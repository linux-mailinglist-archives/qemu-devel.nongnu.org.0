Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF23A0530
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:37:00 +0200 (CEST)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiT6-00056L-2T
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqiSI-0004MV-Ia
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:36:10 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqiSG-0006oP-IS
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:36:10 -0400
Received: by mail-ed1-x534.google.com with SMTP id s6so26042223edu.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mRMbcgEkrVlWgn/EHSYgKjxSkDzL+RBD82gZD8gP/+I=;
 b=u1L4qB2RHMKYCwngiT8DCc/VwEqjgqBRwbrVcrZiE7rt/QDDNAFiuYPCx0ae5lnOgh
 iJifLtBqUoiNB/nr1DjP7A1K9Lsgbc8au5alPONjKQvO4IpYtB6rS4/PpyAoWLMSbBhH
 vpdSN0Cq4LmDGoWGj4PGNsjj6a3ayi0Fcn3CqT8vJJTapOL4eyb1uy1wyBMWycgmk9wQ
 w4Mpsdwdgk5Wrt6VOylgn9A2KSzPQxPD8SS1DwELMqdbdgVPXJWOL/rRDsQYZPyYzqLw
 ydxRBwysy45O436CSuXMVpdjzRJbHYBl1+Gd/JYAz3wDn8bKuuwF2m7L3IjDHpjFfrsI
 54UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mRMbcgEkrVlWgn/EHSYgKjxSkDzL+RBD82gZD8gP/+I=;
 b=gwjCG69mG9+OdQmi55Yzv2w5UxwPqwLbKGyaT66r1MGiNnPSx4BR+H0EFCGcGjvEf7
 fghakFc95Dw7R7jdX1zoa0o2At8MOan5Bh6UQ7bTPLohurQaoyuppPyMWE1h44Pkat9P
 wpU1cDX/mNpWUDCdJCC7MNh7ip5zD11F3rP1h/x2gnTWHMTcEbxFFCHPH6fboaTtIy9D
 8Fy3CUSsLKH2zvlFUMg9nO+RWI+CvYPceXJIsRHqRGy5NCSaJHcKv/L0LSNaMjrcgzJY
 CGgz+2m40Jsz29wgUNvhxDG8G6VTHelqfuypNkP/mZzq77E3r6Uk2AEesNZpazEWgG8x
 iWNA==
X-Gm-Message-State: AOAM533Q/FFZzV+vCFjWdN4NxifIjrUD6F30GKHztYLra01pZxqkfLx4
 4saTYXhhY/OR4tfdf1nB96F3ryoG4AGLFW6zkZg=
X-Google-Smtp-Source: ABdhPJxcG04UVpx70qE4GhkRrncWF/4hlfK5DpyuI36h1iFWx191Sx8cjDtcseRceYcIBIOP+Rq2MgYMxzmVwrGJkUo=
X-Received: by 2002:aa7:ca1a:: with SMTP id y26mr27162807eds.314.1623184565723; 
 Tue, 08 Jun 2021 13:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
 <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
 <CAFEAcA_kTthg=Y3152r4+eN=iunZy3vGq9J9vFKTog1rmsHsfA@mail.gmail.com>
In-Reply-To: <CAFEAcA_kTthg=Y3152r4+eN=iunZy3vGq9J9vFKTog1rmsHsfA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Jun 2021 00:35:53 +0400
Message-ID: <CAJ+F1C+H7aw+_2+FspPv0nLtfbM=anBrhCaBWVYVhP6o8nqSDg@mail.gmail.com>
Subject: Re: [PULL 0/2] Libslirp patches
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000071e75e05c4471bd1"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000071e75e05c4471bd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jun 8, 2021 at 8:55 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 8 Jun 2021 at 16:55, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Mon, Jun 7, 2021 at 4:17 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
> >> >> clang sanitizer build: link failure:
> >> >> subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In
> >> >> function `arp_table_add':
> >> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> >> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> >> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> >> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:34:
> >> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:34:
> >> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >> >> (and lots more similar)
> >>
> >> > I don't get this  when running make vm-build-netbsd. What else am I
> missing?
> >>
> >>
> >> This isn't NetBSD related, it's just a clang sanitizer build on Linux.
> >
> >
> >
> > I am running configure with '--enable-sanitizers' --cc=3Dclang
> --cxx=3Dclang++ --host-cc=3Dclang, I can't reproduce.
> >
> > What's your distro? (or meson + clang versions)
>
> Ubuntu 18.04.5 LTS (bionic); configure arguments
> '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
> '--extra-cflags=3D-fsanitize=3Dundefined  -fno-sanitize=3Dshift-base
> -Werror'
> clang version 6.0.0-1ubuntu2


Per subproject `default_library` was added in 0.54, and we require 0.55.3.
Why is it trying to build libslirp.so?

I tried to make vm-build-ubuntu.i386 with the following changes:

 diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 47681b6f87..21d0b64eb1 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -18,7 +18,7 @@ import ubuntuvm
 DEFAULT_CONFIG =3D {
     'install_cmds' : "apt-get update,"\
                      "apt-get build-dep -y qemu,"\
-                     "apt-get install -y libfdt-dev language-pack-en
ninja-build",
+                     "apt-get install -y libfdt-dev language-pack-en
ninja-build clang",
 }

 class UbuntuX86VM(ubuntuvm.UbuntuVM):
@@ -32,7 +32,7 @@ class UbuntuX86VM(ubuntuvm.UbuntuVM):
         cd $(mktemp -d);
         sudo chmod a+r /dev/vdb;
         tar -xf /dev/vdb;
-        ./configure {configure_opts};
+        ./configure {configure_opts} --cc=3Dclang --cxx=3Dclang++
--host-cc=3Dclang --extra-cflags=3D'-fsanitize=3Dundefined
 -fno-sanitize=3Dshift-base -Werror';
         make --output-sync {target} -j{jobs} {verbose};
     """

(or with EXTRA_CONFIGURE_OPTS)

And it failed with:

[2363/9207] Linking target qemu-system-aarch64
FAILED: qemu-system-aarch64
clang++ @qemu-system-aarch64.rsp
libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
`helper_atomic_cmpxchgq_le_mmu':
/tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:86: undefined
reference to `__atomic_compare_exchange_8'
libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
`helper_atomic_xchgq_le_mmu':
/tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:134: undefined
reference to `__atomic_exchange_8'
libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
`helper_atomic_fetch_addq_le_mmu':

Any idea what I am missing?

thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000071e75e05c4471bd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 8, 2021 at 8:55 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank"=
>peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, 8 Jun 2021 at 16:55, Marc-Andr=C3=A9 Lurea=
u<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Mon, Jun 7, 2021 at 4:17 PM Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; w=
rote:<br>
<br>
&gt;&gt; &gt;&gt; clang sanitizer build: link failure:<br>
&gt;&gt; &gt;&gt; subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.=
o: In<br>
&gt;&gt; &gt;&gt; function `arp_table_add&#39;:<br>
&gt;&gt; &gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../s=
ubprojects/libslirp/src/arp_table.c:51:<br>
&gt;&gt; &gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#=
39;<br>
&gt;&gt; &gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../s=
ubprojects/libslirp/src/arp_table.c:51:<br>
&gt;&gt; &gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#=
39;<br>
&gt;&gt; &gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../s=
ubprojects/libslirp/src/arp_table.c:51:<br>
&gt;&gt; &gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#=
39;<br>
&gt;&gt; &gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../s=
ubprojects/libslirp/src/arp_table.c:34:<br>
&gt;&gt; &gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#=
39;<br>
&gt;&gt; &gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../s=
ubprojects/libslirp/src/arp_table.c:34:<br>
&gt;&gt; &gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#=
39;<br>
&gt;&gt; &gt;&gt; (and lots more similar)<br>
&gt;&gt;<br>
&gt;&gt; &gt; I don&#39;t get this=C2=A0 when running make vm-build-netbsd.=
 What else am I missing?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; This isn&#39;t NetBSD related, it&#39;s just a clang sanitizer bui=
ld on Linux.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I am running configure with &#39;--enable-sanitizers&#39; --cc=3Dclang=
 --cxx=3Dclang++ --host-cc=3Dclang, I can&#39;t reproduce.<br>
&gt;<br>
&gt; What&#39;s your distro? (or meson + clang versions)<br>
<br>
Ubuntu 18.04.5 LTS (bionic); configure arguments<br>
&#39;--cc=3Dclang&#39; &#39;--cxx=3Dclang++&#39; &#39;--enable-gtk&#39;<br>
&#39;--extra-cflags=3D-fsanitize=3Dundefined=C2=A0 -fno-sanitize=3Dshift-ba=
se<br>
-Werror&#39;<br>
clang version 6.0.0-1ubuntu2</blockquote><div><br></div><div>Per subproject=
 `default_library` was added in 0.54, and we require 0.55.3. Why is it tryi=
ng to build libslirp.so?</div><div><br></div><div>I tried to make vm-build-=
ubuntu.i386 with the following changes:</div><div><br></div><div>=C2=A0diff=
 --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386<br>index 47681b6f87..2=
1d0b64eb1 100755<br>--- a/tests/vm/ubuntu.i386<br>+++ b/tests/vm/ubuntu.i38=
6<br>@@ -18,7 +18,7 @@ import ubuntuvm<br>=C2=A0DEFAULT_CONFIG =3D {<br>=C2=
=A0 =C2=A0 =C2=A0&#39;install_cmds&#39; : &quot;apt-get update,&quot;\<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;apt-get build-dep -y qemu,&quot;\<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apt-get install -y libf=
dt-dev language-pack-en ninja-build&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apt-get install -y libfdt-=
dev language-pack-en ninja-build clang&quot;,<br>=C2=A0}<br>=C2=A0<br>=C2=
=A0class UbuntuX86VM(ubuntuvm.UbuntuVM):<br>@@ -32,7 +32,7 @@ class UbuntuX=
86VM(ubuntuvm.UbuntuVM):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(mktemp -=
d);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sudo chmod a+r /dev/vdb;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xf /dev/vdb;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0./configure {configure_opts};<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0./configur=
e {configure_opts} --cc=3Dclang --cxx=3Dclang++ --host-cc=3Dclang --extra-c=
flags=3D&#39;-fsanitize=3Dundefined =C2=A0-fno-sanitize=3Dshift-base -Werro=
r&#39;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make --output-sync {target} -j=
{jobs} {verbose};<br>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div><div><br><=
/div><div>(or with EXTRA_CONFIGURE_OPTS)</div><div><br></div><div>And it fa=
iled with:</div><div><br></div><div>[2363/9207] Linking target qemu-system-=
aarch64<br>FAILED: qemu-system-aarch64 <br>clang++ @qemu-system-aarch64.rsp=
<br>libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function `helper_=
atomic_cmpxchgq_le_mmu&#39;:<br>/tmp/tmp.VkWONZ62bA/build/../accel/tcg/atom=
ic_template.h:86: undefined reference to `__atomic_compare_exchange_8&#39;<=
br>libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function `helper_a=
tomic_xchgq_le_mmu&#39;:<br>/tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_t=
emplate.h:134: undefined reference to `__atomic_exchange_8&#39;<br>libqemu-=
aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function `helper_atomic_fetch=
_addq_le_mmu&#39;:<br></div><div><br></div></div><div>Any idea what I am mi=
ssing?</div><div><br></div><div>thanks</div><div><br></div><div>-- <br><div=
 dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--00000000000071e75e05c4471bd1--

