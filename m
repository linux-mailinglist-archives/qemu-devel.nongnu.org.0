Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28C48C09A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:02:30 +0100 (CET)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZWX-0001wQ-CZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:02:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZEc-0008Su-2P
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:43:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZEY-0004Lq-JX
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641977033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHF7lQnvRQd4BwxGI5zN8E97FZYb8PnmdQMEf+Su1F4=;
 b=YVGHCzJHQxlP1sGWG4CgCMV3yZbPobVGNww9VVQAOIbowemX6GujtrJqgFbvl62wp/aBSC
 I0qtE9OE7hoZc8Bt8gFYGWvygX77bcdgB4ACRGdUxojmnZ6FAYPWAOIkuPSwHJcZAQPb2q
 aBvFLL0YB9FzrooRUBk0mmLwHdZ2uKE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-U8GpLnVNMdyRMFiar3MG_w-1; Wed, 12 Jan 2022 03:43:50 -0500
X-MC-Unique: U8GpLnVNMdyRMFiar3MG_w-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402510800b003f9d22c4d48so1589271edd.21
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZHF7lQnvRQd4BwxGI5zN8E97FZYb8PnmdQMEf+Su1F4=;
 b=bIDl0NYQcWuoKo+hhzUQsrkgd5uD8iWmCflIJ57tjo+5fkJz1AzOzlSQ0nRRUfl/xG
 2jlhbB2Z9Wdg2GZLdfMV6PnXv7bQP+uSFGadqXltr+zZyGrFVfQ8q32lUbXN9JC2TZEl
 BKqGO62mvxAepcCE5Zu/P+VlnUGLf4mXFdo4tFwCqW9gHWDBniljFuw9/aOBDiJ+1lF7
 pZ8Maoq9WIqL08SqvIQEaoCaZnOgLuc75PHfTluHxIEYfllKxR1NVImDmoyl9URIxkMb
 FnCihsYboFaJp8tNWP2DnPYY6lX7leCb263RhEXof/AM8F9iB/YHeqi5z6gnS1emp+CM
 AiPw==
X-Gm-Message-State: AOAM533z2QlA3g1jKJFgmLAWbf6LyQ0sxhWDn7z4wOrkCEyb01TcFLFq
 HnIccj3MW4ONw8nh/1y0EJQF2XOxZLKeNBSPK0j3ik15+fxq2AwS/oMBS9ASZzuCp+vqHNWAFZG
 cNyfl01i7Xaa6Pss=
X-Received: by 2002:a17:906:6a90:: with SMTP id
 p16mr6730236ejr.115.1641977029201; 
 Wed, 12 Jan 2022 00:43:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8aZIQFKcRj1m3J4asp7UJ+e2avKi3Sv+JRu1U/pnfE0Bd1F7BCpnbZBjrfz6ZxA57A5l5iQ==
X-Received: by 2002:a17:906:6a90:: with SMTP id
 p16mr6730219ejr.115.1641977028954; 
 Wed, 12 Jan 2022 00:43:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id s7sm5833115edx.56.2022.01.12.00.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:43:48 -0800 (PST)
Message-ID: <28a7fb97-6c81-6975-e6f2-c65370d1cc99@redhat.com>
Date: Wed, 12 Jan 2022 09:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/5] target/s390x: Fix shifting 32-bit values for more
 than 31 bits
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-5-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112043948.224405-5-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

>  
> +static uint32_t cc_calc_sla_32(uint32_t src, int shift)
> +{
> +    return cc_calc_sla_64(((uint64_t)src) << 32, shift);
> +}
> +

Nice trick. What about doing the shift in op_sla if  s->insn->data == 31
and unifying to a single CC_OP_SLA ?

>  static uint32_t cc_calc_flogr(uint64_t dst)
>  {
>      return dst ? 2 : 0;
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index 90c753068c..1c3e115712 100644
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
> -    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 63)
> +    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sla, 0, 63)
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
> index 68ca7e476a..5a2b609d0f 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -1178,19 +1178,6 @@ struct DisasInsn {
>  /* ====================================================================== */
>  /* Miscellaneous helpers, used by several operations.  */
>  
> -static void help_l2_shift(DisasContext *s, DisasOps *o, int mask)
> -{
> -    int b2 = get_field(s, b2);
> -    int d2 = get_field(s, d2);
> -
> -    if (b2 == 0) {
> -        o->in2 = tcg_const_i64(d2 & mask);
> -    } else {
> -        o->in2 = get_address(s, 0, b2, d2);
> -        tcg_gen_andi_i64(o->in2, o->in2, mask);
> -    }
> -}
> -
>  static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
>  {
>      if (dest == s->pc_tmp) {
> @@ -5923,17 +5910,19 @@ static void in2_ri2(DisasContext *s, DisasOps *o)
>  }
>  #define SPEC_in2_ri2 0
>  
> -static void in2_sh32(DisasContext *s, DisasOps *o)
> +static void in2_sh(DisasContext *s, DisasOps *o)
>  {
> -    help_l2_shift(s, o, 31);
> -}
> -#define SPEC_in2_sh32 0
> +    int b2 = get_field(s, b2);
> +    int d2 = get_field(s, d2);
>  
> -static void in2_sh64(DisasContext *s, DisasOps *o)
> -{
> -    help_l2_shift(s, o, 63);
> +    if (b2 == 0) {
> +        o->in2 = tcg_const_i64(d2 & 0x3f);
> +    } else {
> +        o->in2 = get_address(s, 0, b2, d2);
> +        tcg_gen_andi_i64(o->in2, o->in2, 0x3f);
> +    }
>  }
> -#define SPEC_in2_sh64 0
> +#define SPEC_in2_sh 0
>  
>  static void in2_m2_8u(DisasContext *s, DisasOps *o)
>  {

LGTM, thanks

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


