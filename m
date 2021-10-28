Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B303243E90D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:42:36 +0200 (CEST)
Received: from localhost ([::1]:55434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBIJ-0003wU-SL
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgBC3-00071D-0q
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:36:07 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:39804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgBBy-0000nb-W8
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:36:06 -0400
Received: by mail-ua1-x934.google.com with SMTP id ba32so13712183uab.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 12:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PAjfajqf6hhzWsw0ynUSYD8tS6fzbX5F+OgUJQ+LEr4=;
 b=GgkW3uG8kP3DNEj9qGg+RrKZCla8tv1BkcOMdckr0XaAj7wrWGUzUqnMafkSZPU6Ko
 rxepff7+/ZbHq/17vfk4mKLknkPF+TGFt8diP5bENq7V0H8dFKdchpmSx2DoW1LBDj4a
 Ed/V24V+G+90/ieQGk6blyHoCUlSD+5haKN4xm7kdB01iD8VZxLDx+SCBhbp8Mfx5oO4
 UF4p5uXXhcIRMo/PubFNLj/qvEkiFAxYiMiFk1HAhMmTjOdIMz3pMB45qabhC5MzTZC+
 QUhjW03NrZMri/WwLHZUSLhuoZFnFZH7rH42TKbRUCZYx8sQJzHEjJghMxiLpgu1sj/f
 9ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAjfajqf6hhzWsw0ynUSYD8tS6fzbX5F+OgUJQ+LEr4=;
 b=Ms5c5lemk2ZtyJWq4L/zs1Lct7GLPekvAeF5pZCqcfBx1HWUvxa0zuhH6Wy2z2E0gH
 62X8uhvHau5XH98qtOyU3jY551YYmxm1ckbpelRlY6xROHJIX6MPOYNkpS7FkEBDuNjr
 7LUB1tiHNYoUbKmB7tM3nYp9wFIZ+C7hmj3KD3lZSV0n8eq/pNDyauOry1UETMV1Eq+I
 fufCcOhAAzel1Ys35o6ZVF2BRxRIiioHRpHMlxDu6cdbKZ/DaGkLqY3MsD7lSl2oIF8X
 yexroKnayZic7ROvKi+91KNIGnlv9MfdZtAeEPsZs6G8zipiAgtAWkekR+7M2KfNzrux
 kc9A==
X-Gm-Message-State: AOAM530QAoopoQYEBS5UoWw52cBbRIWTwBujElww6oVp8hRZdD4RVkaq
 mK/ipK9m3sWSGAZ16kZ29fk83i3oDkqsUFn50/5kLA==
X-Google-Smtp-Source: ABdhPJzHGxC3TvWfm43gozX7b1zE6w9gUORmeROIiOq40JACIZZdL+L1ymaHo4hizGpxdZxPx9HXWuUrlkJbCEdhSc4=
X-Received: by 2002:a05:6102:5494:: with SMTP id
 bk20mr7512819vsb.6.1635449761371; 
 Thu, 28 Oct 2021 12:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-13-imp@bsdimp.com>
 <264949a3-4bc2-e4a1-8a4f-61ee43008c91@linaro.org>
In-Reply-To: <264949a3-4bc2-e4a1-8a4f-61ee43008c91@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 13:35:50 -0600
Message-ID: <CANCZdfo-Q2Xhsesbx9-gZhumFhLE+8akCtoWbfSpaNDnd2TJrA@mail.gmail.com>
Subject: Re: [PATCH 12/24] bsd-user/arm/target_arch_sigtramp.h: Signal
 Trampoline for arm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000132a2c05cf6ed281"
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000132a2c05cf6ed281
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 9:42 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +    /*
> > +     * The code has to load r7 manually rather than using
> > +     * "ldr r7, =SYS_return to make sure the size of the
> > +     * code is correct.
> > +     */
>
> This comment was applicable to the original freebsd asm source; it has no
> bearing on the
> hex instructions below


Yea, the code size will always be correct...


> > +    uint32_t sigtramp_code[] = {
> > +    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
> > +    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */
>
> I guess this was a bit of thumb1 source that accidentally became ABI?
> Otherwise I can't think why you wouldn't squish the mov into the add.
>

It's in our ABI. gdb and others know what the sigcode signature looks like
for sigreturn
so we can't really change it without a lot of pain... So we're kinda stuck
with very
old-school ARM code sequences for our modern armv7 port. There's likely no
reason to have the defensive call to sys_exit either, but like I said,
we're kinda
stuck with it w/o replacing it in a number of external sources...  You may
see similar
issues with the aarch64 code I'll post next.


> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

thanks!

Warner


> r~
>

--000000000000132a2c05cf6ed281
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 9:42 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* The code has to load r7 manually rather than us=
ing<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* &quot;ldr r7, =3DSYS_return to make sure the si=
ze of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* code is correct.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
This comment was applicable to the original freebsd asm source; it has no b=
earing on the <br>
hex instructions below</blockquote><div><br></div><div>Yea, the code size w=
ill always be correct...</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">&gt; +=C2=A0 =C2=A0 uint32_t sigtramp_code[] =3D {<br=
>
&gt; +=C2=A0 =C2=A0 /* 1 */ 0xE1A0000D,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* mov r0, sp */<br>
&gt; +=C2=A0 =C2=A0 /* 2 */ 0xE2800000 + sigf_uc,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* add r0, r0, #SIGF_UC */<br>
<br>
I guess this was a bit of thumb1 source that accidentally became ABI?<br>
Otherwise I can&#39;t think why you wouldn&#39;t squish the mov into the ad=
d.<br></blockquote><div><br></div><div>It&#39;s in our ABI. gdb and others =
know what the sigcode=C2=A0signature looks like for sigreturn</div><div>so =
we can&#39;t really change=C2=A0it without a lot of pain... So we&#39;re ki=
nda stuck with very</div><div>old-school ARM code sequences for our modern =
armv7 port. There&#39;s likely no</div><div>reason to have the defensive ca=
ll to sys_exit either, but like I said, we&#39;re kinda</div><div>stuck wit=
h it w/o replacing it in a number of external sources...=C2=A0 You may see =
similar</div><div>issues with the aarch64 code I&#39;ll post next.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>thanks!</div><div><br></div><div>Warner</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--000000000000132a2c05cf6ed281--

