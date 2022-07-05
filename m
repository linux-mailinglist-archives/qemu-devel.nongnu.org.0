Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD4E5660C9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 03:51:01 +0200 (CEST)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8XiN-0004B9-Lq
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 21:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8XhE-0003Dy-KO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:49:48 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8XhC-0006LG-Vb
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:49:48 -0400
Received: by mail-pj1-x1032.google.com with SMTP id s21so6201421pjq.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 18:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hWPfkn2qJR+6qFiQqf0svTdho8AjayVA0Gh0rn1Vxu4=;
 b=GYCyNtLFEBMwcdKsbx4qTXar586KxBBdpoOzB/NWaxY2Qd4tZZ9dxQe4F6cso8lwef
 6wSjk2JrcQtZ9GIyUWpzfn85QpYiQ8prmdBWB4yi6h7L2EK0TYtpWZqt6OmGKCtqN+7T
 GXVi8MNuMzrNzdMEHb8ArncTY+xQP4P5gAhfIL3uuj25sMxGvxVBz/7EkAsQ6hing3Fd
 BCR1BFfQb+NhcBXnlsRhe5lgwoPzlrxcrs5xVji/CIyA7oed7VqwNi/oyjGxVqlb6uBl
 qkDrzKwbVhtqTvqMiufop93U9//8bNBrkVelV7Eq3XudSxc06/ugv+P2I/oJbzRFOkmu
 dpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hWPfkn2qJR+6qFiQqf0svTdho8AjayVA0Gh0rn1Vxu4=;
 b=Zj+lh3ZvaGAJ310M4uU6N8pDzbNz9Nmht3ElmWLNhLvYLnv048QVfk45bbmdPmwoNu
 feZKLzUD3kYFm27nKYs5fAK4Tq/9maPl0kWDZ3Se/oe09J3zSCCfwFYFI4GaEtBIyXn0
 8gVf1mAatRjAuViOg26J4Htw4k6GdeEJ/5ZKBzggbTfM0weeWLchzYp1z16U7xVTsmYq
 S95oW3a8shel3cbV/2R3pqZF7q/gJWqonNVwmRvwoFUpU1/rlOyON3We0K5MdLebkfj7
 yRBZnVp4o9EFYj88YhBi9X9/sowEXim9eZCqWCnl/6ET2k/CFQ0q3sVMhwBkjlD4N4qC
 DV/g==
X-Gm-Message-State: AJIora+kP4l03SS9y0mpUm98N/SJz5GHdgWRYUxuJuIuyFDowHPZrHal
 BFU1PrSKxhvNTBX4PGoZSPrDhA==
X-Google-Smtp-Source: AGRyM1uSML4hRujT6qymOU5yG6guagwThBHzWULt+7dYNrfgzviBH2gmGavTfW2pmmaEflcZc9A4xA==
X-Received: by 2002:a17:902:efd1:b0:16b:dc3b:7fbc with SMTP id
 ja17-20020a170902efd100b0016bdc3b7fbcmr11060323plb.45.1656985785409; 
 Mon, 04 Jul 2022 18:49:45 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 cq13-20020a056a00330d00b005255489187fsm21469906pfb.135.2022.07.04.18.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 18:49:44 -0700 (PDT)
Message-ID: <52d072c4-b6e7-c413-b15e-3aae358b4b00@linaro.org>
Date: Tue, 5 Jul 2022 07:19:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 20/45] target/arm: Implement SME LD1, ST1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-21-richard.henderson@linaro.org>
 <CAFEAcA_qDAR9YmXdZ0wuVVkaBeV3ArGzknjLkU=BqJn7hBAbjw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_qDAR9YmXdZ0wuVVkaBeV3ArGzknjLkU=BqJn7hBAbjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 7/4/22 16:09, Peter Maydell wrote:
>> +static void clear_vertical_h(void *vptr, size_t off, size_t len)
>> +{
>> +    uint16_t *ptr = vptr;
>> +    size_t i;
>> +
>> +    for (i = 0; i < len / 2; ++i) {
>> +        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
>> +    }
> 
> The code for the bigger-than-byte vertical actions seems wrong:
> because 'ptr' is a uint16_t here this expression is mixing
> byte offsets (off, the multiply by sizeof(ARMVectorReg) with
> halfword offsets (i, the fact we're calculating an index value
> for a uint16_t array).

I agree these are wrong, because they mix 'i' as index and 'off' as byte offset.  I think 
the correct addressing is always the same as byte addressing.  I.e.

     for (i = 0; i < len; i += N) {
         uintN_t *ptr = vptr + (i + off) * sizeof(ARMVectorReg);
         *ptr = 0;
     }

so that every iteration advances N rows and writes N bytes.

>> +static void copy_vertical_h(void *vdst, const void *vsrc, size_t len)
>> +{
>> +    const uint16_t *src = vsrc;
>> +    uint16_t *dst = vdst;
>> +    size_t i;
>> +
>> +    for (i = 0; i < len / 2; ++i) {
>> +        dst[i * sizeof(ARMVectorReg)] = src[i];
> 
> Similarly the array index calculation for dst[] here looks wrong.

I don't think so in this case.  I'm not mixing indexes and byte offsets like I was above.

Recall that the next vertical tile element is not in the next physical row, but in the Nth 
physical row.  Therefore there are always sizeof(ARMVectorReg) elements in the host layout 
between vertical tile elements.

I agree it looks strange.

>> +#define DO_LD(NAME, TYPE, HOST, TLB)                                        \
>> +static inline void sme_##NAME##_v_host(void *za, intptr_t off, void *host)  \
>> +{                                                                           \
>> +    TYPE val = HOST(host);                                                  \
>> +    *(TYPE *)(za + off * sizeof(ARMVectorReg)) = val;                       \
>> +}                                                                           \
>> +static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
>> +                        intptr_t off, target_ulong addr, uintptr_t ra)      \
>> +{                                                                           \
>> +    TYPE val = TLB(env, useronly_clean_ptr(addr), ra);                      \
>> +    *(TYPE *)(za + off * sizeof(ARMVectorReg)) = val;                       \
>> +}
> 
> So in these functions is 'za' pre-adjusted to the start address of the
> vertical column?

Yes.  That's true of all of these routines, and what I compute in get_tile_colrow.

> Is 'off' a byte offset here 

Yes.

> (in which case the arithmetic is wrong for anything except byte columns)

I don't think so in this case.  This is all byte arithmetic.  Just as for copy_vertical_*, 
there are N rows between elements.

Consider a vertical tile slice of uint64_t:

   Element 0 is off=0 -> za + row 0.
   Element 1 is off=8 -> za + row 8.

>> +    tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), a->esz);
>> +    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
> 
> Theoretically we ought to call gen_check_sp_alignment() here
> for rn == 31, but I guess we didn't do that for any of the
> non-base-A64 instructions like SVE either.

Oh yeah.  Some day we should make gen_check_sp_alignment do something too.


r~

