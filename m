Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9804BA16E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:40:24 +0100 (CET)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKh1D-000517-Nn
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:40:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nKgPP-0006ce-0J
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:01:19 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nKgPL-0003Tm-Vi
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:01:18 -0500
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8EF8A40615
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645102870;
 bh=x/2ScG4D4h0C8GyVW1b9b+v/np6KRjsbvZOmmRDB/m0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=OxGrrJvRVCG8vMVtWnxv6Sy6qCYwzYJKhFWFTFMU+jyoDvD6VDs/Nn6ebyRdhJuGL
 XILMMMxoNu5AeV0RfyKSLB9H7aZWgLY0qqobKGJ3/XgBqz1wey3+lEPLwzNT4voWA9
 BTSAAjbPevF0BPmBou2vUq5u+40dDH4DUuoxL5N5NGOu8HxmUHI/K8QYiNqcEQHOEF
 DGSUX6hJoPmSDB82NXPisQFNWkAGTLxHtAdoTRfFJZsX5qeaOP/AHFNveJGPQuvat1
 RJcYz5T/M+0zrxSTQGZ7iEsixX+yHz3Wmx6zoYELi6d6dY4hiQazQh/Yrx/vVlyIWy
 fpFldBGWn68QA==
Received: by mail-io1-f71.google.com with SMTP id
 r191-20020a6b8fc8000000b0063de0033ee7so2105924iod.3
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 05:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/2ScG4D4h0C8GyVW1b9b+v/np6KRjsbvZOmmRDB/m0=;
 b=IADKqTWE3uBxf4Ac1UTNlc7GE/zAoKHrnfS+2/FG9+u5B0ZDFofW0CwCyWkmziijE5
 uqJxUNj2ZxgurohRAoibTVau2Zn2xP5XpMWMa7U4OWRy/kwhEfo7g60O0YPkgbBMgkxI
 FdpQolMqtFFlSu5CUjV2bWx6iC1u+42rj+HFhzNr+48VO1+d2csZkpaW6RPCNZE1niYV
 Q2v1bSuWzNypvub7hmrZd2CLgoxBsA3Etp6YGQTT7IH8k4ka2UfGvKHzxGEPKEnjWR6r
 ljyXm9Zbf3POXEnDVVVHDe7gllLm0OFC7aOalV91SWfKKofDJ5k8DJajuJkA11yvDvbb
 piuw==
X-Gm-Message-State: AOAM530Qx0cTvWL+BALFaAB7/KNc/usmavVpjZM5vKkCMFsloVaE1TUT
 +Xx7NKWiVyrcI2uHwMjdy3gTt2RI+1P39CTv7df12sKquVDyPo0POafUzGz1EUEOKCnjU7/Z/Nx
 voLhbD+GjMAjpXAHZbt//ym/K6Qzu+39Yy5F61CzhFKKUp5Sb
X-Received: by 2002:a92:6b09:0:b0:2bc:5426:9572 with SMTP id
 g9-20020a926b09000000b002bc54269572mr1979090ilc.136.1645102869273; 
 Thu, 17 Feb 2022 05:01:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd/wqlBiLTw78Kx9Md0SrntHIx3Dc+wL+hXmpDkwsnte6cbN8MmTdo6ZXOh7EuhcuksBhTvtcOTUxR/geoMF8=
X-Received: by 2002:a92:6b09:0:b0:2bc:5426:9572 with SMTP id
 g9-20020a926b09000000b002bc54269572mr1979067ilc.136.1645102868831; Thu, 17
 Feb 2022 05:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20220217034725.272552-1-richard.henderson@linaro.org>
In-Reply-To: <20220217034725.272552-1-richard.henderson@linaro.org>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Thu, 17 Feb 2022 14:00:42 +0100
Message-ID: <CAATJJ0+_BPG5zHTaqho=mgbWAhg5MLn__1zU_hXGCdDTJ9NfZA@mail.gmail.com>
Subject: Re: [PATCH] tcg: Remove dh_alias indirection for dh_typecode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 4:48 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The dh_alias redirect is intended to handle TCG types as distinguished
> from C types.  TCG does not distinguish signed int from unsigned int,
> because they are the same size.  However, we need to retain this
> distinction for dh_typecode, lest we fail to extend abi types properly
> for the host call parameters.

Thank you Richard and Keith for the fix for
- https://github.com/keith-packard/snek/issues/58
- https://gitlab.com/qemu-project/qemu/-/issues/876

I did apply that and tested it on s390x with the load that originally found it.
With qemu 6.2 + that patch I ran the full testsuite of snek-arm on
s390x and it works great now.
If you like feel free to add any combination of the following when committing:

Fixes: #876
Fixes: 7319d83a735 ("tcg: Combine dh_is_64bit and dh_is_signed to dh_typecode")
Reported-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Tested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>

> This bug was detected when running the 'arm' emulator on an s390
> system. The s390 uses TCG_TARGET_EXTEND_ARGS which triggers code
> in tcg_gen_callN to extend 32 bit values to 64 bits; the incorrect
> sign data in the typemask for each argument caused the values to be
> extended as unsigned values.
>
> This simple program exhibits the problem:
>
>         static volatile int num = -9;
>         static volatile int den = -5;
>
>         int
>         main(void)
>         {
>                 int quo = num / den;
>                 printf("num %d den %d quo %d\n", num, den, quo);
>                 exit(0);
>         }
>
> When run on the broken qemu, this results in:
>
>         num -9 den -5 quo 0
>
> The correct result is:
>
>         num -9 den -5 quo 1
>
> Reported-by: Keith Packard <keithp@keithp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/helper-head.h   | 19 ++++++++++---------
>  target/hppa/helper.h         |  2 ++
>  target/i386/ops_sse_header.h |  3 +++
>  target/m68k/helper.h         |  1 +
>  target/ppc/helper.h          |  3 +++
>  5 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
> index b974eb394a..734af067fe 100644
> --- a/include/exec/helper-head.h
> +++ b/include/exec/helper-head.h
> @@ -53,13 +53,16 @@
>  # ifdef TARGET_LONG_BITS
>  #  if TARGET_LONG_BITS == 32
>  #   define dh_alias_tl i32
> +#   define dh_typecode_tl dh_typecode_i32
>  #  else
>  #   define dh_alias_tl i64
> +#   define dh_typecode_tl dh_typecode_i64
>  #  endif
>  # endif
> -# define dh_alias_env ptr
>  # define dh_ctype_tl target_ulong
> +# define dh_alias_env ptr
>  # define dh_ctype_env CPUArchState *
> +# define dh_typecode_env dh_typecode_ptr
>  #endif
>
>  /* We can't use glue() here because it falls foul of C preprocessor
> @@ -92,18 +95,16 @@
>  #define dh_typecode_i64 4
>  #define dh_typecode_s64 5
>  #define dh_typecode_ptr 6
> -#define dh_typecode(t) glue(dh_typecode_, dh_alias(t))
> +#define dh_typecode_int dh_typecode_s32
> +#define dh_typecode_f16 dh_typecode_i32
> +#define dh_typecode_f32 dh_typecode_i32
> +#define dh_typecode_f64 dh_typecode_i64
> +#define dh_typecode_cptr dh_typecode_ptr
> +#define dh_typecode(t) dh_typecode_##t
>
>  #define dh_callflag_i32  0
> -#define dh_callflag_s32  0
> -#define dh_callflag_int  0
>  #define dh_callflag_i64  0
> -#define dh_callflag_s64  0
> -#define dh_callflag_f16  0
> -#define dh_callflag_f32  0
> -#define dh_callflag_f64  0
>  #define dh_callflag_ptr  0
> -#define dh_callflag_cptr dh_callflag_ptr
>  #define dh_callflag_void 0
>  #define dh_callflag_noreturn TCG_CALL_NO_RETURN
>  #define dh_callflag(t) glue(dh_callflag_, dh_alias(t))
> diff --git a/target/hppa/helper.h b/target/hppa/helper.h
> index fe8a9ce493..c7e35ce8c7 100644
> --- a/target/hppa/helper.h
> +++ b/target/hppa/helper.h
> @@ -1,7 +1,9 @@
>  #if TARGET_REGISTER_BITS == 64
>  # define dh_alias_tr     i64
> +# define dh_typecode_tr  dh_typecode_i64
>  #else
>  # define dh_alias_tr     i32
> +# define dh_typecode_tr  dh_typecode_i32
>  #endif
>  #define dh_ctype_tr      target_ureg
>
> diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
> index e68af5c403..cef28f2aae 100644
> --- a/target/i386/ops_sse_header.h
> +++ b/target/i386/ops_sse_header.h
> @@ -30,6 +30,9 @@
>  #define dh_ctype_Reg Reg *
>  #define dh_ctype_ZMMReg ZMMReg *
>  #define dh_ctype_MMXReg MMXReg *
> +#define dh_typecode_Reg dh_typecode_ptr
> +#define dh_typecode_ZMMReg dh_typecode_ptr
> +#define dh_typecode_MMXReg dh_typecode_ptr
>
>  DEF_HELPER_3(glue(psrlw, SUFFIX), void, env, Reg, Reg)
>  DEF_HELPER_3(glue(psraw, SUFFIX), void, env, Reg, Reg)
> diff --git a/target/m68k/helper.h b/target/m68k/helper.h
> index 9842eeaa95..0a6b4146f6 100644
> --- a/target/m68k/helper.h
> +++ b/target/m68k/helper.h
> @@ -17,6 +17,7 @@ DEF_HELPER_4(cas2l_parallel, void, env, i32, i32, i32)
>
>  #define dh_alias_fp ptr
>  #define dh_ctype_fp FPReg *
> +#define dh_typecode_fp dh_typecode_ptr
>
>  DEF_HELPER_3(exts32, void, env, fp, s32)
>  DEF_HELPER_3(extf32, void, env, fp, f32)
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index ab008c9d4e..ae7d503fcf 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -127,9 +127,11 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
>
>  #define dh_alias_avr ptr
>  #define dh_ctype_avr ppc_avr_t *
> +#define dh_typecode_avr dh_typecode_ptr
>
>  #define dh_alias_vsr ptr
>  #define dh_ctype_vsr ppc_vsr_t *
> +#define dh_typecode_vsr dh_typecode_ptr
>
>  DEF_HELPER_3(vavgub, void, avr, avr, avr)
>  DEF_HELPER_3(vavguh, void, avr, avr, avr)
> @@ -708,6 +710,7 @@ DEF_HELPER_3(store_dbatu, void, env, i32, tl)
>
>  #define dh_alias_fprp ptr
>  #define dh_ctype_fprp ppc_fprp_t *
> +#define dh_typecode_fprp dh_typecode_ptr
>
>  DEF_HELPER_4(DADD, void, env, fprp, fprp, fprp)
>  DEF_HELPER_4(DADDQ, void, env, fprp, fprp, fprp)
> --
> 2.25.1
>
>


-- 
Christian Ehrhardt
Staff Engineer, Ubuntu Server
Canonical Ltd

