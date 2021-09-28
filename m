Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BE41A927
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 08:57:29 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV73Q-0006Zf-MU
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 02:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mV70v-0004Y0-DE
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:54:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mV70t-0006TI-VZ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:54:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id r23so30759961wra.6
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XApEuAvtpcteFqgqpDVjCud3PWAg78tVCdbXnIC3wjA=;
 b=g8wAlXiSFvTDIIcWf/s/oajPGyRXZImzFmlUnpJcDEEfZj2aNfpgFprUBFVLFFm7Uv
 h126FPsk/2Jm9RQ4OE+aR4jvZt5vLSKaRlXsVfdy59Z1s4aeW6Aam2PiMr1lLo5QVFpi
 1umPuueA4Zg7uwjNZssTikKu7PjS1GvZzPZtA2el3Zx7wFPqsDyaOOxF6n/XWQPgBgot
 mLU6kw/u8x7BXKAyZXBm0XoegHsU23ml7UTqSmXgkWd3EjY7Nu59Vk4zg6aiRGIsZhzQ
 /MydJLwPaXMhzPTphRDWUsB2Nr0WU2HK8SPAoSiug9KNbG5SCzPdldK30nglJSzIP3ut
 Ovfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XApEuAvtpcteFqgqpDVjCud3PWAg78tVCdbXnIC3wjA=;
 b=zW5knctU4xxSi99/kqQHbNLdylm0FIIMEz7c4yE8qPUXXxUQF0ie2n+pfEHq3FkyAY
 mjJ08ixEMtTnuWFLwtcaVtHiK2ucn9GEtw9rbvN9UZJ30iSnFtl1+JVmtOoi202gNUEQ
 o1P05K1rSpE3Nfi0x/XZ40NCaRFh76ouda5gBIyA2Ozj3oHQOk64FYcBhQk23dQAxyxG
 AL6v7hq2basf3paDkfxHOycMCXIAoWegvHPbGAogRAZVb+mwn5Sd2AZCHGphR7Yy+4HU
 z9QBm+Qo0QVv6G+Tvaa5VWnc0CPjvKEiARCNHZyWd0x5snCMTJHDmIDmEszCcg5IGHN2
 D2wA==
X-Gm-Message-State: AOAM531xjX9m4FQoD5l+3fCLmHGW9nDtKTxQEhFhLRFh4KLcyLDE5+Km
 mI7Qolf1u6st/rwMKbfHWww=
X-Google-Smtp-Source: ABdhPJwl1h02iNVQwlEFUVqEmKdapUB/S+DKYOu1FV2bXRhJqzN1pflwECxs3OnF1K+2CzznoN4D1Q==
X-Received: by 2002:a5d:5231:: with SMTP id i17mr4575884wra.392.1632812090008; 
 Mon, 27 Sep 2021 23:54:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w5sm18720035wra.87.2021.09.27.23.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 23:54:49 -0700 (PDT)
Message-ID: <4716e619-73c8-4f99-7406-30613aa43247@amsat.org>
Date: Tue, 28 Sep 2021 08:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 23/25] linux-user/sparc: Implement setup_sigtramp
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210928020039.184412-1-richard.henderson@linaro.org>
 <20210928020039.184412-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210928020039.184412-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 04:00, Richard Henderson wrote:
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sparc/target_signal.h |  4 ++++
>  linux-user/sparc/signal.c        | 40 +++++++++++++++++++++-----------
>  2 files changed, 30 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

