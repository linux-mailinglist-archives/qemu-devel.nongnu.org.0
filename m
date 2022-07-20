Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8557B61C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:06:05 +0200 (CEST)
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8Sq-0003H3-AT
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oE87R-00080k-AZ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oE87O-0004Nw-3K
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658317432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lif+hwX14OBVu0p+NrjH1G4a5bBTHI4JcUxvSQfp9m0=;
 b=St5uvVWCcw810Aphz6eFAZdz89QaFi0jM77GG1pTmHgjXWU6po5HCL0J1j3cOMbvidJ11F
 +V7ocZ4bTZTatOES/RrOQ8VJZ/fjn7qHxgrJMyjsa3Q3t8QXkQnCpSe1VWRkGGIh0hwSDr
 L1s+ct1jWknZKC89J/ZQZgHB2jRdbCw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-W_J5RAQLMZ2wsClenNP4Mw-1; Wed, 20 Jul 2022 07:43:51 -0400
X-MC-Unique: W_J5RAQLMZ2wsClenNP4Mw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n21-20020a7bc5d5000000b003a2ff4d7a9bso664648wmk.9
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 04:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=Lif+hwX14OBVu0p+NrjH1G4a5bBTHI4JcUxvSQfp9m0=;
 b=Zgtdcz0u2HNOmoWRVcGbUSsIIRzqMgYgAv0u+MNUq6BKTjiUdxRM2pNZFTO7N+TvQA
 YfB78ZICTrARHLKsuFHbKz19HUruwx5lydk/U7MYF5Xfs44EK3j2mRIQnBgbgTPgAAfS
 7Yc8NPMxbQXJdvDWmXPu5ULSR4f1t0lz9Xu145M9jtdu3h1AzXD44ZTm7E5mYh/XO3Wx
 Gwex4qCAt963ZCNOOGDAwE+O2RMeDWB9efmDQSE46h2s54oZSV89uJl8qXhDyWg8FRGx
 8q/ZkYp+n2sreiRm05X8Yl1ic3rWxWATY0KptySJhWS3Kig1gkQdzlf3cWUJCloE9PjL
 OYZQ==
X-Gm-Message-State: AJIora81fYXCrDjhOsouldt7cvMU5aV3ss7ndAgFFNoBMFJr37ndYxhf
 X7xnirbSyDz/X4pSieBqIjAZYOF5OoRTMX/6nuYe7OSUjJuP9sCTDWMpFmK672+QKXUiBboZViN
 7KutV9d3zjxIaVHE=
X-Received: by 2002:a7b:c4c8:0:b0:3a3:1b77:61bf with SMTP id
 g8-20020a7bc4c8000000b003a31b7761bfmr3490914wmk.92.1658317430238; 
 Wed, 20 Jul 2022 04:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUCnvxHJnDBHzV7lxexgIGhJRGYMMah55EgWCrd7yNNHT4xZJo9scRIauG6lvkHKGW/kiirQ==
X-Received: by 2002:a7b:c4c8:0:b0:3a3:1b77:61bf with SMTP id
 g8-20020a7bc4c8000000b003a31b7761bfmr3490892wmk.92.1658317429892; 
 Wed, 20 Jul 2022 04:43:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:e00:8d96:5dba:6bc4:6e89?
 (p200300cbc7060e008d965dba6bc46e89.dip0.t-ipconnect.de.
 [2003:cb:c706:e00:8d96:5dba:6bc4:6e89])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a1cf719000000b003976fbfbf00sm2146997wmh.30.2022.07.20.04.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 04:43:49 -0700 (PDT)
Message-ID: <2b3d579a-295a-cd25-70c3-ecb551e74cf4@redhat.com>
Date: Wed, 20 Jul 2022 13:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <YtaUQkVUPVHt+v0Z@zx2c4.com>
 <20220719114307.102643-1-Jason@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] target/s390x: support PRNO_TRNG instruction
In-Reply-To: <20220719114307.102643-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19.07.22 13:43, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19-rc6.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  target/s390x/cpu_models.c        |  2 --
>  target/s390x/gen-features.c      |  2 ++
>  target/s390x/tcg/crypto_helper.c | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 1a562d2801..90aac3d795 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -421,8 +421,6 @@ static void check_consistency(const S390CPUModel *model)
>          { S390_FEAT_DFP_FAST, S390_FEAT_DFP },
>          { S390_FEAT_TRANSACTIONAL_EXE, S390_FEAT_STFLE_49 },
>          { S390_FEAT_EDAT_2, S390_FEAT_EDAT},
> -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KIMD_SHA_512 },
> -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KLMD_SHA_512 },
>          { S390_FEAT_MSA_EXT_4, S390_FEAT_MSA_EXT_3 },
>          { S390_FEAT_SIE_CMMA, S390_FEAT_CMM },
>          { S390_FEAT_SIE_CMMA, S390_FEAT_SIE_GSLS },
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index ad140184b9..3d333e2789 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -749,6 +749,8 @@ static uint16_t qemu_V7_0[] = {
>   */
>  static uint16_t qemu_MAX[] = {
>      S390_FEAT_VECTOR_ENH2,
> +    S390_FEAT_MSA_EXT_5,
> +    S390_FEAT_PRNO_TRNG,
>  };


Again, what about the warning? We don't want to report warnings in the
QEMU default.

>  
>  /****** END FEATURE DEFS ******/
> diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> index 138d9e7ad9..dccce7f707 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -12,12 +12,30 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/guest-random.h"
>  #include "s390x-internal.h"
>  #include "tcg_s390x.h"
>  #include "exec/helper-proto.h"
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
>  
> +static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
> +                            uint64_t buf, uint64_t len)
> +{
> +        uint8_t tmp[256];
> +
> +        if (!(env->psw.mask & PSW_MASK_64))
> +                len = (uint32_t)len;
> +
> +        while (len) {
> +                size_t block = MIN(len, sizeof(tmp));
> +                qemu_guest_getrandom_nofail(tmp, block);
> +                for (size_t i = 0; i < block; ++i)
> +                        cpu_stb_data_ra(env, wrap_address(env, buf++), tmp[i], ra);

So, whenever we would get an exception, we would not update the
registers. This implies that we'd always start anew on an exception,
even though we already modified page content.

What the real HW does is constantly update the registers before the
exception is delivered, such that you can simply pick up work again when
re-entering the instruction after the exception was handled by the guest.

I assume we could do the same: updating the registers whenever a store
succeeded. Doing that after each and every byte is a bit inefficient,
but not sure if we care.

But as we're only storing random data, maybe we don't really care for
now and can simply always start anew. (the guest can observe this wrong
handling, though)

At a minimum we might want to add

/*
 * TODO: we should update the registers constantly, such that we reflect
 * which memory was already processed/modified if we get an exception
 * in-between.
 */

> +                len -= block;
> +        }
> +}
> +
>  uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>                       uint32_t type)
>  {
> @@ -52,6 +70,20 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>              cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>          }
>          break;
> +    case 114:
> +        if (r1 & 1 || !r1 || r2 & 1 || !r2) {
> +                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +                break;

You can drop the "break;", we'll jump right out of that function and
never return -- the function is flagged as G_NORETURN.

> +        }
> +
> +        fill_buf_random(env, ra, env->regs[r1], env->regs[r1 + 1]);
> +        fill_buf_random(env, ra, env->regs[r2], env->regs[r2 + 1]);
> +
> +        env->regs[r1] += env->regs[r1 + 1];
> +        env->regs[r1 + 1] = 0;
> +        env->regs[r2] += env->regs[r2 + 1];
> +        env->regs[r2 + 1] = 0;

We have to be careful in 24-bit an 31-bit address mode, we may only
update selected parts of the registers.

For example, note that instead of env->regs[r1 + 1], you'd actually have
to use the reduced length you currently compute in fill_buf_random.

We have to make sure the following holds:


"For the PRNO-TRNG function, the first-operand
address, first-operand length, second-operand
address, and second-operand length in general reg-
isters R1, R1 + 1, R2, and R2 + 1, respectively, are
updated at the completion of the instruction. In the
24-bit addressing mode, bits 40-63 of the even-num-
bered register are incremented by the number of
bytes processed for the respective operand, bits 0-31
of the register remain unchanged, and regardless of
the operand’s length, bits 32-39 of the register may
be set to zero or may remain unchanged. In the 31-
bit addressing mode, bits 33-63 of the even-num-
bered register are incremented by the number of
bytes processed for the respective operand, bits 0-31
of the register remain unchanged, and regardless of
the operand’s length, bit 32 of the register may be set
to zero or may remain unchanged. In the 64-bit
addressing mode, bits 0-63 of the even-numbered
register are incremented by the number of bytes pro-
cessed for the respective operand. In either the 24-
or 31-bit addressing mode, bits 32-63 of the odd-
numbered register are decremented by the number
of bytes processed for the respective operand, and
bits 0-31 of the register remain unchanged. In the 64-
bit addressing mode, bits 0-63 of the odd-numbered
register are decremented by the number of bytes pro-
cessed for the respective operand."

See target/s390x/tcg/mem_helper.c:set_address() as an example on how to
modify parts of registers using deposit64().


Thanks!

-- 
Thanks,

David / dhildenb


