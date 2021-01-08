Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653582EF597
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:14:55 +0100 (CET)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuPe-0006S2-1F
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxuOY-0005yK-Ok
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:13:46 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxuOW-0000FV-7k
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:13:46 -0500
Received: by mail-lf1-x12f.google.com with SMTP id x20so24050658lfe.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=qs3RXjQAtIfsiXG6n3GhHV/BRaco7aRopH0FVL0/Ptg=;
 b=DBH9yN/mB9cu33Io2EPzgfYs+6A8YWi5as/F1Bvgv2zEHS5h0LRbmpguxprKV1Hq6Z
 AE/41bizPRC0nnUPcfbQKUV7pn6QQk/caLy/uFDUYvwC48itVZ5WZau8DHYIi4Y4vctS
 Qg6/gxPw3lzfONQgvMqSfXQPWSIKXJXnXpnvqCs/rLiQARbaNub2jd8MmM3KzUEBQHc3
 Au59XbgVc/M4BUts9U8ccKgOBTpBsii2JDusUJF3XI0+wpMkS7IvaNN+xJh9NP9lBRz/
 +YCqZtT7nvcAKRFVuXQNSo1oecc0eAfmq0A00iyfT43HAL59sgaeKzcc9qJx/cK9ioqq
 tpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=qs3RXjQAtIfsiXG6n3GhHV/BRaco7aRopH0FVL0/Ptg=;
 b=ipFk00SbEzmXseJtMeRFG81Vdks0+7P+JS9gUFARljk4jsUn84p/2T/VUGM5E9N/A9
 PIpKTzE4h9XxfQOdGFxyEXBqx2Oj63zZpIkWNDoIkFF/paCo1PX+8LDeDTFTn1LDcODp
 wdBr9WzJMQkrGyzi49O1U//Ts2Cg3tAEokFpuptinVCXA2XeRabfz2JeNRA+AydOj2hG
 +XqrzSqeMCPjpeLYjvS7CPHsa4G2T9MYY+N736UFbUJt5+KKgbgDo+XqeZzJpexRjl0T
 ZngiP56vaHgZClSv8HqRxidETkgRkNmPiNMorJzBl+xtb7SMcCLhi0fH5r34/V/d0CKp
 Q6Yw==
X-Gm-Message-State: AOAM533UcHjCRL0fR8D4uB2FUCG1hsvSFIDQocfHuYnPp75Y4b/sCI4k
 ANQXa+wtfEym7KxgUyssWWVAP66K991nYZuHOyc=
X-Google-Smtp-Source: ABdhPJwrnbghGDMC8QH3l++AtfaHJI+TX+sZUlcBPr/kP6oMub2ESGzdvr41hGHSS9+Lh3owRxfHi0PimscCPHpQM14=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr1878501ljg.347.1610122422308; 
 Fri, 08 Jan 2021 08:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108151632.277015-1-f4bug@amsat.org>
 <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
In-Reply-To: <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 9 Jan 2021 00:13:31 +0800
Message-ID: <CAE2XoE-sDrYDtKjqRQ_+=7XNmnFX3_BoJadULoLj-X3oMDaYbA@mail.gmail.com>
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000006d44405b865d78c"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x12f.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000006d44405b865d78c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 9, 2021 at 12:05 AM Peter Maydell <peter.maydell@linaro.org>
wrote:
>
> On Fri, 8 Jan 2021 at 15:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:
> >
> > When decodetree.py was added in commit 568ae7efae7, QEMU was
> > using Python 2 which happily reads UTF-8 files in text mode.
> > Python 3 requires either UTF-8 locale or an explicit encoding
> > passed to open(). Now that Python 3 is required, explicit
> > UTF-8 encoding for decodetree sources.
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
> > ---
> >  scripts/decodetree.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> > index 47aa9caf6d1..fa40903cff1 100644
> > --- a/scripts/decodetree.py
> > +++ b/scripts/decodetree.py
> > @@ -1304,7 +1304,7 @@ def main():
> >
> >      for filename in args:
> >          input_file =3D filename
> > -        f =3D open(filename, 'r')
> > +        f =3D open(filename, 'r', encoding=3D'utf-8')
> >          parse_file(f, toppat)
> >          f.close()
>
> Should we also be opening the output file explicitly as
> utf-8 ? (How do we say "write to sys.stdout as utf-8" for
> the case where we're doing that?)

Can be done with
```
        sys.stdout =3D io.TextIOWrapper(sys.stdout.buffer, encoding=3D"utf8=
",
errors=3D"ignore")
```

>
> thanks
> -- PMM
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000006d44405b865d78c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sat, Jan 9, 2021 at 12:05 AM Peter Maydell &lt;=
<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt=
; wrote:<br>&gt;<br>&gt; On Fri, 8 Jan 2021 at 15:16, Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote=
:<br>&gt; &gt;<br>&gt; &gt; When decodetree.py was added in commit 568ae7ef=
ae7, QEMU was<br>&gt; &gt; using Python 2 which happily reads UTF-8 files i=
n text mode.<br>&gt; &gt; Python 3 requires either UTF-8 locale or an expli=
cit encoding<br>&gt; &gt; passed to open(). Now that Python 3 is required, =
explicit<br>&gt; &gt; UTF-8 encoding for decodetree sources.<br>&gt; &gt;<b=
r>&gt; &gt; This fixes:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 $ /usr/bin/python3=
 scripts/decodetree.py test.decode<br>&gt; &gt; =C2=A0 Traceback (most rece=
nt call last):<br>&gt; &gt; =C2=A0 =C2=A0 File &quot;scripts/decodetree.py&=
quot;, line 1397, in &lt;module&gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 main(=
)<br>&gt; &gt; =C2=A0 =C2=A0 File &quot;scripts/decodetree.py&quot;, line 1=
308, in main<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 parse_file(f, toppat)<br>&gt=
; &gt; =C2=A0 =C2=A0 File &quot;scripts/decodetree.py&quot;, line 994, in p=
arse_file<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 for line in f:<br>&gt; &gt; =C2=
=A0 =C2=A0 File &quot;/usr/lib/python3.6/encodings/ascii.py&quot;, line 26,=
 in decode<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 return codecs.ascii_decode(inp=
ut, self.errors)[0]<br>&gt; &gt; =C2=A0 UnicodeDecodeError: &#39;ascii&#39;=
 codec can&#39;t decode byte 0xc3 in position 80:<br>&gt; &gt; =C2=A0 ordin=
al not in range(128)<br>&gt; &gt;<br>&gt; &gt; Reported-by: Peter Maydell &=
lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>=
&gt;<br>&gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D=
"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>&gt; &gt; ---<br>&gt; &=
gt; =C2=A0scripts/decodetree.py | 2 +-<br>&gt; &gt; =C2=A01 file changed, 1=
 insertion(+), 1 deletion(-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/scripts=
/decodetree.py b/scripts/decodetree.py<br>&gt; &gt; index 47aa9caf6d1..fa40=
903cff1 100644<br>&gt; &gt; --- a/scripts/decodetree.py<br>&gt; &gt; +++ b/=
scripts/decodetree.py<br>&gt; &gt; @@ -1304,7 +1304,7 @@ def main():<br>&gt=
; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0for filename in args:<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_file =3D filename<br>&gt; &gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(filename, &#39;r&#39;)<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(filename, &#39;r&#39;, encoding=3D&#=
39;utf-8&#39;)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parse_file(f,=
 toppat)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()<br>&gt;<b=
r>&gt; Should we also be opening the output file explicitly as<br>&gt; utf-=
8 ? (How do we say &quot;write to sys.stdout as utf-8&quot; for<br>&gt; the=
 case where we&#39;re doing that?)<br><br>Can be done with<br>```<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 sys.stdout =3D io.TextIOWrapper(sys.stdout.buffer, en=
coding=3D&quot;utf8&quot;, errors=3D&quot;ignore&quot;)<br>```<div><br>&gt;=
<br>&gt; thanks<br>&gt; -- PMM<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=
=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--00000000000006d44405b865d78c--

