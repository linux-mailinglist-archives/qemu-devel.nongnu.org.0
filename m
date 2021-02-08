Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE8313E23
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:55:46 +0100 (CET)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BhJ-0005aR-A6
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95fI-0001uw-R5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:29:18 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95ev-00057A-Ho
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:29:04 -0500
Received: by mail-wm1-x330.google.com with SMTP id o24so5365305wmh.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ueFZ25kIdWi+xdX1P2brSyuxbAe9YkotputOfuHXYbo=;
 b=XL72s5BSZr4erJmx+lf5Otn4ail+m1m3rNC32xdjuRlqLcta2krvWHkvsGIpN5rGAr
 L4MMQEc/7yPziQJuiyHDoodx7E5lZeGrcwUBHb/5t4W5E2otGyOZAvfXoBxBY8ye8jFw
 TO5iIPFlL8f7ioEn/rSpQ6e7IH65xtVq4gB2NDyXGsgqtAEoZLZphf/HP5eCgQxrSKQj
 NLN/5BogrlNreJ9mYReJlLJwq4oILR5+pknZf6dxTwIIOXZ0OVDLf7aFbmgE85yzKecq
 zqqQqRhC0ZYPG08cCbejTXNHfZyucikStylp+GKVzviSTYo9ObWbXX7/X1pviM32Bqe9
 +s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ueFZ25kIdWi+xdX1P2brSyuxbAe9YkotputOfuHXYbo=;
 b=FObo/Y5LVG82Mw4vcnhb2k9dgejo58gvewxe2cy0h/onwflee/KFe5hajagHaVML17
 oFESLRWUD89UdIIxLqNLEeGyXgmKRZeTuM5dPsI1VtvRDKqjs0BNVotwtNnJPFtu6Kjv
 LWGesaDJOjpMdkyuqwbDXnG0nlyb5rleU9O6OHP752S/EAzZ9tPvEbe+oniq3BVuERM7
 s0XDBbGbyltKg7BWBrhpYGbBSFMXTQaLP/3eaDfn12bCzPgAJjtftTh1eQspWNJNz5Mb
 acgO1htdUADZHAWb+i4GuFmaA6e2YU05ZMo6IO/j/GDJvWZQVl3tbTe1R3EXdgBh8Nzl
 WtoA==
X-Gm-Message-State: AOAM530A6x6rqpkrmkoKdtOtv9hn8UFJ4wNEL8pyLBekft0ezJSrb0AN
 3FrN9qgmDeqRAOcoJgs/dcUmHOi0d1n0GDPk
X-Google-Smtp-Source: ABdhPJzQgwGBdtJGkZV6ImmXtS/PYS/8wS2HTwSQsBqe+fLYmYyP8b+mpR0ev/6/KHm5DK1raTfmQw==
X-Received: by 2002:a05:600c:4285:: with SMTP id
 v5mr7009316wmc.59.1612787326187; 
 Mon, 08 Feb 2021 04:28:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x9sm22985216wmb.14.2021.02.08.04.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:28:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64C071FF7E;
 Mon,  8 Feb 2021 12:28:44 +0000 (GMT)
References: <20210207050714.258627-1-dominik.gloess@tum.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dominik =?utf-8?B?R2zDtsOf?= <dominik.gloess@tum.de>
Subject: Re: [PATCH] target/i386: expose more MSRs to GDB
Date: Mon, 08 Feb 2021 12:12:39 +0000
In-reply-to: <20210207050714.258627-1-dominik.gloess@tum.de>
Message-ID: <87ft26bv5v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Dominik Gl=C3=B6=C3=9F <dominik.gloess@tum.de> writes:

> This patch adds 7 more model-specific registers to be usable while remote
> debugging in gdb. Accessing these registers can for example be useful for
> tracing Linux Systemcalls.
>
> Signed-off-by: Dominik Gl=C3=B6=C3=9F <dominik.gloess@tum.de>
> ---
>
> Adding registers to GDB like this works fine for now. Should there
> arise the need to add more MSRs, a rework of the code that reads
> the xml file should be considered. Hard coding the amount of registers and
> matching the offsets in gdbstub and the xml seems prone to error.

There are a number of places where the register state of the guest could
be read:

  - gdbstub
  - hmp (info registers) - does QMP also expose this?
  - logging (-d cpu)

and eventually

  - tcg plugins

so in the medium term I think it would make sense to have a generic
register facility that front-ends could register their registers with
which could then handle the various bits of glue to the various
consumers of register data. For example we could generate the gdb XML in
a similar manner to the current arm_register_sysreg_for_xml code.

I doubt the x86 front-end will see anything like the extensive handling
of the current ARMCPRegInfo code but having data driven machine
descriptions is certainly handy when you have to deal with multiple
architecture variants. Perhaps there is some scope for some logic
sharing or maybe those mechanisms will always be intimately tied to the
implementation details of the front-end?

This is all a rather long winded way of saying it looks ok to me so if
the arch maintainers are happy I am:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> This is similar to the patch by Elias Djossou to allow outputting the same
> registers via HMP. Both patches are however independent from each other.
>
> gdb-xml/i386-32bit.xml |   7 +++
>  gdb-xml/i386-64bit.xml |   7 +++
>  target/i386/cpu.c      |   4 +-
>  target/i386/gdbstub.c  | 122 ++++++++++++++++++++++++++++++++++++-----
>  4 files changed, 125 insertions(+), 15 deletions(-)
>
> diff --git a/gdb-xml/i386-32bit.xml b/gdb-xml/i386-32bit.xml
> index 872fcea9c2..0e650c9027 100644
> --- a/gdb-xml/i386-32bit.xml
> +++ b/gdb-xml/i386-32bit.xml
> @@ -61,6 +61,13 @@
>    <reg name=3D"es_base" bitsize=3D"32" type=3D"int32"/-->
>    <reg name=3D"fs_base" bitsize=3D"32" type=3D"int32"/>
>    <reg name=3D"gs_base" bitsize=3D"32" type=3D"int32"/>
> +  <reg name=3D"sysenter_cs" bitsize=3D"32" type=3D"int32"/>
> +  <reg name=3D"sysenter_esp" bitsize=3D"32" type=3D"int32"/>
> +  <reg name=3D"sysenter_eip" bitsize=3D"32" type=3D"int32"/>
> +  <reg name=3D"star" bitsize=3D"32" type=3D"int32"/>
> +  <reg name=3D"lstar" bitsize=3D"32" type=3D"int32"/>
> +  <reg name=3D"cstar" bitsize=3D"32" type=3D"int32"/>
> +  <reg name=3D"fmask" bitsize=3D"32" type=3D"int32"/>
>    <reg name=3D"k_gs_base" bitsize=3D"32" type=3D"int32"/>
>
>    <flags id=3D"i386_cr0" size=3D"4">
> diff --git a/gdb-xml/i386-64bit.xml b/gdb-xml/i386-64bit.xml
> index 6d88969211..d7ca2d8586 100644
> --- a/gdb-xml/i386-64bit.xml
> +++ b/gdb-xml/i386-64bit.xml
> @@ -74,6 +74,13 @@
>    <reg name=3D"es_base" bitsize=3D"64" type=3D"int64"/-->
>    <reg name=3D"fs_base" bitsize=3D"64" type=3D"int64"/>
>    <reg name=3D"gs_base" bitsize=3D"64" type=3D"int64"/>
> +  <reg name=3D"sysenter_cs" bitsize=3D"64" type=3D"int64"/>
> +  <reg name=3D"sysenter_esp" bitsize=3D"64" type=3D"int64"/>
> +  <reg name=3D"sysenter_eip" bitsize=3D"64" type=3D"int64"/>
> +  <reg name=3D"star" bitsize=3D"64" type=3D"int64"/>
> +  <reg name=3D"lstar" bitsize=3D"64" type=3D"int64"/>
> +  <reg name=3D"cstar" bitsize=3D"64" type=3D"int64"/>
> +  <reg name=3D"fmask" bitsize=3D"64" type=3D"int64"/>
>    <reg name=3D"k_gs_base" bitsize=3D"64" type=3D"int64"/>
>
>    <!-- Control registers -->
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ae89024d36..2b7be1c248 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7321,10 +7321,10 @@ static void x86_cpu_common_class_init(ObjectClass=
 *oc, void *data)
>      cc->gdb_arch_name =3D x86_gdb_arch_name;
>  #ifdef TARGET_X86_64
>      cc->gdb_core_xml_file =3D "i386-64bit.xml";
> -    cc->gdb_num_core_regs =3D 66;
> +    cc->gdb_num_core_regs =3D 73;
>  #else
>      cc->gdb_core_xml_file =3D "i386-32bit.xml";
> -    cc->gdb_num_core_regs =3D 50;
> +    cc->gdb_num_core_regs =3D 57;
>  #endif
>      cc->disas_set_info =3D x86_disas_set_info;
>
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 41e265fc67..5743ba39b3 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -46,7 +46,8 @@ static const int gpr_map32[8] =3D { 0, 1, 2, 3, 4, 5, 6=
, 7 };
>   */
>  #define IDX_NB_IP       1
>  #define IDX_NB_FLAGS    1
> -#define IDX_NB_SEG      (6 + 3)
> +#define IDX_NB_SEG      6
> +#define IDX_NB_MSR      10
>  #define IDX_NB_CTL      6
>  #define IDX_NB_FP       16
>  /*
> @@ -54,13 +55,14 @@ static const int gpr_map32[8] =3D { 0, 1, 2, 3, 4, 5,=
 6, 7 };
>   */
>  #define IDX_NB_MXCSR    1
>  /*
> - *          total ----> 8+1+1+9+6+16+8+1=3D50 or 16+1+1+9+6+16+16+1=3D66
> + *          total ----> 8+1+1+6+10+6+16+8+1=3D57 or 16+1+1+6+10+6+16+16+=
1=3D73
>   */
>
>  #define IDX_IP_REG      CPU_NB_REGS
>  #define IDX_FLAGS_REG   (IDX_IP_REG + IDX_NB_IP)
>  #define IDX_SEG_REGS    (IDX_FLAGS_REG + IDX_NB_FLAGS)
> -#define IDX_CTL_REGS    (IDX_SEG_REGS + IDX_NB_SEG)
> +#define IDX_MSR_REGS    (IDX_SEG_REGS + IDX_NB_SEG)
> +#define IDX_CTL_REGS    (IDX_MSR_REGS + IDX_NB_MSR)
>  #define IDX_FP_REGS     (IDX_CTL_REGS + IDX_NB_CTL)
>  #define IDX_XMM_REGS    (IDX_FP_REGS + IDX_NB_FP)
>  #define IDX_MXCSR_REG   (IDX_XMM_REGS + CPU_NB_REGS)
> @@ -143,25 +145,56 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteAr=
ray *mem_buf, int n)
>          case IDX_SEG_REGS + 5:
>              return gdb_get_reg32(mem_buf, env->segs[R_GS].selector);
>
> -        case IDX_SEG_REGS + 6:
> +        case IDX_MSR_REGS:
>              if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
>                  return gdb_get_reg64(mem_buf, env->segs[R_FS].base);
>              }
>              return gdb_get_reg32(mem_buf, env->segs[R_FS].base);
>
> -        case IDX_SEG_REGS + 7:
> +        case IDX_MSR_REGS + 1:
>              if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
>                  return gdb_get_reg64(mem_buf, env->segs[R_GS].base);
>              }
>              return gdb_get_reg32(mem_buf, env->segs[R_GS].base);
>
> -        case IDX_SEG_REGS + 8:
> -#ifdef TARGET_X86_64
> +        case IDX_MSR_REGS + 2:
> +            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
> +                return gdb_get_reg64(mem_buf, env->sysenter_cs);
> +            }
> +            return gdb_get_reg32(mem_buf, env->sysenter_cs);
> +
> +        case IDX_MSR_REGS + 3:
> +            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
> +                return gdb_get_reg64(mem_buf, env->sysenter_esp);
> +            }
> +            return gdb_get_reg32(mem_buf, env->sysenter_esp);
> +
> +        case IDX_MSR_REGS + 4:
>              if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
> -                return gdb_get_reg64(mem_buf, env->kernelgsbase);
> +                return gdb_get_reg64(mem_buf, env->sysenter_eip);
>              }
> -            return gdb_get_reg32(mem_buf, env->kernelgsbase);
> +            return gdb_get_reg32(mem_buf, env->sysenter_eip);
> +
> +        case IDX_MSR_REGS + 5:
> +            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
> +                return gdb_get_reg64(mem_buf, env->star);
> +            }
> +            return gdb_get_reg32(mem_buf, env->star);
> +
> +#ifdef TARGET_X86_64
> +        case IDX_MSR_REGS + 6:
> +            return gdb_get_reg64(mem_buf, env->fmask);
> +        case IDX_MSR_REGS + 7:
> +            return gdb_get_reg64(mem_buf, env->lstar);
> +        case IDX_MSR_REGS + 8:
> +            return gdb_get_reg64(mem_buf, env->cstar);
> +        case IDX_MSR_REGS + 9:
> +            return gdb_get_reg64(mem_buf, env->kernelgsbase);
>  #else
> +        case IDX_MSR_REGS + 6:
> +        case IDX_MSR_REGS + 7:
> +        case IDX_MSR_REGS + 8:
> +        case IDX_MSR_REGS + 9:
>              return gdb_get_reg32(mem_buf, 0);
>  #endif
>
> @@ -330,7 +363,7 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>          case IDX_SEG_REGS + 5:
>              return x86_cpu_gdb_load_seg(cpu, R_GS, mem_buf);
>
> -        case IDX_SEG_REGS + 6:
> +        case IDX_MSR_REGS:
>              if (env->hflags & HF_CS64_MASK) {
>                  env->segs[R_FS].base =3D ldq_p(mem_buf);
>                  return 8;
> @@ -338,7 +371,7 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>              env->segs[R_FS].base =3D ldl_p(mem_buf);
>              return 4;
>
> -        case IDX_SEG_REGS + 7:
> +        case IDX_MSR_REGS + 1:
>              if (env->hflags & HF_CS64_MASK) {
>                  env->segs[R_GS].base =3D ldq_p(mem_buf);
>                  return 8;
> @@ -346,16 +379,79 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_=
t *mem_buf, int n)
>              env->segs[R_GS].base =3D ldl_p(mem_buf);
>              return 4;
>
> -        case IDX_SEG_REGS + 8:
> +        case IDX_MSR_REGS + 2:
> +            if (env->hflags & HF_CS64_MASK) {
> +                env->sysenter_cs =3D ldq_p(mem_buf);
> +                return 8;
> +            }
> +            env->sysenter_cs =3D ldl_p(mem_buf);
> +            return 4;
> +
> +        case IDX_MSR_REGS + 3:
> +            if (env->hflags & HF_CS64_MASK) {
> +                env->sysenter_esp =3D ldq_p(mem_buf);
> +                return 8;
> +            }
> +            env->sysenter_esp =3D ldl_p(mem_buf);
> +            return 4;
> +
> +        case IDX_MSR_REGS + 4:
> +            if (env->hflags & HF_CS64_MASK) {
> +                env->sysenter_eip =3D ldq_p(mem_buf);
> +                return 8;
> +            }
> +            env->sysenter_eip =3D ldl_p(mem_buf);
> +            return 4;
> +
> +        case IDX_MSR_REGS + 5:
> +            if (env->hflags & HF_CS64_MASK) {
> +                env->star =3D ldq_p(mem_buf);
> +                return 8;
> +            }
> +            env->star =3D ldl_p(mem_buf);
> +            return 4;
> +
>  #ifdef TARGET_X86_64
> +        case IDX_MSR_REGS + 6:
> +            if (env->hflags & HF_CS64_MASK) {
> +                env->lstar =3D ldq_p(mem_buf);
> +                return 8;
> +            }
> +            env->lstar =3D ldl_p(mem_buf);
> +            return 4;
> +
> +        case IDX_MSR_REGS + 7:
> +            if (env->hflags & HF_CS64_MASK) {
> +                env->cstar =3D ldq_p(mem_buf);
> +                return 8;
> +            }
> +            env->cstar =3D ldl_p(mem_buf);
> +            return 4;
> +
> +        case IDX_MSR_REGS + 8:
> +            if (env->hflags & HF_CS64_MASK) {
> +                env->fmask =3D ldq_p(mem_buf);
> +                return 8;
> +            }
> +            env->fmask =3D ldl_p(mem_buf);
> +            return 4;
> +
> +        case IDX_MSR_REGS + 9:
>              if (env->hflags & HF_CS64_MASK) {
>                  env->kernelgsbase =3D ldq_p(mem_buf);
>                  return 8;
>              }
>              env->kernelgsbase =3D ldl_p(mem_buf);
> -#endif
>              return 4;
> +#else
> +        case IDX_MSR_REGS + 6:
> +        case IDX_MSR_REGS + 7:
> +        case IDX_MSR_REGS + 8:
> +        case IDX_MSR_REGS + 9:
> +            return 4;
> +#endif
>
> +        /* The first 8 registers have been addressed in an if block abov=
e */
>          case IDX_FP_REGS + 8:
>              cpu_set_fpuc(env, ldl_p(mem_buf));
>              return 4;


--=20
Alex Benn=C3=A9e

