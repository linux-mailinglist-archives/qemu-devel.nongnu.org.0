Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9548AFEB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:54:02 +0100 (CET)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IXA-0001aO-QP
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7I2c-0000L4-B6
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7I2Z-00043p-32
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641910941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3kOHivcya0c4X91WkVzwyP+0X5EyshnEmBg1vR4X+w=;
 b=c2AVLWsAKFALg5arD1l54OItGyobQ1niTHan+8snOtLaMcgdXT17KCVY58ZLCP9gXZX7+l
 Oihe2FQbhvw+ODbk9vtYUJ3l0EMNsfastr/+44yqJNirr8zp5wPGRp2ldmUY9iqiXIFlYC
 ylZK3aUwb7vI1BTWSE44PA+6nQq1f9c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-IqXvP-TUMyqpo_P-rW6wSg-1; Tue, 11 Jan 2022 09:22:20 -0500
X-MC-Unique: IqXvP-TUMyqpo_P-rW6wSg-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so13443285edb.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=f3kOHivcya0c4X91WkVzwyP+0X5EyshnEmBg1vR4X+w=;
 b=vpf4JNgyvAFxXnhDGwUQVlBXcEHW5GPHNhS9FM9EgkWZW7SNefYKn49WJgNDBBIQNT
 3fiJOmDeN6uWDG4fT8JAU8uK8TLjijXgnrEBEwGuOkab9k1jWRSB5HgWHMQqq1ZkmtZ/
 8Jn+ZTQHX+OouZbyHdLDbcQsJ23bqCfrvWGwExKLRZsLdeTg51S1gNgR+Y53dtBxa/0I
 RjptkzyiY7mSNDIJAJ9svf82dZPiXOUS8ofTAipyPX8ykuu8VHxK1gGu7y6Tnosjt1LQ
 bW6DStYBsVMAamTji5miXSBDLcD7m9fq8Fca1ycRtc1dEqt4AVfMxbsPUOGyY2lr//Oq
 Uv+g==
X-Gm-Message-State: AOAM533Ws/GG8rm6SdJ0UqdSwvfer10nlAJDe91Mi5GSyNN6z7Rj+VDY
 X9R18pKSKZ4oMGRjtJKHbXY9tP7+jGptzO/LicMiKpmEhP+prVx/p/V0dEaWShp8Pje+Ejw29jx
 vV6fnAmnreYggxDE=
X-Received: by 2002:a05:6402:5112:: with SMTP id
 m18mr4671784edd.191.1641910939331; 
 Tue, 11 Jan 2022 06:22:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwoI1sthYiG1BiTbDXz1YcjeO91yTLF8uwPiLFkk8v5ZAEhvBiCB0Y6czqLQ+o2nyQsY+alg==
X-Received: by 2002:a05:6402:5112:: with SMTP id
 m18mr4671740edd.191.1641910938867; 
 Tue, 11 Jan 2022 06:22:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:6800:150a:bea9:f03e:c4da?
 (p200300cbc7026800150abea9f03ec4da.dip0.t-ipconnect.de.
 [2003:cb:c702:6800:150a:bea9:f03e:c4da])
 by smtp.gmail.com with ESMTPSA id w3sm3620749eji.134.2022.01.11.06.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 06:22:18 -0800 (PST)
Message-ID: <64e683e1-64ca-205e-0f09-0817c97a7e1c@redhat.com>
Date: Tue, 11 Jan 2022 15:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220110185918.219154-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] target/s390x: Fix 32-bit shifts
In-Reply-To: <20220110185918.219154-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.01.22 19:59, Ilya Leoshkevich wrote:
> Both 32- and 64-bit shifts use lowest 6 address bits. The current code
> special-cases 32-bit shifts to use only 5 bits, which is not correct.
> 

I assume for 32-bit shifts, we could only shift by 31, not by 32 or
bigger. So it's impossible to zero out a 32bit register using a shift
right now.

Let's take a look at the details:

* RLL: IMHO it doesn't matter if we rotate by an additional 32bit, the
       result is the same. Not broken.
* SLA/SLAK: the numerical part is 31-bit, we don't care about shifting
            any more, the result for the numerical part is the same (0).
            Not broken.
* SLL/SLAK: Is broken because we cannot shift by > 31 and create
            a 0 result. Broken.
* SRA/SRAK: Same as SLA/SLAK. Not broken.
* SRL/SRLK: Same as SLL/SLAK, broken.
* SLDA/SLDL ... should not be broken because they are 64 bit shifts.

So AFAIKS, only SLL/SLAK and SRL/SRLK needs fixing to be able to shift > 32.

The issue with this patch is that I think it degrades CC computation.
For 32bit, we could now get a shift < 64, and I think at least
cc_calc_sla_32() is not prepared for that.


> Fix by merging sh32 and sh64.
> 
> Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/insn-data.def  | 36 ++++++++++++++++-----------------
>  target/s390x/tcg/translate.c    | 10 ++-------
>  tests/tcg/s390x/Makefile.target |  1 +
>  tests/tcg/s390x/sll.c           | 25 +++++++++++++++++++++++
>  4 files changed, 46 insertions(+), 26 deletions(-)
>  create mode 100644 tests/tcg/s390x/sll.c
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index f0af458aee..348a15be72 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -747,8 +747,8 @@
>      C(0xb9e1, POPCNT,  RRE,   PC,  0, r2_o, r1, 0, popcnt, nz64)
>  
>  /* ROTATE LEFT SINGLE LOGICAL */
> -    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh32, new, r1_32, rll32, 0)
> -    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, rll64, 0)
> +    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh, new, r1_32, rll32, 0)
> +    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh, r1, 0, rll64, 0)
>  
>  /* ROTATE THEN INSERT SELECTED BITS */
>      C(0xec55, RISBG,   RIE_f, GIE, 0, r2, r1, 0, risbg, s64)
> @@ -784,29 +784,29 @@
>      C(0x0400, SPM,     RR_a,  Z,   r1, 0, 0, 0, spm, 0)
>  
>  /* SHIFT LEFT SINGLE */
> -    D(0x8b00, SLA,     RS_a,  Z,   r1, sh32, new, r1_32, sla, 0, 31)
> -    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh32, new, r1_32, sla, 0, 31)
> -    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh64, r1, 0, sla, 0, 63)
> +    D(0x8b00, SLA,     RS_a,  Z,   r1, sh, new, r1_32, sla, 0, 31)
> +    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh, new, r1_32, sla, 0, 31)
> +    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh, r1, 0, sla, 0, 63)
>  /* SHIFT LEFT SINGLE LOGICAL */
> -    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh32, new, r1_32, sll, 0)
> -    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh32, new, r1_32, sll, 0)
> -    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, sll, 0)
> +    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh, new, r1_32, sll, 0)
> +    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh, new, r1_32, sll, 0)
> +    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh, r1, 0, sll, 0)
>  /* SHIFT RIGHT SINGLE */
> -    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh32, new, r1_32, sra, s32)
> -    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh32, new, r1_32, sra, s32)
> -    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh64, r1, 0, sra, s64)
> +    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh, new, r1_32, sra, s32)
> +    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh, new, r1_32, sra, s32)
> +    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh, r1, 0, sra, s64)
>  /* SHIFT RIGHT SINGLE LOGICAL */
> -    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh32, new, r1_32, srl, 0)
> -    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh32, new, r1_32, srl, 0)
> -    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh64, r1, 0, srl, 0)
> +    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh, new, r1_32, srl, 0)
> +    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh, new, r1_32, srl, 0)
> +    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh, r1, 0, srl, 0)
>  /* SHIFT LEFT DOUBLE */
> -    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 31)
> +    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sla, 0, 31)

I'm confused. Is the 31 correct here? We're operating on a 64 bit value
and the sign bit shouldn't be in the middle ... but maybe I am missing
something/

>  /* SHIFT LEFT DOUBLE LOGICAL */
> -    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sll, 0)
> +    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sll, 0)
>  /* SHIFT RIGHT DOUBLE */
> -    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sra, s64)
> +    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sra, s64)
>  /* SHIFT RIGHT DOUBLE LOGICAL */
> -    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, srl, 0)
> +    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, srl, 0)
>  
>  /* SQUARE ROOT */
>      F(0xb314, SQEBR,   RRE,   Z,   0, e2, new, e1, sqeb, 0, IF_BFP)
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index f180853e7a..89e14b8f29 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -5922,17 +5922,11 @@ static void in2_ri2(DisasContext *s, DisasOps *o)
>  }
>  #define SPEC_in2_ri2 0
>  
> -static void in2_sh32(DisasContext *s, DisasOps *o)
> -{
> -    help_l2_shift(s, o, 31);
> -}
> -#define SPEC_in2_sh32 0
> -
> -static void in2_sh64(DisasContext *s, DisasOps *o)
> +static void in2_sh(DisasContext *s, DisasOps *o)
>  {
>      help_l2_shift(s, o, 63);

If we go down that path, we should better inline help_l2_shift().

>  }
> -#define SPEC_in2_sh64 0
> +#define SPEC_in2_sh 0
>  
>  static void in2_m2_8u(DisasContext *s, DisasOps *o)
>  {
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index cc64dd32d2..4212bab014 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -9,6 +9,7 @@ TESTS+=exrl-trtr
>  TESTS+=pack
>  TESTS+=mvo
>  TESTS+=mvc
> +TESTS+=sll
>  TESTS+=trap
>  TESTS+=signals-s390x
>  
> diff --git a/tests/tcg/s390x/sll.c b/tests/tcg/s390x/sll.c
> new file mode 100644
> index 0000000000..aba2a94676
> --- /dev/null
> +++ b/tests/tcg/s390x/sll.c
> @@ -0,0 +1,25 @@
> +#include <stdint.h>
> +#include <unistd.h>
> +
> +int main(void)
> +{
> +    uint64_t op1 = 0xb90281a3105939dfull;
> +    uint64_t op2 = 0xb5e4df7e082e4c5eull;
> +    uint64_t cc = 0xffffffffffffffffull;
> +
> +    asm("sll\t%[op1],0xd04(%[op2])"
> +        "\n\tipm\t%[cc]"

Let's make this human-readable :)

asm("    sll %[op1],0xd04(%[op2])\n"
    "    ipm %[cc]"

Should we bettr use "asm volatile"?

> +        : [op1] "+r" (op1),
> +          [cc] "+r" (cc)
> +        : [op2] "r" (op2)
> +        : "cc");
> +    if (op1 != 0xb90281a300000000ull) {
> +        write(1, "bad result\n", 11);
> +        return 1;
> +    }
> +    if (cc != 0xffffffff10ffffffull) {
> +        write(1, "bad cc\n", 7);
> +        return 1;
> +    }
> +    return 0;
> +}

Can we split out the test into a separate patch?

-- 
Thanks,

David / dhildenb


