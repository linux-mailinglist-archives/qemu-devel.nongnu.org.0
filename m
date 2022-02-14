Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C44B4FED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:21:48 +0100 (CET)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaMV-0001qN-U6
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:21:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaEP-0002yq-OG
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:13:30 -0500
Received: from [2a00:1450:4864:20::431] (port=45686
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaEO-0000RF-BO
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:13:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id p9so5948661wra.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=agkB3uiJ3JfJ/YEIZOLldPbyppmBSns8dZR8D8kar0s=;
 b=Gv84ccgCoJvlOvLwbzXM3a7qyYPvxoukbD1VG06sZrawSoY8w2rsE+pMAKt45DLs7e
 Us9iFGf9IYpNBSLLmVj3hiKQXSgyZU5iX1BE9J9qk3NTuxoBPgSZwwPzaVSu1/JhcLtJ
 uHW79D7sZF7e0HvZ8Kds3uBUHMmV4IEb5g7LtYuqN7ncqEtrN6GIw5h9r+LIH9KPyDlx
 MzalkkeBMDokcQe2wSxsPIL+SiOh5Pb+MbvFK1jKamtS/K+nKrqWT9hDRtTFrcDDOgaN
 QU36MHkIXL0tl96pi57hEDyUIdaeM7J7iGJf68H9gM7jycR9nuf42sMLdj0QEgwSCkFu
 uusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=agkB3uiJ3JfJ/YEIZOLldPbyppmBSns8dZR8D8kar0s=;
 b=wPSvWfP7NAjju2j2+tynAS3t1zfAkkxyQJVZoueX0amw8U9apSZALUEtUfFnvUnZCI
 8Lb7Tnmb3Jesyzeg4SCp9EPu6VsW1Qd0hJyqEOEsYocyN7dfoSG2Nhn23SM1B5GPVhJl
 5GGstj6NIhJsDJUm4SRHe7tFkX1eNddU3MTWw0aTg4JYc5EBUFSFMRdNKZdxgkBgOlvk
 BcegRsmUY6agiZGLoThwr6nUmI9aE53TSzAwdrCn1OEGJ9fuIPCTf9w952nJi+EWKpYV
 WH5qSpTzJ5yAIIYwd9otLddE/c2/GKiilHfVvGqJNAVEKsiBC0vpbhkjnl/zWHDKfDB2
 8Emg==
X-Gm-Message-State: AOAM531mlb8DvPDYSDgHoamTpxadQM++iK3j9Z18r0bWGG3nyvGyo5ak
 VvgvL8Q5OXD07sU16fcC9A4=
X-Google-Smtp-Source: ABdhPJzSbT+x2TgdpQWf4HQ5pkZpCIVyaQjN5NrQbStTBn3ussYyxzWmjZeeOMkJUa6qRhB8rj9hGw==
X-Received: by 2002:a5d:6143:: with SMTP id y3mr2912373wrt.210.1644840801785; 
 Mon, 14 Feb 2022 04:13:21 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id d14sm14789317wri.93.2022.02.14.04.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:13:21 -0800 (PST)
Message-ID: <2c3876ba-8d71-4df1-7080-66ad880cebac@amsat.org>
Date: Mon, 14 Feb 2022 13:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220213021215.1974-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220213021215.1974-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/2/22 03:12, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fd74c46426..5aefb5b431a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2333,6 +2333,7 @@ F: audio/alsaaudio.c
>   Core Audio framework backend
>   M: Gerd Hoffmann <kraxel@redhat.com>
>   R: Christian Schoenebeck <qemu_oss@crudebyte.com>
> +R: Akihiko Odaki <akihiko.odaki@gmail.com>
>   S: Odd Fixes
>   F: audio/coreaudio.c
>   
> @@ -2585,6 +2586,7 @@ F: util/drm.c
>   
>   Cocoa graphics
>   M: Peter Maydell <peter.maydell@linaro.org>
> +R: Akihiko Odaki <akihiko.odaki@gmail.com>
>   S: Odd Fixes
>   F: ui/cocoa.m
>   

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

