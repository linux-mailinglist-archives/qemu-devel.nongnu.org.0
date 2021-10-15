Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74E42FB69
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:49:02 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSGL-0002Mi-4V
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSDW-0000ZE-Np
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:46:06 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:41602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSDT-00078E-Om
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:46:06 -0400
Received: by mail-ua1-x92b.google.com with SMTP id r17so19873189uaf.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Ck0K+fXWbIxbbtI+cdRKOc/s1uZWHJgmb+rL1ZDfko=;
 b=picoWT4c0Smj+IbxwJHbJyI2t0L7adebR6qizKm2i93ir0kH/QtKhYQ0BzEYw9uvUS
 iYYtpNmco2I4nKxhZyrxJhzbDj5pfZNTvyAZvPmNMT1e+zKVE26dIysvDxd/o4iU0FPH
 1t3KJTwGu1aSzfuzb5im2rZXkbU+744UnlM91ZlJJCH8e7AIX+WrxwGzJUccY+EWvfgM
 M/PURz2Acm2ybhk53ajYFf9y0p0U9zByBdeWcAqcQwZlnZpyzKocbHSRhH8Y8y2wT1Vi
 aBo6rxkoAzjxDaBgE4/QzoO2yx/3RSQwefNyZcZEekqNwpKp6RFv3kvg5ixCCYyWAV8r
 IHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Ck0K+fXWbIxbbtI+cdRKOc/s1uZWHJgmb+rL1ZDfko=;
 b=Cei0Dj1lCp8HF1JD6D8xw8ADhhzI5wzrmnJ1b9g3kM/5UlF5PxoWt7CgyCa/7YxVqd
 zS4nftTwcNovFz96vlEKQk27zgWa3LA74ZwVd4i4n+AYqXlF/1BlRJvQcQWABIs1Z7Es
 yEGZ//LKTYuEb8Mnv2XhlXGXf1y/XNx8+jC5CW2Gn3QimKzBWIRyLsOcrFAD6f6oiAAU
 Q3kXAZSwwdBrNMhIBhGUYoPr7m91/frERA89nEW6w8dRGc/0iCu1Kl2E7x8WIf8r+UNZ
 EyFGRv4FrcARmMOU0wc5HWYtm/sjhcbyZGTqqf7PmD/VH0MnKjsHfPcnwpjv7/3NDbM7
 WJSw==
X-Gm-Message-State: AOAM531R/e29veISzJe9tFNMUi4xGBH02nepsjfPoDb2/l9LX/5cFBDr
 /ai44I43ZEeSOS0u7m/tvOAMsebrDklIlnqnTeWv0A==
X-Google-Smtp-Source: ABdhPJyWLHTaT5sk9sN8kzbK9c+H+J60LkBGIU018BRBBPS+I4YXcHRFTikhaZkLG/qjKj//DokpBPa42ECT52gQ2SM=
X-Received: by 2002:a67:c903:: with SMTP id w3mr16065290vsk.6.1634323559171;
 Fri, 15 Oct 2021 11:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-36-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-36-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:45:48 -0600
Message-ID: <CANCZdfpjQCv+SGcnkK7W_L=4Ap-c3x0H3yXwd4QgJhHrvi-eLA@mail.gmail.com>
Subject: Re: [PATCH v5 35/67] target/riscv: Make riscv_cpu_tlb_fill sysemu only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000031579705ce689b55"
Received-SPF: none client-ip=2607:f8b0:4864:20::92b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000031579705ce689b55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The fallback code in cpu_loop_exit_sigsegv is sufficient
> for riscv linux-user.
>
> Remove the code from cpu_loop that raised SIGSEGV.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/riscv/cpu_loop.c |  7 -------
>  target/riscv/cpu.c          |  2 +-
>  target/riscv/cpu_helper.c   | 21 +--------------------
>  3 files changed, 2 insertions(+), 28 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index 9859a366e4..aef019b1c8 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -87,13 +87,6 @@ void cpu_loop(CPURISCVState *env)
>              sigcode =3D TARGET_TRAP_BRKPT;
>              sigaddr =3D env->pc;
>              break;
> -        case RISCV_EXCP_INST_PAGE_FAULT:
> -        case RISCV_EXCP_LOAD_PAGE_FAULT:
> -        case RISCV_EXCP_STORE_PAGE_FAULT:
> -            signum =3D TARGET_SIGSEGV;
> -            sigcode =3D TARGET_SEGV_MAPERR;
> -            sigaddr =3D env->badaddr;
> -            break;
>          case RISCV_EXCP_SEMIHOST:
>              env->gpr[xA0] =3D do_common_semihosting(cs);
>              env->pc +=3D 4;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1d69d1887e..2ab89a3f70 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -653,9 +653,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops =3D=
 {
>  static const struct TCGCPUOps riscv_tcg_ops =3D {
>      .initialize =3D riscv_translate_init,
>      .synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,
> -    .tlb_fill =3D riscv_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .tlb_fill =3D riscv_cpu_tlb_fill,
>      .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
>      .do_interrupt =3D riscv_cpu_do_interrupt,
>      .do_transaction_failed =3D riscv_cpu_do_transaction_failed,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d41d5cd27c..b520d6fc78 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -748,7 +748,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vadd=
r
> addr,
>                              riscv_cpu_two_stage_lookup(mmu_idx);
>      riscv_raise_exception(env, cs->exception_index, retaddr);
>  }
> -#endif /* !CONFIG_USER_ONLY */
>
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
> @@ -756,7 +755,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -#ifndef CONFIG_USER_ONLY
>      vaddr im_address;
>      hwaddr pa =3D 0;
>      int prot, prot2, prot_pmp;
> @@ -888,25 +886,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>      }
>
>      return true;
> -
> -#else
> -    switch (access_type) {
> -    case MMU_INST_FETCH:
> -        cs->exception_index =3D RISCV_EXCP_INST_PAGE_FAULT;
> -        break;
> -    case MMU_DATA_LOAD:
> -        cs->exception_index =3D RISCV_EXCP_LOAD_PAGE_FAULT;
> -        break;
> -    case MMU_DATA_STORE:
> -        cs->exception_index =3D RISCV_EXCP_STORE_PAGE_FAULT;
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -    env->badaddr =3D address;
> -    cpu_loop_exit_restore(cs, retaddr);
> -#endif
>  }
> +#endif /* !CONFIG_USER_ONLY */
>
>  /*
>   * Handle Traps
> --
> 2.25.1
>
>

--00000000000031579705ce689b55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The fallback code in cpu_loop_exit_sigsegv is sufficient=
<br>
for riscv linux-user.<br>
<br>
Remove the code from cpu_loop that raised SIGSEGV.<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/riscv/cpu_loop.c |=C2=A0 7 -------<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0| 21 +--------------------<br>
=C2=A03 files changed, 2 insertions(+), 28 deletions(-)<br></blockquote><di=
v><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c<br>
index 9859a366e4..aef019b1c8 100644<br>
--- a/linux-user/riscv/cpu_loop.c<br>
+++ b/linux-user/riscv/cpu_loop.c<br>
@@ -87,13 +87,6 @@ void cpu_loop(CPURISCVState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigcode =3D TARGET_TRAP_BRK=
PT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigaddr =3D env-&gt;pc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RISCV_EXCP_INST_PAGE_FAULT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RISCV_EXCP_LOAD_PAGE_FAULT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RISCV_EXCP_STORE_PAGE_FAULT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signum =3D TARGET_SIGSEGV;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigcode =3D TARGET_SEGV_MAPERR;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaddr =3D env-&gt;badaddr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case RISCV_EXCP_SEMIHOST:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gpr[xA0] =3D do_com=
mon_semihosting(cs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc +=3D 4;<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 1d69d1887e..2ab89a3f70 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -653,9 +653,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops =3D {=
<br>
=C2=A0static const struct TCGCPUOps riscv_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D riscv_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,=
<br>
-=C2=A0 =C2=A0 .tlb_fill =3D riscv_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .tlb_fill =3D riscv_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D riscv_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D riscv_cpu_do_transaction_fai=
led,<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index d41d5cd27c..b520d6fc78 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -748,7 +748,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr =
addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_two_stage_lookup(mmu_idx);<br>
=C2=A0 =C2=A0 =C2=A0riscv_raise_exception(env, cs-&gt;exception_index, reta=
ddr);<br>
=C2=A0}<br>
-#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
@@ -756,7 +755,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0vaddr im_address;<br>
=C2=A0 =C2=A0 =C2=A0hwaddr pa =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int prot, prot2, prot_pmp;<br>
@@ -888,25 +886,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
-<br>
-#else<br>
-=C2=A0 =C2=A0 switch (access_type) {<br>
-=C2=A0 =C2=A0 case MMU_INST_FETCH:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D RISCV_EXCP_INST_PAG=
E_FAULT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case MMU_DATA_LOAD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D RISCV_EXCP_LOAD_PAG=
E_FAULT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case MMU_DATA_STORE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D RISCV_EXCP_STORE_PA=
GE_FAULT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 env-&gt;badaddr =3D address;<br>
-=C2=A0 =C2=A0 cpu_loop_exit_restore(cs, retaddr);<br>
-#endif<br>
=C2=A0}<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0/*<br>
=C2=A0 * Handle Traps<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000031579705ce689b55--

