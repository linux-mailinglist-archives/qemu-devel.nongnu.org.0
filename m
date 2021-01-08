Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591282EF147
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:31:19 +0100 (CET)
Received: from localhost ([::1]:53028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxpzC-0006Wf-DY
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxpwM-0005Do-AY
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:28:22 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxpwK-0000Hh-AN
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:28:22 -0500
Received: by mail-oi1-f181.google.com with SMTP id d189so10928124oig.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 03:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S80ZtTC6km0r13uKHFUfNFhYdqrSHnMmZ6G6uwFQpFI=;
 b=QeyaYMh/XDck1VT8MatXUiKm4wqD672mF0XcWKqbGMKhkqVX3+xzRQBZ1BRefuftoc
 JJyEzx31O/T8eDt1nYzquadId3bSSDqjttBWkYXvwkDtyFa1+6Z7AsngB2FQx0iJ0lc4
 sspwkoxIwyyeaNVnNI+qqAOglkLLAVlXjC6j0tr1yqlotlhSaFipiUcaCYcfgw8/iD6w
 NusDIeA8OteTJKBMT1KLYX681ZE18Lm/5u4+zbSV8HAcPNCPixd/Yd+aa+62Qz/lOake
 PnjwxygNeKmBjwmETlp8iCHul/fhtXPPBAjPFkapJiXpAtidomW1qX86U0uQlQ5eYx5d
 EEcA==
X-Gm-Message-State: AOAM530hEbZkkr6eos057KnxuX/RZpAHBErzZ2QwUcXN6TPGx/6xZVNZ
 dDe18baSJUcJhOkBNS1jHuLaTXrkHjQ2L+QLMBw=
X-Google-Smtp-Source: ABdhPJxpKtAus5KyrLHWpLwh9Z3ROs83jFBzasg0zzKiK9HOZA6uxFDzb1wO3xG1KQtnjMxLGHuejrhi7TlALbfXe4s=
X-Received: by 2002:aca:58d6:: with SMTP id m205mr1946644oib.121.1610105299185; 
 Fri, 08 Jan 2021 03:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20210107222253.20382-1-f4bug@amsat.org>
 <CAFEAcA-6SD7304G=tXUYWZMYekZ=+ZXaMc26faTNnHFxw9MWqg@mail.gmail.com>
In-Reply-To: <CAFEAcA-6SD7304G=tXUYWZMYekZ=+ZXaMc26faTNnHFxw9MWqg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 8 Jan 2021 12:28:07 +0100
Message-ID: <CAAdtpL7CKT3gG8VCP4K1COjfqbG+pP_p_LG5Py8rmjUJH4foMg@mail.gmail.com>
Subject: Re: [PULL 00/66] MIPS patches for 2021-01-07
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000068b43805b861da3b"
Received-SPF: pass client-ip=209.85.167.181;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 kvm-devel <kvm@vger.kernel.org>, Paul Burton <paulburton@kernel.org>,
 Libvirt <libvir-list@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000068b43805b861da3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Le ven. 8 janv. 2021 11:35, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> On Thu, 7 Jan 2021 at 22:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
> wrote:
> >
> > The following changes since commit
> 470dd6bd360782f5137f7e3376af6a44658eb1d3:
> >
> >   Merge remote-tracking branch
> 'remotes/stsquad/tags/pull-testing-060121-4' into staging (2021-01-06
> 22:18:36 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/philmd/qemu.git tags/mips-20210107
> >
> > for you to fetch changes up to f97d339d612b86d8d336a11f01719a10893d6707=
:
> >
> >   docs/system: Remove deprecated 'fulong2e' machine alias (2021-01-07
> 22:57:49 +0100)
> >
> > ----------------------------------------------------------------
> > MIPS patches queue
> >
> > - Simplify CPU/ISA definitions
> > - Various maintenance code movements in translate.c
> > - Convert part of the MSA ASE instructions to decodetree
> > - Convert some instructions removed from Release 6 to decodetree
> > - Remove deprecated 'fulong2e' machine alias
>
> Hi; this failed to build on some of my hosts:
>
> [1/4674] Generating 'libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc'.
> FAILED: libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc
> /usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py
> ../../target/mips/mips64r6.decode --static-deco
> de=3Ddecode_mips64r6 -o libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc
> Traceback (most recent call last):
>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
> 1397, in <module>
>     main()
>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
> 1308, in main
>     parse_file(f, toppat)
>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
> 994, in parse_file
>     for line in f:
>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
> 80: ordinal not in range(128)
>

My lastname in the copyright line =3D)

[2/4674] Generating 'libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc'.
> FAILED: libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc
> /usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py
> ../../target/mips/msa64.decode --static-decode=3D
> decode_msa64 -o libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc
> Traceback (most recent call last):
>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
> 1397, in <module>
>     main()
>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
> 1308, in main
>     parse_file(f, toppat)
>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
> 994, in parse_file
>     for line in f:
>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
> 93: ordinal not in range(128)
>
> etc.
>
> Looks like decodetree fails to cope with non-ASCII characters in
> its input file -- probably this depends on the host locale settings:
> I think these hosts run in the 'C' locale.
>

Can you provide more information on your host so we can cover it in
Gitlab-CI?

Thanks,

Phil.

>

--00000000000068b43805b861da3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Hi Peter,</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div=
><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 8 janv. 2021 11:35, Peter Ma=
ydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.=
org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Thu, 7 Jan 2021 at 22:25, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto=
:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&=
gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 470dd6bd360782f5137f7e3376af6a44658=
eb1d3:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/stsquad/tags/pul=
l-testing-060121-4&#39; into staging (2021-01-06 22:18:36 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/philmd/qemu.git" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://gitlab.com/philmd/qemu.git</a>=
 tags/mips-20210107<br>
&gt;<br>
&gt; for you to fetch changes up to f97d339d612b86d8d336a11f01719a10893d670=
7:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0docs/system: Remove deprecated &#39;fulong2e&#39; machine =
alias (2021-01-07 22:57:49 +0100)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; MIPS patches queue<br>
&gt;<br>
&gt; - Simplify CPU/ISA definitions<br>
&gt; - Various maintenance code movements in translate.c<br>
&gt; - Convert part of the MSA ASE instructions to decodetree<br>
&gt; - Convert some instructions removed from Release 6 to decodetree<br>
&gt; - Remove deprecated &#39;fulong2e&#39; machine alias<br>
<br>
Hi; this failed to build on some of my hosts:<br>
<br>
[1/4674] Generating &#39;libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc&=
#39;.<br>
FAILED: libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc<br>
/usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py<br>
../../target/mips/mips64r6.decode --static-deco<br>
de=3Ddecode_mips64r6 -o libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc<b=
r>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot=
;, line<br>
1397, in &lt;module&gt;<br>
=C2=A0 =C2=A0 main()<br>
=C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot=
;, line<br>
1308, in main<br>
=C2=A0 =C2=A0 parse_file(f, toppat)<br>
=C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot=
;, line<br>
994, in parse_file<br>
=C2=A0 =C2=A0 for line in f:<br>
=C2=A0 File &quot;/usr/lib/python3.6/encodings/ascii.py&quot;, line 26, in =
decode<br>
=C2=A0 =C2=A0 return codecs.ascii_decode(input, self.errors)[0]<br>
UnicodeDecodeError: &#39;ascii&#39; codec can&#39;t decode byte 0xc3 in pos=
ition<br>
80: ordinal not in range(128)<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div dir=3D"auto" style=3D"font-family:sans-se=
rif">My lastname in the copyright line =3D)</div><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
[2/4674] Generating &#39;libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc&#39=
;.<br>
FAILED: libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc<br>
/usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py<br>
../../target/mips/msa64.decode --static-decode=3D<br>
decode_msa64 -o libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot=
;, line<br>
1397, in &lt;module&gt;<br>
=C2=A0 =C2=A0 main()<br>
=C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot=
;, line<br>
1308, in main<br>
=C2=A0 =C2=A0 parse_file(f, toppat)<br>
=C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot=
;, line<br>
994, in parse_file<br>
=C2=A0 =C2=A0 for line in f:<br>
=C2=A0 File &quot;/usr/lib/python3.6/encodings/ascii.py&quot;, line 26, in =
decode<br>
=C2=A0 =C2=A0 return codecs.ascii_decode(input, self.errors)[0]<br>
UnicodeDecodeError: &#39;ascii&#39; codec can&#39;t decode byte 0xc3 in pos=
ition<br>
93: ordinal not in range(128)<br>
<br>
etc.<br>
<br>
Looks like decodetree fails to cope with non-ASCII characters in<br>
its input file -- probably this depends on the host locale settings:<br>
I think these hosts run in the &#39;C&#39; locale.<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you provide more info=
rmation on your host so we can cover it in Gitlab-CI?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Phil.</div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000068b43805b861da3b--

