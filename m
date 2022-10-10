Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F85FA27D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:12:09 +0200 (CEST)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwJz-0000w2-T8
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ohwAF-00035o-MF
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:02:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ohwAB-0000QC-Uh
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:02:03 -0400
Received: by mail-ed1-x536.google.com with SMTP id e18so16775030edj.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b5D/3hUSdUk+e2F7x6m6s6mm6R0d++zHu0j9CncAt9M=;
 b=4u4EPCBuH1wG+Ak/TPUMIy3obsg1gXvO2SSPteQJiM/6JCGVlijcig0iSWULk8LHFS
 Yf0IxV/bOIBJ4oxdJSBVrDLFgHNyiG1geAvekx3+qIF6rwtSC4iOSU4B9hMoHMLD0j2b
 Sxno2t1Mm1x65EmosSLrtXvCsfW3ntUTeE3X24kZ1xJ57LqWcDz5O4BoNCbVX6SZtnuN
 Z0iM1YTZz2r5DPx6myfACVkw5U1/di8hDEJMnE8/0os1lrI0ZT2hz7HrYUL1ZxtR7jXA
 Tiao0jcAGsl4pAEk44tDnYHH52XWmAByjnAeOJQL0ILbaQC3ZCTzQfR5TVQXd/czoTaC
 91pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b5D/3hUSdUk+e2F7x6m6s6mm6R0d++zHu0j9CncAt9M=;
 b=LHUv+3HVIxM9ibP8Pk7Mq08OQdajQtIiWs7d6BemzIYNL8eiz8/fgvyvLQnWzvfpOK
 t52q/F3M3ZXKta+kemdbiqNsUPtZk3vt9i2gsGkfAj5CwDkQFG6DD8ADawjqsWnKKGOt
 lgGA8QvT9hEsgqTGCF/5LLam2zoTYDGqcjEXPgfOrW2pNfYopvM9YYwJNn03LMOtI5OS
 xfdtlogFrtNyxkJjf2f4GqVu+4SHOnqD0a4oOOTIAz99vUsWBzKKcfoS6q2CtxJyrliu
 HrRb0PO5EnMCuBsJ9ExRLNsAsPQzQBddEPFZ42Xsw/hWSN09XQGebp15mhSB/NYacHVR
 2Nog==
X-Gm-Message-State: ACrzQf0DqwgjMKWK+RABsUuA295ePrm7YrFD9vz90OYHKj+rs3/yB/+Q
 qxLxgYOOGF+g5gEv1hnIXibDPdb4j4vUob6mofNrYw==
X-Google-Smtp-Source: AMsMyM6+i4PmAOYqDG86xkSkfNTrEDBUMYL6SYrkiVumdZowDv2ovTzLWwPa516GityW67q4OEogoryUiyNK4jWZP/A=
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr18574740edb.241.1665421317149; Mon, 10
 Oct 2022 10:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <af7a54fd-8194-a7fc-cfed-0c8e0cf101a0@blastwave.org>
 <d7faf945-401b-b848-c32a-732e031c1a0a@redhat.com>
In-Reply-To: <d7faf945-401b-b848-c32a-732e031c1a0a@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 10 Oct 2022 11:01:46 -0600
Message-ID: <CANCZdfpAbisbStaXfL=tqMUoCB=E-jcGCSQCEgtrSi5OmUgVfg@mail.gmail.com>
Subject: Re: FAILED: libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
To: Thomas Huth <thuth@redhat.com>
Cc: Dennis Clarke <dclarke@blastwave.org>, qemu-devel@nongnu.org, 
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000002b28605eab11e8b"
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000002b28605eab11e8b
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 10, 2022 at 1:13 AM Thomas Huth <thuth@redhat.com> wrote:

> On 10/10/2022 08.18, Dennis Clarke wrote:
> >
> > On FreeBSD 14.0 CURRENT amd64 everything seems to go swimmingly until :
> >
> > [5679/6848] Compiling C object
> libqemu-arm-bsd-user.fa.p/bsd-user_mmap.c.o
> > [5680/6848] Compiling C object
> libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
> > FAILED: libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
> > /usr/bin/cc -m64 -mcx16 -Ilibqemu-arm-bsd-user.fa.p -I. -I..
> -Itarget/arm
> > -I../target/arm -I../common-user/host/x86_64 -I../bsd-user/include
> > -Ibsd-user/freebsd -I../bsd-user/freebsd -I../bsd-user/host/x86_64
> > -Ibsd-user -I../bsd-user -I../bsd-user/arm -Iqapi -Itrace -Iui
> -Iui/shader
> > -I/usr/local/include -I/usr/local/include/glib-2.0
> > -I/usr/local/lib/glib-2.0/include -fcolor-diagnostics -Wall
> -Winvalid-pch
> > -std=gnu11 -O0 -g -iquote . -iquote /opt/bw/build/qemu -iquote
> > /opt/bw/build/qemu/include -iquote /opt/bw/build/qemu/tcg/i386 -pthread
> > -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> -Wstrict-prototypes
> > -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> > -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
> > -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> > -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
> > -Wexpansion-to-defined -Wno-initializer-overrides
> -Wno-missing-include-dirs
> > -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition
> > -Wno-tautological-type-limit-compare -Wno-psabi
> > -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong -m64 -g
> -O0
> > -fno-builtin -fPIE -DNEED_CPU_H
> > '-DCONFIG_TARGET="arm-bsd-user-config-target.h"'
> > '-DCONFIG_DEVICES="arm-bsd-user-config-devices.h"' -MD -MQ
> > libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -MF
> > libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o.d -o
> > libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -c ../bsd-user/signal.c
> > In file included from ../bsd-user/signal.c:27:
> > In file included from ../bsd-user/host/x86_64/host-signal.h:14:
> > In file included from /usr/include/vm/pmap.h:92:
> > /usr/include/machine/pmap.h:452:2: error: fields must have a constant
> size:
> > 'variable length array in structure' extension will never be supported
> >          PV_CHUNK_HEADER
> >          ^
> > /usr/include/machine/pmap.h:448:12: note: expanded from macro
> 'PV_CHUNK_HEADER'
> >          uint64_t                pc_map[_NPCM];  /* bitmap; 1 = free */
> \
> >                                  ^
> > /usr/include/machine/pmap.h:456:2: error: fields must have a constant
> size:
> > 'variable length array in structure' extension will never be supported
> >          PV_CHUNK_HEADER
> >          ^
> > /usr/include/machine/pmap.h:448:12: note: expanded from macro
> 'PV_CHUNK_HEADER'
> >          uint64_t                pc_map[_NPCM];  /* bitmap; 1 = free */
> \
> >                                  ^
> > 2 errors generated.
> > ninja: build stopped: subcommand failed.
> > gmake[1]: *** [Makefile:165: run-ninja] Error 1
> > gmake[1]: Leaving directory '/opt/bw/build/qemu/build'
> > gmake: *** [GNUmakefile:11: all] Error 2
> >
> > phobos#
> >
> > Is there a trivial patch ?  Or perhaps try again using GCC and not
> LLVM/Clang?
>
> I'm not using FreeBSD, so no real clue, but this pretty much sounds like
> _NPCM is not properly defined by your system headers anymore, so I assume
> this is a problem on the FreeBSD side ... I'd suggest to report it on the
> FreeBSD mailing list.
>

Actually, it is properly defined. The real problem is that it depends on
howmany, which is defined
in sys/param.h, which isn't included in sys/_pv_entry.h, leading to the
problem. This makes it look
like a variable length array which compilers hate in this context.

diff --git a/bsd-user/host/x86_64/host-signal.h
b/bsd-user/host/x86_64/host-signal.h
index 47ca19f8814..32ac4e41803 100644
--- a/bsd-user/host/x86_64/host-signal.h
+++ b/bsd-user/host/x86_64/host-signal.h
@@ -9,6 +9,7 @@
 #ifndef X86_64_HOST_SIGNAL_H
 #define X86_64_HOST_SIGNAL_H

+#include <sys/param.h>
 #include <sys/ucontext.h>
 #include <machine/trap.h>
 #include <vm/pmap.h>

fixes it. It's unclear to me if this should be added to sys/_pv_entry.h
(this was just committed to
FreeBSD in the last week), or if I need to upstream this patch.

Warner

--00000000000002b28605eab11e8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 10, 2022 at 1:13 AM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/10/202=
2 08.18, Dennis Clarke wrote:<br>
&gt; <br>
&gt; On FreeBSD 14.0 CURRENT amd64 everything seems to go swimmingly until =
:<br>
&gt; <br>
&gt; [5679/6848] Compiling C object libqemu-arm-bsd-user.fa.p/bsd-user_mmap=
.c.o<br>
&gt; [5680/6848] Compiling C object libqemu-arm-bsd-user.fa.p/bsd-user_sign=
al.c.o<br>
&gt; FAILED: libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o<br>
&gt; /usr/bin/cc -m64 -mcx16 -Ilibqemu-arm-bsd-user.fa.p -I. -I.. -Itarget/=
arm <br>
&gt; -I../target/arm -I../common-user/host/x86_64 -I../bsd-user/include <br=
>
&gt; -Ibsd-user/freebsd -I../bsd-user/freebsd -I../bsd-user/host/x86_64 <br=
>
&gt; -Ibsd-user -I../bsd-user -I../bsd-user/arm -Iqapi -Itrace -Iui -Iui/sh=
ader <br>
&gt; -I/usr/local/include -I/usr/local/include/glib-2.0 <br>
&gt; -I/usr/local/lib/glib-2.0/include -fcolor-diagnostics -Wall -Winvalid-=
pch <br>
&gt; -std=3Dgnu11 -O0 -g -iquote . -iquote /opt/bw/build/qemu -iquote <br>
&gt; /opt/bw/build/qemu/include -iquote /opt/bw/build/qemu/tcg/i386 -pthrea=
d <br>
&gt; -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-pr=
ototypes <br>
&gt; -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes <br>
&gt; -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition <br>
&gt; -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self <br>
&gt; -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels <br>
&gt; -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-include=
-dirs <br>
&gt; -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefiniti=
on <br>
&gt; -Wno-tautological-type-limit-compare -Wno-psabi <br>
&gt; -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong -m64 =
-g -O0 <br>
&gt; -fno-builtin -fPIE -DNEED_CPU_H <br>
&gt; &#39;-DCONFIG_TARGET=3D&quot;arm-bsd-user-config-target.h&quot;&#39; <=
br>
&gt; &#39;-DCONFIG_DEVICES=3D&quot;arm-bsd-user-config-devices.h&quot;&#39;=
 -MD -MQ <br>
&gt; libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -MF <br>
&gt; libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o.d -o <br>
&gt; libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -c ../bsd-user/signal.c<=
br>
&gt; In file included from ../bsd-user/signal.c:27:<br>
&gt; In file included from ../bsd-user/host/x86_64/host-signal.h:14:<br>
&gt; In file included from /usr/include/vm/pmap.h:92:<br>
&gt; /usr/include/machine/pmap.h:452:2: error: fields must have a constant =
size: <br>
&gt; &#39;variable length array in structure&#39; extension will never be s=
upported<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PV_CHUNK_HEADER<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; /usr/include/machine/pmap.h:448:12: note: expanded from macro &#39;PV_=
CHUNK_HEADER&#39;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pc_map[_NPCM];=C2=A0 /* bitmap; 1 =3D free */=C2=A0 \<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; /usr/include/machine/pmap.h:456:2: error: fields must have a constant =
size: <br>
&gt; &#39;variable length array in structure&#39; extension will never be s=
upported<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PV_CHUNK_HEADER<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; /usr/include/machine/pmap.h:448:12: note: expanded from macro &#39;PV_=
CHUNK_HEADER&#39;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pc_map[_NPCM];=C2=A0 /* bitmap; 1 =3D free */=C2=A0 \<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; 2 errors generated.<br>
&gt; ninja: build stopped: subcommand failed.<br>
&gt; gmake[1]: *** [Makefile:165: run-ninja] Error 1<br>
&gt; gmake[1]: Leaving directory &#39;/opt/bw/build/qemu/build&#39;<br>
&gt; gmake: *** [GNUmakefile:11: all] Error 2<br>
&gt; <br>
&gt; phobos#<br>
&gt; <br>
&gt; Is there a trivial patch ?=C2=A0 Or perhaps try again using GCC and no=
t LLVM/Clang?<br>
<br>
I&#39;m not using FreeBSD, so no real clue, but this pretty much sounds lik=
e <br>
_NPCM is not properly defined by your system headers anymore, so I assume <=
br>
this is a problem on the FreeBSD side ... I&#39;d suggest to report it on t=
he <br>
FreeBSD mailing list.<br></blockquote><div><br></div><div>Actually, it is p=
roperly defined. The real problem is that it depends on howmany, which is d=
efined</div><div>in sys/param.h, which isn&#39;t included in sys/_pv_entry.=
h, leading to the problem. This makes it look</div><div>like a variable len=
gth array which compilers hate in this context.</div><div><br></div>diff --=
git a/bsd-user/host/x86_64/host-signal.h b/bsd-user/host/x86_64/host-signal=
.h<br>index 47ca19f8814..32ac4e41803 100644<br>--- a/bsd-user/host/x86_64/h=
ost-signal.h<br>+++ b/bsd-user/host/x86_64/host-signal.h<br>@@ -9,6 +9,7 @@=
<br>=C2=A0#ifndef X86_64_HOST_SIGNAL_H<br>=C2=A0#define X86_64_HOST_SIGNAL_=
H<br><br>+#include &lt;sys/param.h&gt;<br>=C2=A0#include &lt;sys/ucontext.h=
&gt;<br>=C2=A0#include &lt;machine/trap.h&gt;<br><div>=C2=A0#include &lt;vm=
/pmap.h&gt;</div><div><br></div><div>fixes it. It&#39;s unclear to me if th=
is should be added to sys/_pv_entry.h (this was just committed to</div><div=
>FreeBSD in the last week), or if I need to upstream this patch.</div><div>=
<br></div><div>Warner</div></div></div>

--00000000000002b28605eab11e8b--

