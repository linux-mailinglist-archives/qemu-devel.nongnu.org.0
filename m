Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42038B23B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:50:31 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljk0M-0007Zg-Pk
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljjci-00041P-OX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:26:05 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljjcf-0007HL-Cg
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:26:04 -0400
Received: by mail-ed1-x535.google.com with SMTP id h16so19627654edr.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e0wcKNwqOSWjVO2rtFlsvn/tzi0qgzoH6F2AM/1qc60=;
 b=cEx1Mcl6H/JyqFHhfzrDQdUgKAysJFMdO4frbnqRsXr7ijqy9xerWbv9YMulS/vRpj
 mPnk8iPhP+9Y0wHMC6c/HadionwKuDha9qDVmY6+YfjNq0Kwg59WFGUR8dOYRlS0nkoF
 IYQNsJYASkIpLzm5s0OaKZEx45W5VmsFh88k2PNDh9q+DQP2FWxUdGe40e+Op4RizVjo
 x5bGLdiXdXJLgtjL4Pwv40MkRJMzDT127HJyTAYNDWhG3AnJeTm0rNo/YYBaZNRV0plb
 8HHwZkc4g4+K6oobhTWoKxDnljYZ9qQGfMNA8xWWJEZ3jEvcnzLr6OCWqiFwqK3UKIZz
 qtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e0wcKNwqOSWjVO2rtFlsvn/tzi0qgzoH6F2AM/1qc60=;
 b=Om2AgDxqJVrfnbl+hg2ZU1QXOX7dOVuS11In/4UY0l7sM9M18PXyU6yO71Fu0DbO8x
 cT8e26wfIDtlqFYNccMTJS42ERtGuim8VKHf7Y5GOv1vGHIDuElSlbYy+tu9H0Zbn3IR
 j2WptDUYNtiZuVhVRH2aNy0CE2zvKZZfsfP97FghAQwzJfRgTyy1/5jm7mf+jxHUFVD5
 Tp2LU5bDLI3ns+A2Hzk/aOkMLXaZtmhFz4+xK84qSz5cnX6XwZAEPNdzCgjRpsuWASfQ
 ra+FWUonw047awgFb37OqUsg7uW7xJfw5hLl6oYmpZk89lNdAiDhkWyInetRF4PNLhkh
 1uGg==
X-Gm-Message-State: AOAM530Y7r10dKL0i+sVByO5MuHYpDTEu2m2nG4GyzLQKvIeZLN7xAXu
 rZnAPboILa1kA928ZhFKWjI6Tao3sYSPDswalRG+wQ==
X-Google-Smtp-Source: ABdhPJzJdSVgrQNdFglEiAaXYtDglCvPtz6V6zF13Xa1S7Pzfq97vuvnkRaOiBnYmcJ3cadNOH7u/QKiso0QDXyt7xI=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr5252823edb.100.1621520758549; 
 Thu, 20 May 2021 07:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210520082257.187061-1-pbonzini@redhat.com>
 <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
 <CAFEAcA-w-EtshAEcx0u-k_iWjt8ynurpWB7nMdDZRHLcBaHDJA@mail.gmail.com>
In-Reply-To: <CAFEAcA-w-EtshAEcx0u-k_iWjt8ynurpWB7nMdDZRHLcBaHDJA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 15:25:39 +0100
Message-ID: <CAFEAcA_Tyn6kDVEbR4EfHdjqMQm_CRvswCjgaLytFZQjdyBNrg@mail.gmail.com>
Subject: Re: [PULL 00/26] Misc patches for 2021-05-20
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 at 15:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 20 May 2021 at 14:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 20 May 2021 at 09:31, Paolo Bonzini <pbonzini@redhat.com> wrote:

> > > ----------------------------------------------------------------
> > > * submodule cleanups (Philippe, myself)
> > > * tiny step towards a usable preconfig mode (myself)
> > > * bump Meson submodule (myself)
> > > * Kconfig and LOCK_GUARD cleanups (philippe)
> > > * new x86 CPUID feature (Yang Zhong)
> > > * "-object qtest" support (myself)
> > > * Dirty ring support for KVM (Peter)
> > > * Fixes for 6.0 command line parsing breakage (myself)
> > > * Fix for macOS 11.3 SDK (Katsuhiro)
> > > * Fix for scsi-generic handling (myself)
> > >
> >
> >
> > Fails to build on PPC64:
> >
> > WARNING: Project specifies a minimum meson_version '>=0.55.0' but uses
> > features which were added in newer versions:
> >  * 0.57.0: {'test() timeout <= 0'}
> >
> >
> > ERROR: Could not detect Ninja v1.8.2 or newer
>
> Also, my OSX build which I configure with
> ../..configure --extra-cflags='-fdiagnostics-color=never -Werror
> -Wno-error=deprecated-declarations'
>
> now triggers a meson.build warning:

Also also, dropping the merge commit reveals that the pullreq somehow
broke the build trees such that trying to do a build on master no
longer works:

make: Entering directory '/home/pm/qemu/build/all'
config-host.mak is out-of-date, running configure
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
/usr/bin/ninja  build.ninja && touch build.ninja.stamp
[0/1] Regenerating build files.
Traceback (most recent call last):
  File "/home/pm/qemu/meson/mesonbuild/mesonmain.py", line 140, in run
    return options.run_func(options)
  File "/home/pm/qemu/meson/mesonbuild/msetup.py", line 245, in run
    app.generate()
  File "/home/pm/qemu/meson/mesonbuild/msetup.py", line 154, in generate
    env = environment.Environment(self.source_dir, self.build_dir, self.options)
  File "/home/pm/qemu/meson/mesonbuild/environment.py", line 523, in __init__
    self.coredata = coredata.load(self.get_build_dir())
  File "/home/pm/qemu/meson/mesonbuild/coredata.py", line 1016, in load
    obj = pickle.load(f)
ModuleNotFoundError: No module named 'mesonbuild.mesonlib.universal';
'mesonbuild.mesonlib' is not a package
FAILED: build.ninja


This seems like a meson bug -- if the cached data isn't valid for
this version of meson it should just blow it away, not die with
a backtrace.

thanks
-- PMM

