Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768701281C4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 19:01:11 +0100 (CET)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiMaM-0001Yd-2E
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 13:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iiMZC-00013M-Az
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 13:00:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iiMZ9-000422-MH
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:59:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iiMZ9-0003zB-B7
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:59:55 -0500
Received: by mail-wm1-x342.google.com with SMTP id f129so10122516wmf.2
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PCGs2LZNUQ2sPRBQ/e7STcNu0ibbpo4EWiBQuzsxBEY=;
 b=IYyPMTHVJviNIwVdXNuu056hLlQ1jEnhAOThi1Eja52K76kWsMhck7bZYd/f0EyNhO
 ZvkKAdfHu40EMhpdGnfv77mPex7dOom/yZ6usfxskWNEeNj+tUCQ4CNFG+nvDJjCGA8m
 kqoXzYbhFuqN55HrMaIzuQS9l0Pl+uk92pXiRzakfAtmPlxkEubYmpOyoKdLprDcAHwm
 l4FoUVUDhz03rJOPK6Jec+nqRhpfivNbehE2GhaVs6sjr3sNEntUJ3k8M8DLe5loGaMD
 FTRwux5WDh046MRlg9Mmi6I3O2cUoVGrq+OgPVUVpl1suyd7KJg7UytYUUKcF3YMxyoA
 mNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=PCGs2LZNUQ2sPRBQ/e7STcNu0ibbpo4EWiBQuzsxBEY=;
 b=ocjvvyZN+Wj2O8u9xvB0HDFWL7u5lQvjRUB55ivdqfmzGsNe+vw8+1kGnpc1YhI8vu
 Q2kC6+A2ov5m8TyEFgyUyKOfIn/yV5Dxdhtaus9DkAWJZ6bdIHE3LvsObLs6g5SDzUI2
 49MttHCsNcJc5BovFe3LRZtviURe8hrWypLvWP41VBNYXEHFRQcDLy2JovIsWCVrF/U4
 JvceQxOJrFZp04S5O/Yfka/uvq+UBzAbyjmVCTqaDiph/2VLYedEAcZHq4/qQuq/w42Z
 3dkTUb59GqEDdMlrh4GJgX851ogOY7uI8FCT4mDtFS0kFnRN6DW8x1LjYVJB1rzwvGmX
 jN7Q==
X-Gm-Message-State: APjAAAUOICk0JmcsLDGcOYpjy2TTSeGS4TVHiahZqEy/yHV15kKFXIcG
 kqojzICxrySs+NVysmE3FwdIfI81ynY=
X-Google-Smtp-Source: APXvYqz7T8pSQeFDwe0FU9Oi7savOmKQsx3wlJozHsv71zmWJQ9jsATuFyoE5Nq/35E3VLf3eCQXbg==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr18318797wmj.90.1576864792175; 
 Fri, 20 Dec 2019 09:59:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 5sm11089272wrh.5.2019.12.20.09.59.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 09:59:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66C0B1FF87
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 17:59:50 +0000 (GMT)
References: <20191216221158.29572-1-richard.henderson@linaro.org>
 <20191216221158.29572-15-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 14/28] cputlb: Expand cpu_ldst_useronly_template.h in
 user-exec.c
In-reply-to: <20191216221158.29572-15-richard.henderson@linaro.org>
Date: Fri, 20 Dec 2019 17:59:50 +0000
Message-ID: <87a77mdgix.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> With the tracing hooks, the inline functions are no longer
> so simple.  Reduce the amount of preprocessor obfuscation
> by expanding the text of each of the functions generated.
> The result is only slightly larger than the original.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/cpu_ldst.h                   |  54 +++--
>  include/exec/cpu_ldst_useronly_template.h | 159 ---------------
>  accel/tcg/user-exec.c                     | 236 ++++++++++++++++++++++
>  3 files changed, 262 insertions(+), 187 deletions(-)
>  delete mode 100644 include/exec/cpu_ldst_useronly_template.h
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 41b98ba801..0f3c49a005 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -120,35 +120,33 @@ static inline void clear_helper_retaddr(void)
>=20=20
>  /* In user-only mode we provide only the _code and _data accessors. */
>=20=20
> -#define MEMSUFFIX _data
> -#define DATA_SIZE 1
> -#include "exec/cpu_ldst_useronly_template.h"
> +uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
> +uint32_t cpu_lduw_data(CPUArchState *env, abi_ptr ptr);
> +uint32_t cpu_ldl_data(CPUArchState *env, abi_ptr ptr);
> +uint64_t cpu_ldq_data(CPUArchState *env, abi_ptr ptr);
> +int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr);
> +int cpu_ldsw_data(CPUArchState *env, abi_ptr ptr);
>=20=20
> -#define DATA_SIZE 2
> -#include "exec/cpu_ldst_useronly_template.h"
> +uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t reta=
ddr);
> +uint32_t cpu_lduw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t reta=
ddr);
> +uint32_t cpu_ldl_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retad=
dr);
> +uint64_t cpu_ldq_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retad=
dr);
> +int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
> +int cpu_ldsw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
>=20=20
> -#define DATA_SIZE 4
> -#include "exec/cpu_ldst_useronly_template.h"
> +void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
> +void cpu_stw_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
> +void cpu_stl_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
> +void cpu_stq_data(CPUArchState *env, abi_ptr ptr, uint64_t val);
>=20=20
> -#define DATA_SIZE 8
> -#include "exec/cpu_ldst_useronly_template.h"
> -#undef MEMSUFFIX
> -
> -#define MEMSUFFIX _code
> -#define CODE_ACCESS
> -#define DATA_SIZE 1
> -#include "exec/cpu_ldst_useronly_template.h"
> -
> -#define DATA_SIZE 2
> -#include "exec/cpu_ldst_useronly_template.h"
> -
> -#define DATA_SIZE 4
> -#include "exec/cpu_ldst_useronly_template.h"
> -
> -#define DATA_SIZE 8
> -#include "exec/cpu_ldst_useronly_template.h"
> -#undef MEMSUFFIX
> -#undef CODE_ACCESS
> +void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint32_t val, uintptr_t retaddr);
> +void cpu_stw_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint32_t val, uintptr_t retaddr);
> +void cpu_stl_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint32_t val, uintptr_t retaddr);
> +void cpu_stq_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint64_t val, uintptr_t retaddr);
>=20=20
>  /*
>   * Provide the same *_mmuidx_ra interface as for softmmu.
> @@ -520,6 +518,8 @@ void cpu_stq_mmuidx_ra(CPUArchState *env, abi_ptr add=
r, uint64_t val,
>  #undef CPU_MMU_INDEX
>  #undef MEMSUFFIX
>=20=20
> +#endif /* defined(CONFIG_USER_ONLY) */
> +
>  uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
>  uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
>  uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
> @@ -535,8 +535,6 @@ static inline int cpu_ldsw_code(CPUArchState *env, ab=
i_ptr addr)
>      return (int16_t)cpu_lduw_code(env, addr);
>  }
>=20=20
> -#endif /* defined(CONFIG_USER_ONLY) */
> -
>  /**
>   * tlb_vaddr_to_host:
>   * @env: CPUArchState
> diff --git a/include/exec/cpu_ldst_useronly_template.h b/include/exec/cpu=
_ldst_useronly_template.h
> deleted file mode 100644
> index e5a3d1983a..0000000000
> --- a/include/exec/cpu_ldst_useronly_template.h
> +++ /dev/null
> @@ -1,159 +0,0 @@
> -/*
> - *  User-only accessor function support
> - *
> - * Generate inline load/store functions for one data size.
> - *
> - * Generate a store function as well as signed and unsigned loads.
> - *
> - * Not used directly but included from cpu_ldst.h.
> - *
> - *  Copyright (c) 2015 Linaro Limited
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> - */
> -
> -#if !defined(CODE_ACCESS)
> -#include "trace-root.h"
> -#endif
> -
> -#include "trace/mem.h"
> -
> -#if DATA_SIZE =3D=3D 8
> -#define SUFFIX q
> -#define USUFFIX q
> -#define DATA_TYPE uint64_t
> -#define SHIFT 3
> -#elif DATA_SIZE =3D=3D 4
> -#define SUFFIX l
> -#define USUFFIX l
> -#define DATA_TYPE uint32_t
> -#define SHIFT 2
> -#elif DATA_SIZE =3D=3D 2
> -#define SUFFIX w
> -#define USUFFIX uw
> -#define DATA_TYPE uint16_t
> -#define DATA_STYPE int16_t
> -#define SHIFT 1
> -#elif DATA_SIZE =3D=3D 1
> -#define SUFFIX b
> -#define USUFFIX ub
> -#define DATA_TYPE uint8_t
> -#define DATA_STYPE int8_t
> -#define SHIFT 0
> -#else
> -#error unsupported data size
> -#endif
> -
> -#if DATA_SIZE =3D=3D 8
> -#define RES_TYPE uint64_t
> -#else
> -#define RES_TYPE uint32_t
> -#endif
> -
> -static inline RES_TYPE
> -glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr)
> -{
> -    RES_TYPE ret;
> -#ifdef CODE_ACCESS
> -    set_helper_retaddr(1);
> -    ret =3D glue(glue(ld, USUFFIX), _p)(g2h(ptr));
> -    clear_helper_retaddr();
> -#else
> -    MemOp op =3D MO_TE | SHIFT;
> -    uint16_t meminfo =3D trace_mem_get_info(op, MMU_USER_IDX, false);
> -    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> -    ret =3D glue(glue(ld, USUFFIX), _p)(g2h(ptr));
> -#endif
> -    return ret;
> -}
> -
> -#ifndef CODE_ACCESS
> -static inline RES_TYPE
> -glue(glue(glue(cpu_ld, USUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
> -                                                  abi_ptr ptr,
> -                                                  uintptr_t retaddr)
> -{
> -    RES_TYPE ret;
> -    set_helper_retaddr(retaddr);
> -    ret =3D glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(env, ptr);
> -    clear_helper_retaddr();
> -    return ret;
> -}
> -#endif
> -
> -#if DATA_SIZE <=3D 2
> -static inline int
> -glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr)
> -{
> -    int ret;
> -#ifdef CODE_ACCESS
> -    set_helper_retaddr(1);
> -    ret =3D glue(glue(lds, SUFFIX), _p)(g2h(ptr));
> -    clear_helper_retaddr();
> -#else
> -    MemOp op =3D MO_TE | MO_SIGN | SHIFT;
> -    uint16_t meminfo =3D trace_mem_get_info(op, MMU_USER_IDX, false);
> -    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> -    ret =3D glue(glue(lds, SUFFIX), _p)(g2h(ptr));
> -    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> -#endif
> -    return ret;
> -}
> -
> -#ifndef CODE_ACCESS
> -static inline int
> -glue(glue(glue(cpu_lds, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
> -                                                  abi_ptr ptr,
> -                                                  uintptr_t retaddr)
> -{
> -    int ret;
> -    set_helper_retaddr(retaddr);
> -    ret =3D glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(env, ptr);
> -    clear_helper_retaddr();
> -    return ret;
> -}
> -#endif /* CODE_ACCESS */
> -#endif /* DATA_SIZE <=3D 2 */
> -
> -#ifndef CODE_ACCESS
> -static inline void
> -glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr,
> -                                      RES_TYPE v)
> -{
> -    MemOp op =3D MO_TE | SHIFT;
> -    uint16_t meminfo =3D trace_mem_get_info(op, MMU_USER_IDX, true);
> -    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> -    glue(glue(st, SUFFIX), _p)(g2h(ptr), v);
> -    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> -}
> -
> -static inline void
> -glue(glue(glue(cpu_st, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
> -                                                  abi_ptr ptr,
> -                                                  RES_TYPE v,
> -                                                  uintptr_t retaddr)
> -{
> -    set_helper_retaddr(retaddr);
> -    glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(env, ptr, v);
> -    clear_helper_retaddr();
> -}
> -#endif
> -
> -#undef RES_TYPE
> -#undef DATA_TYPE
> -#undef DATA_STYPE
> -#undef SUFFIX
> -#undef USUFFIX
> -#undef DATA_SIZE
> -#undef SHIFT
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index b09f7a1577..79da4219bb 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -26,6 +26,8 @@
>  #include "translate-all.h"
>  #include "exec/helper-proto.h"
>  #include "qemu/atomic128.h"
> +#include "trace-root.h"
> +#include "trace/mem.h"
>=20=20
>  #undef EAX
>  #undef ECX
> @@ -734,6 +736,240 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>=20=20
>  /* The softmmu versions of these helpers are in cputlb.c.  */
>=20=20
> +uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint32_t ret;
> +    uint16_t meminfo =3D trace_mem_get_info(MO_UB, MMU_USER_IDX, false);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    ret =3D ldub_p(g2h(ptr));
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +    return ret;
> +}
> +
> +int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
> +{
> +    int ret;
> +    uint16_t meminfo =3D trace_mem_get_info(MO_SB, MMU_USER_IDX, false);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    ret =3D ldsb_p(g2h(ptr));
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +    return ret;
> +}
> +
> +uint32_t cpu_lduw_data(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint32_t ret;
> +    uint16_t meminfo =3D trace_mem_get_info(MO_TEUW, MMU_USER_IDX, false=
);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    ret =3D lduw_p(g2h(ptr));
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +    return ret;
> +}
> +
> +int cpu_ldsw_data(CPUArchState *env, abi_ptr ptr)
> +{
> +    int ret;
> +    uint16_t meminfo =3D trace_mem_get_info(MO_TESW, MMU_USER_IDX, false=
);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    ret =3D ldsw_p(g2h(ptr));
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +    return ret;
> +}
> +
> +uint32_t cpu_ldl_data(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint32_t ret;
> +    uint16_t meminfo =3D trace_mem_get_info(MO_TEUL, MMU_USER_IDX, false=
);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    ret =3D ldl_p(g2h(ptr));
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +    return ret;
> +}
> +
> +uint64_t cpu_ldq_data(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint64_t ret;
> +    uint16_t meminfo =3D trace_mem_get_info(MO_TEQ, MMU_USER_IDX, false);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    ret =3D ldq_p(g2h(ptr));
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +    return ret;
> +}
> +
> +uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t reta=
ddr)
> +{
> +    uint32_t ret;
> +
> +    set_helper_retaddr(retaddr);
> +    ret =3D cpu_ldub_data(env, ptr);
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
> +{
> +    int ret;
> +
> +    set_helper_retaddr(retaddr);
> +    ret =3D cpu_ldsb_data(env, ptr);
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +uint32_t cpu_lduw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t reta=
ddr)
> +{
> +    uint32_t ret;
> +
> +    set_helper_retaddr(retaddr);
> +    ret =3D cpu_lduw_data(env, ptr);
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +int cpu_ldsw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
> +{
> +    int ret;
> +
> +    set_helper_retaddr(retaddr);
> +    ret =3D cpu_ldsw_data(env, ptr);
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +uint32_t cpu_ldl_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retad=
dr)
> +{
> +    uint32_t ret;
> +
> +    set_helper_retaddr(retaddr);
> +    ret =3D cpu_ldl_data(env, ptr);
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +uint64_t cpu_ldq_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retad=
dr)
> +{
> +    uint64_t ret;
> +
> +    set_helper_retaddr(retaddr);
> +    ret =3D cpu_ldq_data(env, ptr);
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
> +{
> +    uint16_t meminfo =3D trace_mem_get_info(MO_UB, MMU_USER_IDX, true);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    stb_p(g2h(ptr), val);
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +}
> +
> +void cpu_stw_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
> +{
> +    uint16_t meminfo =3D trace_mem_get_info(MO_TEUW, MMU_USER_IDX, true);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    stw_p(g2h(ptr), val);
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +}
> +
> +void cpu_stl_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
> +{
> +    uint16_t meminfo =3D trace_mem_get_info(MO_TEUL, MMU_USER_IDX, true);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    stl_p(g2h(ptr), val);
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +}
> +
> +void cpu_stq_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
> +{
> +    uint16_t meminfo =3D trace_mem_get_info(MO_TEQ, MMU_USER_IDX, true);
> +
> +    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
> +    stq_p(g2h(ptr), val);
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
> +}
> +
> +void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint32_t val, uintptr_t retaddr)
> +{
> +    set_helper_retaddr(retaddr);
> +    cpu_stb_data(env, ptr, val);
> +    clear_helper_retaddr();
> +}
> +
> +void cpu_stw_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint32_t val, uintptr_t retaddr)
> +{
> +    set_helper_retaddr(retaddr);
> +    cpu_stw_data(env, ptr, val);
> +    clear_helper_retaddr();
> +}
> +
> +void cpu_stl_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint32_t val, uintptr_t retaddr)
> +{
> +    set_helper_retaddr(retaddr);
> +    cpu_stl_data(env, ptr, val);
> +    clear_helper_retaddr();
> +}
> +
> +void cpu_stq_data_ra(CPUArchState *env, abi_ptr ptr,
> +                     uint64_t val, uintptr_t retaddr)
> +{
> +    set_helper_retaddr(retaddr);
> +    cpu_stq_data(env, ptr, val);
> +    clear_helper_retaddr();
> +}
> +
> +uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint32_t ret;
> +
> +    set_helper_retaddr(1);
> +    ret =3D ldub_p(g2h(ptr));
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint32_t ret;
> +
> +    set_helper_retaddr(1);
> +    ret =3D lduw_p(g2h(ptr));
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint32_t ret;
> +
> +    set_helper_retaddr(1);
> +    ret =3D ldl_p(g2h(ptr));
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
> +uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
> +{
> +    uint64_t ret;
> +
> +    set_helper_retaddr(1);
> +    ret =3D ldq_p(g2h(ptr));
> +    clear_helper_retaddr();
> +    return ret;
> +}
> +
>  /* Do not allow unaligned operations to proceed.  Return the host addres=
s.  */
>  static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>                                 int size, uintptr_t retaddr)


--=20
Alex Benn=C3=A9e

