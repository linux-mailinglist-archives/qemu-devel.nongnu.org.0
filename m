Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9B4AD60A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:16:01 +0100 (CET)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOTX-0008Hm-VI
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:15:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHNvc-00080K-6C
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:40:58 -0500
Received: from [2607:f8b0:4864:20::102c] (port=55290
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHNvV-00005L-15
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:40:53 -0500
Received: by mail-pj1-x102c.google.com with SMTP id on2so7438809pjb.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V1MYjKC6eeNJXNOPNTfZbnbQteOiqYNrEmaHODhlN0U=;
 b=DfJNzSfBktW3CcTFVAiwfG33sQM8XLZKYvQ/OsnPPZLyiAxOuqCIAUE1owdEeJ5pkk
 jFhNQPkySiYX0Tt/5StjjHDU86Uy+2ffyfiKZwfMHu/C1Yon4OrInaHNOm15VGQxx0FU
 G6Xy6XWreSGbMz4Ze4HWTwKmMcxqiPckOyk5N68eBGgpyKnQR/nOBOPbkAvfNtLwCvU+
 BiyIbfKd9CJ7AM+l12LyOUTjkIm0Ss1j7uzweA4imrtmzre1Rr81EOXv6ybXc9MzI5vB
 iCfgQbXipfkmfKhIq1uLATpQ3cKKxvjrSY9Rg8FlgTPvbhTOzX0eQTEquwJWIkJpYv65
 lHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V1MYjKC6eeNJXNOPNTfZbnbQteOiqYNrEmaHODhlN0U=;
 b=Dij3QSdGk/CB8OG7iuoJxKIdtdWrhqt4XwV/19haN9dm14VRCf12iwjBR7LlxkG5bT
 qmpRs5W951MOwLLlNhuB7kM+GeglMZZsIFXAP14i4eMU6J5FFDWmsLY3KWB07XzRDnoO
 xDidT28lWd1C2+lKXXip1uO30HbUsopg61bu4n2nOphWNEAvRsQopoB8gzb4w4vsaq/P
 pYeR2SLNcch80KavXSb5YVGfJKZKjgPn86YprLpFUOMPI/MaQ//As/gsmpAKWxFN1WTk
 PX79kZyvCYpOBkVnp0kv7d+RPuchfbxKopvfXmfrNyK6EgKYULRg3gGc3lEhc9wf+/nM
 QmIg==
X-Gm-Message-State: AOAM533zSH59jJtPgjDHBnq+IciYWDh000MIrmNNtz+nC17Y8kOYRKRw
 vUpm9n8hDlaJF1pqeY+IOYw=
X-Google-Smtp-Source: ABdhPJwwRx22RbJe2aIgkKhqqkkMhR6DPPzSOiKA39P7EA0i2h8+7EQjL7ntoAY8Toh4voY9KetgUg==
X-Received: by 2002:a17:902:7486:: with SMTP id
 h6mr4119417pll.92.1644316826016; 
 Tue, 08 Feb 2022 02:40:26 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 16sm2343625pje.34.2022.02.08.02.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:40:25 -0800 (PST)
Message-ID: <8c0c5680-d361-ee61-c6a1-2b3e82a918e7@amsat.org>
Date: Tue, 8 Feb 2022 11:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 4/5] linux-user: Move sparc/host-signal.h to
 sparc64/host-signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-5-richard.henderson@linaro.org>
In-Reply-To: <20220208071237.319844-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 8/2/22 08:12, Richard Henderson wrote:
> We do not support sparc32 as a host, so there's no point in
> sparc64 redirecting to sparc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/include/host/sparc/host-signal.h   | 71 -------------------
>   linux-user/include/host/sparc64/host-signal.h | 64 ++++++++++++++++-
>   2 files changed, 63 insertions(+), 72 deletions(-)
>   delete mode 100644 linux-user/include/host/sparc/host-signal.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

