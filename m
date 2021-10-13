Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BF42B359
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:23:26 +0200 (CEST)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUrV-0001JS-HN
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1maUPk-0008H8-VL
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:54:45 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1maUPi-00052i-IN
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:54:44 -0400
Received: by mail-ua1-x92b.google.com with SMTP id h4so1772738uaw.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iuo8cbj7BVVgmng+lMdkiWZQBjV0iofXCYIMUX/9Jnk=;
 b=aWUuDSFOT3V46YFpKOYwhISaRQCuv5LGJ2KBOlh+YlVWM8Ip7SxmykZIgpSo8zlHJg
 s5QJZ4GFXfFqVOnmTvO93Nnu7Ta/f9oWYEdqON+0riRfLRmbxp6K2cQ8Gaei6qJamWXE
 uTXgyENconH6Vq/aPO+3qXSkTQFZOD4CuqCrcxpVX7EJ4HFPub2X8yiMUvsZ5Z9+bMfe
 R7PEGE2iguQMhs43p2gWtslHUAQRZVONPp2eK99FvsQ6lhDRV7+Pi4CIqYEExTmpqYpH
 OKN6oE5ki1wnlFjqnf2Dq1qtEkCheY2pnVG+aPYvva0LoVRuVOOq/iNpgM3wsgDnn3i1
 8q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iuo8cbj7BVVgmng+lMdkiWZQBjV0iofXCYIMUX/9Jnk=;
 b=obrkBaiY2plPcaAB5IezNwEeVRKyIcZ9+d4QQAfHgXk1/67j0aG0PwhiBBgDphKHoW
 14Y6n8WJUrt9AzP2azgS1vdrweT0AhSIkAioXnHxP1wP1nVA7nj2WBObJiEjkdlPzqVW
 CQJSZO/1mqmgO9kLW93wnhNe/nGOldRMYlg7CYmeQbv61g/MkA9QasvJas8hlIGAuBIg
 RydhnCB334aUxywckDc/wFkyQ1qZhuzYzNonXXrwATS85MGfmQkLyXs23ixVAyLlPy8Z
 aB0U7uWpDbvZzJjOyCycCjn/kIbLpnwkrAnpkjJFaVRtXLa8yJKoh32VHLq12rj8TOur
 Gfhw==
X-Gm-Message-State: AOAM533ZOeCPQl2JX6e31QrSZRRhtHlRu4hbx6wIdWuop1Lsd+nwu65f
 sM/jW5EIyU3okmUZ+qaHTWp35GgLrWJUlkitUg0yww==
X-Google-Smtp-Source: ABdhPJzgd5omU0alAI6WmCPAxvZgY5cPZ3rP2+IUoW3fH9FhnE0fbP1MMs3tzdNI5IVsLp2HL5Ikf7L4gWalEsJz/I4=
X-Received: by 2002:a67:fc8b:: with SMTP id x11mr21461971vsp.12.1634093680699; 
 Tue, 12 Oct 2021 19:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211013024607.731881-1-richard.henderson@linaro.org>
 <20211013024607.731881-10-richard.henderson@linaro.org>
In-Reply-To: <20211013024607.731881-10-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 12 Oct 2021 20:54:32 -0600
Message-ID: <CANCZdfqKbvGB58Z3CygFeq7TrACPqzb=2MHc0upQDncBnMq=tg@mail.gmail.com>
Subject: Re: [PATCH v4 09/48] target/ppc: Restrict ppc_cpu_do_unaligned_access
 to sysemu
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005e3cbe05ce331526"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005e3cbe05ce331526
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 8:52 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This is not used by, nor required by, user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/internal.h    | 8 +++-----
>  target/ppc/excp_helper.c | 8 +++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 339974b7d8..6aa9484f34 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -211,11 +211,6 @@ void helper_compute_fprf_float16(CPUPPCState *env,
> float16 arg);
>  void helper_compute_fprf_float32(CPUPPCState *env, float32 arg);
>  void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);
>
> -/* Raise a data fault alignment exception for the specified virtual
> address */
> -void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                 MMUAccessType access_type, int mmu_idx,
> -                                 uintptr_t retaddr) QEMU_NORETURN;
> -
>  /* translate.c */
>
>  int ppc_fixup_cpu(PowerPCCPU *cpu);
> @@ -291,6 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>  bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr);
> +void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                 MMUAccessType access_type, int mmu_idx,
> +                                 uintptr_t retaddr) QEMU_NORETURN;
>  #endif
>
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index e568a54536..17607adbe4 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1454,11 +1454,8 @@ void helper_book3s_msgsndp(CPUPPCState *env,
> target_ulong rb)
>
>      book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);
>  }
> -#endif
> -#endif /* CONFIG_TCG */
> -#endif
> +#endif /* TARGET_PPC64 */
>
> -#ifdef CONFIG_TCG
>  void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                   MMUAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr)
> @@ -1483,4 +1480,5 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr
> vaddr,
>      env->error_code = 0;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> -#endif
> +#endif /* CONFIG_TCG */
> +#endif /* !CONFIG_USER_ONLY */
> --
> 2.25.1
>
>
>

--0000000000005e3cbe05ce331526
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 12, 2021 at 8:52 PM Richard Henderson &lt;<a hr=
ef=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 is not used by, nor required by, user-only.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/ppc/internal.h=C2=A0 =C2=A0 | 8 +++-----<br>
=C2=A0target/ppc/excp_helper.c | 8 +++-----<br>
=C2=A02 files changed, 6 insertions(+), 10 deletions(-)<br></blockquote><di=
v><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com">imp@bsdimp.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
diff --git a/target/ppc/internal.h b/target/ppc/internal.h<br>
index 339974b7d8..6aa9484f34 100644<br>
--- a/target/ppc/internal.h<br>
+++ b/target/ppc/internal.h<br>
@@ -211,11 +211,6 @@ void helper_compute_fprf_float16(CPUPPCState *env, flo=
at16 arg);<br>
=C2=A0void helper_compute_fprf_float32(CPUPPCState *env, float32 arg);<br>
=C2=A0void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);<br=
>
<br>
-/* Raise a data fault alignment exception for the specified virtual addres=
s */<br>
-void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int=
 mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU_NORETU=
RN;<br>
-<br>
=C2=A0/* translate.c */<br>
<br>
=C2=A0int ppc_fixup_cpu(PowerPCCPU *cpu);<br>
@@ -291,6 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,<b=
r>
=C2=A0bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
+void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int=
 mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU_NORETU=
RN;<br>
=C2=A0#endif<br>
<br>
=C2=A0#endif /* PPC_INTERNAL_H */<br>
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c<br>
index e568a54536..17607adbe4 100644<br>
--- a/target/ppc/excp_helper.c<br>
+++ b/target/ppc/excp_helper.c<br>
@@ -1454,11 +1454,8 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_=
ulong rb)<br>
<br>
=C2=A0 =C2=A0 =C2=A0book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);<br>
=C2=A0}<br>
-#endif<br>
-#endif /* CONFIG_TCG */<br>
-#endif<br>
+#endif /* TARGET_PPC64 */<br>
<br>
-#ifdef CONFIG_TCG<br>
=C2=A0void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mmu_idx, uintptr_t retadd=
r)<br>
@@ -1483,4 +1480,5 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr =
vaddr,<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;error_code =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit_restore(cs, retaddr);<br>
=C2=A0}<br>
-#endif<br>
+#endif /* CONFIG_TCG */<br>
+#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000005e3cbe05ce331526--

