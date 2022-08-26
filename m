Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B5A5A2741
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:56:35 +0200 (CEST)
Received: from localhost ([::1]:54244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXww-0001kF-GD
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:56:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRXVe-0000Lu-BP
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRXVb-0008K8-B0
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661513298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zn/9mjkarBlVWDYXqVRMYB2pEMbC0FOiTpyuGvZcf4E=;
 b=fqu8C1m99b5XOa3KDimI/XYR8kLKrx3ubmBhXh1S7Q5l1i0vL7fOgUTzZGm3Q8sMK7BTYB
 R84Mp90+Ph0jzH10U1gJJGO5DfNDffmCf8mM6wzdIiXcbwMMcUkxlbdlWBaKpw7vZfV2O+
 sUxqz2tJA0GYWaMult+5xA1SKb8qgYU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-wxIy0h9uPvCnUY7g6L6KQA-1; Fri, 26 Aug 2022 07:28:14 -0400
X-MC-Unique: wxIy0h9uPvCnUY7g6L6KQA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p19-20020a05600c1d9300b003a5c3141365so3924882wms.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 04:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Zn/9mjkarBlVWDYXqVRMYB2pEMbC0FOiTpyuGvZcf4E=;
 b=dvZcO2+88kaIICzGNCoD8egD/wyF3LsliErb7YvIgW8Td+ymStuIZnRZjxDHQUgeeV
 PKjeNNhdxLhl+X1LxQWEvftT+twvh6Xj0PbtlZGVO9G9WXJknrI8rtGDpbnGQzwgf3CS
 xLkHuBpQshisd6KpU4uDxdvQV9E8ufIvosK4szag29Dmgz6em9Ma+7EOrzmYp4biAash
 K2mDicygcElxCTJdSWJQFiV9LYCz8JAlKrd2QkLPGGuNZ+OtC9NIVf34Ot9fk0W/wSjj
 7pbDY0hQO4DaMrb+3u32CEl/okd/OjR1+o8m1dzgUng18yVOag0LoP++6K4P2oNzlUhw
 Z02Q==
X-Gm-Message-State: ACgBeo06UKF/XJw7yX9D/lsd2EVa9eGFqw/zG13l5d5Lxa739lCASi3a
 hLHrPkb8U8UPmIy8mN3yg7sfz04Ul+9yrmEyGtqYr6K4lkZ84InmuhZUcoOvxuFnSal/lWottZv
 1Y9zEEuDgJcEy3Es=
X-Received: by 2002:a05:6000:2a1:b0:225:7d0e:a8 with SMTP id
 l1-20020a05600002a100b002257d0e00a8mr3961755wry.322.1661513293856; 
 Fri, 26 Aug 2022 04:28:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4D3WxpfWiXwt3ADLeKqqvK8fPkg/92VcSQWZyeVSUeVRLI6It1aT5152OfMkdC1UjaW8Pl+w==
X-Received: by 2002:a05:6000:2a1:b0:225:7d0e:a8 with SMTP id
 l1-20020a05600002a100b002257d0e00a8mr3961729wry.322.1661513293544; 
 Fri, 26 Aug 2022 04:28:13 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-42.web.vodafone.de.
 [109.43.179.42]) by smtp.gmail.com with ESMTPSA id
 h21-20020a05600c351500b003a60ff7c082sm8670853wmq.15.2022.08.26.04.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 04:28:13 -0700 (PDT)
Message-ID: <4b1352d4-4dff-7ab7-4c96-3fed4f52dd77@redhat.com>
Date: Fri, 26 Aug 2022 13:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Yu0UtNzyb81O0ND2@zx2c4.com>
 <20220809150331.84296-1-Jason@zx2c4.com>
 <20220809150331.84296-2-Jason@zx2c4.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v7 2/2] target/s390x: support PRNO_TRNG instruction
In-Reply-To: <20220809150331.84296-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 09/08/2022 17.03, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   target/s390x/gen-features.c      |  1 +
>   target/s390x/tcg/crypto_helper.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)

Also here: If you've got some spare time, a test in tests/tcg/s390x/ would 
be very welcome!

> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 85ab69d04e..423ae44315 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -752,6 +752,7 @@ static uint16_t qemu_MAX[] = {
>       S390_FEAT_MSA_EXT_5,
>       S390_FEAT_KIMD_SHA_512,
>       S390_FEAT_KLMD_SHA_512,
> +    S390_FEAT_PRNO_TRNG,
>   };

(this will need some fencing for old machine types, too, just like in patch 1/2)

>   /****** END FEATURE DEFS ******/
> diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> index 4d45de8faa..e155ae1f54 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -14,6 +14,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/guest-random.h"
>   #include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/helper-proto.h"
> @@ -167,6 +168,31 @@ static int klmd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_bloc
>       return 0;
>   }
>   
> +static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
> +                            uint64_t *buf_reg, uint64_t *len_reg)
> +{
> +    uint8_t tmp[256];
> +    uint64_t len = *len_reg;
> +    int message_reg_len = 64;
> +
> +    if (!(env->psw.mask & PSW_MASK_64)) {
> +        len = (uint32_t)len;
> +        message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> +    }
> +
> +    while (len) {
> +        size_t block = MIN(len, sizeof(tmp));
> +
> +        qemu_guest_getrandom_nofail(tmp, block);
> +        for (size_t i = 0; i < block; ++i) {
> +            cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
> +            *buf_reg = deposit64(*buf_reg, 0, message_reg_len, *buf_reg + 1);
> +            --*len_reg;

I know it's annoying, but technically, you must not touch the upper bits of 
the len_reg if running in 31- or 24-bit addressing mode. The Principles of 
Operations say:

"In either the 24- or 31-bit addressing mode, bits 32-63 of the odd-numbered 
register are decremented by the number
of bytes processed for the respective operand, and
bits 0-31 of the register remain unchanged."

> +        }
> +        len -= block;
> +    }
> +}
> +
>   uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>                        uint32_t type)
>   {

Don't you also need to modify the "query" part to signal the availability of 
the function? Doesn't Linux in the guest check the availability first before 
using it?

> @@ -209,6 +235,10 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>               return klmd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1]);
>           }
>           break;
> +    case 114: /* CPACF_PRNO_TRNG */
> +        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
> +        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
> +        break;
>       default:
>           /* we don't implement any other subfunction yet */
>           g_assert_not_reached();

Maybe one more thing to check (according the "Special Conditions" section in 
the Principles of Operation):

"A specification exception is recognized and no other
action is taken if any of the following conditions exist:

...

2. The R1 or R2 fields designate an odd-numbered
register or general register 0. This exception is
recognized regardless of the function code.
"

  Thomas


