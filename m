Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365F4AF9EB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:26:06 +0100 (CET)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrfJ-0003TV-Ik
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHrbD-0000G9-Ko
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:21:51 -0500
Received: from [2a00:1450:4864:20::130] (port=34386
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHrbA-0008Sb-2s
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:21:50 -0500
Received: by mail-lf1-x130.google.com with SMTP id o2so5894479lfd.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 10:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9YZFNuVSfP55sMvOG8YitDULyu/i82jfQAMD2jlO7Ys=;
 b=goHUXntu2bim3eWsSSQpsjGgwlsL1O5SEJp+hGg7psMPFYeMbPmKKaUXg5ZB6+4DqM
 YhcRY2zLF3T7KwpLGxgXpG7lx1E3k6s9q4caU0JysxM9d80cpdg5PJ7ZHRzI2ZPSR0iJ
 Ri2EG++wQ3pC0XUPB6qV8vBkxsdzwQ9cwJwVtQX8x6IKxo1jWbGtww5khpF7FY88ffmv
 hu8j6qbo0me20iCXSW438AK6qwoSh/N9apNThmvE+Ort32G1LliJYBOyu/di/qmOmO0F
 x9Qi3PFBMreMdEq9UFzqugjHGUE0/opmgvw806/wOrVIYqiUsC3FvxYCmjcWQwt1+vjg
 o9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YZFNuVSfP55sMvOG8YitDULyu/i82jfQAMD2jlO7Ys=;
 b=kPOTT2EMADX4PhntTxauAdHs42uZtInrPjYwYm8utQho3aQN/9BimmckEGenaGqvya
 wt66UcyZSBnktjv74u3FBe426ihkejevSYsnVB6uPat0Huy6CkAHo5D4NIhD6A21rU3t
 Nf3r11Ay8G3RLMDDQggekb/kjTSJPkK6zAncwAlnTJF14of0JtJg68e1cI/jIImr4tH+
 iJh01vZboJ977ST8hP+p2FF1D7VH0Sl6z1hPhLArFPVeZJbj2yiZJPB4TbS6hScv0BGn
 VTQlquV/WcK9Ri6v46ZFeXiyZvqSQwLOOKT48ihpvdSewzfKHM/Q6unXAM5Ps4j9vYQG
 O0/A==
X-Gm-Message-State: AOAM533tj9/a9zaVbmxr+KO2k2sQ5CQJSt8Szmj+N7F6a/zDCmbm5hma
 nTp7/porC/IIA/QkY+4r63bd/2TpAYFKnPhcJcQ=
X-Google-Smtp-Source: ABdhPJzAbNP7I8X07h5O7wXM99SU7O56JPRE7X3RJeZ1cIWL581ouGmLt7309ekN8bNaG7d3kwLLYFbEmdSBy8RLfkk=
X-Received: by 2002:a05:6512:368f:: with SMTP id
 d15mr2331212lfs.447.1644430846226; 
 Wed, 09 Feb 2022 10:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
 <CAMVc7JXB4KUFbMDekXiVTVqT_UQVpy-y6C+Z8caaSC3FRwPjWg@mail.gmail.com>
 <7028769.ONZ7M9ntUb@silver>
In-Reply-To: <7028769.ONZ7M9ntUb@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Wed, 9 Feb 2022 13:20:34 -0500
Message-ID: <CAB26zV2sdVq41CFdp3uJV76af9T=osNUHKiRpMr0kxS6OH5fGw@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000072770205d799e4dd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000072770205d799e4dd
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 9, 2022 at 9:08 AM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Mittwoch, 9. Februar 2022 14:33:25 CET Akihiko Odaki wrote:
> > > I like the idea of switching it to __attribute__((weak)). I should note
> > > that I'm not sure that I can actually fully test this out since I'm
> > > getting stuck with the linker noting my undefined fake function during
> > > the build, but the idea does make logical sense to me for the future
> fail
> > > case and the happy case builds again when implemented with actual
> > > pthread_fchdir_np:
> > >
> > > [1075/2909] Linking target qemu-nbd
> > > FAILED: qemu-nbd
> > > cc -m64 -mcx16  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o
> -Wl,-dead_strip_dylibs
> > > -Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_load
> > > libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcrypto.fa
> > > -Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_load
> > > libio.fa -fstack-protector-strong
> > > -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib
> > > -Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a
> > > libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa
> > > @block.syms /usr/local/Cellar/gnutls/3.7.3/lib/libgnutls.dylib -lutil
> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl
> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm
> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > > -lgmodule-2.0 -lglib-2.0 -lintl
> > > /usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2
> > > -framework CoreFoundation -framework IOKit -lcurl
> > > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > > -lgmodule-2.0 -lglib-2.0 -lintl -lbz2
> > > /usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam>
> > > Undefined symbols for architecture x86_64:
> > >   "_pthread_fchdir_npfoo", referenced from:
> > >       _qemu_mknodat in libblockdev.fa(os-posix.c.o)
> > >
> > > ld: symbol(s) not found for architecture x86_64
> > > clang: error: linker command failed with exit code 1 (use -v to see
> > > invocation) ninja: build stopped: subcommand failed.
> > > make[1]: *** [run-ninja] Error 1
> > > make: *** [all] Error 2
> > >
> > > With that caveat re testing in mind, unless there's another recommended
> > > path forward, I think it makes sense to stick with
> __attribute__((weak))
> > > and prepare v6 which incorporates this and all the other feedback from
> > > this round.
> > __attribute__((weak_import)), which explicitly marks the function as
> > external, is more appropriate here. It is feature-equivalent with the
> > availability attribute when the minimum deployment target is lower
> > than the version which introduced the function.
>
> Thanks for chiming in on this macOS issue Akihiko!
>
> Are you sure that "weak_import" is still the preferred way? From behaviour
> PoV
> I do not see any difference at all. I can't even tell what the intended
> difference was, and QEMU currently only seems to use "weak" in the entire
> code
> base.
>
> Googling around, "weak_import" seems to be required on ancient OS X
> versions
> only and that it's now deprecated in favour of the more common "weak", no?
>
> Best regards,
> Christian Schoenebeck
>

Either way seems reasonable to me. For reference, what I'm seeing on Google
and what Christian may be referring to is a circa-2016 conversation on GCC
bugzilla, where a tentative conclusion seems to be that the distinction
between the two is small and weak is probably preferred now:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69179

--00000000000072770205d799e4dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 9, 2022 at 9:08 AM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mittwoch, 9. Februar 2022 14:33:25 CET =
Akihiko Odaki wrote:<br>
&gt; &gt; I like the idea of switching it to __attribute__((weak)). I shoul=
d note<br>
&gt; &gt; that I&#39;m not sure that I can actually fully test this out sin=
ce I&#39;m<br>
&gt; &gt; getting stuck with the linker noting my undefined fake function d=
uring<br>
&gt; &gt; the build, but the idea does make logical sense to me for the fut=
ure fail<br>
&gt; &gt; case and the happy case builds again when implemented with actual=
<br>
&gt; &gt; pthread_fchdir_np:<br>
&gt; &gt; <br>
&gt; &gt; [1075/2909] Linking target qemu-nbd<br>
&gt; &gt; FAILED: qemu-nbd<br>
&gt; &gt; cc -m64 -mcx16=C2=A0 -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,-dea=
d_strip_dylibs<br>
&gt; &gt; -Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_=
load<br>
&gt; &gt; libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcry=
pto.fa<br>
&gt; &gt; -Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_=
load<br>
&gt; &gt; libio.fa -fstack-protector-strong<br>
&gt; &gt; -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib<br>
&gt; &gt; -Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a<br>
&gt; &gt; libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa lib=
io.fa<br>
&gt; &gt; @block.syms /usr/local/Cellar/gnutls/3.7.3/lib/libgnutls.dylib -l=
util<br>
&gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib<=
br>
&gt; &gt; -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl<br>
&gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib<=
br>
&gt; &gt; -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm<br>
&gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib<=
br>
&gt; &gt; -lgmodule-2.0 -lglib-2.0 -lintl<br>
&gt; &gt; /usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2<=
br>
&gt; &gt; -framework CoreFoundation -framework IOKit -lcurl<br>
&gt; &gt; -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib<=
br>
&gt; &gt; -lgmodule-2.0 -lglib-2.0 -lintl -lbz2<br>
&gt; &gt; /usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam&gt; <br>
&gt; &gt; Undefined symbols for architecture x86_64:<br>
&gt; &gt;=C2=A0 =C2=A0&quot;_pthread_fchdir_npfoo&quot;, referenced from:<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_qemu_mknodat in libblockdev.fa(os-posi=
x.c.o)<br>
&gt; &gt; <br>
&gt; &gt; ld: symbol(s) not found for architecture x86_64<br>
&gt; &gt; clang: error: linker command failed with exit code 1 (use -v to s=
ee<br>
&gt; &gt; invocation) ninja: build stopped: subcommand failed.<br>
&gt; &gt; make[1]: *** [run-ninja] Error 1<br>
&gt; &gt; make: *** [all] Error 2<br>
&gt; &gt; <br>
&gt; &gt; With that caveat re testing in mind, unless there&#39;s another r=
ecommended<br>
&gt; &gt; path forward, I think it makes sense to stick with __attribute__(=
(weak))<br>
&gt; &gt; and prepare v6 which incorporates this and all the other feedback=
 from<br>
&gt; &gt; this round.<br>
&gt; __attribute__((weak_import)), which explicitly marks the function as<b=
r>
&gt; external, is more appropriate here. It is feature-equivalent with the<=
br>
&gt; availability attribute when the minimum deployment target is lower<br>
&gt; than the version which introduced the function.<br>
<br>
Thanks for chiming in on this macOS issue Akihiko!<br>
<br>
Are you sure that &quot;weak_import&quot; is still the preferred way? From =
behaviour PoV <br>
I do not see any difference at all. I can&#39;t even tell what the intended=
 <br>
difference was, and QEMU currently only seems to use &quot;weak&quot; in th=
e entire code <br>
base.<br>
<br>
Googling around, &quot;weak_import&quot; seems to be required on ancient OS=
 X versions <br>
only and that it&#39;s now deprecated in favour of the more common &quot;we=
ak&quot;, no?<br>
<br>
Best regards,<br>
Christian Schoenebeck<br></blockquote><div><br></div><div>Either way seems =
reasonable to me. For reference, what I&#39;m seeing on Google and what Chr=
istian may be referring to is a circa-2016 conversation on GCC bugzilla, wh=
ere a
 tentative conclusion seems to be that the distinction between the two=20
is small and weak is probably preferred now: <a href=3D"https://gcc.gnu.org=
/bugzilla/show_bug.cgi?id=3D69179" target=3D"_blank">https://gcc.gnu.org/bu=
gzilla/show_bug.cgi?id=3D69179</a></div><div>=C2=A0<br></div></div></div>

--00000000000072770205d799e4dd--

