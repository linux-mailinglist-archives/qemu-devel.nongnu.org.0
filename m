Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABEC3DE9ED
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:45:25 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAqzE-0001ii-5h
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAqyJ-00010p-2Y
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:44:27 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAqyH-0007jw-5N
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:44:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id x14so28166189edr.12
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcMzDsvL0lwlZqk9ss77yqtnwS+kAu7fGJEaC0ZHNnE=;
 b=GmCjIuvQJkWV7U6hxxzMMcG+1kP9sle0gJPkmBIYIFDosM8KUhLzgRYKxQh5OOpsrW
 40uOJTO2CfveGQODYVzrVUoqCPLNi2C4LM0lyd6q7p+ws7VvfZ+eIG54gREnuSO8LHJ9
 5U+c4syGfCgkJ95RRooyknmqP/uK5LtO8VXr2qqJc8V+7sOd7xVD8jN1/aun8BM5Yb7l
 PP4M1ief0Xpsn+XV3nFzlD+qNyu4QgvZ84q/Vne+eW6C884R1GA/BBkqRkM40p2SczNE
 ebM6L97Kb9zZZNpw3DonxaEsJBLiCY+BfgdtCyItrA8LWVJnBjzdyDbqYIbCVZqcOkCy
 oiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcMzDsvL0lwlZqk9ss77yqtnwS+kAu7fGJEaC0ZHNnE=;
 b=A+Wuu8h4X7gb1DQHeF/wwUXifprTUHsMX0PWazc03q/d14HVErGUviMpzyBHaLBqhF
 7BbOg6RFhu07+I3XYgwxsSAtEamTNL3YkQ7nu/UP9DREA+YbByR1RTSfymJ/gJYuHs5P
 Z+T43JEds/JqaRq/RKa4QHUz0vp2c2xslM0H7LtSNklyKzLN3D2mUZW9QHRRzzP6HsHD
 tgvipro8IFc3mUyxrkXi0XOE0wH3BjAjI5oFYnl7B+5FIl/H5r9Qk0zM6OeYqxTfMpCL
 k8/bTD7SsYkuI7qr9Vlh4NjOeZYtCQK3lk/VoKf2UV3O7MPm8YUj6JiuG1flqGx/6vsE
 2H6g==
X-Gm-Message-State: AOAM530BfoF9bSRKzbcUSvGKvpKal1Y+KHf4ErWKbdsnRxxx+GgF7tuP
 goIK0F9wH6J/TfvqQUz16gBiEkonlb+F8bQLKLs=
X-Google-Smtp-Source: ABdhPJxLyhvkcEyGQUd47Mhr2W/4e5yiBIY1AkLmkgnWG1xkPtRUNnpn5wwRmFUuJj8SfY4l6doNDkaRvhwGfhZIRA8=
X-Received: by 2002:a05:6402:2547:: with SMTP id
 l7mr5208664edb.314.1627983863507; 
 Tue, 03 Aug 2021 02:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
 <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
 <CAJ+F1CJ79-ZrE2J8XZaoBt3LzprB0Z4YJb7cU_hvQf8qd84L1g@mail.gmail.com>
 <CAFEAcA8saN260spE0BPD_++2zasVrsyYzaP_YBMfcPRzv+nxSg@mail.gmail.com>
In-Reply-To: <CAFEAcA8saN260spE0BPD_++2zasVrsyYzaP_YBMfcPRzv+nxSg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 3 Aug 2021 13:44:11 +0400
Message-ID: <CAJ+F1C+D80TCWiN7-ZV4yqbNPHp6ce=PWENGu6EbjBFhsxY3Qg@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e2727f05c8a48778"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x533.google.com
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

--000000000000e2727f05c8a48778
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 1:09 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 3 Aug 2021 at 09:30, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> > On Tue, Aug 3, 2021 at 12:55 AM Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >> This one is still here:
> >>
> >> subprojects/libslirp/libslirp.so.0.3.1.p/src_arp_table.c.o: In
> >> function `arp_table_add':
> >>
> /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libsli=
rp/src/arp_table.c:51:
> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >>
> /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libsli=
rp/src/arp_table.c:51:
> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >>
> >> when building the subprojects/libslirp/libslirp.so.0.3.1
> >>
> >> configure options:
> >> '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
> >> '--extra-cflags=3D-fsanitize=3Dundefined  -fno-sanitize=3Dshift-base
> >> -Werror'
> >
> >
> > I am not able to reproduce. Could you check the value of default_librar=
y
> for libslirp when you run "meson configure". It should be "static".
>
> I never run "meson configure". I just run the QEMU "make".
>
>
Yes, here running "meson configure" after configure/make allows me to check
what meson has actually recorded.


> Are you testing by starting with a before-the-libslirp-merge
> change QEMU, doing a build, then updating to the libslirp
> changes, and then doing a 'make' without reconfigure or
> 'make clean' ? I suspect this is perhaps to do with it being
> an incremental build.
>
>
I tested with the "make vm-build-ubuntu.amd64" setup I gave before, so it
is a fresh build. Doing incremental build test is tedious, but I can give
it a try.

>> This happens because (as noted in the clang documentation for the
> >> sanitizer: https://clang.llvm.org/docs/AddressSanitizer.html)
> >> when linking a shared library with the sanitizers, clang does not
> >> link in the sanitizer runtime library. That library is linked in
> >> with the executable, and the shared library's references to the
> >> sanitizer runtime functions are satisfied that way. However
> >> you/meson are building libslirp.so with -Wl,--no-undefined
> >> so the link of the .so fails.
> >> (This does not happen with gcc, because gcc chose to make the
> >> default for sanitizers to be to link against a shared libasan,
> >> not a static one, the reverse of clang's default.)
> >>
> >> What I don't understand is why we're building the .so at all.
> >> I just tried a fresh build with
> >> '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
> >> '--enable-sanitizers'
> >> to check that telling configure (and possibly thus meson) about
> >> the sanitizers more directly still demonstrated the problem:
> >> but that sidesteps it because it never builds the .so.
> >> My other build directories (the ones that do plain old gcc
> >> builds with no sanitizer) seem to have built the .so file
> >> as well, though, so this isn't related to either clang or to
> >> the sanitizers -- meson just doesn't seem to be consistent
> >> about what we build.
> >>
> >> A related meson bug:
> >> https://github.com/mesonbuild/meson/issues/764
> >> (which was closed by just making meson warn if you tell it
> >> to both use --no-undefined (which is the default) and to use
> >> the sanitizer.)
> >>
> >> The ideal fix seems to me to be to figure out why we're
> >> building the libslirp .so and not do that.
> >>
> >> A simple fix/workaround would be to set "b_lundef =3D false" in
> >> default_options in your meson.build (which will suppress the
> >> -Wl,--no-undefined option). That does mean you won't get
> >> any warnings if you accidentally make libslirp use a function
> >> that is provided by the QEMU executable, I suppose.
> >>
> >
> > What if you pass --extra-ldflags=3D'-fsanitize=3Dundefined' then?
>
> -fsanitize=3Dundefined is already in the ldflags. That doesn't
> help because clang is still going to decide not to statically
> link libasan and give an error because of -Wl,--noundefined.
>

Ok


--=20
Marc-Andr=C3=A9 Lureau

--000000000000e2727f05c8a48778
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 1:09 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 3 Aug 2021 at 09:30, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt; On Tue, Aug 3, 2021 at 12:55 AM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt; This one is still here:<br>
&gt;&gt;<br>
&gt;&gt; subprojects/libslirp/libslirp.so.0.3.1.p/src_arp_table.c.o: In<br>
&gt;&gt; function `arp_table_add&#39;:<br>
&gt;&gt; /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects=
/libslirp/src/arp_table.c:51:<br>
&gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
&gt;&gt; /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects=
/libslirp/src/arp_table.c:51:<br>
&gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
&gt;&gt;<br>
&gt;&gt; when building the subprojects/libslirp/libslirp.so.0.3.1<br>
&gt;&gt;<br>
&gt;&gt; configure options:<br>
&gt;&gt; &#39;../../configure&#39; &#39;--cc=3Dclang&#39; &#39;--cxx=3Dclan=
g++&#39; &#39;--enable-gtk&#39;<br>
&gt;&gt; &#39;--extra-cflags=3D-fsanitize=3Dundefined=C2=A0 -fno-sanitize=
=3Dshift-base<br>
&gt;&gt; -Werror&#39;<br>
&gt;<br>
&gt;<br>
&gt; I am not able to reproduce. Could you check the value of default_libra=
ry for libslirp when you run &quot;meson configure&quot;. It should be &quo=
t;static&quot;.<br>
<br>
I never run &quot;meson configure&quot;. I just run the QEMU &quot;make&quo=
t;.<br>
<br></blockquote><div><br></div><div>Yes, here running &quot;meson configur=
e&quot; after configure/make allows me to check what meson has actually rec=
orded.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Are you testing by starting with a before-the-libslirp-merge<br>
change QEMU, doing a build, then updating to the libslirp<br>
changes, and then doing a &#39;make&#39; without reconfigure or<br>
&#39;make clean&#39; ? I suspect this is perhaps to do with it being<br>
an incremental build.<br>
<br></blockquote><div><br></div><div>I tested with the &quot;make vm-build-=
ubuntu.amd64&quot; setup I gave before, so it is a fresh build. Doing incre=
mental build test is tedious, but I can give it a try.<br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; This happens because (as noted in the clang documentation for the<=
br>
&gt;&gt; sanitizer: <a href=3D"https://clang.llvm.org/docs/AddressSanitizer=
.html" rel=3D"noreferrer" target=3D"_blank">https://clang.llvm.org/docs/Add=
ressSanitizer.html</a>)<br>
&gt;&gt; when linking a shared library with the sanitizers, clang does not<=
br>
&gt;&gt; link in the sanitizer runtime library. That library is linked in<b=
r>
&gt;&gt; with the executable, and the shared library&#39;s references to th=
e<br>
&gt;&gt; sanitizer runtime functions are satisfied that way. However<br>
&gt;&gt; you/meson are building libslirp.so with -Wl,--no-undefined<br>
&gt;&gt; so the link of the .so fails.<br>
&gt;&gt; (This does not happen with gcc, because gcc chose to make the<br>
&gt;&gt; default for sanitizers to be to link against a shared libasan,<br>
&gt;&gt; not a static one, the reverse of clang&#39;s default.)<br>
&gt;&gt;<br>
&gt;&gt; What I don&#39;t understand is why we&#39;re building the .so at a=
ll.<br>
&gt;&gt; I just tried a fresh build with<br>
&gt;&gt; &#39;../../configure&#39; &#39;--cc=3Dclang&#39; &#39;--cxx=3Dclan=
g++&#39; &#39;--enable-gtk&#39;<br>
&gt;&gt; &#39;--enable-sanitizers&#39;<br>
&gt;&gt; to check that telling configure (and possibly thus meson) about<br=
>
&gt;&gt; the sanitizers more directly still demonstrated the problem:<br>
&gt;&gt; but that sidesteps it because it never builds the .so.<br>
&gt;&gt; My other build directories (the ones that do plain old gcc<br>
&gt;&gt; builds with no sanitizer) seem to have built the .so file<br>
&gt;&gt; as well, though, so this isn&#39;t related to either clang or to<b=
r>
&gt;&gt; the sanitizers -- meson just doesn&#39;t seem to be consistent<br>
&gt;&gt; about what we build.<br>
&gt;&gt;<br>
&gt;&gt; A related meson bug:<br>
&gt;&gt; <a href=3D"https://github.com/mesonbuild/meson/issues/764" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/mesonbuild/meson/issues/76=
4</a><br>
&gt;&gt; (which was closed by just making meson warn if you tell it<br>
&gt;&gt; to both use --no-undefined (which is the default) and to use<br>
&gt;&gt; the sanitizer.)<br>
&gt;&gt;<br>
&gt;&gt; The ideal fix seems to me to be to figure out why we&#39;re<br>
&gt;&gt; building the libslirp .so and not do that.<br>
&gt;&gt;<br>
&gt;&gt; A simple fix/workaround would be to set &quot;b_lundef =3D false&q=
uot; in<br>
&gt;&gt; default_options in your meson.build (which will suppress the<br>
&gt;&gt; -Wl,--no-undefined option). That does mean you won&#39;t get<br>
&gt;&gt; any warnings if you accidentally make libslirp use a function<br>
&gt;&gt; that is provided by the QEMU executable, I suppose.<br>
&gt;&gt;<br>
&gt;<br>
&gt; What if you pass --extra-ldflags=3D&#39;-fsanitize=3Dundefined&#39; th=
en?<br>
<br>
-fsanitize=3Dundefined is already in the ldflags. That doesn&#39;t<br>
help because clang is still going to decide not to statically<br>
link libasan and give an error because of -Wl,--noundefined.<br></blockquot=
e><div><br></div><div>Ok</div><br clear=3D"all"></div><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e2727f05c8a48778--

