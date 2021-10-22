Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B954375EA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 13:23:02 +0200 (CEST)
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdsdZ-0006GI-GD
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 07:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olagarde@gmail.com>)
 id 1mdsbU-0005CD-3X
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 07:20:52 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <olagarde@gmail.com>)
 id 1mdsbS-0005qd-80
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 07:20:51 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so3981607otb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ykhykSyI1gxdXnuFqJ+uVFlD6FDaXmeBm/p1T+cmtEg=;
 b=hvFZjjQvHZHR4HsCLNBdA+EM/4yVx+/YZFcbmA8rGrlC21gyuDkZGhaz2K3spFJeC/
 S70XjLrOCyavqu40FoqQ1hMsoe8vXhLX+fORt6QMitQQnZm80dG7dmyaMv+TiidM/GhR
 lEm0fXSVOAUG/5Uz9B7+gJMi2R6H+5/nQGFjaeEuJ6+qZQ6V8apZcPWMICYZ1MCHNGXZ
 cZ+5pxVB/MRFlYkg4nrgKaJuxDtoF2vhNRtuCIurwhMJlpYzrlhv2CFInA4U5m17c+b/
 m1Y9UmigFKD1r9ZY/n8SiaTiLGUkA8n09JzfOiLnWc+yH5d0UER6GHxg7zHiw8UJ1NbC
 WxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ykhykSyI1gxdXnuFqJ+uVFlD6FDaXmeBm/p1T+cmtEg=;
 b=Udes9RY4KGCXmtVeT/khKq9DB2hV3SfGxDMaLNd3Wpv2T0isG51Q6rpIQAiotPWFY6
 kObIzhUGsBHtmMhtI0kDNjs5SdCQrngfGfW6jnXO7rke2SgpLScGOIKgCiZSK+H5zXkM
 e+49R6KcwLXmXLIUXLHIUYEfQwi9CkWUA5gtIKQB19SSvHoXt+6HFIvOUe7tTxYv+V6J
 GAtSOnKyOZwnn7Q3tv3TcDOYY9k/iLz/4QPjVQTdBYoj70f16oxDMXEyAg9XC+DL+smM
 82PAST0Kwvz8oT6Z/qLs67ENghD9TpTyl2Zi00kufgnFNQznnyHUHF3M3E4gcSpP1hrt
 WKrQ==
X-Gm-Message-State: AOAM533mZkvkU92Fr40fLeVIcmtxKZ7rLkRKj1HTprSUgu/jqT4HuJMQ
 7mqCLYf1UWsQTC8ypRQQ/mKKM5wRclW4DbZlOroorT7Ds8o=
X-Google-Smtp-Source: ABdhPJy9NbHgrTwUVjeg65YyANmdaAMUy2XgdOQ/yYfycLcbxZeZLBDKIOjC3pVyB1MJe3PCvzru4MRD95yJOIfR8vM=
X-Received: by 2002:a9d:448:: with SMTP id 66mr10068452otc.136.1634901648414; 
 Fri, 22 Oct 2021 04:20:48 -0700 (PDT)
MIME-Version: 1.0
From: Owen LaGarde <olagarde@gmail.com>
Date: Fri, 22 Oct 2021 07:20:37 -0400
Message-ID: <CACDcNnWWbzkH5-h6=BoXdA92DyVfTD7Kp=Spoz62yXw5t+tLGw@mail.gmail.com>
Subject: configure --extra-cflags and --extra-ldflags values not propagating
 to meson?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ff1ab505ceef3324"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=olagarde@gmail.com; helo=mail-ot1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff1ab505ceef3324
Content-Type: text/plain; charset="UTF-8"

Am I using --extra-cflags and --extra-ldflags wrong in the configure call?

I'd like to source build several pre-reqs specific to supporting the qemu
source
build.  I'd specifically not like to install neither the qemu or re-req
builds
at the system level.  Normally I'd expect the --extra-cflags and
--extra-ldflags
configure options to do this but they do not appear to propagate to meson.
There
was an approved meson patch back in 2018 for extra-cflags / extra-ldflags
and qemu
is currently using meson >5.8(?) but it doesn't look like configure is
adding the
args anywhere in the build tree.  There are a number of ways to do this,
what's
appropriate / future-proof wrt building qemu from source?  And why is
configure
supporting --extra-[c,ld]args but not doing anything with the values?

---------

As an example assume I've installed lzfse from source with a homedir
prefix, no
other copies elsewhere, no ldconfig reference, no associated env vars, and
force
the qemu build to require it.  Yeah, but this is just an dumb example.

    $ ls -l ~/include/* ~/lib/*
    /home/olagarde/include/lzfse.h
    /home/olagarde/lib/liblzfse.so

    $ env |grep -i flags

    $ set |grep -i flags

        local flags_color="$c_lblue";
            s="$flags_color$s";

    $ git clone https://gitlab.com/qemu-project/qemu.git

        <...snipsnip...>

    $ mkdir qemu/build && cd qemu/build

    $ ../configure --prefix=/home/olagarde \
        --extra-cflags="-I /home/olagarde/include" \
        --extra-ldflags="-L /home/olagarde/lib" \
        --enable-lzfse

        <...snipsnip...>
        ../meson.build:898:2: ERROR: C header 'lzfse.h' not found
        A full log can be found at {a_really_long_path}meson-log.txt
        ERROR: meson setup failed

Per the meson logs the command was

    cc -m64 -mcx16 {a_really_long_path}testfile.c -E -P \
        -D_FILE_OFFSET_BITS=64 -P -O0 -std=gnu11

and the testfile.c was

    #ifdef __has_include
     #if !__has_include("lzfse.h")
      #error "Header 'lzfse.h' could not be found"
     #endif
    #else
     #include <lzfse.h>
    #endif

which obviously should fail exactly as it did, but should and does succeed
if the --extra-cflags value is added to the cc call.

All four args arrays in the config-meson.cross are empty so configure
didn't pass the cli extra-args in?  Also 'find' doesn't report any files
in the tree containing /home/olagarde/include or /home/olagarde/lib, so
the option values passed to configure never made it into mesa (or anything
else)?

--000000000000ff1ab505ceef3324
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Am I using --extra-cflags and --extra-ldflags wrong in the=
 configure call?<br><br>I&#39;d like to source build several pre-reqs speci=
fic to supporting the qemu source<br>build.=C2=A0 I&#39;d specifically not =
like to install neither the qemu or re-req builds<br>at the system level.=
=C2=A0 Normally I&#39;d expect the --extra-cflags and --extra-ldflags<br>co=
nfigure options to do this but they do not appear to propagate to meson.=C2=
=A0 There<br>was an approved meson patch back in 2018 for extra-cflags / ex=
tra-ldflags and qemu<br>is currently using meson &gt;5.8(?) but it doesn&#3=
9;t look like configure is adding the<br>args anywhere in the build tree.=
=C2=A0 There are a number of ways to do this, what&#39;s<br>appropriate / f=
uture-proof wrt building qemu from source?=C2=A0 And why is configure<br>su=
pporting --extra-[c,ld]args but not doing anything with the values?<br><div=
><br></div><div>---------</div><div><br></div>As an example assume I&#39;ve=
 installed lzfse from source with a homedir prefix, no<br>other copies else=
where, no ldconfig reference, no associated env vars, and force<br>the qemu=
 build to require it.=C2=A0 Yeah, but this is just an dumb example.<br><br>=
=C2=A0 =C2=A0 $ ls -l ~/include/* ~/lib/*<br>=C2=A0 =C2=A0 /home/olagarde/i=
nclude/lzfse.h<br>=C2=A0 =C2=A0 /home/olagarde/lib/liblzfse.so<br><br>=C2=
=A0 =C2=A0 $ env |grep -i flags<br><br>=C2=A0 =C2=A0 $ set |grep -i flags<b=
r><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 local flags_color=3D&quot;$c_lblue&quot;;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=3D&quot;$flags_color$s&quot=
;;<br><br>=C2=A0 =C2=A0 $ git clone <a href=3D"https://gitlab.com/qemu-proj=
ect/qemu.git">https://gitlab.com/qemu-project/qemu.git</a><br><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &lt;...snipsnip...&gt;<br><br>=C2=A0 =C2=A0 $ mkdir qe=
mu/build &amp;&amp; cd qemu/build<br><br>=C2=A0 =C2=A0 $ ../configure --pre=
fix=3D/home/olagarde \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --extra-cflags=3D&quo=
t;-I /home/olagarde/include&quot; \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --extra-=
ldflags=3D&quot;-L /home/olagarde/lib&quot; \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --enable-lzfse<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;...snipsnip...&gt=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../meson.build:898:2: ERROR: C header &#39=
;lzfse.h&#39; not found<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 A full log can be fo=
und at {a_really_long_path}meson-log.txt<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR=
OR: meson setup failed<br><br>Per the meson logs the command was<br><br>=C2=
=A0 =C2=A0 cc -m64 -mcx16 {a_really_long_path}testfile.c -E -P \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -D_FILE_OFFSET_BITS=3D64 -P -O0 -std=3Dgnu11<br><br>an=
d the testfile.c was<br><br>=C2=A0 =C2=A0 #ifdef __has_include<br>=C2=A0 =
=C2=A0 =C2=A0#if !__has_include(&quot;lzfse.h&quot;)<br>=C2=A0 =C2=A0 =C2=
=A0 #error &quot;Header &#39;lzfse.h&#39; could not be found&quot;<br>=C2=
=A0 =C2=A0 =C2=A0#endif<br>=C2=A0 =C2=A0 #else<br>=C2=A0 =C2=A0 =C2=A0#incl=
ude &lt;lzfse.h&gt;<br>=C2=A0 =C2=A0 #endif<br><br>which obviously should f=
ail exactly as it did, but should and does succeed<br>if the --extra-cflags=
 value is added to the cc call.<br><br>All four args arrays in the config-m=
eson.cross are empty so configure<br>didn&#39;t pass the cli extra-args in?=
=C2=A0 Also &#39;find&#39; doesn&#39;t report any files<br>in the tree cont=
aining /home/olagarde/include or /home/olagarde/lib, so<br>the option value=
s passed to configure never made it into mesa (or anything<br>else)?<br></d=
iv>

--000000000000ff1ab505ceef3324--

