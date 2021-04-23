Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB47369C01
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:23:25 +0200 (CEST)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3Gm-0008CX-1O
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la3FY-0007V5-SM
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:22:08 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:41724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la3FV-0007r5-Pd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:22:08 -0400
Received: by mail-qk1-x72b.google.com with SMTP id 8so17301105qkv.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 14:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xgY2Lf2vMiJTQ7oOnkAxO9gU4ZBMmPOlOlvlEXUvcPQ=;
 b=oa0BX4c0wPGOfcALenj8SuEtKDZ7XR7blVuy8p590cj9Kl+5ZamiKuVq3PeRV1Jywa
 UtSejCdy6hCYRGVlb9BTn6TjP+GJiVKELpjG3+fxy79mchWoBh+BGTM9S8NSX+2i7Wvn
 ctWBZ2V01G57x2MWF2A6pb+cMKjL2KuQEz+rYNblGTQyp9bL6/rFS3X7Zjf5U/1ipAKZ
 LXB0J+pfAsLRG/Ti2PjyIkN5BJFq4hMmQuT4yR2d6wnvRw06MLJ6i3UhTcuczwrGyqag
 TLYcB+Td/yA+6FeW5dbTPN4XFS5i96jkG+iOiNo0BG8wwfsKGRuZu7/3MGRxqYTyidIi
 +5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgY2Lf2vMiJTQ7oOnkAxO9gU4ZBMmPOlOlvlEXUvcPQ=;
 b=foxDaFA/V0/So8wyzcMg9z9JCZLAXe7EHav7uYovT5fLlcyGSoIIkH+i2vHsWqSFky
 A0+6u9kHlFz7KpTLmmJCwLR+cQYW9aE5cE/HPmlF+R1B0hCCEkFkPIir0BCvnv+zAtgO
 VM1J4a/nb9fvS1PI7A8JbQVr+RMmv0yb55uYKqrjhYDMmJYu+rTGXJ1CPt/EwBwvuOqk
 XtO/gljoR1c9DKhgJz85ZJxeWv+QnW9e/8Ea+rbK6QatCDuKnfn38qQ+Ly3mTq5r5YJW
 pJI0I+8GJR4sTpOMqvzCIRgw3VUuT/lEM6OA9a/SgXRG5z6mpcxOJoNJLIxxh9rDB2oO
 UYSw==
X-Gm-Message-State: AOAM530j/nXTuU/mUowlNUQPqrZusA/8kiWIeq/6oSlKSC/JldNMW4ht
 Zh4ETHFTrYKRvDmOsGkXLeQ2raKVCJINEab6dfCozQ==
X-Google-Smtp-Source: ABdhPJwSnv7B6kTnMv+uznl18eXqtsu7vOmrqwpHl7GZ9ZvTDh1d+Jmp5z4dgtlLRB2TZdg6QUW4Uc3LH1mlMEI9y/A=
X-Received: by 2002:a37:6492:: with SMTP id y140mr6042493qkb.89.1619212923888; 
 Fri, 23 Apr 2021 14:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-10-imp@bsdimp.com>
 <8e2ebe60-b2d3-c69b-eedc-3424684a24aa@amsat.org>
In-Reply-To: <8e2ebe60-b2d3-c69b-eedc-3424684a24aa@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 23 Apr 2021 15:21:53 -0600
Message-ID: <CANCZdfrV60FxASF61ddiPKu29++k048crgvnk_qP6fkAwFYZAA@mail.gmail.com>
Subject: Re: [PULL 19/24] bsd-user: use qemu_strtol in preference to strtol
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000024fe5605c0aa6329"
Received-SPF: none client-ip=2607:f8b0:4864:20::72b;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72b.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024fe5605c0aa6329
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 3:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 4/23/21 10:39 PM, imp@bsdimp.com wrote:
> > From: Warner Losh <imp@bsdimp.com>
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/main.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/bsd-user/main.c b/bsd-user/main.c
> > index 69e5525607..95fda8c5ae 100644
> > --- a/bsd-user/main.c
> > +++ b/bsd-user/main.c
> > @@ -821,7 +821,7 @@ int main(int argc, char **argv)
> >              }
> >          } else if (!strcmp(r, "s")) {
> >              r =3D argv[optind++];
> > -            x86_stack_size =3D strtol(r, (char **)&r, 0);
> > +            x86_stack_size =3D qemu_strtol(r, (char **)&r, 0);
> >              if (x86_stack_size <=3D 0) {
> >                  usage();
> >              }
> > @@ -853,7 +853,7 @@ int main(int argc, char **argv)
> >                  exit(1);
> >              }
> >          } else if (!strcmp(r, "B")) {
> > -            guest_base =3D strtol(argv[optind++], NULL, 0);
> > +            guest_base =3D qemu_strtol(argv[optind++], NULL, 0);
>
> Missing error check (-EINVAL & -ERANGE).
>

Thanks! Will update.


> >              have_guest_base =3D true;
> >          } else if (!strcmp(r, "drop-ld-preload")) {
> >              (void) envlist_unsetenv(envlist, "LD_PRELOAD");
> >
>
>

--00000000000024fe5605c0aa6329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 3:16 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 4/23/21 10:39 PM, <a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">=
imp@bsdimp.com</a> wrote:<br>
&gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_bla=
nk">imp@bsdimp.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/main.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
&gt; index 69e5525607..95fda8c5ae 100644<br>
&gt; --- a/bsd-user/main.c<br>
&gt; +++ b/bsd-user/main.c<br>
&gt; @@ -821,7 +821,7 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(r, &quot;s&quot;)=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D argv[optind++];<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x86_stack_size =3D strtol(r=
, (char **)&amp;r, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x86_stack_size =3D qemu_str=
tol(r, (char **)&amp;r, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x86_stack_size &lt=
;=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usage();=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -853,7 +853,7 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(r, &quot;B&quot;)=
) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_base =3D strtol(argv[=
optind++], NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_base =3D qemu_strtol(=
argv[optind++], NULL, 0);<br>
<br>
Missing error check (-EINVAL &amp; -ERANGE).<br></blockquote><div><br></div=
><div>Thanks! Will update.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 have_guest_base =3D tr=
ue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strcmp(r, &quot;drop-ld-=
preload&quot;)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) envlist_unseten=
v(envlist, &quot;LD_PRELOAD&quot;);<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000024fe5605c0aa6329--

