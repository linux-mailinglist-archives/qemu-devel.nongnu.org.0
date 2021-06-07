Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279839DC17
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 14:18:18 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqECu-0007sU-Tg
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 08:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqEBp-0007DZ-TJ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:17:09 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqEBn-0007sB-Nh
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:17:09 -0400
Received: by mail-ed1-x530.google.com with SMTP id b11so20094224edy.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z2OcFIdW0kEwTiqcXXZ0MkIFQLeCcBr/Hf32MZOJdUk=;
 b=zqniisFi07Iiw0FaPKwl8q6tsc6hddOm5YxnHba8i9/El1/yialYMkl5TzoOK+6PBK
 MmTjjueKQcMIZ5FLSeZO+lsGfBEsnUna/NGQoAqWP4sBm3tQG51VRHiqnp2VOyrl16Hd
 jEpwK8LPZsHV8qVePzslMbVMPpHJqPXNNiKNiUptqV0PEOayBEf7Klnx57AjbynEVzKB
 QrYqkVLaQWIkCSkmwp7hoG3djVIAJazwYB3qq+C/npbJw655JuZRZc06hfDkU7Urp0US
 szNdpiWPzJ1h0JOMzA38ZYQbNJz6C4IExC5B3uGbHLjKFZmT0gCYBWJyyF/UUNN0RKhx
 XJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z2OcFIdW0kEwTiqcXXZ0MkIFQLeCcBr/Hf32MZOJdUk=;
 b=XD8iuHP9lpzfxXvaOYETY6xOZO/hvox3uUMoifvX2QSxYno3HQ0poLo+LZjSXDnbXw
 4T+oE2eCP5uSSr0YIwws67kqBx3OQ9VyuusJp0uaQHJ0Bdkx7xGBFzHyU0l8RLBEkVW5
 isb8u3uy24swflmxNMzelSbxk5kE01SF15DiztOA9m6bJPOHjdRbZuyva2H2ecgFHFxE
 fWRFmwVKuRaIEUL2wOTXfCV/peBlsuVsEhd2Xy/44L9XA4cJd+IYSglH9po0xJIZ8BsQ
 SMJKJ7OZSmP2YyZ754lYReYRSsqU7uK68wrhJTv5BsvQa8xGrgC781FYelX4l/9tx66s
 fjSg==
X-Gm-Message-State: AOAM531SZ8dTuGRkjWAm4douAS5QaJMZdKdlUcqAYvQYHbGNBOHNqIYr
 gMCpraq7EFVFNRH3uGPcgpceF1GT1o/hd5ZzOk1lHg==
X-Google-Smtp-Source: ABdhPJzBScdODB6Pi7EFCi/npt4chlAcJiOEKzknwbg2v9XHTmAtZEHSUlol8WKsqN/rurUEE3QyLr/BaXMzxeOWGeg=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr19997065eds.146.1623068225963; 
 Mon, 07 Jun 2021 05:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
In-Reply-To: <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jun 2021 13:16:32 +0100
Message-ID: <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
Subject: Re: [PULL 0/2] Libslirp patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Jun 2021 at 12:01, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Peter
>
> On Tue, Jun 1, 2021 at 1:17 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>>
>> On Sat, 29 May 2021 at 19:55, <marcandre.lureau@redhat.com> wrote:
>> >
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > The following changes since commit 62c0ac5041e9130b041adfa13a41583d3c3=
ddd24:
>> >
>> >   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210=
526' into staging (2021-05-28 16:25:21 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
>> >
>> > for you to fetch changes up to b060428091c758781acc4d42849accc036d3c81=
6:
>> >
>> >   build-sys: make libslirp a meson subproject (2021-05-29 22:52:37 +04=
00)
>> >
>> > ----------------------------------------------------------------
>> > Update libslirp & make it a subproject
>> >
>> > ----------------------------------------------------------------
>>
>> All hosts, odd warnings on checkout and running configure:
>>
>> warning: unable to rmdir 'slirp': Directory not empty
>
>
> This one is from git itself. It doesn't clean up old submodule locations,=
 even though they are actually "clean". git submodule "(re)move" has its li=
mits I guess.

Yeah, I guess we have to live with this one.

>> make: Entering directory '/home/pm/qemu/build/all'
>> config-host.mak is out-of-date, running configure
>>   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
>> tests/fp/berkeley-softfloat-3 dtc capstone slirp
>> warn: ignoring non-existent submodule slirp
>
>
>  However, I don't get this when simply running make. Maybe you run make i=
n parallel, and config-host.mak didn't have the time to regenerate with a n=
ew GIT_SUBMODULES.
>
> I wonder if we miss a dependency like "git-submodule-update: config-host.=
mak" ?

Something looks like it's still using an old list of submodules.

> Running configure before make should also prevent this from happening.

Incremental build needs to keep working.

>>
>> BSD VMs: error message just before launching the VM (though the VM did
>> seem to then launch OK):
>>
>> Found ninja-1.8.2 at /usr/bin/ninja
>> ninja: no work to do.
>> (GIT=3D"git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh"
>> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/be
>> rkeley-softfloat-3 dtc capstone slirp)
>> warn: ignoring non-existent submodule slirp
>> /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd
>> --debug  --jobs 8 --verbose    --image
>> "/home/peter.maydell/.cache/qemu
>> -vm/images/netbsd.img"  --snapshot --build-qemu
>> /home/peter.maydell/qemu-netbsd --
>> DEBUG:root:Creating archive
>> /home/peter.maydell/qemu-netbsd/build/vm-test-6kefrq76.tmp/data-f706c.ta=
r
>> for src_dir dir: /home/peter.maydell/q
>> emu-netbsd
>> error: pathspec 'slirp' did not match any file(s) known to git.


Maybe this is something needing updating in the "create the archive"
script?

>>
>> clang sanitizer build: link failure:
>> subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In
>> function `arp_table_add':
>> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libs=
lirp/src/arp_table.c:51:
>> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libs=
lirp/src/arp_table.c:51:
>> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libs=
lirp/src/arp_table.c:51:
>> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libs=
lirp/src/arp_table.c:34:
>> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libs=
lirp/src/arp_table.c:34:
>> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> (and lots more similar)

> I don't get this  when running make vm-build-netbsd. What else am I missi=
ng?

This isn't NetBSD related, it's just a clang sanitizer build on Linux.

>> OSX: linker warnings linking libslirp.0.dylib:
>>
>>
>> [34/1977] Linking target subprojects/libslirp/libslirp.0.dylib
>> ld: warning: dylib
>> (/usr/local/Cellar/glib/2.68.0/lib/libgthread-2.0.dylib) was built for
>> newer macOS version (10.15) than being linked (10.4)
>> ld: warning: dylib
>> (/usr/local/Cellar/glib/2.68.0/lib/libglib-2.0.dylib) was built for
>> newer macOS version (10.15) than being linked (10.4)
>> ld: warning: dylib (/usr/local/opt/gettext/lib/libintl.dylib) was
>> built for newer macOS version (10.14) than being linked (10.4)
>>
>
> This looks related to:
> https://gitlab.freedesktop.org/slirp/libslirp/-/commit/410e296a52fb274648=
f8ecf53561eaab4b33c52c
>
> It could be that we need to use the version information from glib (or fro=
m any libraries used).
>
> It looks safe to ignore although I re-opened:
>  https://gitlab.freedesktop.org/slirp/libslirp/-/issues/36#note_940695

I'm not generally a fan of ignoring warnings. I would prefer it if
we understood why it was happening and how shared libraries are
supposed to be being built.

thanks
-- PMM

