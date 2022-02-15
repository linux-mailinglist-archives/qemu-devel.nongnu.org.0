Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A94B747F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:59:44 +0100 (CET)
Received: from localhost ([::1]:50926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK339-0001Fm-5Z
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK2jN-0007sG-AE
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:39:22 -0500
Received: from [2607:f8b0:4864:20::52d] (port=40945
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK2jK-0007BD-K4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:39:16 -0500
Received: by mail-pg1-x52d.google.com with SMTP id q132so7136pgq.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 10:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UejEu0HzoBYlK4R96yOloNJZOm4d4GvjXLvk0/GQc2U=;
 b=J78Xbzwn7cFkhxEzH2EHjArLchrGPGsEnFqPIuOselItbMFGTOsk6V4nXriaBLIYXX
 EgLSNsnq4Ja+1NgLaxqwfEM2ADnhNXN4SbR3SmEcJk0Ooo5rWLN0nEkaL985xd6VzZ8G
 +T7VkC0ICwetaErH/vTt2vh1hFs5+9snQl/tnGOG1kjrfhFhNRfmG53BckI6cOBdiW0b
 7bpoOgpzAQ32148RSSAT2STB5704Ef64YzPvERZd6j2pzQJlamTIQhiM1Mrbh7qyfjPS
 QwLXZAmq8zpJesYmUCGx8bhgge5m/LKvtZS3TUM0+zJrZ1zkwc/xkTNYaxyWUD6koOR6
 QlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UejEu0HzoBYlK4R96yOloNJZOm4d4GvjXLvk0/GQc2U=;
 b=3/20wxjKhhgWJTn2+IxoBOY1NHGJjb12OwmT1Q5mE29hMCkx/hgDZSqG7wcIjdf+x8
 +vyriVR549tQLpiXoDZiiTTpl0sggMcJaLaQEm/Yrb6AC917uzai2TtT3NCkdIwGdhFl
 /clcjCFnXPSZpZw+SeAptdW+LPM4NAgzarITFJGmXzDsCFNcicTY5ia8Sn+ohs/CqXst
 +JTO+8I9MAb894tU4PQm2zsKxsYzBN3ayPD/T2HZlIhBizjjWqT8zg2Y3KYDeeu6farb
 KL/efDLsFppiwESQmqoPvCSzpuU45mW1PqtBCq9fesm9X8zWh5UOnEr5xBUQsPzogFQo
 RlOA==
X-Gm-Message-State: AOAM533rcWbs7xAyfSvaoffTNwkBPra2KU3W0m1gaoIV4G2+vu+ADEF7
 EcGEYWhMKQdn9j+swofsWCg=
X-Google-Smtp-Source: ABdhPJw6FLSK/oBJbh67wr4zGrNoLfzDqHItiyOUY65Mjat81FC/lXMLMebLBNkjeI7xWzuOq8jHww==
X-Received: by 2002:a63:345:: with SMTP id 66mr207489pgd.268.1644950353114;
 Tue, 15 Feb 2022 10:39:13 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id z9sm3082467pgz.32.2022.02.15.10.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 10:39:12 -0800 (PST)
Message-ID: <7dcd2ac3-d009-feb3-a177-f79f49bd848b@amsat.org>
Date: Tue, 15 Feb 2022 19:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] migration: Remove load_state_old and
 minimum_version_id_old
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220215175705.3846411-1-peter.maydell@linaro.org>
In-Reply-To: <20220215175705.3846411-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 15/2/22 18:57, Peter Maydell wrote:
> There are no longer any VMStateDescription structs in the tree which
> use the load_state_old support for custom handling of incoming
> migration from very old QEMU.  Remove the mechanism entirely.
> 
> This includes removing one stray useless setting of
> minimum_version_id_old in a VMStateDescription with no load_state_old
> function, which crept in after the global weeding-out of them in
> commit 17e313406126.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/devel/migration.rst    | 10 ++--------
>   include/migration/vmstate.h |  2 --
>   hw/ssi/xlnx-versal-ospi.c   |  1 -
>   migration/vmstate.c         |  6 ------
>   4 files changed, 2 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


