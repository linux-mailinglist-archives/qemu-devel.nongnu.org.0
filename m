Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8913971FD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:03:13 +0200 (CEST)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2Ay-0002hb-9F
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lo29p-0000xg-UB
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:02:01 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lo29n-0001zi-JH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:02:01 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j10so16727172edw.8
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7bUDoz9djyiLt2+gFZab8MQ5LfFw7QRXQlLdrWBjpyU=;
 b=hfHAY+zsIivVRubuNo0f524VrPDXtYl6rg9f7BPbAsBjEuKHR/yK8358yFwnUvtekB
 16ZvLDv9X2jP6dr6EBzQIxn3v/GOuFoCok13rPzzJMXLNyg7MSDF2/jCnRgyK+LYoxcl
 /qUeDnbHpOGGAfPRqooOcPUPOx+5+2kztaH0IfYrNVdNxZEC+Oq3eYS4+WOgZZlSqESG
 wb5KhGb3CkGHPtbr9+WkcqYqMeQDXoZwmsWJwujH0SO0/Rl3Vs9raZak3Vhby69Z6ILY
 lC0P86pqfrg9UFrxHgt5GTHCA72nyPV46FFGpgYFIiYtB6vX/E6q+v3VlMcF29uWTiZL
 4aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7bUDoz9djyiLt2+gFZab8MQ5LfFw7QRXQlLdrWBjpyU=;
 b=OJEHju19BOgWim8OAuZQp0Kh8lHOatY1yNCS+y64DrVqgIYCJp+HlYounOMQHfdUPy
 IIuMc5AuRvp8NWXeac45/FpvCDxasRKKlzgbN0/pO8vItpLlNxKnV0yS+TAPEFaQBpJ2
 crwPmxo2VfQC+8tdSz8KRUJqkI+kneTTSN5ZqMdGuuKYULagwDwqO0/tMa7aUaigC0XM
 XHDNMsBViYsuvGY96nSKl8McIfope0GDgSD079hPR0H53qZ8lFhRzLmYwz5JKKqzQpRk
 DV/rCkXZSEZiYyNl2paeqdBKqYoPPD+23NsOZAqrb9FtwBzEZeQE4IiOjSgJi/pof6GB
 V84Q==
X-Gm-Message-State: AOAM530D4bw+GIoL7FVnby2mSCB7HHxgjDluwhwsb5F9c+qc4qvmukvW
 UrCB20g2Qb0dRBdPb8zCLvpagc2lY9YxqFfoDt7863Gw9MfiTw==
X-Google-Smtp-Source: ABdhPJx62QXMMhs4koMz55mhbpEloAuPYfRP5oovpmoB/0/8nUqenVPNONyqlUdzSo5SDe8dhVm+vX5lU8rSax9LAhE=
X-Received: by 2002:aa7:cfd4:: with SMTP id r20mr8205097edy.237.1622545316484; 
 Tue, 01 Jun 2021 04:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 1 Jun 2021 15:01:44 +0400
Message-ID: <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
Subject: Re: [PULL 0/2] Libslirp patches
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000038987f05c3b2457f"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000038987f05c3b2457f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter

On Tue, Jun 1, 2021 at 1:17 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sat, 29 May 2021 at 19:55, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The following changes since commit
> 62c0ac5041e9130b041adfa13a41583d3c3ddd24:
> >
> >   Merge remote-tracking branch
> 'remotes/rth-gitlab/tags/pull-tcg-20210526' into staging (2021-05-28
> 16:25:21 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
> >
> > for you to fetch changes up to b060428091c758781acc4d42849accc036d3c816=
:
> >
> >   build-sys: make libslirp a meson subproject (2021-05-29 22:52:37 +040=
0)
> >
> > ----------------------------------------------------------------
> > Update libslirp & make it a subproject
> >
> > ----------------------------------------------------------------
>
> All hosts, odd warnings on checkout and running configure:
>
> warning: unable to rmdir 'slirp': Directory not empty
>

This one is from git itself. It doesn't clean up old submodule locations,
even though they are actually "clean". git submodule "(re)move" has its
limits I guess.

make: Entering directory '/home/pm/qemu/build/all'
> config-host.mak is out-of-date, running configure
>   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> warn: ignoring non-existent submodule slirp
>

 However, I don't get this when simply running make. Maybe you run make in
parallel, and config-host.mak didn't have the time to regenerate with a new
GIT_SUBMODULES.

I wonder if we miss a dependency like "git-submodule-update:
config-host.mak" ?

Running configure before make should also prevent this from happening.


> BSD VMs: error message just before launching the VM (though the VM did
> seem to then launch OK):
>
> Found ninja-1.8.2 at /usr/bin/ninja
> ninja: no work to do.
> (GIT=3D"git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/be
> rkeley-softfloat-3 dtc capstone slirp)
> warn: ignoring non-existent submodule slirp
> /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd
> --debug  --jobs 8 --verbose    --image
> "/home/peter.maydell/.cache/qemu
> -vm/images/netbsd.img"  --snapshot --build-qemu
> /home/peter.maydell/qemu-netbsd --
> DEBUG:root:Creating archive
> /home/peter.maydell/qemu-netbsd/build/vm-test-6kefrq76.tmp/data-f706c.tar
> for src_dir dir: /home/peter.maydell/q
> emu-netbsd
> error: pathspec 'slirp' did not match any file(s) known to git.
>

> clang sanitizer build: link failure:
> subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In
> function `arp_table_add':
>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:34:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:34:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
> (and lots more similar)
>
>
I don't get this  when running make vm-build-netbsd. What else am I missing=
?

>

> OSX: linker warnings linking libslirp.0.dylib:
>
>
> [34/1977] Linking target subprojects/libslirp/libslirp.0.dylib
> ld: warning: dylib
> (/usr/local/Cellar/glib/2.68.0/lib/libgthread-2.0.dylib) was built for
> newer macOS version (10.15) than being linked (10.4)
> ld: warning: dylib
> (/usr/local/Cellar/glib/2.68.0/lib/libglib-2.0.dylib) was built for
> newer macOS version (10.15) than being linked (10.4)
> ld: warning: dylib (/usr/local/opt/gettext/lib/libintl.dylib) was
> built for newer macOS version (10.14) than being linked (10.4)
>
>
This looks related to:
https://gitlab.freedesktop.org/slirp/libslirp/-/commit/410e296a52fb274648f8=
ecf53561eaab4b33c52c

It could be that we need to use the version information from glib (or from
any libraries used).

It looks safe to ignore although I re-opened:
 https://gitlab.freedesktop.org/slirp/libslirp/-/issues/36#note_940695

--=20
Marc-Andr=C3=A9 Lureau

--00000000000038987f05c3b2457f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 1:17 P=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Sat, 29 May 2021 at 19:55, &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The following changes since commit 62c0ac5041e9130b041adfa13a41583d3c3=
ddd24:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/rth-gitlab/tags/=
pull-tcg-20210526&#39; into staging (2021-05-28 16:25:21 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@github.com:elmarco/qemu.git tags/libslirp-pull-request=
<br>
&gt;<br>
&gt; for you to fetch changes up to b060428091c758781acc4d42849accc036d3c81=
6:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0build-sys: make libslirp a meson subproject (2021-05-29 22=
:52:37 +0400)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Update libslirp &amp; make it a subproject<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
<br>
All hosts, odd warnings on checkout and running configure:<br>
<br>
warning: unable to rmdir &#39;slirp&#39;: Directory not empty<br></blockquo=
te><div><br></div><div>This one is from git itself. It doesn&#39;t clean up=
 old submodule locations, even though they are actually &quot;clean&quot;. =
git submodule &quot;(re)move&quot; has its limits I guess.<br></div><div> <=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
make: Entering directory &#39;/home/pm/qemu/build/all&#39;<br>
config-host.mak is out-of-date, running configure<br>
=C2=A0 GIT=C2=A0 =C2=A0 =C2=A0ui/keycodemapdb meson tests/fp/berkeley-testf=
loat-3<br>
tests/fp/berkeley-softfloat-3 dtc capstone slirp<br>
warn: ignoring non-existent submodule slirp<br></blockquote><div><br></div>=
<div>=C2=A0However, I don&#39;t get this when simply running make. Maybe yo=
u run make in parallel, and config-host.mak didn&#39;t have the time to reg=
enerate with a new GIT_SUBMODULES.</div><div><br></div><div><div>I wonder i=
f we miss a dependency like &quot;git-submodule-update: config-host.mak&quo=
t; ?<br></div></div><div><br></div><div>Running configure before make shoul=
d also prevent this from happening.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
BSD VMs: error message just before launching the VM (though the VM did<br>
seem to then launch OK):<br>
<br>
Found ninja-1.8.2 at /usr/bin/ninja<br>
ninja: no work to do.<br>
(GIT=3D&quot;git&quot; &quot;/home/peter.maydell/qemu-netbsd/scripts/git-su=
bmodule.sh&quot;<br>
update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/be<br>
rkeley-softfloat-3 dtc capstone slirp)<br>
warn: ignoring non-existent submodule slirp<br>
/usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd<br>
--debug=C2=A0 --jobs 8 --verbose=C2=A0 =C2=A0 --image<br>
&quot;/home/peter.maydell/.cache/qemu<br>
-vm/images/netbsd.img&quot;=C2=A0 --snapshot --build-qemu<br>
/home/peter.maydell/qemu-netbsd --<br>
DEBUG:root:Creating archive<br>
/home/peter.maydell/qemu-netbsd/build/vm-test-6kefrq76.tmp/data-f706c.tar<b=
r>
for src_dir dir: /home/peter.maydell/q<br>
emu-netbsd<br>
error: pathspec &#39;slirp&#39; did not match any file(s) known to git.<br>=
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
clang sanitizer build: link failure:<br>
subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In<br>
function `arp_table_add&#39;:<br>
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:51:<br>
undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:51:<br>
undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:51:<br>
undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:34:<br>
undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
/home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslir=
p/src/arp_table.c:34:<br>
undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
(and lots more similar)<br>
<br></blockquote><div><br></div><div><div>I don&#39;t get this=C2=A0 when r=
unning make vm-build-netbsd. What else am I missing?<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
</blockquote>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
OSX: linker warnings linking libslirp.0.dylib:<br>
<br>
<br>
[34/1977] Linking target subprojects/libslirp/libslirp.0.dylib<br>
ld: warning: dylib<br>
(/usr/local/Cellar/glib/2.68.0/lib/libgthread-2.0.dylib) was built for<br>
newer macOS version (10.15) than being linked (10.4)<br>
ld: warning: dylib<br>
(/usr/local/Cellar/glib/2.68.0/lib/libglib-2.0.dylib) was built for<br>
newer macOS version (10.15) than being linked (10.4)<br>
ld: warning: dylib (/usr/local/opt/gettext/lib/libintl.dylib) was<br>
built for newer macOS version (10.14) than being linked (10.4)<br>
<br></blockquote><div><br></div><div>This looks related to:<br></div><div><=
a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/commit/410e296a52=
fb274648f8ecf53561eaab4b33c52c">https://gitlab.freedesktop.org/slirp/libsli=
rp/-/commit/410e296a52fb274648f8ecf53561eaab4b33c52c</a></div><div><br></di=
v><div>It could be that we need to use the version information from glib (o=
r from any libraries used).</div><div><br></div><div>It looks safe to ignor=
e although I re-opened:<br></div><div>=C2=A0<a href=3D"https://gitlab.freed=
esktop.org/slirp/libslirp/-/issues/36#note_940695">https://gitlab.freedeskt=
op.org/slirp/libslirp/-/issues/36#note_940695</a></div></div><br>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></d=
iv>

--00000000000038987f05c3b2457f--

