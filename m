Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36145525B8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 22:21:05 +0200 (CEST)
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NtQ-0007uC-OJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 16:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o3Nq5-0006yd-P7
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:17:38 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:33334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o3Nq4-0007GR-0W
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:17:37 -0400
Received: by mail-vs1-xe32.google.com with SMTP id j6so3421999vsi.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2tU/8ePtWFBEYg8VDWccUdzypUPlvr6NWAlVA4Z5dg=;
 b=K1vkROQRbQvL2zzQ+6YEDpcauszZ76LI8IDJCrbjPScxZFOwT2uai5sVi2wTvQcke0
 IfS3wmAActPfV0D6vxnauFa+SSz6uLHKQNEOo4NisVVRBvEVew7Fz6OHNyoeWPpOKw65
 RzFyPskWTCuDFCgtZ25MUAbroW877fwOkpRVX2g4vNyYmrEn7WSUrkHDYJStmGQ373YG
 IJiIVzEvU68SQt8ir4Ctpr9+AUUXytwWPzN1QrJL4+UYncEwL0OXncCOfTCEhXpaX/d6
 GUBblPpc9XeejpNyiPQIC57EacD/mVfJMOS9uEqh36uWuqPhBt2391MSHlH7hbmr1ygL
 hv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2tU/8ePtWFBEYg8VDWccUdzypUPlvr6NWAlVA4Z5dg=;
 b=0nRr15j+I0rKI2fUEYybMUL5XV5A1EH1XIuxqAUYtlPF2SQG9+mj6/Lelf6SXtm69x
 UqPQM4Ryktkqvwf2uPrwMHqiUUXSPbfk84WoX5p2emuYmvvjuegLvPsk1sJ4/OKy/648
 awd5e3YpdcZghAp/7U97BB8YFL75+pdBm3aj3i8R5C2U67ZtTBgiWKRK8SacNOmNbEDU
 ojjwkiv3xe+lnZNeBUylipZP22KYoMb1jE+dIMCVKORKmdq3FdUgicpbGRvzCyLKTpr4
 1X0fEOmCreNVT+uU3eoAicj4lyI9S61hxHFDwtR6kSuIKcXnzrTuPuPHDY4RYM8ZDhWN
 nnAQ==
X-Gm-Message-State: AJIora+wDEzQVjl0X+geXKo+CWigJfBvvRG5KFaPXbCnvOGEweElJ12F
 n2TzcWoTgnArwNk7QyvqGqVG2FnjrLs14xDQsR3k9A==
X-Google-Smtp-Source: AGRyM1vz7Xg4vkE+T8lImZ5DFdZ/Xe0qUWQLi+5SWYOuREP0uILb9XEQMHUj09iLhHccVAd4QxUBfYMMslshLTvDhe8=
X-Received: by 2002:a67:c113:0:b0:354:3ef9:3f79 with SMTP id
 d19-20020a67c113000000b003543ef93f79mr1491688vsj.3.1655756254243; Mon, 20 Jun
 2022 13:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-3-imp@bsdimp.com>
 <0d822ee9-89f2-9ad8-c3ad-3f7a6c0abf75@linaro.org>
In-Reply-To: <0d822ee9-89f2-9ad8-c3ad-3f7a6c0abf75@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 20 Jun 2022 14:17:23 -0600
Message-ID: <CANCZdfp4eAWboZieVLYE0dgA=LL561R902wmwrgafctkaMaqdA@mail.gmail.com>
Subject: Re: [PATCH 02/10] bsd-user: Implement symlink, symlinkat, readlink
 and readlinkat
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Stacey Son <sson@freebsd.org>, Jung-uk Kim <jkim@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000005e847d05e1e6cb11"
Received-SPF: none client-ip=2607:f8b0:4864:20::e32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005e847d05e1e6cb11
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 12:28 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/20/22 10:42, Warner Losh wrote:
> > +static abi_long do_bsd_readlink(CPUArchState *env, abi_long arg1,
> > +        abi_long arg2, abi_long arg3)
> > +{
> > +    abi_long ret;
> > +    void *p1, *p2;
> > +
> > +    LOCK_PATH(p1, arg1);
> > +    p2 = lock_user(VERIFY_WRITE, arg2, arg3, 0);
> > +    if (p2 == NULL) {
> > +        UNLOCK_PATH(p1, arg1);
> > +        return -TARGET_EFAULT;
> > +    }
> > +#ifdef __FreeBSD__
> > +    if (strcmp(p1, "/proc/curproc/file") == 0) {
> > +        CPUState *cpu = env_cpu(env);
> > +        TaskState *ts = (TaskState *)cpu->opaque;
> > +        strncpy(p2, ts->bprm->fullpath, arg3);
> > +        ret = MIN((abi_long)strlen(ts->bprm->fullpath), arg3);
> > +    } else
> > +#endif
>
> Unfortunate ifdef.  Do we really need it while the other bsds are
> presumably still
> non-functional?  I see that HOST_DEFAULT_BSD_TYPE isn't hooked up either...
>

I can remove the ifdef for now and add it to the TODO file as something to
check
when we try to support NetBSD/OpenBSD again.

Warner

--0000000000005e847d05e1e6cb11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 20, 2022 at 12:28 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 6/20/22 10:42, Warner Losh wrote:<br>
&gt; +static abi_long do_bsd_readlink(CPUArchState *env, abi_long arg1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_long arg2, abi_long arg3)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_long ret;<br>
&gt; +=C2=A0 =C2=A0 void *p1, *p2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 LOCK_PATH(p1, arg1);<br>
&gt; +=C2=A0 =C2=A0 p2 =3D lock_user(VERIFY_WRITE, arg2, arg3, 0);<br>
&gt; +=C2=A0 =C2=A0 if (p2 =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 UNLOCK_PATH(p1, arg1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#ifdef __FreeBSD__<br>
&gt; +=C2=A0 =C2=A0 if (strcmp(p1, &quot;/proc/curproc/file&quot;) =3D=3D 0=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D env_cpu(env);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TaskState *ts =3D (TaskState *)cpu-&gt;op=
aque;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 strncpy(p2, ts-&gt;bprm-&gt;fullpath, arg=
3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D MIN((abi_long)strlen(ts-&gt;bprm-=
&gt;fullpath), arg3);<br>
&gt; +=C2=A0 =C2=A0 } else<br>
&gt; +#endif<br>
<br>
Unfortunate ifdef.=C2=A0 Do we really need it while the other bsds are pres=
umably still <br>
non-functional?=C2=A0 I see that HOST_DEFAULT_BSD_TYPE isn&#39;t hooked up =
either...<br></blockquote><div><br></div><div>I can remove the ifdef for no=
w and add it to the TODO file as something to check</div><div>when we try t=
o support NetBSD/OpenBSD again.=C2=A0</div><div><br></div><div>Warner</div>=
</div></div>

--0000000000005e847d05e1e6cb11--

