Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85E40759A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 10:44:49 +0200 (CEST)
Received: from localhost ([::1]:44336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOycy-0007hV-9x
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 04:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mOyc7-00072R-Ho
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 04:43:55 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mOyc5-0000sI-Iv
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 04:43:55 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so5728467ott.10
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4X+a7C/5nP7HAQxrOiSymI1mRpg70mvJhLnB49wVnOs=;
 b=FYc9pjPHhRi/1LbHY6cg+qBPpqsxoLkv7Y9KQXL5Vl/LrIjxEPO2SUxvO2OZbKEom/
 uhSDIPrRaYpIUQu8cf23vljpcIjup73e+bHzr9/JSMlaMoRUSEf2lY2sTlYjBUzMcKl7
 Ac0nVImC2BOoteilo7CvNErdd43kveyimg2EnDGmIMmzrm5lW3NMGDj7SiaVJqSZ8QoM
 5BZWY6973HTHFVLVq1HgjctqqRxSftpZg+um98aupzF38uYFwr6oC6JEo65RUmb6YejR
 fbBfl+Uq+sgFaKxbo8fatqimo1BmZZYGlHB9WMvVTGYhioNY9aPxS22XyGOsmOpOLPu5
 KIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4X+a7C/5nP7HAQxrOiSymI1mRpg70mvJhLnB49wVnOs=;
 b=Y7LWJ3dxt4aichjLyHs32kwL0enIFSh6PZh41fEXTNbpNwBRufokjz0CnhnwIbvgrN
 zoL8ovayimTqLNrlVe2tqXEgQBT0ScJqnbD8Ux1B9rC5uCZiTuUZ6V+aW+BzTOBxR+VO
 fC+yj/Zeym9lhViFMQQ9gDLnggecRlmvMKYEq60Znm1MbAkA7+bQmDGvf0UZDRZPBgQV
 2FgKVe5ohUCCdwlNEgaUYxtqk3qfcNoLnYkP6pSVQFqio8z9qtBJ9gCr08m+S6PWv3os
 JIORlrxhqCRDrd7g/E3k/BIdcOMHFiQk6WbLh2BO/ppaJ4NWba2x+gXutj6L9Q9c+DZx
 tL+g==
X-Gm-Message-State: AOAM530WTCkJ83ccbskyiqpuGB8CEpJumYmQf1t5USa9MBtGAHhK4uuU
 5qtS5c1MAtg2ExZx03pXOcI2juHYzUnmra5VPO0=
X-Google-Smtp-Source: ABdhPJxMFPGTALbIGjKBDKyxiXvAKTCSUXyL0fFZRspfe0W08VSTifnlDk9WJxNYXmu1IPKh5m5/DykPXgHITbG9XwE=
X-Received: by 2002:a05:6830:9:: with SMTP id c9mr1586334otp.122.1631349831915; 
 Sat, 11 Sep 2021 01:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
In-Reply-To: <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sat, 11 Sep 2021 10:43:40 +0200
Message-ID: <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
To: Helge Konetzka <hk@zapateado.de>
Content-Type: multipart/alternative; boundary="0000000000003c5cce05cbb43b83"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c5cce05cbb43b83
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 11, 2021 at 8:29 AM Helge Konetzka <hk@zapateado.de> wrote:

> Am 10.09.21 um 17:44 schrieb Paolo Bonzini:
> > On 25/08/21 18:43, Helge Konetzka wrote:
> >> Furthermore I would like to propose to change the instructions for
> >> Native builds with MSYS2 on Wiki Windows page.
> >>
> >> Please remove the section which copies system binaries to match the
> >> expected file names!
> >>
> >> Instead define variables for configure (gcc-ar and gcc-ranlib are
> >> existing copies of x86_64-w64-mingw32-gcc-ar and
> >> x86_64-w64-mingw32-gcc-ranlib) and add strip to enable make install:
> >>
> >> AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres
> >> STRIP=strip \
> >> ./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl
> >
> > Do you even need anything but "./configure"? (possibly AR=gcc-ar NM=nm
> > at the beginning)?
>
> Sorry for being indistinct!
>
> My intention was to put "AR=gcc-ar NM=nm OBJCOPY=objcopy
> RANLIB=gcc-ranlib WINDRES=windres STRIP=strip" in front of "./configure"
> (see the '\' after STRIP=strip) instead of copying binaries:
>
> diff -Naur qemu.org.orig/Hosts/W32 qemu.org/Hosts/W32
> --- qemu.org.orig/Hosts/W32     2021-09-11 08:27:01.198715675 +0200
> +++ qemu.org/Hosts/W32  2021-09-11 08:28:15.853605118 +0200
> @@ -232,14 +232,6 @@
>       Close the MSYS2 console.
>       Start mingw64.exe.
>
> -cd /mingw64/bin
> -cp x86_64-w64-mingw32-gcc-ar.exe x86_64-w64-mingw32-ar.exe
> -cp x86_64-w64-mingw32-gcc-ranlib.exe x86_64-w64-mingw32-ranlib.exe
> -cp windres.exe x86_64-w64-mingw32-windres.exe
> -cp nm.exe x86_64-w64-mingw32-nm.exe
> -cp objcopy.exe x86_64-w64-mingw32-objcopy.exe
> -cd ~
> -
>       Download the QEMU source code:
>
>   git clone https://www.github.com/qemu/qemu
> @@ -247,6 +239,7 @@
>       Finally build QEMU with:
>
>   cd qemu
> +AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres
> STRIP=strip \
>   ./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl
>   make
>
>
Hi,

I wrote those instructions as I obviously could not find a better way to
get Qemu to cross-compile using MSYS2 in Windows.
When you look at configure, you see that only adding the cross-prefix will
not find the MSYS equivalents of some tools:

ar="${AR-${cross_prefix}ar}"
looks for x86_64-w64-mingw32-ar.exe and not (as it is named in MSYS2)
x86_64-w64-mingw32-gcc-ar.exe

Perhaps it would be better to fix configure for the MSYS2 case so the
flags or the renaming are not required?

Best,
Howard

--0000000000003c5cce05cbb43b83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Sep 11, 2021 at 8:29 AM Helge Konetzka &lt;<a href=3D"mailto=
:hk@zapateado.de" target=3D"_blank">hk@zapateado.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Am 10.09.21 um 17:44 sch=
rieb Paolo Bonzini:<br>
&gt; On 25/08/21 18:43, Helge Konetzka wrote:<br>
&gt;&gt; Furthermore I would like to propose to change the instructions for=
 <br>
&gt;&gt; Native builds with MSYS2 on Wiki Windows page.<br>
&gt;&gt;<br>
&gt;&gt; Please remove the section which copies system binaries to match th=
e <br>
&gt;&gt; expected file names!<br>
&gt;&gt;<br>
&gt;&gt; Instead define variables for configure (gcc-ar and gcc-ranlib are =
<br>
&gt;&gt; existing copies of x86_64-w64-mingw32-gcc-ar and <br>
&gt;&gt; x86_64-w64-mingw32-gcc-ranlib) and add strip to enable make instal=
l:<br>
&gt;&gt;<br>
&gt;&gt; AR=3Dgcc-ar NM=3Dnm OBJCOPY=3Dobjcopy RANLIB=3Dgcc-ranlib WINDRES=
=3Dwindres <br>
&gt;&gt; STRIP=3Dstrip \<br>
&gt;&gt; ./configure --cross-prefix=3Dx86_64-w64-mingw32- --enable-gtk --en=
able-sdl<br>
&gt; <br>
&gt; Do you even need anything but &quot;./configure&quot;? (possibly AR=3D=
gcc-ar NM=3Dnm <br>
&gt; at the beginning)?<br>
<br>
Sorry for being indistinct!<br>
<br>
My intention was to put &quot;AR=3Dgcc-ar NM=3Dnm OBJCOPY=3Dobjcopy <br>
RANLIB=3Dgcc-ranlib WINDRES=3Dwindres STRIP=3Dstrip&quot; in front of &quot=
;./configure&quot; <br>
(see the &#39;\&#39; after STRIP=3Dstrip) instead of copying binaries:<br>
<br>
diff -Naur qemu.org.orig/Hosts/W32 <a href=3D"http://qemu.org/Hosts/W32" re=
l=3D"noreferrer" target=3D"_blank">qemu.org/Hosts/W32</a><br>
--- qemu.org.orig/Hosts/W32=C2=A0 =C2=A0 =C2=A02021-09-11 08:27:01.19871567=
5 +0200<br>
+++ <a href=3D"http://qemu.org/Hosts/W32" rel=3D"noreferrer" target=3D"_bla=
nk">qemu.org/Hosts/W32</a>=C2=A0 2021-09-11 08:28:15.853605118 +0200<br>
@@ -232,14 +232,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 Close the MSYS2 console.<br>
=C2=A0 =C2=A0 =C2=A0 Start mingw64.exe.<br>
<br>
-cd /mingw64/bin<br>
-cp x86_64-w64-mingw32-gcc-ar.exe x86_64-w64-mingw32-ar.exe<br>
-cp x86_64-w64-mingw32-gcc-ranlib.exe x86_64-w64-mingw32-ranlib.exe<br>
-cp windres.exe x86_64-w64-mingw32-windres.exe<br>
-cp nm.exe x86_64-w64-mingw32-nm.exe<br>
-cp objcopy.exe x86_64-w64-mingw32-objcopy.exe<br>
-cd ~<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 Download the QEMU source code:<br>
<br>
=C2=A0 git clone <a href=3D"https://www.github.com/qemu/qemu" rel=3D"norefe=
rrer" target=3D"_blank">https://www.github.com/qemu/qemu</a><br>
@@ -247,6 +239,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 Finally build QEMU with:<br>
<br>
=C2=A0 cd qemu<br>
+AR=3Dgcc-ar NM=3Dnm OBJCOPY=3Dobjcopy RANLIB=3Dgcc-ranlib WINDRES=3Dwindre=
s <br>
STRIP=3Dstrip \<br>
=C2=A0 ./configure --cross-prefix=3Dx86_64-w64-mingw32- --enable-gtk --enab=
le-sdl<br>
=C2=A0 make<br>
<br></blockquote><div>=C2=A0</div><div>Hi, <br></div><div><br></div><div>I =
wrote those instructions as I obviously could not find a better way to get =
Qemu to cross-compile using MSYS2 in Windows.</div><div>When you look at co=
nfigure, you see that only adding the cross-prefix will not find the MSYS e=
quivalents of some tools:</div><div><br></div><div>ar=3D&quot;${AR-${cross_=
prefix}ar}&quot;</div><div><span style=3D"font-family:arial,sans-serif">loo=
ks for x86_64-w64-mingw32-ar.exe and not (as it is named in MSYS2) x86_64-w=
64-mingw32-gcc-ar.exe</span>
</div><div><pre><span style=3D"font-family:arial,sans-serif">Perhaps it wou=
ld be better to fix configure for the MSYS2 case so the flags or the renami=
ng are not required?
</span></pre>

</div><div>Best,<br></div><div>Howard<br></div></div></div>
</div>

--0000000000003c5cce05cbb43b83--

