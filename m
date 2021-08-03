Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41B83DE87C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:32:28 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApqd-00085B-Sr
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAppD-0006rJ-Ve
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:30:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAppB-0008S9-LS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:30:59 -0400
Received: by mail-ej1-x62e.google.com with SMTP id h9so19704276ejs.4
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8E5az0CQR8L6WkP8o7VNh0uRxqqfB7VZ49ZQyxXxbds=;
 b=V3lMDW8/n3j2yYU2sIy4Kypguj+ANnOpxG4PwvL+25jIxS91b+gpIF9mShVs5g31hp
 Rc4U3aGu8RRhEo86R1gWkgNnAGy3aSXodbZ+1+s2Eeeh157sfto83GJcktCi9N3ZTA0B
 EBNWu9VdFDVY4SheyXtGbIWpo71JtjjonLcNRIS7B3L0bhBG+QjNzQbKw8GdEBhADzSi
 6jWVNlen3aG/B9zbZGKX2/2184AEyrS83tDxvQhlafo5jV0BDwFacc4H9WH9js5yBWAj
 2QNjf4ZhTFJc8Y8e0PCPkNJe+YEKaDa7M4Edi5Uqgf0t7Tpuj/Ck07N0cVbWmrxpPx3B
 Kfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8E5az0CQR8L6WkP8o7VNh0uRxqqfB7VZ49ZQyxXxbds=;
 b=Sptv4+38vRUr/D84Ta5JFAVSCgR8FqS5Tq0ZD7xQMn85D+r11o/bKpU4Ph3/x37s8n
 jVytJ61nHKHhjMyzCoCcbtr3pvmhaHlH19nKAkrzlHfCunBg2FqfCpzYd9RJ3nrrasE9
 UALmQ/3wAYxIOprFJ+IXvuRUKT7YDnpqqEodG8QYvO0HEv08LnH377BthxmQ+iMRctOk
 AQUd6520T640T1CkEwLPfDiVhH3ik9UqxWq7reWYK5jXypadQ4UtvhxjbrksCLowRqAa
 6Jh26Os2ydkB+bzeNtnA4Eutode+tUG3a2pq5yH1+xjrNWDedoPk21Ko9Y1vrzsJ6gVe
 /dTg==
X-Gm-Message-State: AOAM5337Rv3NApKRQTEaDQc0NfG9A4ZkO13nPX+L1EvW1KIAEk4krVx8
 1fz8h7Yd2PmUbibvGVYgf3F+tOrMNVnkbND4AK4=
X-Google-Smtp-Source: ABdhPJw/pJBbo/OYRqaKJJ3TbzJnveTWZoCWmje7VonOMbC+AlMI0LG6Az3uY39mFCHPNwqOTt0j02TWhI6tNwZcdyE=
X-Received: by 2002:a17:907:3e1c:: with SMTP id
 hp28mr19118512ejc.109.1627979455993; 
 Tue, 03 Aug 2021 01:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
 <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
In-Reply-To: <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 3 Aug 2021 12:30:44 +0400
Message-ID: <CAJ+F1CJ79-ZrE2J8XZaoBt3LzprB0Z4YJb7cU_hvQf8qd84L1g@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002d1fb305c8a3817f"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
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

--0000000000002d1fb305c8a3817f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 12:55 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 2 Aug 2021 at 19:58, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi Peter
> >
> > On Sun, Aug 1, 2021 at 4:10 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >>
> >> On Wed, 28 Jul 2021 at 16:47, Marc-Andr=C3=A9 Lureau
> >> <marcandre.lureau@gmail.com> wrote:
> >> > I wish my previous pull request with the submodule change would
> >> > receive more help or attention, as I either couldn't reproduce the
> >> > failure (neither CI) or it was just some one-time warnings due to th=
e
> >> > transition...
> >>
> >> Well, I reported the failures back to you. I can't do a lot more,
> >> because libslirp development is now much more opaque to me because
> >> it doesn't happen in-tree. So instead of "some small change happens an=
d
> >> we pick up issues with it early", you have to deal with all of
> >> the accumulated problems at once when you update the submodule :-(
> >>
> >> rc2 is on Tuesday, so we're starting to run short on time to
> >> get an updated slirp in for 6.1.
> >>
> >
> > Do you mind checking the https://github.com/elmarco/qemu/tree/libslirp
> branch?
> >
> > From https://mail.gnu.org/archive/html/qemu-devel/2021-06/msg00031.html=
,
> there would still be the one-time warnings from git, but osx and dist err=
or
> should be gone.
>
> Yep, I still see the git "warning: unable to rmdir 'slirp': Directory
> not empty", but I think we can ignore that.
>
> I also see
> config-host.mak is out-of-date, running configure
>   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> warn: ignoring non-existent submodule slirp
>
> but I think that is also a one-off?
>

yes


> > Only one left as a mystery is the Ubuntu-ASAN link issue.
>
> This one is still here:
>
> subprojects/libslirp/libslirp.so.0.3.1.p/src_arp_table.c.o: In
> function `arp_table_add':
>
> /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libsli=
rp/src/arp_table.c:51:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
>
> /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libsli=
rp/src/arp_table.c:51:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
>
> when building the subprojects/libslirp/libslirp.so.0.3.1
>
> configure options:
> '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
> '--extra-cflags=3D-fsanitize=3Dundefined  -fno-sanitize=3Dshift-base
> -Werror'
>

I am not able to reproduce. Could you check the value of default_library
for libslirp when you run "meson configure". It should be "static".

I tested with "make vm-build-ubuntu.amd64", with tests/vm/ubuntu.amd64:
import sys
import basevm
import ubuntuvm

DEFAULT_CONFIG =3D {
    'install_cmds' : "apt-get update,"\
                     "apt-get build-dep -y qemu,"\
                     "apt-get install -y libfdt-dev language-pack-en
ninja-build clang",
}

class UbuntuX64VM(ubuntuvm.UbuntuVM):
    name =3D "ubuntu.amd64"
    arch =3D "x86_64"
    image_link=3D"https://cloud-images.ubuntu.com/releases/bionic/"\
               "release-20191114/ubuntu-18.04-server-cloudimg-amd64.img"

image_sha256=3D"0c55fded766f3e4efb082f604ed71dd58c8e81f04bd1a66b4ced80ad626=
17547"
    BUILD_SCRIPT =3D """
        set -e;
        cd $(mktemp -d);
        sudo chmod a+r /dev/vdb;
        tar -xf /dev/vdb;
        ./configure {configure_opts} --cc=3Dclang --cxx=3Dclang++
--host-cc=3Dclang --extra-cflags=3D'-fsanitize=3Dundefined
 -fno-sanitize=3Dshift-base -Werror'
        make --output-sync {target} -j{jobs} {verbose};
    """

if __name__ =3D=3D "__main__":
    sys.exit(basevm.main(UbuntuX64VM, DEFAULT_CONFIG))



> This happens because (as noted in the clang documentation for the
> sanitizer: https://clang.llvm.org/docs/AddressSanitizer.html)
> when linking a shared library with the sanitizers, clang does not
> link in the sanitizer runtime library. That library is linked in
> with the executable, and the shared library's references to the
> sanitizer runtime functions are satisfied that way. However
> you/meson are building libslirp.so with -Wl,--no-undefined
> so the link of the .so fails.
> (This does not happen with gcc, because gcc chose to make the
> default for sanitizers to be to link against a shared libasan,
> not a static one, the reverse of clang's default.)
>
> What I don't understand is why we're building the .so at all.
> I just tried a fresh build with
> '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
> '--enable-sanitizers'
> to check that telling configure (and possibly thus meson) about
> the sanitizers more directly still demonstrated the problem:
> but that sidesteps it because it never builds the .so.
> My other build directories (the ones that do plain old gcc
> builds with no sanitizer) seem to have built the .so file
> as well, though, so this isn't related to either clang or to
> the sanitizers -- meson just doesn't seem to be consistent
> about what we build.
>
> A related meson bug:
> https://github.com/mesonbuild/meson/issues/764
> (which was closed by just making meson warn if you tell it
> to both use --no-undefined (which is the default) and to use
> the sanitizer.)
>
> The ideal fix seems to me to be to figure out why we're
> building the libslirp .so and not do that.
>
> A simple fix/workaround would be to set "b_lundef =3D false" in
> default_options in your meson.build (which will suppress the
> -Wl,--no-undefined option). That does mean you won't get
> any warnings if you accidentally make libslirp use a function
> that is provided by the QEMU executable, I suppose.
>
>
What if you pass --extra-ldflags=3D'-fsanitize=3Dundefined' then?

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002d1fb305c8a3817f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 12:55 AM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, 2 Aug 2021 at 19:58, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter<br>
&gt;<br>
&gt; On Sun, Aug 1, 2021 at 4:10 PM Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 28 Jul 2021 at 16:47, Marc-Andr=C3=A9 Lureau<br>
&gt;&gt; &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank=
">marcandre.lureau@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; I wish my previous pull request with the submodule change wou=
ld<br>
&gt;&gt; &gt; receive more help or attention, as I either couldn&#39;t repr=
oduce the<br>
&gt;&gt; &gt; failure (neither CI) or it was just some one-time warnings du=
e to the<br>
&gt;&gt; &gt; transition...<br>
&gt;&gt;<br>
&gt;&gt; Well, I reported the failures back to you. I can&#39;t do a lot mo=
re,<br>
&gt;&gt; because libslirp development is now much more opaque to me because=
<br>
&gt;&gt; it doesn&#39;t happen in-tree. So instead of &quot;some small chan=
ge happens and<br>
&gt;&gt; we pick up issues with it early&quot;, you have to deal with all o=
f<br>
&gt;&gt; the accumulated problems at once when you update the submodule :-(=
<br>
&gt;&gt;<br>
&gt;&gt; rc2 is on Tuesday, so we&#39;re starting to run short on time to<b=
r>
&gt;&gt; get an updated slirp in for 6.1.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Do you mind checking the <a href=3D"https://github.com/elmarco/qemu/tr=
ee/libslirp" rel=3D"noreferrer" target=3D"_blank">https://github.com/elmarc=
o/qemu/tree/libslirp</a> branch?<br>
&gt;<br>
&gt; From <a href=3D"https://mail.gnu.org/archive/html/qemu-devel/2021-06/m=
sg00031.html" rel=3D"noreferrer" target=3D"_blank">https://mail.gnu.org/arc=
hive/html/qemu-devel/2021-06/msg00031.html</a>, there would still be the on=
e-time warnings from git, but osx and dist error should be gone.<br>
<br>
Yep, I still see the git &quot;warning: unable to rmdir &#39;slirp&#39;: Di=
rectory<br>
not empty&quot;, but I think we can ignore that.<br>
<br>
I also see<br>
config-host.mak is out-of-date, running configure<br>
=C2=A0 GIT=C2=A0 =C2=A0 =C2=A0ui/keycodemapdb meson tests/fp/berkeley-testf=
loat-3<br>
tests/fp/berkeley-softfloat-3 dtc capstone slirp<br>
warn: ignoring non-existent submodule slirp<br>
<br>
but I think that is also a one-off?<br></blockquote><div><br></div><div>yes=
</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Only one left as a mystery is the Ubuntu-ASAN link issue.<br>
<br>
This one is still here:<br>
<br>
subprojects/libslirp/libslirp.so.0.3.1.p/src_arp_table.c.o: In<br>
function `arp_table_add&#39;:<br>
/mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp=
/src/arp_table.c:51:<br>
undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
/mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp=
/src/arp_table.c:51:<br>
undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
<br>
when building the subprojects/libslirp/libslirp.so.0.3.1<br>
<br>
configure options:<br>
&#39;../../configure&#39; &#39;--cc=3Dclang&#39; &#39;--cxx=3Dclang++&#39; =
&#39;--enable-gtk&#39;<br>
&#39;--extra-cflags=3D-fsanitize=3Dundefined=C2=A0 -fno-sanitize=3Dshift-ba=
se<br>
-Werror&#39;<br></blockquote><div><br></div><div>I am not able to reproduce=
. Could you check the value of default_library for libslirp when you run &q=
uot;meson configure&quot;. It should be &quot;static&quot;.<br></div><div><=
br></div><div>I tested with &quot;make vm-build-ubuntu.amd64&quot;, with te=
sts/vm/ubuntu.amd64:</div><div>import sys<br>import basevm<br>import ubuntu=
vm<br><br>DEFAULT_CONFIG =3D {<br>=C2=A0 =C2=A0 &#39;install_cmds&#39; : &q=
uot;apt-get update,&quot;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;apt-get build-dep -y qemu,&quot;\<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;apt-get install -y libfdt-dev language-pack-en ninja-build clang&q=
uot;,<br>}<br><br>class UbuntuX64VM(ubuntuvm.UbuntuVM):<br>=C2=A0 =C2=A0 na=
me =3D &quot;ubuntu.amd64&quot;<br>=C2=A0 =C2=A0 arch =3D &quot;x86_64&quot=
;<br>=C2=A0 =C2=A0 image_link=3D&quot;<a href=3D"https://cloud-images.ubunt=
u.com/releases/bionic/">https://cloud-images.ubuntu.com/releases/bionic/</a=
>&quot;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;re=
lease-20191114/ubuntu-18.04-server-cloudimg-amd64.img&quot;<br>=C2=A0 =C2=
=A0 image_sha256=3D&quot;0c55fded766f3e4efb082f604ed71dd58c8e81f04bd1a66b4c=
ed80ad62617547&quot;<br>=C2=A0 =C2=A0 BUILD_SCRIPT =3D &quot;&quot;&quot;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 set -e;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd $(m=
ktemp -d);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sudo chmod a+r /dev/vdb;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tar -xf /dev/vdb;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
/configure {configure_opts} --cc=3Dclang --cxx=3Dclang++ --host-cc=3Dclang =
--extra-cflags=3D&#39;-fsanitize=3Dundefined =C2=A0-fno-sanitize=3Dshift-ba=
se -Werror&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 make --output-sync {target} =
-j{jobs} {verbose};<br>=C2=A0 =C2=A0 &quot;&quot;&quot;<br><br>if __name__ =
=3D=3D &quot;__main__&quot;:<br>=C2=A0 =C2=A0 sys.exit(basevm.main(UbuntuX6=
4VM, DEFAULT_CONFIG))</div><div><br></div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
This happens because (as noted in the clang documentation for the<br>
sanitizer: <a href=3D"https://clang.llvm.org/docs/AddressSanitizer.html" re=
l=3D"noreferrer" target=3D"_blank">https://clang.llvm.org/docs/AddressSanit=
izer.html</a>)<br>
when linking a shared library with the sanitizers, clang does not<br>
link in the sanitizer runtime library. That library is linked in<br>
with the executable, and the shared library&#39;s references to the<br>
sanitizer runtime functions are satisfied that way. However<br>
you/meson are building libslirp.so with -Wl,--no-undefined<br>
so the link of the .so fails.<br>
(This does not happen with gcc, because gcc chose to make the<br>
default for sanitizers to be to link against a shared libasan,<br>
not a static one, the reverse of clang&#39;s default.)<br>
<br>
What I don&#39;t understand is why we&#39;re building the .so at all.<br>
I just tried a fresh build with<br>
&#39;../../configure&#39; &#39;--cc=3Dclang&#39; &#39;--cxx=3Dclang++&#39; =
&#39;--enable-gtk&#39;<br>
&#39;--enable-sanitizers&#39;<br>
to check that telling configure (and possibly thus meson) about<br>
the sanitizers more directly still demonstrated the problem:<br>
but that sidesteps it because it never builds the .so.<br>
My other build directories (the ones that do plain old gcc<br>
builds with no sanitizer) seem to have built the .so file<br>
as well, though, so this isn&#39;t related to either clang or to<br>
the sanitizers -- meson just doesn&#39;t seem to be consistent<br>
about what we build.<br>
<br>
A related meson bug:<br>
<a href=3D"https://github.com/mesonbuild/meson/issues/764" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/mesonbuild/meson/issues/764</a><br>
(which was closed by just making meson warn if you tell it<br>
to both use --no-undefined (which is the default) and to use<br>
the sanitizer.)<br>
<br>
The ideal fix seems to me to be to figure out why we&#39;re<br>
building the libslirp .so and not do that.<br>
<br>
A simple fix/workaround would be to set &quot;b_lundef =3D false&quot; in<b=
r>
default_options in your meson.build (which will suppress the<br>
-Wl,--no-undefined option). That does mean you won&#39;t get<br>
any warnings if you accidentally make libslirp use a function<br>
that is provided by the QEMU executable, I suppose.<br>
<br></blockquote><div><br></div><div>What if you pass --extra-ldflags=3D&#3=
9;-fsanitize=3Dundefined&#39; then?</div></div><div class=3D"gmail_quote"><=
br></div><div class=3D"gmail_quote">thanks<br></div><div class=3D"gmail_quo=
te"><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000002d1fb305c8a3817f--

