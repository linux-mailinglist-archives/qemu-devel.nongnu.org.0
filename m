Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE823DE11F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 22:57:01 +0200 (CEST)
Received: from localhost ([::1]:38356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAezb-0003Vh-TO
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 16:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAeyE-0002hr-98
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 16:55:34 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAeyB-00030K-G6
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 16:55:33 -0400
Received: by mail-ej1-x636.google.com with SMTP id hs10so24315376ejc.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LgqqdYn/0RQHgtQZQStgPr1TmiBW2ElT8Ehc6UYm0AU=;
 b=uZXd39cRem9Mj0sFf00cfH/Vsti+eweLh5zdcYwUhjTTEfeuDwZaePj3xKUjD7+0oN
 nGCAD0jMvG57uEh34obEB9dgkn2+AYkLnKd+UsHHwqZaRVbqOK5JSLlWj71pk82Ou3hE
 zg3mh2hSlN71wkieh7ozM0Z11DHAhAVIHpPVxC/epsyty2h1nQwrE/zGtLYLioqWgk+n
 FE2/14KAKif/+TURHP7hdUevuD6AZasc/+btVFQk45fCTBtwT5L9I3UP+dBHlvohi+a3
 54iigFedRRFIWM51XuzejgRk6zF8/a60uVQGJqKxjgj6W7fJT79hmC+Br8VomgU2x9uC
 p3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LgqqdYn/0RQHgtQZQStgPr1TmiBW2ElT8Ehc6UYm0AU=;
 b=Kt/BlndM9mBSR7oLhwYBKFqOKpcI5x6O8JNe/r2rwZxDd+hglIE432Ole2G5Imyram
 WH2cBqMtek4Tm9cLLO8wm7Xv0Ph0Ep3WS8SergSUuQRjKRDJNxGvNXEJAnJ5mdx9Cx7/
 rfC7WLFBdtXk2LqghS24fTSfCL5F/Q8kB2tZeaF0+Jt7RbeseMzLrd0i3A+saRcCjWfQ
 AaG4D5rm1+3hRSt0v9Yug8zqHjnoXwR6Zarcknz+QnGPEaFZjE6+jgVvJRLXHC/hnBvb
 OHfN/aLjhTi+A3S1zjqe16UuJn3WFWUCd5173mMiY5ehYdX8DhauWjfL6yrQRPrn+j3f
 MsJg==
X-Gm-Message-State: AOAM530ztP5ZJpa4HZdDDv7JKJQGSy2sgWKp4YILxMplyLaDhU0OVkrB
 sMO1upTEwso2wHiU4u0/FEvUR3yOjq/t00ohk8K61Q==
X-Google-Smtp-Source: ABdhPJwhc2CCaE2LdwamdTB9OjiTP7VxhABB+fZnOmJ95C6m2CXUihx5SixprKTk774YNVFWrUVQP2kNyaC49jSyuwg=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr17202548ejb.482.1627937729626; 
 Mon, 02 Aug 2021 13:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
In-Reply-To: <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 21:54:46 +0100
Message-ID: <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 2 Aug 2021 at 19:58, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Peter
>
> On Sun, Aug 1, 2021 at 4:10 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>>
>> On Wed, 28 Jul 2021 at 16:47, Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> > I wish my previous pull request with the submodule change would
>> > receive more help or attention, as I either couldn't reproduce the
>> > failure (neither CI) or it was just some one-time warnings due to the
>> > transition...
>>
>> Well, I reported the failures back to you. I can't do a lot more,
>> because libslirp development is now much more opaque to me because
>> it doesn't happen in-tree. So instead of "some small change happens and
>> we pick up issues with it early", you have to deal with all of
>> the accumulated problems at once when you update the submodule :-(
>>
>> rc2 is on Tuesday, so we're starting to run short on time to
>> get an updated slirp in for 6.1.
>>
>
> Do you mind checking the https://github.com/elmarco/qemu/tree/libslirp br=
anch?
>
> From https://mail.gnu.org/archive/html/qemu-devel/2021-06/msg00031.html, =
there would still be the one-time warnings from git, but osx and dist error=
 should be gone.

Yep, I still see the git "warning: unable to rmdir 'slirp': Directory
not empty", but I think we can ignore that.

I also see
config-host.mak is out-of-date, running configure
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
warn: ignoring non-existent submodule slirp

but I think that is also a one-off?

> Only one left as a mystery is the Ubuntu-ASAN link issue.

This one is still here:

subprojects/libslirp/libslirp.so.0.3.1.p/src_arp_table.c.o: In
function `arp_table_add':
/mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp=
/src/arp_table.c:51:
undefined reference to `__ubsan_handle_type_mismatch_v1'
/mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp=
/src/arp_table.c:51:
undefined reference to `__ubsan_handle_type_mismatch_v1'

when building the subprojects/libslirp/libslirp.so.0.3.1

configure options:
'../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
'--extra-cflags=3D-fsanitize=3Dundefined  -fno-sanitize=3Dshift-base
-Werror'

This happens because (as noted in the clang documentation for the
sanitizer: https://clang.llvm.org/docs/AddressSanitizer.html)
when linking a shared library with the sanitizers, clang does not
link in the sanitizer runtime library. That library is linked in
with the executable, and the shared library's references to the
sanitizer runtime functions are satisfied that way. However
you/meson are building libslirp.so with -Wl,--no-undefined
so the link of the .so fails.
(This does not happen with gcc, because gcc chose to make the
default for sanitizers to be to link against a shared libasan,
not a static one, the reverse of clang's default.)

What I don't understand is why we're building the .so at all.
I just tried a fresh build with
'../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
'--enable-sanitizers'
to check that telling configure (and possibly thus meson) about
the sanitizers more directly still demonstrated the problem:
but that sidesteps it because it never builds the .so.
My other build directories (the ones that do plain old gcc
builds with no sanitizer) seem to have built the .so file
as well, though, so this isn't related to either clang or to
the sanitizers -- meson just doesn't seem to be consistent
about what we build.

A related meson bug:
https://github.com/mesonbuild/meson/issues/764
(which was closed by just making meson warn if you tell it
to both use --no-undefined (which is the default) and to use
the sanitizer.)

The ideal fix seems to me to be to figure out why we're
building the libslirp .so and not do that.

A simple fix/workaround would be to set "b_lundef =3D false" in
default_options in your meson.build (which will suppress the
-Wl,--no-undefined option). That does mean you won't get
any warnings if you accidentally make libslirp use a function
that is provided by the QEMU executable, I suppose.

thanks
-- PMM

