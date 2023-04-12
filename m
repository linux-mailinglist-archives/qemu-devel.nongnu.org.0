Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB486DF4A8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:06:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZEX-0003Ga-Jm; Wed, 12 Apr 2023 08:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pmZEF-0003C4-Ea
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:05:36 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pmZED-00071W-AW
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:05:35 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a34d3812cso260558066b.2
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681301129; x=1683893129;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZirTmkRa0ZwPJVM+bn34VszAXhCQHMxnkAcSQjjwRC0=;
 b=QZpQXmJDjnaVYz3dv3C1y0SwdeZRt10ylS8JQgMsSO94WeLTa6VjUnktmwFS15dp/w
 U8ps9TTyd+WKTrEWhBiAmhDETanjiT7exRz36o5Wq00e1aOsbYj4eKvNqY5TQFNB29rF
 tEBzjn/J6hN6HEwKdvH9r2rgvETWgOSr20Iy791p+Iq1Hb8asJCjZ6s07dziVLOlj1o1
 x/t4mHoHMofQFXRHcxaioNOw4GkUFPmjxT/dZUBnp4Z/Ph5PjMgpFILkRG4hreKUShGf
 OuNR/qDYdWZZYbMq7dkWt7XAknyO+18W2lP9YmceLikXLRuCFGQHD9ipC9kjvt3qhVEU
 yZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681301129; x=1683893129;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZirTmkRa0ZwPJVM+bn34VszAXhCQHMxnkAcSQjjwRC0=;
 b=KsAofC93clu+doGDhQag46oepNiVfSvDOHEREFskuwbTZV8EpNAOSmOhs3ZB0nsGTF
 Keaip/I6AQmKv+Cp2BeCtYrLATvk9UG5d6ZlpMWjXQbIIac3F0C+P5Bt9/MUZZwq1mq5
 aKnlFgRb6ds38SPk//5y7b5825wRubyviFBAXfY9YQUex4QyIGCnenXbflLFO9xRA0z7
 8PvyQ7Ma1C1Dxdqobl6OmG/+s1CHvD+2aL677LbYll8UUaZEmkixWfcna4Fu8ENIIwNL
 t/Q4K4n1zYwwSac7ygXUr1a75Atlrq3iGZd/cObz+iXZng+19NOQt8/8AIFIV2OYUata
 IWfQ==
X-Gm-Message-State: AAQBX9f8SrIhZwvKTeaXRlmHK37jhGGubKJ9W2EPztK8MPnGqAiW5hg5
 0Sx/9KoNumohBTWO7aavWqzJR680egn0gMTe9zqhH97JegA=
X-Google-Smtp-Source: AKy350YvI1urvtfLxRoza50LD6B4KcJnN5fqJ0GCNKV3pitdMRvvdMSVt9WMjIs54deLxYfk2UYj/rI/Vucelig7K3U=
X-Received: by 2002:a50:9f46:0:b0:4fa:e5e0:9466 with SMTP id
 b64-20020a509f46000000b004fae5e09466mr1060578edf.7.1681301128536; Wed, 12 Apr
 2023 05:05:28 -0700 (PDT)
MIME-Version: 1.0
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 12 Apr 2023 14:05:14 +0200
Message-ID: <CABLmASEcJRNWRaFum_BKgwKu7cJ8BDM3W94W-ZZwFLFuEwkh7g@mail.gmail.com>
Subject: source fails to compile on msys2
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000086e64205f9226c43"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000086e64205f9226c43
Content-Type: text/plain; charset="UTF-8"

Hello,

It seems the current source fails to compile with up to date msys2.

Source is configured with:
./configure --target-list="ppc-softmmu" --enable-gtk --enable-sdl
--enable-slirp

FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
"c++" "-m64" "-mcx16" "-Iqga/vss-win32/qga-vss.dll.p" "-Iqga/vss-win32"
"-I../qga/vss-win32" "-I." "-Iqapi" "-Itrace" "-Iui" "-Iui/shader"
"-IC:/msys64/mingw64/include/glib-2.0"
"-IC:/msys64/mingw64/lib/glib-2.0/include" "-fdiagnostics-color=auto"
"-Wall" "-Winvalid-pch" "-Wnon-virtual-dtor" "-Werror" "-std=gnu++11" "-O2"
"-g" "-iquote" "." "-iquote" "C:/msys64/home/hsp/src/qemu-master-clean"
"-iquote" "C:/msys64/home/hsp/src/qemu-master-clean/include" "-iquote"
"C:/msys64/home/hsp/src/qemu-master-clean/tcg/i386" "-D__STDC_LIMIT_MACROS"
"-D__STDC_CONSTANT_MACROS" "-D__STDC_FORMAT_MACROS" "-U_FORTIFY_SOURCE"
"-D_FORTIFY_SOURCE=2" "-fno-pie" "-no-pie" "-D_GNU_SOURCE"
"-D_FILE_OFFSET_BITS=64" "-D_LARGEFILE_SOURCE" "-fno-strict-aliasing"
"-fno-common" "-fwrapv" "-Wundef" "-Wwrite-strings" "-Wtype-limits"
"-Wformat-security" "-Wformat-y2k" "-Winit-self" "-Wignored-qualifiers"
"-Wempty-body" "-Wendif-labels" "-Wexpansion-to-defined"
"-Wimplicit-fallthrough=2" "-Wmissing-format-attribute"
"-Wno-missing-include-dirs" "-Wno-shift-negative-value" "-Wno-psabi"
"-fstack-protector-strong" "-Wno-unknown-pragmas"
"-Wno-delete-non-virtual-dtor" "-Wno-non-virtual-dtor" -MD -MQ
qga/vss-win32/qga-vss.dll.p/install.cpp.obj -MF
"qga/vss-win32/qga-vss.dll.p/install.cpp.obj.d" -o
qga/vss-win32/qga-vss.dll.p/install.cpp.obj "-c"
../qga/vss-win32/install.cpp
In file included from C:/msys64/mingw64/lib/glib-2.0/include/glibconfig.h:9,
                 from C:/msys64/mingw64/include/glib-2.0/glib/gtypes.h:34,
                 from C:/msys64/mingw64/include/glib-2.0/glib/galloca.h:34,
                 from C:/msys64/mingw64/include/glib-2.0/glib.h:32,
                 from
C:/msys64/home/hsp/src/qemu-master-clean/include/glib-compat.h:32,
                 from
C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:144,
                 from ../qga/vss-win32/install.cpp:13:
C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: error: standard
attributes in middle of decl-specifiers
 1076 | # define G_NORETURN [[noreturn]]
      |                     ^
C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:240:8: note:
in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
      |        ^~~~~~~~~~
C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: note: standard
attributes must precede the decl-specifiers to apply to the declaration, or
follow them to apply to the type
 1076 | # define G_NORETURN [[noreturn]]
      |                     ^
C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:240:8: note:
in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
      |        ^~~~~~~~~~
C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: error: attribute
ignored [-Werror=attributes]
 1076 | # define G_NORETURN [[noreturn]]
      |                     ^
C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:240:8: note:
in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
      |        ^~~~~~~~~~
C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: note: an
attribute that appertains to a type-specifier is ignored
 1076 | # define G_NORETURN [[noreturn]]
      |                     ^
C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:240:8: note:
in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
      |        ^~~~~~~~~~
cc1plus.exe: all warnings being treated as errors

Best,
Howard

--00000000000086e64205f9226c43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>It seems the current =
source fails to compile with up to date msys2.</div><div><br></div><div>Sou=
rce is configured with:</div><div>./configure --target-list=3D&quot;ppc-sof=
tmmu&quot; --enable-gtk --enable-sdl --enable-slirp<br></div><div><br></div=
><div>FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj<br>&quot;c++&quot=
; &quot;-m64&quot; &quot;-mcx16&quot; &quot;-Iqga/vss-win32/qga-vss.dll.p&q=
uot; &quot;-Iqga/vss-win32&quot; &quot;-I../qga/vss-win32&quot; &quot;-I.&q=
uot; &quot;-Iqapi&quot; &quot;-Itrace&quot; &quot;-Iui&quot; &quot;-Iui/sha=
der&quot; &quot;-IC:/msys64/mingw64/include/glib-2.0&quot; &quot;-IC:/msys6=
4/mingw64/lib/glib-2.0/include&quot; &quot;-fdiagnostics-color=3Dauto&quot;=
 &quot;-Wall&quot; &quot;-Winvalid-pch&quot; &quot;-Wnon-virtual-dtor&quot;=
 &quot;-Werror&quot; &quot;-std=3Dgnu++11&quot; &quot;-O2&quot; &quot;-g&qu=
ot; &quot;-iquote&quot; &quot;.&quot; &quot;-iquote&quot; &quot;C:/msys64/h=
ome/hsp/src/qemu-master-clean&quot; &quot;-iquote&quot; &quot;C:/msys64/hom=
e/hsp/src/qemu-master-clean/include&quot; &quot;-iquote&quot; &quot;C:/msys=
64/home/hsp/src/qemu-master-clean/tcg/i386&quot; &quot;-D__STDC_LIMIT_MACRO=
S&quot; &quot;-D__STDC_CONSTANT_MACROS&quot; &quot;-D__STDC_FORMAT_MACROS&q=
uot; &quot;-U_FORTIFY_SOURCE&quot; &quot;-D_FORTIFY_SOURCE=3D2&quot; &quot;=
-fno-pie&quot; &quot;-no-pie&quot; &quot;-D_GNU_SOURCE&quot; &quot;-D_FILE_=
OFFSET_BITS=3D64&quot; &quot;-D_LARGEFILE_SOURCE&quot; &quot;-fno-strict-al=
iasing&quot; &quot;-fno-common&quot; &quot;-fwrapv&quot; &quot;-Wundef&quot=
; &quot;-Wwrite-strings&quot; &quot;-Wtype-limits&quot; &quot;-Wformat-secu=
rity&quot; &quot;-Wformat-y2k&quot; &quot;-Winit-self&quot; &quot;-Wignored=
-qualifiers&quot; &quot;-Wempty-body&quot; &quot;-Wendif-labels&quot; &quot=
;-Wexpansion-to-defined&quot; &quot;-Wimplicit-fallthrough=3D2&quot; &quot;=
-Wmissing-format-attribute&quot; &quot;-Wno-missing-include-dirs&quot; &quo=
t;-Wno-shift-negative-value&quot; &quot;-Wno-psabi&quot; &quot;-fstack-prot=
ector-strong&quot; &quot;-Wno-unknown-pragmas&quot; &quot;-Wno-delete-non-v=
irtual-dtor&quot; &quot;-Wno-non-virtual-dtor&quot; -MD -MQ qga/vss-win32/q=
ga-vss.dll.p/install.cpp.obj -MF &quot;qga/vss-win32/qga-vss.dll.p/install.=
cpp.obj.d&quot; -o qga/vss-win32/qga-vss.dll.p/install.cpp.obj &quot;-c&quo=
t; ../qga/vss-win32/install.cpp<br>In file included from C:/msys64/mingw64/=
lib/glib-2.0/include/glibconfig.h:9,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from C:/msys64/mingw64/include/glib-2.0/glib/gty=
pes.h:34,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from C:/msys64/mingw64/include/glib-2.0/glib/galloca.h:34,<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from C:/msys64/mingw64/inc=
lude/glib-2.0/glib.h:32,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from C:/msys64/home/hsp/src/qemu-master-clean/include/glib=
-compat.h:32,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:14=
4,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ..=
/qga/vss-win32/install.cpp:13:<br>C:/msys64/mingw64/include/glib-2.0/glib/g=
macros.h:1076:21: error: standard attributes in middle of decl-specifiers<b=
r>=C2=A01076 | # define G_NORETURN [[noreturn]]<br>=C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>=
C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:240:8: note: =
in expansion of macro &#39;G_NORETURN&#39;<br>=C2=A0 240 | extern G_NORETUR=
N<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~<br>C:/msy=
s64/mingw64/include/glib-2.0/glib/gmacros.h:1076:21: note: standard attribu=
tes must precede the decl-specifiers to apply to the declaration, or follow=
 them to apply to the type<br>=C2=A01076 | # define G_NORETURN [[noreturn]]=
<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ^<br>C:/msys64/home/hsp/src/qemu-master-clean/include=
/qemu/osdep.h:240:8: note: in expansion of macro &#39;G_NORETURN&#39;<br>=
=C2=A0 240 | extern G_NORETURN<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~<br>C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1=
076:21: error: attribute ignored [-Werror=3Dattributes]<br>=C2=A01076 | # d=
efine G_NORETURN [[noreturn]]<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>C:/msys64/home/hs=
p/src/qemu-master-clean/include/qemu/osdep.h:240:8: note: in expansion of m=
acro &#39;G_NORETURN&#39;<br>=C2=A0 240 | extern G_NORETURN<br>=C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~<br>C:/msys64/mingw64/inc=
lude/glib-2.0/glib/gmacros.h:1076:21: note: an attribute that appertains to=
 a type-specifier is ignored<br>=C2=A01076 | # define G_NORETURN [[noreturn=
]]<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>C:/msys64/home/hsp/src/qemu-master-clean/incl=
ude/qemu/osdep.h:240:8: note: in expansion of macro &#39;G_NORETURN&#39;<br=
>=C2=A0 240 | extern G_NORETURN<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~<br>cc1plus.exe: all warnings being treated as errors</=
div><div><br></div><div>Best,</div><div>Howard<br></div></div>

--00000000000086e64205f9226c43--

