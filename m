Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DA3BADD8
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:38:34 +0200 (CEST)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m058b-0007lN-Fj
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m0578-0006wg-Dk
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:37:02 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m0576-000466-Gy
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:37:02 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id j190so1672872vkg.12
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktFrB07UprPA52D4MVnAq3jVX9HBflFC9U3nOrUgxNw=;
 b=ZRVTq+Dyglr6rQvMtwVM0dcFh4fwHI4TDV6d7VFaRFmPgW86SKhIq9vFDg5TZctvfd
 SN0rhtlO/wTCm4L11T6ZQFhP3G8sAyBSKYSLPhUiIn+cmyYSABEa5CEWSrcSFlVTjrDP
 IibkT759N1kU/4FWQAwVKoOMGZ9cm8TRWra5MhguwyykD5x+HmdYr3jkvyzJW4hFkjyT
 70y9vS1r3Kz5pq0oAWGhnxb7BnLx1UlwZCbLBHku7JF2ieyPqbBjdod7eBWOYh+Qq0YS
 sXnPPq9kRiZ/PkSPqNzCKJJVWoicyvVQRuWz+BGjF+2DfMw0inCObr6vhDwBuDmn3SQp
 joGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktFrB07UprPA52D4MVnAq3jVX9HBflFC9U3nOrUgxNw=;
 b=bqT/u3u79Z2MojsTjFOBJGe1ATdTL9snR9msQuytBn58aqB8D3dTflBo8et4utKNV0
 yIVplzDtDc4emvfN/Gwf+AlgVhPav7/On2pgUQk2MaAMFoulcr4RTRC/HuIMy+ZHUban
 3Kfv3MxAPaWv8XjZq/cKdSB6ay8QZ9gwPXzD6eRScSbIjpvcs2rSxf95NLmzn0ne0+Pe
 l5gCmU3K895Y293+6DonJFlBqn6OYvwZ24nf3XDDeMICL1xxoXCFpV0odAchz4n/Br7O
 C/VWnJylFopX0gFAR4Rifv7cCEkl0r387Nnt8hc3hlkVxDWRQFZzQBwZdgPpPp66sz64
 VvWw==
X-Gm-Message-State: AOAM532819gwf5jppvfbam0ZoWPrtyPlJELboZhfUlyBy++uWTMHWfn2
 g5SQahM83knDlXmwSVL61XJc0hH4T47ZYYo1hbI=
X-Google-Smtp-Source: ABdhPJzixNd7DddCegJ1MjwB0w+Fyl1eaoRq9t1slyVmYvfRfWZCF9QV7AriyJzzWzRji7/rwgoW04KjxDJWdfSAGKU=
X-Received: by 2002:a1f:cbc1:: with SMTP id b184mr6583172vkg.16.1625416619377; 
 Sun, 04 Jul 2021 09:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfM6HED-01ntpHTGXuQVg8XX4QnwacE=+eho_NOdQsKfvw@mail.gmail.com>
 <a48db2b4-fda6-1de9-1eb5-e4388a693bf3@redhat.com>
In-Reply-To: <a48db2b4-fda6-1de9-1eb5-e4388a693bf3@redhat.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 12:36:48 -0400
Message-ID: <CAOakUfNVFfofbTZXGRW9YO-JJA-cQuYSmGZv-tYamhM+jhm2vA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] Fix SHELL variable in Makefile for Haiku
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000035ca1705c64eccd5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000035ca1705c64eccd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that would have been fine, but I don't know why that wasn't done
previously. Someone else had put in the full path to env for bash, so I
didn't want to change something which may have been intentional.

=C3=8En dum., 4 iul. 2021 la 12:19, Thomas Huth <thuth@redhat.com> a scris:

> On 04/07/2021 16.28, Richard Zak wrote:
> > Signed-off-by: Richard Zak <richard.j.zak@gmail.com
> > <mailto:richard.j.zak@gmail.com>>
> > ---
> >   Makefile | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 30f19d33bb..37124410da 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -14,7 +14,13 @@ SRC_PATH=3D.
> >   # we have explicit rules for everything
> >   MAKEFLAGS +=3D -rR
> >
> > -SHELL =3D /usr/bin/env bash -o pipefail
> > +# Detect Haiku by checking BeOS variable for host CPU type
> > +ifneq ($(BE_HOST_CPU),)
> > +  # Haiku doesn't have the /usr directory
> > +  SHELL =3D /bin/env bash -o pipefail
> > +else
> > +  SHELL =3D /usr/bin/env bash -o pipefail
> > +endif
>
> Why not simply:
>
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -14,7 +14,7 @@ SRC_PATH=3D.
>   # we have explicit rules for everything
>   MAKEFLAGS +=3D -rR
>
> -SHELL =3D /usr/bin/env bash -o pipefail
> +SHELL =3D bash -o pipefail
>
>   # Usage: $(call quiet-command,command and args,"NAME","args to print")
>   # This will run "command and args", and either:
>
> ?
>
>   Thomas
>
>

--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--00000000000035ca1705c64eccd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that would have been fine, but I don&#39;t know why t=
hat wasn&#39;t done previously. Someone else had put in the full path to en=
v for bash, so I didn&#39;t want to change something which may have been in=
tentional.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">=C3=8En dum., 4 iul. 2021 la 12:19, Thomas Huth &lt;<a href=
=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; a scris:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 04/07/2021 16.28, Richard=
 Zak wrote:<br>
&gt; Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.c=
om" target=3D"_blank">richard.j.zak@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.j.zak@gmail.com" target=3D"_blank=
">richard.j.zak@gmail.com</a>&gt;&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0Makefile | 8 +++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/Makefile b/Makefile<br>
&gt; index 30f19d33bb..37124410da 100644<br>
&gt; --- a/Makefile<br>
&gt; +++ b/Makefile<br>
&gt; @@ -14,7 +14,13 @@ SRC_PATH=3D.<br>
&gt;=C2=A0 =C2=A0# we have explicit rules for everything<br>
&gt;=C2=A0 =C2=A0MAKEFLAGS +=3D -rR<br>
&gt; <br>
&gt; -SHELL =3D /usr/bin/env bash -o pipefail<br>
&gt; +# Detect Haiku by checking BeOS variable for host CPU type<br>
&gt; +ifneq ($(BE_HOST_CPU),)<br>
&gt; + =C2=A0# Haiku doesn&#39;t have the /usr directory<br>
&gt; + =C2=A0SHELL =3D /bin/env bash -o pipefail<br>
&gt; +else<br>
&gt; + =C2=A0SHELL =3D /usr/bin/env bash -o pipefail<br>
&gt; +endif<br>
<br>
Why not simply:<br>
<br>
diff --git a/Makefile b/Makefile<br>
--- a/Makefile<br>
+++ b/Makefile<br>
@@ -14,7 +14,7 @@ SRC_PATH=3D.<br>
=C2=A0 # we have explicit rules for everything<br>
=C2=A0 MAKEFLAGS +=3D -rR<br>
<br>
-SHELL =3D /usr/bin/env bash -o pipefail<br>
+SHELL =3D bash -o pipefail<br>
<br>
=C2=A0 # Usage: $(call quiet-command,command and args,&quot;NAME&quot;,&quo=
t;args to print&quot;)<br>
=C2=A0 # This will run &quot;command and args&quot;, and either:<br>
<br>
?<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--00000000000035ca1705c64eccd5--

