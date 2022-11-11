Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCB62582B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRBT-0001zg-1R; Fri, 11 Nov 2022 05:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otRBQ-0001xR-OU
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:22:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otRBP-0006US-8q
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:22:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 r203-20020a1c44d4000000b003cfa97c05cdso3559241wma.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FtdG2GimTWbFzKgTnodViSCEV0zuIUi/zy9S+5Pdr7E=;
 b=Oi9xvr2HLB+WaFujrGUC6g5bZpEJj7RTvsmvn89smnPWA92NzojRjlmRbL6E2FyH9y
 rzBLgf1rEKz4OvvLX+8vjyQvTDhijXn3+gXlxhneNuoeK4jRVpTQoaCljRJDiM2lPbm2
 SmCTBiymKAaFzoZ7UjIrDs7G1cJ2H1+naBe+E29BEWcsYMS0BhsuttmIpOuTP/KBR1s3
 6yLm9bmmuK8mmVyiJ88UTIf26E6BWcGiL3u0PHcQ6QGFWSNoKPviLIfB0SfowvHwS5A8
 0cqt6U6mJVOLCN8offQNU8QHNGd8nU828E8UpMaplsqqUM4p3uOdp2/42YbB407Hw1IF
 kH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FtdG2GimTWbFzKgTnodViSCEV0zuIUi/zy9S+5Pdr7E=;
 b=EydXW0IWheAIzdPmseJOVJqA538yxu1qNGQRSysxVcTd52icH1X9At4fuWhqN/Pbb0
 YDKm8ybPQ3poI50mk57PRHCVcIZlH2LiLIGQWCGdxn9g/qEMOtrqket0eEeXxs1M9OVk
 BiJKnEHqPcFJDGEhxDTKTyhPDoxRFPPZLP3koct6usOA0Pz+YBX+0cpbDg22VzVt6Bcz
 sGGZKmSDAD4JBwQwaT8GpZU1rF/VWgdayB3Q9kpjZAfGYm7/oZrIIuZ3m9jsKk1UqC2t
 2vyXS0o5ZHyQr+CGnIRnOYYjDzIpPOL3p/RzwTwW6hXjDCDErxk/UgbZapcqQC7GIrl9
 6w3A==
X-Gm-Message-State: ANoB5pnyUkcMuDAgEr2AmPqbpii/wUS0vxhA+D5BQA2SUeY6M2Y3R1EX
 N/t29eDFs+hUJOlQ/bKkNFnniQ==
X-Google-Smtp-Source: AA0mqf5FqVeLTGiB3Ur1uljUJ0gngK8e83LiAuMyB94qoYvPtDHa0f4aaClNWLVgfxc2d3XXvDw92Q==
X-Received: by 2002:a05:600c:b41:b0:3c6:c2ae:278b with SMTP id
 k1-20020a05600c0b4100b003c6c2ae278bmr757686wmr.127.1668162165730; 
 Fri, 11 Nov 2022 02:22:45 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c228600b003cf4d99fd2asm2432006wmf.6.2022.11.11.02.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 02:22:45 -0800 (PST)
Message-ID: <740d6b2c-a292-8119-173c-8611854ed03d@linaro.org>
Date: Fri, 11 Nov 2022 11:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] tests/plugins: add a new vcpu state tracking plugin
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20221108164921.1980508-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221108164921.1980508-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/11/22 17:49, Alex Bennée wrote:
> Although we call qemu_plugin_register_vcpu_idle_cb() in the bb test we
> don't really exercise the rest of the state change callbacks. Add a
> new test that tests the whole API.
> 
> [AJB: I wrote this in an attempt to flush out a reproducer for #1195
> although so far now joy.]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Idan Horowitz <idan.horowitz@gmail.com>
> ---
>   tests/plugin/vcpu.c      | 140 +++++++++++++++++++++++++++++++++++++++
>   tests/plugin/meson.build |   2 +-
>   2 files changed, 141 insertions(+), 1 deletion(-)
>   create mode 100644 tests/plugin/vcpu.c


> +static uint64_t get_timestamp(void) {

Checkpatch complains atbout this bracket ^ position ;)

> +    struct timespec ts;
> +    clock_gettime(CLOCK_MONOTONIC, &ts);
> +    return ts.tv_sec * 1000000000LL + ts.tv_nsec;
> +}


