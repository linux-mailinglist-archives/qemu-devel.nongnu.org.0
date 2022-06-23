Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C0558A3F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 22:37:52 +0200 (CEST)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4TaJ-0006qw-Cy
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 16:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4TZK-0005ja-0J
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 16:36:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4TZI-0005sV-5x
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 16:36:49 -0400
Received: by mail-pf1-x432.google.com with SMTP id u37so679637pfg.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5lvSv0ZZG0ClKjeNVWxcUG8GbtSlfE5LU4d7yOduDGA=;
 b=bsGodv2IqFF1AYZqoJhMdQkktCiF3J0t0AKdHuJYKigJ0kpbg17nTrt6EeN9GAtAxc
 aC/Jv9Zk8fkO2JIrLSjMFj3PLuk38G9/H9Xd8CG4zU8KiJN2oMhJu60QKDNGTGVjXXcG
 DX5+PViR9+wRLQ2fYWWJK7SN14Bz2Gz2E8ilYJ9vzviR8Co6JACbGewIt7S9nXQev3eV
 93Ha6CD5M3MTdnYCGpa6ULvxfnJmBR8Pt4k1TTKVheeyY0aPtsdkA0mVgLQtEcXEXQww
 OZovvae4gTbqUT0texLkFr4orGVfWVSp4SqLfX6wjqyOtrX5c6tnoRNaqzwGsuNQxGwc
 p63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5lvSv0ZZG0ClKjeNVWxcUG8GbtSlfE5LU4d7yOduDGA=;
 b=woMRVC0L+DGsDCC/4EjorgUMCyTgJq0PfW0NCSmX0cNcOs8uEmBvVw3tfnxfHu8GeW
 nou2IJxTVsOZwVTxLXCxnoPCVSwJX2jjNhqFaGBEu5TJiKYkpWzhJx/3Ov9XlxHcStW7
 Zgx6oXELpz+7/kCRfxreVk7xLlS+xvhOVhLfYz6JD3ATbDFRLTY8xQp+/uY3ObVorkBi
 Ph2ZixKAbgIEeK4d6RJL6+Tz6/v/BAvLVX2s06EejcaXMcnpkWPgKINz6wmbEKrT8U1g
 a/vBheVkL7y/gzW7fC54jWKIuwTYQML0QbZqphF4kuYrVvVOJLERIBNl1SI2XiSxsmkF
 LLoQ==
X-Gm-Message-State: AJIora/PgCjs2xt4aWJmiP4spszFZGxFQqBh349jwwGbm39Aqpi34YtL
 4iaU8sHqU5M8tr6VHFpU+sXDOg==
X-Google-Smtp-Source: AGRyM1sdLVq6uU08V1dwPb1pvQ2eMtuESo0jiKhTE3Yj2oyPmleoZdhf3dzHjZnt9WJAzhMZPPdxjg==
X-Received: by 2002:a62:ce8a:0:b0:525:706f:14c9 with SMTP id
 y132-20020a62ce8a000000b00525706f14c9mr835855pfg.55.1656016606537; 
 Thu, 23 Jun 2022 13:36:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a170902bcc600b0016a61e7f30dsm195189pls.281.2022.06.23.13.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 13:36:44 -0700 (PDT)
Message-ID: <c6308243-0742-b9dc-a325-da095e687181@linaro.org>
Date: Thu, 23 Jun 2022 13:36:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 26/51] target/arm: Implement SME LD1, ST1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-27-richard.henderson@linaro.org>
 <CAFEAcA932Ud1PH4Az=NVW02mR8Q_GNmsH-kvLTRZ_TmCR8=Psg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA932Ud1PH4Az=NVW02mR8Q_GNmsH-kvLTRZ_TmCR8=Psg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/23/22 04:41, Peter Maydell wrote:
>> +/*
>> + * FIXME: The ARMVectorReg elements are stored in host-endian 64-bit units.
>> + * We do not have a defined ordering of the 64-bit units for host-endian
>> + * 128-bit quantities.  For now, just leave the host words in little-endian
>> + * order and hope for the best.
>> + */
> 
> I don't understand this comment. The architecture ought to specify
> what order the two halves of a 128-bit quantity ought to go in the
> ZArray storage. If we can't guarantee that a host int128_t can be
> handled in a way that does the right thing, then we just can't
> use int128_t.

Indeed.  The spec is an array of bits, and the way the indexing is done is equal to 
putting the two 64-bit quantities in little-endian order in our array.  I'll improve the 
comment.


>> +static inline QEMU_ALWAYS_INLINE
>> +void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
>> +             const target_ulong addr, uint32_t desc, const uintptr_t ra,
>> +             const int esz, uint32_t mtedesc, bool vertical,
>> +             sve_ldst1_host_fn *host_fn,
>> +             sve_ldst1_tlb_fn *tlb_fn,
>> +             ClearFn *clr_fn,
>> +             CopyFn *cpy_fn)
> 
> We now have several rather long functions that are
> pretty complicated and pretty similar handling the various
> SVE and SME loads and stores. Is there really no hope for
> sharing code ?

I'm not sure.  Maybe.  The two issues are:

(1) sve ld4/st4 -- arm didn't make z29-z31 illegal, but defined wraparound to z0.  So I 
pass in a Zreg number not a pointer to those routines.  So the routines can't be reused 
for Zarray without changing that.

(2) sme ld1/st1 vertical slice, which significantly alters the spacing between the elements.

One possibility for these cases is to perform the load into env->some_scratch_space, then 
copy into the final position afterward, and the reverse for stores.

Is that preferable?  Do you see another alternative?


>> +    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
>> +    t_pg = pred_full_reg_ptr(s, a->pg);
>> +    addr = tcg_temp_new_i64();
>> +
>> +    tcg_gen_shli_i64(addr, cpu_reg(s, a->rn), a->esz);
>> +    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rm));
> 
> Aren't rm and rn the wrong way around here?  The pseudocode
> says that rn is the base (can be SP, not scaled) and rm is
> the offset (can be XZR, scaled by mbytes).

Yep, thanks.


r~

