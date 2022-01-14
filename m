Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1D48EFD6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:24:43 +0100 (CET)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RFj-000275-2C
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8R5Y-00060R-2e
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:14:12 -0500
Received: from [2607:f8b0:4864:20::a2d] (port=33568
 helo=mail-vk1-xa2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8R5V-0001MH-R7
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:14:11 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id g5so6374275vkg.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Pqhk4naImMMhbRyCz8wPolnnxEjvzHGyeBmHFhijmI=;
 b=6Sz9Pq7iKSsg4FuFKiqBRlAnlPsUMRb0WTulyoxqHcC29rLcLDchSV2DifKWVtimt9
 YwAlyk/QQF1xUvvE1xdcP+iW5MmCts01dS3VXoEHyXI2NX1Sc8CoRkFbblM48EEgvSsi
 NVN0vy9s4Rl3KSJGCUyjqw3+m3oh/iYfyGWbLmCuyR+4747mFN61goDhYhwxiVQ22l3m
 KWd8uTwBghOC6i9S5D+TWJZ8tkIASgG4XWSv0y0T7lzTI5K6TD43wgqC5WQGqcg2UYrC
 XEQShLfQo2miy8Wi3lpH+WldoFFcXTQnBWn59lSdap+1BoBZNvOUlMak28G1bo+zeFCU
 WRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Pqhk4naImMMhbRyCz8wPolnnxEjvzHGyeBmHFhijmI=;
 b=cZ02bHv25QnlsSEUrCEXoUwLaWmsmDo5Mz0OtId7JrCf6OEt0DZ367YsuRPXwUYC1o
 +XZBhOGQb1ZJSD9a94weBDt9LS/7lxuCrNxZp4M6n7cSjYmjN5keJCXGh/duDohD+KTu
 SdGyf10uVOGZsYiW1hh2WSk6Q/PhvqpWpPxKn9zBrrGb8lS1ZNaV02A/kWPe21SVjtmD
 OAEtIwT46TQ7Mjn6/fnyXiUCam1oCfrSAdBI3h+j1EY4WxNs/r2fW5Rn6yI0Z8vicrnM
 zxZqws4GOVwPi0wxDfuEUntLLsch64NCyodbOzTaSKAvr3vWi7iaUZg397Z1sIP5YYhX
 ZUjQ==
X-Gm-Message-State: AOAM5309kooX1QIURjpa7kKMARX43KvdZ3mIp3Ke0xs0thjkbMpAspfX
 Qig5kwMhHQJ4y3zJ+F0rPuT+leo4mXlv06yPxK6GlF3MeHw=
X-Google-Smtp-Source: ABdhPJxp386rNwbMM6KtEZfmSwHVCukbf+O273B62Emk5lxqqAuH10d/AT2Ab700zLfG2bngOnYIeEfSh8f4mqNNKRc=
X-Received: by 2002:a05:6122:1805:: with SMTP id
 ay5mr4655756vkb.5.1642184048748; 
 Fri, 14 Jan 2022 10:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-9-imp@bsdimp.com>
 <CAFEAcA-ieL5iT5tq4M_D_wAN=aOe9fzAvpFJ7thq6YvaQwqJRg@mail.gmail.com>
In-Reply-To: <CAFEAcA-ieL5iT5tq4M_D_wAN=aOe9fzAvpFJ7thq6YvaQwqJRg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 14 Jan 2022 11:13:57 -0700
Message-ID: <CANCZdfpGhj-M21GWgd6QzVmzcTjhY4E93jMObv7uAyHjdxm4dg@mail.gmail.com>
Subject: Re: [PATCH 08/30] bsd-user/arm/target_arch_cpu.h: Implement data
 faults
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e1bdf505d58ec4c9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1bdf505d58ec4c9
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 10:40 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Update for the richer set of data faults that are now possible. Copied
> > largely from linux-user/arm/cpu_loop.c
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/arm/target_arch_cpu.h | 44 ++++++++++++++++++++++++++--------
> >  1 file changed, 34 insertions(+), 10 deletions(-)
> >
> > diff --git a/bsd-user/arm/target_arch_cpu.h
> b/bsd-user/arm/target_arch_cpu.h
> > index 996a361e3fe..51e592bcfe7 100644
> > --- a/bsd-user/arm/target_arch_cpu.h
> > +++ b/bsd-user/arm/target_arch_cpu.h
> > @@ -39,8 +39,7 @@ static inline void target_cpu_init(CPUARMState *env,
> >
> >  static inline void target_cpu_loop(CPUARMState *env)
> >  {
> > -    int trapnr;
> > -    target_siginfo_t info;
> > +    int trapnr, si_signo, si_code;
> >      unsigned int n;
> >      CPUState *cs = env_cpu(env);
> >
> > @@ -143,15 +142,40 @@ static inline void target_cpu_loop(CPUARMState
> *env)
> >              /* just indicate that signals should be handled asap */
> >              break;
> >          case EXCP_PREFETCH_ABORT:
> > -            /* See arm/arm/trap.c prefetch_abort_handler() */
> >          case EXCP_DATA_ABORT:
> > -            /* See arm/arm/trap.c data_abort_handler() */
> > -            info.si_signo = TARGET_SIGSEGV;
> > -            info.si_errno = 0;
> > -            /* XXX: check env->error_code */
> > -            info.si_code = 0;
> > -            info.si_addr = env->exception.vaddress;
> > -            queue_signal(env, info.si_signo, &info);
> > +            /*
> > +             * See arm/arm/trap-v6.c prefetch_abort_handler() and
> data_abort_handler()
> > +             *
> > +             * However, FreeBSD maps these to a generic value and then
> uses that
> > +             * to maybe fault in pages in
> vm/vm_fault.c:vm_fault_trap(). I
> > +             * believe that the indirection maps the same as Linux, but
> haven't
> > +             * chased down every single possible indirection.
> > +             */
> > +
> > +            /* For user-only we don't set TTBCR_EAE, so look at the
> FSR. */
> > +            switch (env->exception.fsr & 0x1f) {
> > +            case 0x1: /* Alignment */
> > +                si_signo = TARGET_SIGBUS;
> > +                si_code = TARGET_BUS_ADRALN;
> > +                break;
> > +            case 0x3: /* Access flag fault, level 1 */
> > +            case 0x6: /* Access flag fault, level 2 */
> > +            case 0x9: /* Domain fault, level 1 */
> > +            case 0xb: /* Domain fault, level 2 */
> > +            case 0xd: /* Permision fault, level 1 */
> > +            case 0xf: /* Permision fault, level 2 */
>
> "Permission" (I see we have this typo in linux-user).
>

Fixed. Also, if you can, please cc me if you'd like on 'back ported' fixes
into linux-user when you post them
for review that arise from this. It helps me keep track and not miss them
in this rather high volume mailing
list.


> > +                si_signo = TARGET_SIGSEGV;
> > +                si_code = TARGET_SEGV_ACCERR;
> > +                break;
> > +            case 0x5: /* Translation fault, level 1 */
> > +            case 0x7: /* Translation fault, level 2 */
> > +                si_signo = TARGET_SIGSEGV;
> > +                si_code = TARGET_SEGV_MAPERR;
> > +                break;
> > +            default:
> > +                g_assert_not_reached();
> > +            }
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

Thanks!

Warner

--000000000000e1bdf505d58ec4c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 10:40 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, 9 Jan 2022 at 16:29, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Update for the richer set of data faults that are now possible. Copied=
<br>
&gt; largely from linux-user/arm/cpu_loop.c<br>
&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/arm/target_arch_cpu.h | 44 ++++++++++++++++++++++++++--=
------<br>
&gt;=C2=A0 1 file changed, 34 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch=
_cpu.h<br>
&gt; index 996a361e3fe..51e592bcfe7 100644<br>
&gt; --- a/bsd-user/arm/target_arch_cpu.h<br>
&gt; +++ b/bsd-user/arm/target_arch_cpu.h<br>
&gt; @@ -39,8 +39,7 @@ static inline void target_cpu_init(CPUARMState *env,=
<br>
&gt;<br>
&gt;=C2=A0 static inline void target_cpu_loop(CPUARMState *env)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 int trapnr;<br>
&gt; -=C2=A0 =C2=A0 target_siginfo_t info;<br>
&gt; +=C2=A0 =C2=A0 int trapnr, si_signo, si_code;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int n;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt;<br>
&gt; @@ -143,15 +142,40 @@ static inline void target_cpu_loop(CPUARMState *=
env)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* just indicate that =
signals should be handled asap */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_PREFETCH_ABORT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* See arm/arm/trap.c prefe=
tch_abort_handler() */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_DATA_ABORT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* See arm/arm/trap.c data_=
abort_handler() */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_signo =3D TARGET_SI=
GSEGV;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_errno =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XXX: check env-&gt;error=
_code */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_code =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_addr =3D env-&gt;ex=
ception.vaddress;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_signal(env, info.si_s=
igno, &amp;info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* See arm/arm/trap-v6=
.c prefetch_abort_handler() and data_abort_handler()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* However, FreeBSD ma=
ps these to a generic value and then uses that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to maybe fault in p=
ages in vm/vm_fault.c:vm_fault_trap(). I<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* believe that the in=
direction maps the same as Linux, but haven&#39;t<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* chased down every s=
ingle possible indirection.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* For user-only we don&#39=
;t set TTBCR_EAE, so look at the FSR. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (env-&gt;exception.f=
sr &amp; 0x1f) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x1: /* Alignment */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D =
TARGET_SIGBUS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_code =3D T=
ARGET_BUS_ADRALN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3: /* Access flag fa=
ult, level 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x6: /* Access flag fa=
ult, level 2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x9: /* Domain fault, =
level 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xb: /* Domain fault, =
level 2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xd: /* Permision faul=
t, level 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf: /* Permision faul=
t, level 2 */<br>
<br>
&quot;Permission&quot; (I see we have this typo in linux-user).<br></blockq=
uote><div><br></div><div>Fixed. Also, if you can, please cc me if you&#39;d=
 like on &#39;back ported&#39; fixes into linux-user when you post them</di=
v><div>for review that arise from this. It helps me keep track and not miss=
 them in this rather high volume mailing</div><div>list.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D =
TARGET_SIGSEGV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_code =3D T=
ARGET_SEGV_ACCERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x5: /* Translation fa=
ult, level 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x7: /* Translation fa=
ult, level 2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D =
TARGET_SIGSEGV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_code =3D T=
ARGET_SEGV_MAPERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_=
reached();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Otherwise<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><br=
></div><div>Thanks!</div><div><br></div><div>Warner</div></div></div>

--000000000000e1bdf505d58ec4c9--

