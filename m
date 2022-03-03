Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF24D4CB695
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:49:35 +0100 (CET)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeLG-0008CL-K0
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nPeJy-0007BV-5Q; Thu, 03 Mar 2022 00:48:14 -0500
Received: from [2607:f8b0:4864:20::c35] (port=44935
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nPeJw-0007pn-6t; Thu, 03 Mar 2022 00:48:13 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so4637948oot.11; 
 Wed, 02 Mar 2022 21:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=URPRzefN7LqMfr7GW4YcF+xiy9GC2NG0UPYq05JyCk8=;
 b=LulodE3ryD8e3zuq0tWXsY7W37fajkPEoRgC7HUoEHlO/OsdYdhZ95SVtwvi37q+Id
 gjoxWRLR0xNlnDuZCV+g2VrkJvLRf2p+V0FmJUzvMgldyhHoLX7jYi0u0r6nTcpLIn+f
 4W3fIjG6Rg59xw8ynDAKNkl6JnuPnCAD5m2brc4AGJgnO3maFQTMyFHRIS6TGCiToipP
 NhTzDQjmz2jyyRt6d+LHxzoJK1/wFkDPrXBWyonTR3IriXrrl6bFCETiPhBvL1VNq1D4
 OscUFpsC6mFjOhaYO/s9BmOAq01COwcL8qXU/6On6zIMONfJkewkF/txPA+li61Fgpwg
 eF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URPRzefN7LqMfr7GW4YcF+xiy9GC2NG0UPYq05JyCk8=;
 b=eSdhsiTS2qFPwdbX6rTRU4VhGEBAo7tvxBQPcVM5P1U1F/euzQgmJnn85F2ZaYPdtj
 q7jmcFFAGQJ1bCvSQz6h47jh+J0NF6xwHtAMbaPPsG01oZOf5tw1bTdGUfafEPAkRUeB
 lLaQ201OKH9dVOYMZVZNxR5yIuusCeBLNwrbZtu6WgGLL5ngYMM0WNv2R6pmI9wrJ0ia
 JxFjQ5T5V/911Y9ZRgn/evNfxvegZLntmsL2PoNQsagkdngBnojGzG2rB1taZntiLLhG
 AaXa+p9eAxzllAX6U/9eQB6IfdYRptmHsEF1vHYcnYFSCNUTASBzCGbdbM5BytTBT7Av
 NRPw==
X-Gm-Message-State: AOAM5326SLK65we4qy/v0cHx6lCUrL9o9ua29trC8Nfx1x6olv/Czn4m
 PYgxtrYXsw6EwSxiWFEvP1ETNl7tg8qapTdKano=
X-Google-Smtp-Source: ABdhPJyWlle0eh76bz1ii2B9OaKEN8sE41tYqfNEMzhUG3hgOWAnIWwcTw3WDtejJiur2HCkgu2pBNRyB7KfI4AHVL8=
X-Received: by 2002:a05:6870:3490:b0:d4:50b3:8939 with SMTP id
 n16-20020a056870349000b000d450b38939mr2791308oah.62.1646286490600; Wed, 02
 Mar 2022 21:48:10 -0800 (PST)
MIME-Version: 1.0
References: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
 <e2dd457d-29b3-32be-72e2-315e686dff69@eik.bme.hu>
 <CABLmASH5tFs86Dq+1e+ByMF43jZL5UZ7MempVVhtKCwjdpa7aw@mail.gmail.com>
 <87pmn352q0.fsf@linux.ibm.com>
In-Reply-To: <87pmn352q0.fsf@linux.ibm.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 3 Mar 2022 06:47:59 +0100
Message-ID: <CABLmASGsfUFh1m5e4yZLA+HFNWDU7JpA08HgU7zVTkJXjJfWXA@mail.gmail.com>
Subject: Re: Issue with qemu-system-ppc running OSX guests
To: Fabiano Rosas <farosas@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000078894f05d949f1e8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, qemu-ppc <qemu-ppc@nongnu.org>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078894f05d949f1e8
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 12:55 AM Fabiano Rosas <farosas@linux.ibm.com> wrote:

> Howard Spoelstra <hsp.cat7@gmail.com> writes:
>
> > On Wed, Mar 2, 2022 at 9:11 PM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >
> >> On Wed, 2 Mar 2022, Howard Spoelstra wrote:
> >> > Hi all,
> >> >
> >> > I noticed qemu-system-ppc running OSX guests does not get to the
> desktop
> >> or
> >> > does not display the menu bars.
> >>
> >> Cc-ing the relevant people and the PPC list might help, I've added them.
> >> Also telling which OSX guest version can reproduce the problem could
> help
> >> debugging. Is it any OSX version?
> >>
> >> Regards,
> >> BALATON Zoltan
> >>
> >
> > Oops, Qemu running on Fedora 35 host,
> > Reproducer:
> >
> > ./qemu-system-ppc \
> > -M mac99 \
> > -m 512 \
> > -L pc-bios \
> > -display sdl -serial stdio \
> > -boot c \
> > -drive file=10.1.img,format=raw,media=disk
> >
> > The issue affects all supported Mac OSX guests: 10.0 to 10.5
>
> Hi Howard,
>
> Thanks for bisecting this. It seems we inadvertently marked some of the
> Vector Multiply instructions to be ISA v2.07 only.
>
> I can boot Mac OSX 10.4 until the desktop with this fix:
>
> diff --git a/target/ppc/translate/vmx-impl.c.inc
> b/target/ppc/translate/vmx-impl.c.inc
> index f91bee839d..c5d02d13fe 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -3141,14 +3141,14 @@ static bool trans_VMULLD(DisasContext *ctx, arg_VX
> *a)
>      return true;
>  }
>
> -TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
> -TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
> -TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
> -TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
> -TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)
> -TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
> -TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
> -TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
> +TRANS_FLAGS(ALTIVEC, VMULESB, do_vx_helper, gen_helper_VMULESB)
> +TRANS_FLAGS(ALTIVEC, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
> +TRANS_FLAGS(ALTIVEC, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
> +TRANS_FLAGS(ALTIVEC, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
> +TRANS_FLAGS(ALTIVEC, VMULESH, do_vx_helper, gen_helper_VMULESH)
> +TRANS_FLAGS(ALTIVEC, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
> +TRANS_FLAGS(ALTIVEC, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
> +TRANS_FLAGS(ALTIVEC, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
>  TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)
>  TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)
>  TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)
> ---
>
> I'll let Lucas comment on it and we can send a proper patch in the
> morning.
>

Hi,

Thanks, this patch does indeed fix the issue.

Best,
Howard

--00000000000078894f05d949f1e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 3, 2022 at 12:55 AM Fabia=
no Rosas &lt;<a href=3D"mailto:farosas@linux.ibm.com">farosas@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Howard Spoelstra &lt;<a href=3D"mailto:hsp.cat7@gmail.com" target=3D"_blank=
">hsp.cat7@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Wed, Mar 2, 2022 at 9:11 PM BALATON Zoltan &lt;<a href=3D"mailto:ba=
laton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Wed, 2 Mar 2022, Howard Spoelstra wrote:<br>
&gt;&gt; &gt; Hi all,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I noticed qemu-system-ppc running OSX guests does not get to =
the desktop<br>
&gt;&gt; or<br>
&gt;&gt; &gt; does not display the menu bars.<br>
&gt;&gt;<br>
&gt;&gt; Cc-ing the relevant people and the PPC list might help, I&#39;ve a=
dded them.<br>
&gt;&gt; Also telling which OSX guest version can reproduce the problem cou=
ld help<br>
&gt;&gt; debugging. Is it any OSX version?<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; BALATON Zoltan<br>
&gt;&gt;<br>
&gt;<br>
&gt; Oops, Qemu running on Fedora 35 host,<br>
&gt; Reproducer:<br>
&gt;<br>
&gt; ./qemu-system-ppc \<br>
&gt; -M mac99 \<br>
&gt; -m 512 \<br>
&gt; -L pc-bios \<br>
&gt; -display sdl -serial stdio \<br>
&gt; -boot c \<br>
&gt; -drive file=3D10.1.img,format=3Draw,media=3Ddisk<br>
&gt;<br>
&gt; The issue affects all supported Mac OSX guests: 10.0 to 10.5<br>
<br>
Hi Howard,<br>
<br>
Thanks for bisecting this. It seems we inadvertently marked some of the<br>
Vector Multiply instructions to be ISA v2.07 only.<br>
<br>
I can boot Mac OSX 10.4 until the desktop with this fix:<br>
<br>
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx=
-impl.c.inc<br>
index f91bee839d..c5d02d13fe 100644<br>
--- a/target/ppc/translate/vmx-impl.c.inc<br>
+++ b/target/ppc/translate/vmx-impl.c.inc<br>
@@ -3141,14 +3141,14 @@ static bool trans_VMULLD(DisasContext *ctx, arg_VX =
*a)<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)<br>
-TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)<br>
+TRANS_FLAGS(ALTIVEC, VMULESB, do_vx_helper, gen_helper_VMULESB)<br>
+TRANS_FLAGS(ALTIVEC, VMULOSB, do_vx_helper, gen_helper_VMULOSB)<br>
+TRANS_FLAGS(ALTIVEC, VMULEUB, do_vx_helper, gen_helper_VMULEUB)<br>
+TRANS_FLAGS(ALTIVEC, VMULOUB, do_vx_helper, gen_helper_VMULOUB)<br>
+TRANS_FLAGS(ALTIVEC, VMULESH, do_vx_helper, gen_helper_VMULESH)<br>
+TRANS_FLAGS(ALTIVEC, VMULOSH, do_vx_helper, gen_helper_VMULOSH)<br>
+TRANS_FLAGS(ALTIVEC, VMULEUH, do_vx_helper, gen_helper_VMULEUH)<br>
+TRANS_FLAGS(ALTIVEC, VMULOUH, do_vx_helper, gen_helper_VMULOUH)<br>
=C2=A0TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)<=
br>
=C2=A0TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)<=
br>
=C2=A0TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)<=
br>
---<br>
<br>
I&#39;ll let Lucas comment on it and we can send a proper patch in the<br>
morning.<br></blockquote><div><br></div><div>Hi,</div><div><br></div><div>T=
hanks, this patch does indeed fix the issue.</div><div><br></div><div>Best,=
</div><div>Howard <br></div></div></div>

--00000000000078894f05d949f1e8--

