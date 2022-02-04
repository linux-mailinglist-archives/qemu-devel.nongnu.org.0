Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD74AA1E5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:17:34 +0100 (CET)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5xU-0002VO-EZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:17:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5ci-0003XM-9u
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:56:05 -0500
Received: from [2607:f8b0:4864:20::430] (port=36590
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5cg-00011K-NY
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:56:03 -0500
Received: by mail-pf1-x430.google.com with SMTP id 192so6101913pfz.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y5jqZIG2FvVOZ5jKf2yRYEzLhREyFzTTwO3lyz3pvPs=;
 b=rrIdAHJsQ85hNOugr4OfHH/Tat75MFw0UtR5+vQ7HSJZdj6VUAwD4ri6t6HXfi3Hvm
 daC5FL+E76sdKfSWseSfFNjidnCzE6OEanvNHEtikR4hnx6L8AmAuJdQx24IzBnQ5MyJ
 bzT0/kkzxLYeJt6A/f/1m8g0EXl718ybAHQxSJqMszgqEK4vVVGpMEzuLpZzrrVDZ1IW
 iIYrb79MMXGTC7qL8L461m7xQqRK96gx943VTl9AwngnsBiZnQVju1ZvVuCrBADhMtpH
 Oiu8jCdR6PgV+XpHqLfshoupXWWwPCiMip2jQLOQOTtoul8Q781jK/BcUDH+8oJKSOhW
 xKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y5jqZIG2FvVOZ5jKf2yRYEzLhREyFzTTwO3lyz3pvPs=;
 b=ZAeh/erDWx/ujRsoVSjh8GNTOndxX0ehAJs6aJw6bBBpJ+SS5jXYHURw1I/SfBy0CD
 u7CmoIz9stb6u9644jVWUI6JAF/GwIUKexH8F3AGA0+o/V7tLtkmguYy0UafDzXiAG5y
 X1+Cbe2czGzWcN3ODCsrTtw/qFba2vAfHM4m9Ru6eMnroIpV0MfS6n1hCPuPbLuMMW7+
 /LoRWTtf/mUXuhsn7GIlKxzeROjH8cB+Trotgny5+w+pH8lIfVRUW5mn0C0rRAnZXchu
 VYkX6oT8ny8KdlIloLQYvl2qaIjQp8j2a/rcyAK3tgLDh6St8kGIbzZYkmfa9oO6cKny
 KCTA==
X-Gm-Message-State: AOAM530BSqwOKjzNCjVxBdGK83//UeiHYJZULwz9loLVHglgo4ovFFLn
 iGS57ztxB8rSNsKZj3Fhr/GOUA==
X-Google-Smtp-Source: ABdhPJz0+H1LbNWfo9mcA1BYe68k1ArjdiVRHFHNWB/EvtILx3jg1q/+8CuiZeBSRCbJIvnMPy7/Wg==
X-Received: by 2002:a63:8048:: with SMTP id j69mr620798pgd.557.1644008160347; 
 Fri, 04 Feb 2022 12:56:00 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850?
 ([2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850])
 by smtp.gmail.com with ESMTPSA id l191sm2284642pga.65.2022.02.04.12.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 12:55:59 -0800 (PST)
Message-ID: <ab4a94d6-7d29-10f8-e7a6-c3d9c22cf567@linaro.org>
Date: Sat, 5 Feb 2022 07:55:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 5/5] tcg/sparc: Support unaligned access for user-only
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-6-richard.henderson@linaro.org>
 <CAFEAcA97K-rXBJP9zo1nLFMdA5Rt1hjh1tqUyigcNV+ydSfZgQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA97K-rXBJP9zo1nLFMdA5Rt1hjh1tqUyigcNV+ydSfZgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 06:07, Peter Maydell wrote:
>> +    /*
>> +     * Overalignment: When we're asking for really large alignment,
>> +     * the actual access is always done above and all we need to do
>> +     * here is invoke the handler for SIGBUS.
>> +     */
> 
> I thought the access was in an annulled delay slot and so won't
> be "done above" ?

Bad wording, I suppose.  If the alignment check succeeds, then access is done above.  If 
the alignment check fails, there is no access to be performed, only to report failure.

>> +    switch ((unsigned)memop) {
>> +    case MO_BEUW | MO_UNALN:
>> +    case MO_BESW | MO_UNALN:
>> +    case MO_BEUL | MO_ALIGN_2:
>> +    case MO_BESL | MO_ALIGN_2:
>> +    case MO_BEUQ | MO_ALIGN_4:
>> +        /* Two loads: shift and combine. */
>> +        tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, 0,
>> +                        qemu_ld_opc[a_bits | MO_BE | (memop & MO_SIGN)]);
>> +        tcg_out_ldst(s, data, TCG_REG_T1, 1 << a_bits,
>> +                        qemu_ld_opc[a_bits | MO_BE]);
>> +        tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, 8 << a_bits, SHIFT_SLLX);
> 
> Why are we calculating the offset in memory of the second half of
> the data and the amount to shift it by using the alignment-bits
> rather than the size-bits ? Because of the cases we know that
> here a_bits == s_bits - 1, but I think it would be clearer to
> work in terms of the size.

Ok.

>> +        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 3, ARITH_ANDN);
>> +        tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, 0, LDUW);
> 
> Doesn't this give the wrong fault-address value to the guest
> (ie not the address it used for the load, but a rounded-down one)
> if we take a SIGSEGV? Or do we fix that up elsewhere?

Oops, no.  Perhaps a single byte load to the zero register would fix that, without having 
to go to full load-by-parts.

>> +    case MO_BEUQ | MO_ALIGN_2:
>> +        /*
>> +         * An extra test to verify alignment 2 is 5 insns, which
>> +         * is more than we would save by using the slightly smaller
>> +         * unaligned sequence above.
>> +         */
>> +        tcg_out_ldst(s, data, TCG_REG_T1, 0, LDUH);
>> +        for (int i = 2; i < 8; i += 2) {
>> +            tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, LDUW);
> 
> Isn't this loading 2 + 3 * 4 == 14 bytes?

Oops.  Got confused with the qemu vs sparc "word" there for a moment.


r~

