Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3448AE64
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:26:11 +0100 (CET)
Received: from localhost ([::1]:44992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HAA-0007GJ-1p
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:26:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Gmr-0005D9-1U
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:05 -0500
Received: from [2a00:1450:4864:20::434] (port=37437
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Gmm-0005sM-J0
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:04 -0500
Received: by mail-wr1-x434.google.com with SMTP id t28so26072990wrb.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGZUW/FMGBSbvj4Ciz3I5rAsCdMeLTtEKYL7UNpUgjQ=;
 b=O2ioNNAjbuFp+vnTNw316m6phhwVBoP37nLja123xTQacFmjSR66NUQ4Tq4PNJgCDV
 eNpbS9VUJZMHA5hhO8/MbQvE78I9T4ehKM5mb4/A/aSkxG9Bdw0XFQLtZQ4Y4TBq0tvY
 33geFoNTFdsN7x83hsu2MWr35A0knVJVr06iPJhUDguAcvXeNyRD+ZBvu9HGUN8g2qSb
 ARLMm+796RUrE1RkbP+8fhyFjfLCWVMgOJ5ohySRjaJAt2dOIUEVvLFL0qrF1kcZ+Cd/
 a+3t56LEcJpBYjItY9l+7Mmes35EGaRiUgo4+zQqiQm5novvbUEmmj7ANKwd/CChBadj
 dwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGZUW/FMGBSbvj4Ciz3I5rAsCdMeLTtEKYL7UNpUgjQ=;
 b=66E/MrldnWqwu8WFKP6kNKn42LDOFedAFzwc7Pm/Os7VZF/I96qCXfrgP3J3lk0Yik
 NGAVejYE30OKvFCh9MGy2TOFYSGIOvhrzecZ6ISlpMzz3U+hZAeI/1iXXoZZCd4nzrAQ
 G25rXSFvx5CJei/A3t+a51TJvJaXl6LX2gykT9l3bXPF+ZnBu6qOLFLY15e5fYLQe/rA
 0g4PygX9IYvIIJXHW23+pSg7hq1PKCB+1WtXigSFCPmivFTyxhb+DGTCcWfLLsR3pzQQ
 dXJdXFBUozWOCxxKKP3SmoxC1gCzFpKjXaAgvm07m463q9aEzyjQo6KKCERA02b7NhRe
 Y0Lw==
X-Gm-Message-State: AOAM533LlCu47VkeUq3sGUNuGyCUGM0YpwJjSN5H44MqixRSpY3Bu7kJ
 deZWDwmzMal3SfkhOQFoRIM=
X-Google-Smtp-Source: ABdhPJzWLAw5XYD4kKSWdMf1FIoFodpkNq6OHSzukTheaJ3g+A0t2JwFITgh5ssLg1MbtoPF2kWiog==
X-Received: by 2002:adf:e841:: with SMTP id d1mr2424066wrn.486.1641906116396; 
 Tue, 11 Jan 2022 05:01:56 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id l10sm1668347wmq.7.2022.01.11.05.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 05:01:56 -0800 (PST)
Message-ID: <fbda43c9-22e7-d92a-1b0f-0868846a0a95@amsat.org>
Date: Tue, 11 Jan 2022 14:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] clock-vmstate: Add missing END_OF_LIST
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, luc@lmichel.fr, damien.hedde@greensocs.com,
 peter.maydell@linaro.org
References: <20220111101934.115028-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220111101934.115028-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 11:19, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv
> 
> Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")

Doh I missed this too :(

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/core/clock-vmstate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 9d9174ffbd..7eccb6d4ea 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -44,6 +44,7 @@ const VMStateDescription vmstate_muldiv = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(multiplier, Clock),
>          VMSTATE_UINT32(divider, Clock),
> +        VMSTATE_END_OF_LIST()
>      },
>  };
>  

