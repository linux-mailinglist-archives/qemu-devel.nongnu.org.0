Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523E2EFE16
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 06:43:23 +0100 (CET)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky721-0001dN-Ps
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 00:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1ky70T-0000ev-Mh
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 00:41:45 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:40128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1ky70Q-0001V8-N8
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 00:41:45 -0500
Received: by mail-lf1-x131.google.com with SMTP id m12so28149248lfo.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 21:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=oNmIm4Ey6I4tCs0lVCGj1SZkVvAG4N1N7LghsSpyXro=;
 b=j9lZA9VJU0WT5w2x2iIxuRK6/wHViizw+RjW3BLSUFgLSJvDZfIFiuBZUWjG9jBUVr
 b6D0++4Q5R+aSyNiWKXplNd4u31oqgg+4Kp6PIJ8imRmjhQMa7ALt9WC1r8tzfX0mwye
 ooNKw901vhLWPZn54bxqbP5yrCDLGKGX9m7t706M/3FLYGUt4UkCvgVBVH/wFtAAlPvI
 5/AYdcmiDjDHD5KjUbTTPneoS2O4/uMJQ5GmnOFQ33053Ee8PKOjluNw82598suuoSDw
 8jBYjjOUcDLbDVrYylxmVvsIrozFkT+VvWo4xsKMYpjj1vyYFE70ZPnI93Y6fjo0ZDy6
 93pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=oNmIm4Ey6I4tCs0lVCGj1SZkVvAG4N1N7LghsSpyXro=;
 b=C+AdZf7tJ+KZ3ccYq4XXyAWtBuqV0+Ot6KI1lAdpZp+nypnTMoweSZ+rJvuZOPH/Fh
 JDTXksp4GIJGAmO+88A2f1K1i7PlNMC+WQT7A4yaZtONLGnj1tQ0ZuLZkaa8vXnbqPnB
 v1ydIPEsIzhDSt9AF/hjJ9gWdoSGJ0O8lTnvtUzNIO77LgCM3EW71jQ0AUQ/YMiNAvVT
 uNNItDJYwHjBTkaTNzmAHABhVlorEWroHldZQWkldjrk95UWzIhX+Bf3nzQaB3b+eHMN
 bb/oy4I5PvhxO/dKSs9QZ+lX3IPJvmc33anzmN4+O86nicLxycwSLN5d+wCObrrnYaP2
 uyhw==
X-Gm-Message-State: AOAM532PSQ71pMZ+Ku/pMGG3bA5qJ0SMJZX7zBltkP6D3Va18ztI28n5
 EU/iOMA/gMV5jZakQWgm3ymvIX+J57By0sfFy+A=
X-Google-Smtp-Source: ABdhPJyHh+qo7Ph7wTPddIdFozl0LJRU5jCEb7lD2T/50Owv1gRBMslnuK4S7IN6EG2WsGq2EZXLWdX3NohgPUNHJWg=
X-Received: by 2002:a19:ad4b:: with SMTP id s11mr2860034lfd.427.1610170900520; 
 Fri, 08 Jan 2021 21:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108180952.358947-1-f4bug@amsat.org>
 <20210108185823.GB54056@habkost.net>
In-Reply-To: <20210108185823.GB54056@habkost.net>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 8 Jan 2021 21:41:29 -0800
Message-ID: <CAE2XoE_rkg3Ei-68qKg8Sz76APCme=ikfXyXvCnugZ0wLBdRBw@mail.gmail.com>
Subject: Re: [PATCH v2] decodetree: Open files with encoding='utf-8'
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008da33705b8712011"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x131.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008da33705b8712011
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 10:58 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
>
> On Fri, Jan 08, 2021 at 07:09:52PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > When decodetree.py was added in commit 568ae7efae7, QEMU was
> > using Python 2 which happily reads UTF-8 files in text mode.
> > Python 3 requires either UTF-8 locale or an explicit encoding
> > passed to open(). Now that Python 3 is required, explicit
> > UTF-8 encoding for decodetree source files.
> >
> > To avoid further problems with the user locale, also explicit
> > UTF-8 encoding for the generated C files.
> >
> > Explicit both input/output are plain text by using the 't' mode.
>
> I believe the 't' is unnecessary.  But it's harmless and makes it
> more explicit.
>
> >
> > This fixes:
> >
> >   $ /usr/bin/python3 scripts/decodetree.py test.decode
> >   Traceback (most recent call last):
> >     File "scripts/decodetree.py", line 1397, in <module>
> >       main()
> >     File "scripts/decodetree.py", line 1308, in main
> >       parse_file(f, toppat)
> >     File "scripts/decodetree.py", line 994, in parse_file
> >       for line in f:
> >     File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
> >       return codecs.ascii_decode(input, self.errors)[0]
> >   UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
80:
> >   ordinal not in range(128)
> >
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> However:
>
> > ---
> > v2: utf-8 output too (Peter)
> >     explicit default text mode.
> > ---
> >  scripts/decodetree.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> > index 47aa9caf6d1..d3857066cfc 100644
> > --- a/scripts/decodetree.py
> > +++ b/scripts/decodetree.py
> > @@ -1304,7 +1304,7 @@ def main():
> >
> >      for filename in args:
> >          input_file =3D filename
> > -        f =3D open(filename, 'r')
> > +        f =3D open(filename, 'rt', encoding=3D'utf-8')
> >          parse_file(f, toppat)
> >          f.close()
> >
> > @@ -1324,7 +1324,7 @@ def main():
> >          prop_size(stree)
> >
> >      if output_file:
> > -        output_fd =3D open(output_file, 'w')
> > +        output_fd =3D open(output_file, 'wt', encoding=3D'utf-8')

I misunderstand the cause, this is a better way

> >      else:
> >          output_fd =3D sys.stdout
>
> This will still use the user locale encoding for sys.stdout.  Can
> be solved with:
>
>     output_fd =3D io.TextIOWrapper(sys.stdout.buffer, encoding=3D'utf-8')

For output to console/terminal. I suggest to use
   sys.stdout =3D io.TextIOWrapper(sys.stdout.buffer,
encoding=3Dsys.stdout.encoding, errors=3D"ignore")
When the console/terminal encoding still can not represent the char in the
decodetree, still won't
cause script failure. And that failure can not be fixed by other means.
  errors=3D"ignore" are important, from my experince, even there is `char`
can not represent
in utf8


>
> (Based on a suggestion from Yonggang Luo)
>
> --
> Eduardo
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000008da33705b8712011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Jan 8, 2021 at 10:58 AM Eduardo Habkost &l=
t;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; wrote:=
<br>&gt;<br>&gt; On Fri, Jan 08, 2021 at 07:09:52PM +0100, Philippe Mathieu=
-Daud=C3=A9 wrote:<br>&gt; &gt; When decodetree.py was added in commit 568a=
e7efae7, QEMU was<br>&gt; &gt; using Python 2 which happily reads UTF-8 fil=
es in text mode.<br>&gt; &gt; Python 3 requires either UTF-8 locale or an e=
xplicit encoding<br>&gt; &gt; passed to open(). Now that Python 3 is requir=
ed, explicit<br>&gt; &gt; UTF-8 encoding for decodetree source files.<br>&g=
t; &gt;<br>&gt; &gt; To avoid further problems with the user locale, also e=
xplicit<br>&gt; &gt; UTF-8 encoding for the generated C files.<br>&gt; &gt;=
<br>&gt; &gt; Explicit both input/output are plain text by using the &#39;t=
&#39; mode.<br>&gt;<br>&gt; I believe the &#39;t&#39; is unnecessary.=C2=A0=
 But it&#39;s harmless and makes it<br>&gt; more explicit.<br>&gt;<br>&gt; =
&gt;<br>&gt; &gt; This fixes:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 $ /usr/bin/p=
ython3 scripts/decodetree.py test.decode<br>&gt; &gt; =C2=A0 Traceback (mos=
t recent call last):<br>&gt; &gt; =C2=A0 =C2=A0 File &quot;scripts/decodetr=
ee.py&quot;, line 1397, in &lt;module&gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0=
 main()<br>&gt; &gt; =C2=A0 =C2=A0 File &quot;scripts/decodetree.py&quot;, =
line 1308, in main<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 parse_file(f, toppat)<=
br>&gt; &gt; =C2=A0 =C2=A0 File &quot;scripts/decodetree.py&quot;, line 994=
, in parse_file<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 for line in f:<br>&gt; &g=
t; =C2=A0 =C2=A0 File &quot;/usr/lib/python3.6/encodings/ascii.py&quot;, li=
ne 26, in decode<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 return codecs.ascii_deco=
de(input, self.errors)[0]<br>&gt; &gt; =C2=A0 UnicodeDecodeError: &#39;asci=
i&#39; codec can&#39;t decode byte 0xc3 in position 80:<br>&gt; &gt; =C2=A0=
 ordinal not in range(128)<br>&gt; &gt;<br>&gt; &gt; Reported-by: Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt;<br>&gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>&gt;<br>&gt; Revi=
ewed-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkos=
t@redhat.com</a>&gt;<br>&gt;<br>&gt; However:<br>&gt;<br>&gt; &gt; ---<br>&=
gt; &gt; v2: utf-8 output too (Peter)<br>&gt; &gt; =C2=A0 =C2=A0 explicit d=
efault text mode.<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0scripts/decodetree.py=
 | 4 ++--<br>&gt; &gt; =C2=A01 file changed, 2 insertions(+), 2 deletions(-=
)<br>&gt; &gt;<br>&gt; &gt; diff --git a/scripts/decodetree.py b/scripts/de=
codetree.py<br>&gt; &gt; index 47aa9caf6d1..d3857066cfc 100644<br>&gt; &gt;=
 --- a/scripts/decodetree.py<br>&gt; &gt; +++ b/scripts/decodetree.py<br>&g=
t; &gt; @@ -1304,7 +1304,7 @@ def main():<br>&gt; &gt; <br>&gt; &gt; =C2=A0=
 =C2=A0 =C2=A0for filename in args:<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0input_file =3D filename<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0f =3D open(filename, &#39;r&#39;)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0f =3D open(filename, &#39;rt&#39;, encoding=3D&#39;utf-8&#39;)<br>&gt=
; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parse_file(f, toppat)<br>&gt; &gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()<br>&gt; &gt; <br>&gt; &gt; @@ =
-1324,7 +1324,7 @@ def main():<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0prop_size(stree)<br>&gt; &gt; <br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0if outpu=
t_file:<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0output_fd =3D open(output=
_file, &#39;w&#39;)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0output_fd =3D=
 open(output_file, &#39;wt&#39;, encoding=3D&#39;utf-8&#39;)<div><br></div>=
<div> I misunderstand the cause, this is a better way<br></div><div><br>&gt=
; &gt; =C2=A0 =C2=A0 =C2=A0else:<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0output_fd =3D sys.stdout<br>&gt;<br>&gt; This will still use the user=
 locale encoding for sys.stdout.=C2=A0 Can<br>&gt; be solved with:<br>&gt;<=
br>&gt; =C2=A0 =C2=A0 output_fd =3D io.TextIOWrapper(sys.stdout.buffer, enc=
oding=3D&#39;utf-8&#39;)</div><div><br></div><div>For output to console/ter=
minal. I suggest to use</div><div>=C2=A0 =C2=A0sys.stdout =3D io.TextIOWrap=
per(sys.stdout.buffer, encoding=3Dsys.stdout.encoding, errors=3D&quot;ignor=
e&quot;)</div><div>When the console/terminal encoding still can not represe=
nt the char in the decodetree, still won&#39;t=C2=A0</div><div>cause script=
 failure. And that failure can not be fixed by other means.</div><div>=C2=
=A0 errors=3D&quot;ignore&quot; are important, from my experince, even ther=
e is `char` can not represent</div><div>in utf8</div><div><br></div><div>=
=C2=A0<br></div><div>&gt;<br>&gt; (Based on a suggestion from Yonggang Luo)=
<br>&gt;</div><div><div>&gt; --<br>&gt; Eduardo<br>&gt;<br><br><br>--<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=
=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<=
/div></div></div>

--0000000000008da33705b8712011--

