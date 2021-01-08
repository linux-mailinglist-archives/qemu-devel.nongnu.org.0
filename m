Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3B2EF4C1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:24:19 +0100 (CET)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtcg-0007a8-Sz
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxtbb-0007BL-Dr
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:23:11 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxtbY-0006HN-RG
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:23:11 -0500
Received: by mail-lf1-x134.google.com with SMTP id a12so23768212lfl.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=x4QM7QFfbI5uj39hWRobs6kfQ6+NnlpMPSV/kYHQawM=;
 b=GhhOoQD0zy9R7qreUih+DO6Rtj7zKX1MucaKiIqOwpQB9hfaFOVPprYdpdcjIBpgpa
 6LhtSXEX35wSw97CExr9Vg34CahEPpmrPuERlDvycd3qeUX0pNFBH8+oYMBZBaAzBN6c
 6TGDx0JdANcvZPiTF7+EyoxRPq4JzVgWAA+5kqomkNPPLDOSeELqL2X5memBP7EyRMtu
 t+ZhDSgvGRfGWC2OWozQo35min6vCYCOPY3GK8kPkO6nxVyyh0pHQU+c2OIEqq8BVSob
 X6IC+sv0bYk5NVa6R61SxjryfzIwECdZqkJaB/6d32BbWt2gnUEwSfVHI4fPcZ3Zwgxf
 52cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=x4QM7QFfbI5uj39hWRobs6kfQ6+NnlpMPSV/kYHQawM=;
 b=f20NSRMnA2I541om1eefZ5UQ/qqglWGry9DN6cqvwJibfn+lCUlAE3Z9fY7u9UI18K
 skhTIol3yfUXj9f+zyj41DspnKHaeqEZbF4tcD5SCViNdL4OCC5rwsvFfrx9IF4XSkgV
 aAUYQo0sbrPqqJEwMOdrvFC8iwx1EfylBZEcLM1khqGuLQvATvZY9Dachdhyr4Yjm1Qh
 sz//JkWgHLDi29x5oayZmCnVfvdopuCLEvgUR31kWvwpjj32gOp10IVldRSml+EjWtIz
 qGQOQOI7npM9RIpPgoQ3wfq70clj8m4DRCRyKwZ64ftVgTeDvxDcxc+qgb48Tb1v6PyH
 rdKA==
X-Gm-Message-State: AOAM530sgyxN+8zCnuO1Sl2WH5BqY7oNkKY0feg82ZHaRIToftsQeOro
 WnlI5DMtZoAm7MQRjZp1BFNQLh1qTZeQUNdY1aA=
X-Google-Smtp-Source: ABdhPJzejj9IC0k0DLIv8UKM1EVZTpgedGpntEPFzuZUA1UupI2l5/vwwr4K1W78Bdz8UeCpydt7vTJeBWlhl8TFJJk=
X-Received: by 2002:a19:ad4b:: with SMTP id s11mr1739430lfd.427.1610119386560; 
 Fri, 08 Jan 2021 07:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20210107222253.20382-1-f4bug@amsat.org>
 <CAFEAcA-6SD7304G=tXUYWZMYekZ=+ZXaMc26faTNnHFxw9MWqg@mail.gmail.com>
 <CAAdtpL7CKT3gG8VCP4K1COjfqbG+pP_p_LG5Py8rmjUJH4foMg@mail.gmail.com>
In-Reply-To: <CAAdtpL7CKT3gG8VCP4K1COjfqbG+pP_p_LG5Py8rmjUJH4foMg@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 8 Jan 2021 07:22:55 -0800
Message-ID: <CAE2XoE8YWYnvap+Ox7hWaKfpRjDS+vEKpP61F0w3NkkKse5_iA@mail.gmail.com>
Subject: Re: [PULL 00/66] MIPS patches for 2021-01-07
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000014ffb405b8652267"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x134.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 kvm-devel <kvm@vger.kernel.org>, Paul Burton <paulburton@kernel.org>,
 Libvirt <libvir-list@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000014ffb405b8652267
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 3:31 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:
>
> Hi Peter,
>
> Le ven. 8 janv. 2021 11:35, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :
>>
>> On Thu, 7 Jan 2021 at 22:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:
>> >
>> > The following changes since commit
470dd6bd360782f5137f7e3376af6a44658eb1d3:
>> >
>> >   Merge remote-tracking branch
'remotes/stsquad/tags/pull-testing-060121-4' into staging (2021-01-06
22:18:36 +0000)
>> >
>> > are available in the Git repository at:
>> >
>> >   https://gitlab.com/philmd/qemu.git tags/mips-20210107
>> >
>> > for you to fetch changes up to
f97d339d612b86d8d336a11f01719a10893d6707:
>> >
>> >   docs/system: Remove deprecated 'fulong2e' machine alias (2021-01-07
22:57:49 +0100)
>> >
>> > ----------------------------------------------------------------
>> > MIPS patches queue
>> >
>> > - Simplify CPU/ISA definitions
>> > - Various maintenance code movements in translate.c
>> > - Convert part of the MSA ASE instructions to decodetree
>> > - Convert some instructions removed from Release 6 to decodetree
>> > - Remove deprecated 'fulong2e' machine alias
>>
>> Hi; this failed to build on some of my hosts:
>>
>> [1/4674] Generating 'libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc'.
>> FAILED: libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc
>> /usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py
>> ../../target/mips/mips64r6.decode --static-deco
>> de=3Ddecode_mips64r6 -o libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.in=
c
>> Traceback (most recent call last):
>>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
>> 1397, in <module>
>>     main()
>>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
>> 1308, in main
>>     parse_file(f, toppat)
>>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
>> 994, in parse_file
>>     for line in f:
>>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>>     return codecs.ascii_decode(input, self.errors)[0]
>> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
>> 80: ordinal not in range(128)
Can we always reading file in decodetree with utf8 encoding
And convert all decodetree to utf8 encoding, and the problem should
resolved.
```
 scripts/decodetree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d..8c9eb365ac 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1304,7 +1304,7 @@ def main():

     for filename in args:
         input_file =3D filename
-        f =3D open(filename, 'r')
+        f =3D open(filename, 'r', encoding=3D"utf8")
         parse_file(f, toppat)
         f.close()

```
>
>
> My lastname in the copyright line =3D)
>
>> [2/4674] Generating 'libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc'.
>> FAILED: libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc
>> /usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py
>> ../../target/mips/msa64.decode --static-decode=3D
>> decode_msa64 -o libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc
>> Traceback (most recent call last):
>>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
>> 1397, in <module>
>>     main()
>>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
>> 1308, in main
>>     parse_file(f, toppat)
>>   File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
>> 994, in parse_file
>>     for line in f:
>>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>>     return codecs.ascii_decode(input, self.errors)[0]
>> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
>> 93: ordinal not in range(128)
>>
>> etc.
>>
>> Looks like decodetree fails to cope with non-ASCII characters in
>> its input file -- probably this depends on the host locale settings:
>> I think these hosts run in the 'C' locale.
>
>
> Can you provide more information on your host so we can cover it in
Gitlab-CI?
>
> Thanks,
>
> Phil.



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000014ffb405b8652267
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Jan 8, 2021 at 3:31 AM Philippe Mathieu-Da=
ud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wro=
te:<br>&gt;<br>&gt; Hi Peter,<br>&gt;<br>&gt; Le ven. 8 janv. 2021 11:35, P=
eter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@=
linaro.org</a>&gt; a =C3=A9crit :<br>&gt;&gt;<br>&gt;&gt; On Thu, 7 Jan 202=
1 at 22:25, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.o=
rg">f4bug@amsat.org</a>&gt; wrote:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; The fo=
llowing changes since commit 470dd6bd360782f5137f7e3376af6a44658eb1d3:<br>&=
gt;&gt; &gt;<br>&gt;&gt; &gt; =C2=A0 Merge remote-tracking branch &#39;remo=
tes/stsquad/tags/pull-testing-060121-4&#39; into staging (2021-01-06 22:18:=
36 +0000)<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; are available in the Git reposi=
tory at:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; =C2=A0 <a href=3D"https://gitlab=
.com/philmd/qemu.git">https://gitlab.com/philmd/qemu.git</a> tags/mips-2021=
0107<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; for you to fetch changes up to f97d3=
39d612b86d8d336a11f01719a10893d6707:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; =C2=
=A0 docs/system: Remove deprecated &#39;fulong2e&#39; machine alias (2021-0=
1-07 22:57:49 +0100)<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; --------------------=
--------------------------------------------<br>&gt;&gt; &gt; MIPS patches =
queue<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; - Simplify CPU/ISA definitions<br>&=
gt;&gt; &gt; - Various maintenance code movements in translate.c<br>&gt;&gt=
; &gt; - Convert part of the MSA ASE instructions to decodetree<br>&gt;&gt;=
 &gt; - Convert some instructions removed from Release 6 to decodetree<br>&=
gt;&gt; &gt; - Remove deprecated &#39;fulong2e&#39; machine alias<br>&gt;&g=
t;<br>&gt;&gt; Hi; this failed to build on some of my hosts:<br>&gt;&gt;<br=
>&gt;&gt; [1/4674] Generating &#39;libqemu-mipsel-softmmu.fa.p/decode-mips6=
4r6.c.inc&#39;.<br>&gt;&gt; FAILED: libqemu-mipsel-softmmu.fa.p/decode-mips=
64r6.c.inc<br>&gt;&gt; /usr/bin/python3 /home/petmay01/qemu-for-merges/scri=
pts/decodetree.py<br>&gt;&gt; ../../target/mips/mips64r6.decode --static-de=
co<br>&gt;&gt; de=3Ddecode_mips64r6 -o libqemu-mipsel-softmmu.fa.p/decode-m=
ips64r6.c.inc<br>&gt;&gt; Traceback (most recent call last):<br>&gt;&gt; =
=C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot=
;, line<br>&gt;&gt; 1397, in &lt;module&gt;<br>&gt;&gt; =C2=A0 =C2=A0 main(=
)<br>&gt;&gt; =C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/deco=
detree.py&quot;, line<br>&gt;&gt; 1308, in main<br>&gt;&gt; =C2=A0 =C2=A0 p=
arse_file(f, toppat)<br>&gt;&gt; =C2=A0 File &quot;/home/petmay01/qemu-for-=
merges/scripts/decodetree.py&quot;, line<br>&gt;&gt; 994, in parse_file<br>=
&gt;&gt; =C2=A0 =C2=A0 for line in f:<br>&gt;&gt; =C2=A0 File &quot;/usr/li=
b/python3.6/encodings/ascii.py&quot;, line 26, in decode<br>&gt;&gt; =C2=A0=
 =C2=A0 return codecs.ascii_decode(input, self.errors)[0]<br>&gt;&gt; Unico=
deDecodeError: &#39;ascii&#39; codec can&#39;t decode byte 0xc3 in position=
<br>&gt;&gt; 80: ordinal not in range(128)<br>Can we always reading file in=
 decodetree with utf8 encoding<div>And convert all decodetree to utf8 encod=
ing, and the problem should resolved.<br>```<br>=C2=A0scripts/decodetree.py=
 | 2 +-<br>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff =
--git a/scripts/decodetree.py b/scripts/decodetree.py<br>index 47aa9caf6d..=
8c9eb365ac 100644<br>--- a/scripts/decodetree.py<br>+++ b/scripts/decodetre=
e.py<br>@@ -1304,7 +1304,7 @@ def main():<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0=
for filename in args:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_file =3D f=
ilename<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(filename, &#39;r&#39;)<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(filename, &#39;r&#39;, encoding=
=3D&quot;utf8&quot;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parse_file(f, top=
pat)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()<br>=C2=A0<br>```<div>&g=
t;<br>&gt;<br>&gt; My lastname in the copyright line =3D)<br>&gt;<br>&gt;&g=
t; [2/4674] Generating &#39;libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc&=
#39;.<br>&gt;&gt; FAILED: libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc<br=
>&gt;&gt; /usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetre=
e.py<br>&gt;&gt; ../../target/mips/msa64.decode --static-decode=3D<br>&gt;&=
gt; decode_msa64 -o libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc<br>&gt;&=
gt; Traceback (most recent call last):<br>&gt;&gt; =C2=A0 File &quot;/home/=
petmay01/qemu-for-merges/scripts/decodetree.py&quot;, line<br>&gt;&gt; 1397=
, in &lt;module&gt;<br>&gt;&gt; =C2=A0 =C2=A0 main()<br>&gt;&gt; =C2=A0 Fil=
e &quot;/home/petmay01/qemu-for-merges/scripts/decodetree.py&quot;, line<br=
>&gt;&gt; 1308, in main<br>&gt;&gt; =C2=A0 =C2=A0 parse_file(f, toppat)<br>=
&gt;&gt; =C2=A0 File &quot;/home/petmay01/qemu-for-merges/scripts/decodetre=
e.py&quot;, line<br>&gt;&gt; 994, in parse_file<br>&gt;&gt; =C2=A0 =C2=A0 f=
or line in f:<br>&gt;&gt; =C2=A0 File &quot;/usr/lib/python3.6/encodings/as=
cii.py&quot;, line 26, in decode<br>&gt;&gt; =C2=A0 =C2=A0 return codecs.as=
cii_decode(input, self.errors)[0]<br>&gt;&gt; UnicodeDecodeError: &#39;asci=
i&#39; codec can&#39;t decode byte 0xc3 in position<br>&gt;&gt; 93: ordinal=
 not in range(128)<br>&gt;&gt;<br>&gt;&gt; etc.<br>&gt;&gt;<br>&gt;&gt; Loo=
ks like decodetree fails to cope with non-ASCII characters in<br>&gt;&gt; i=
ts input file -- probably this depends on the host locale settings:<br>&gt;=
&gt; I think these hosts run in the &#39;C&#39; locale.<br>&gt;<br>&gt;<br>=
&gt; Can you provide more information on your host so we can cover it in Gi=
tlab-CI?<br>&gt;<br>&gt; Thanks,<br>&gt;<br>&gt; Phil.<br><br><br><br>--<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=
=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang L=
uo<br></div></div></div>

--00000000000014ffb405b8652267--

