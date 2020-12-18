Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09752DE7FB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 18:22:35 +0100 (CET)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqJSc-0005KA-R2
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 12:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqJOy-0002OG-5q
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:18:48 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqJOq-0001iP-Vk
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:18:47 -0500
Received: by mail-wm1-x336.google.com with SMTP id r4so3368104wmh.5
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=paUrY3dqfAQgSH0DkdaXB4DTrIle/llNl5g53xIE0fM=;
 b=WHdCjaTWUDTeu3/P9TQ6wOdsCmtI/V0cU1PJk3j5UOAA6N6hVIfLpRZi2IQlARYWYm
 KVDZG4esLAw7k1OG0m4fAtevlzBc/HmejaxFtfgFmmXZBIvpSeyCk+xK9EOh3DOw3KFJ
 roDQc4ISDi31B21Ovf5MAeeqad1gsET1T8lI9tAsIDAhQqynR361UM10kFvjDPtEbDir
 7rUDrvYXXzTjQb+heWWPYtFdMdFvCNGUCCD81wV/H27Ze5L9cayb25AyVkvVVSJFNqQ+
 eEcHNjP3B2Np7YMEkQemdqrhMHgUz8lQhmOoVic2qrXBn06VRbxBLu/S4lE+t3QhOVgX
 6u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=paUrY3dqfAQgSH0DkdaXB4DTrIle/llNl5g53xIE0fM=;
 b=PZdFqlG6KGLzR5S0heuUe1+DJPLuTJ2E0HQqnbKow5MyanAUJQj20himDXP8Qj5/R5
 4BQoCQVjoKrDqv0xTnBb1EsseFgcFX+Zc/jlFh0BKutvB/RQkoWX2iGoJmgToS3mfdsX
 ErJOs+xhFWg49xOuUS5g1nBucTgN1Gga2Hz2vnzcfc8Aq1gx+tJGe/6w16tfesZ1zv9E
 uajK8/phE6cSOpfFRUxc/8tqPaOUov92Mb8zOusv1TSgtseot1qWxgyOro8T6Y23SyUN
 7F5QxHyEd2rJN5gJDu7ow8ZFAgm3glEgCm2DvlHIrCsU8lffkT0x8v8DlIY7+DuWGha8
 J3+w==
X-Gm-Message-State: AOAM533vuhpt1UjC08yX5WL5Crpu2rr3PoTmo+JvcYFpnVa5DjLDmfp4
 PeJrNCwPh27hDxq0Yvhgi/3viA==
X-Google-Smtp-Source: ABdhPJxfHcI7AQ9SZis/I7SGMl07vsieI3ElFwznOTTiNwau1lGaT4rNYge1Tz8hw49fS5IlCXYp4g==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr5274635wmb.98.1608311913840;
 Fri, 18 Dec 2020 09:18:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f9sm15953630wrw.81.2020.12.18.09.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 09:18:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B05531FF7E;
 Fri, 18 Dec 2020 17:18:31 +0000 (GMT)
References: <20201217094330.17400-1-alex.bennee@linaro.org>
 <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
 <87v9d0q9rr.fsf@linaro.org>
 <CAFEAcA9dFV5ym=N1XQBJrXHYgu5NNRJC8eB9pPRaK2CokHoHxg@mail.gmail.com>
 <87pn37qqh1.fsf@linaro.org>
 <CAFEAcA-UmyTw8Sn5yZrZFxumJRPv-oGg4uL++7av0oTh8fEAMw@mail.gmail.com>
 <87blerqblh.fsf@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/11] testing and configure updates
Date: Fri, 18 Dec 2020 17:17:53 +0000
In-reply-to: <87blerqblh.fsf@linaro.org>
Message-ID: <878s9vqbh4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Pbonzini@redhat.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Fri, 18 Dec 2020 at 11:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> > No, the 'alldbg' build is the one that does do a 'make clean';
>>> > the build-not-from-clean build worked (presumably because the
>>> > old executable was still left in place from the previous build).
>>>
>>> Hmm I wonder if it's related to the configure options then. What's your
>>> configure setup for that build?
>>
>> '../../configure' '--cc=3Dccache gcc' '--enable-debug'
>> '--python=3Dpython3'
>
> So I did the following:
>
>   git checkout af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f
>   cd build/bisect
>   rm -rf *
>   '../../configure' '--cc=3Dccache gcc' '--enable-debug' '--python=3Dpyth=
on3'
>   make -j30
>   make check-qtest
>
> All ok, then
>
>    git checkout pull-testing-171220-2
>    cd build/bisect
>    make clean
>    ag -r "moxie" | wc -l
>
> And sure enough there is a lot of detritus left (21 lines by ag's
> counting). However:
>
>   make -j30
>   make check-qtest
>
> still passes and doesn't attempt to do anything with moxie. So I'm kind
> of stuck as to what to do now? Maybe we can compare detritus and see
> what is left in your tree that causes the test system to get confused
> and make "clean" really mean it.
>
>   $ ag -l -r "moxie"
>   Makefile.ninja
>   moxie-softmmu-config-target.h
>   qapi/qapi-visit-misc-target.c
>   qapi/qapi-events-misc-target.h
>   qapi/qapi-types-machine.h
>   qapi/qapi-introspect.c
>   qapi/qapi-types-misc-target.h
>   qapi/qapi-visit-machine.c
>   qapi/qapi-visit-misc-target.h
>   qapi/qapi-events-misc-target.c
>   qapi/qapi-types-machine.c
>   meson-info/intro-buildsystem_files.json
>   docs/qemu-qmp-ref.7
>   docs/interop/qemu-qmp-ref.html
>   docs/system/deprecated.html
>   docs/system/index.html
>   moxie-softmmu-config-devices.mak
>   moxie-softmmu-config-devices.h
>   build.ninja
>
> I'm surprised about build.ninja and Makefile.ninja? Don't they get
> regenerated by the configure?

Even weirder, re-run configure and the list grows!

  $ ag -l -r "moxie"
  Makefile.ninja
  moxie-softmmu-config-target.h
  qapi/qapi-visit-misc-target.c
  qapi/qapi-events-misc-target.h
  qapi/qapi-types-machine.h
  qapi/qapi-introspect.c
  qapi/qapi-types-misc-target.h
  qapi/qapi-visit-machine.c
  qapi/qapi-visit-misc-target.h
  qapi/qapi-events-misc-target.c
  qapi/qapi-types-machine.c
  meson-info/intro-buildsystem_files.json
  docs/qemu-qmp-ref.7
  docs/interop/qemu-qmp-ref.html
  docs/system/deprecated.html
  docs/system/index.html
  moxie-softmmu-config-devices.mak
  meson-private/microblazeel-softmmu-config-devices.mak.d
  meson-private/sh4eb-softmmu-config-devices.mak.d
  meson-private/xtensa-softmmu-config-devices.mak.d
  meson-private/mips64-softmmu-config-devices.mak.d
  meson-private/nios2-softmmu-config-devices.mak.d
  meson-private/rx-softmmu-config-devices.mak.d
  meson-private/tricore-softmmu-config-devices.mak.d
  meson-private/s390x-softmmu-config-devices.mak.d
  meson-private/microblaze-softmmu-config-devices.mak.d
  meson-private/riscv64-softmmu-config-devices.mak.d
  meson-private/riscv32-softmmu-config-devices.mak.d
  meson-private/sparc64-softmmu-config-devices.mak.d
  meson-private/arm-softmmu-config-devices.mak.d
  meson-private/xtensaeb-softmmu-config-devices.mak.d
  meson-private/sh4-softmmu-config-devices.mak.d
  meson-private/mips-softmmu-config-devices.mak.d
  meson-private/or1k-softmmu-config-devices.mak.d
  meson-private/sparc-softmmu-config-devices.mak.d
  meson-private/x86_64-softmmu-config-devices.mak.d
  meson-private/avr-softmmu-config-devices.mak.d
  meson-private/mips64el-softmmu-config-devices.mak.d
  meson-private/mipsel-softmmu-config-devices.mak.d
  meson-private/ppc-softmmu-config-devices.mak.d
  meson-private/aarch64-softmmu-config-devices.mak.d
  meson-private/i386-softmmu-config-devices.mak.d
  meson-private/alpha-softmmu-config-devices.mak.d
  meson-private/ppc64-softmmu-config-devices.mak.d
  meson-private/hppa-softmmu-config-devices.mak.d
  meson-private/m68k-softmmu-config-devices.mak.d
  meson-private/cris-softmmu-config-devices.mak.d
  moxie-softmmu-config-devices.h
  build.ninja

--=20
Alex Benn=C3=A9e

