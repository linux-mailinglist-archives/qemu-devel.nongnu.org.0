Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3E4DA34E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 20:32:13 +0100 (CET)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUCtw-0004PH-Df
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 15:32:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUCs8-0002VL-FK
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:30:20 -0400
Received: from [2607:f8b0:4864:20::112e] (port=37586
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUCs5-0005sh-Ck
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:30:19 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2e5757b57caso58789887b3.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o5LWHKOHu9XWvfgfHgeUFiDZs+3zK+BI+FG6HjGoRs4=;
 b=RmZoJ1x6DSZcozLZkNt8KEH5C2KqhpeTzK4tArSR09eh2O/J2+KHprBaI+hqPrEEco
 htPwabh/3r3sjEg9A5sBnpSQXq+l1UJ4xHqtHgX/nOk4Scaw5v75EYJhC0rw2Mnogiv4
 LiZHbcjCiu1pGWo1O2BPOTAdGIivPkbI1nsPTSbvJCAV+ct5tMJPl91JklHvs9jJqV+3
 Bis5qSCwMAl1YYVDKh0WzPc7LknqwNgpJHNgX9AAXHJau1h7oowGG2iZ+4tEBXmW9QZ1
 wgoSVnoJXdousleieCvO+Mx5y4NVDacZhlr+3NJDmg4ANQVKAdaYJvQGPi3GLcT1r2xX
 i6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o5LWHKOHu9XWvfgfHgeUFiDZs+3zK+BI+FG6HjGoRs4=;
 b=0teGErqKhbdYZlqLpHpcxs6n7L8nj9cpLh21errwsFa4chLPlsFmhMsgW0RXok3n8R
 I16YMyDyBKBC5z2WfiHfKZpzqV9QN8Rm/P2cBsiJGt3tRK35PGcNNBaQGacVFiLsaVE7
 asJN6mGvOD+QHqatQ4nzlROffQ9nPygf6XDzqR8Al+vp3BZLpCSuG+biQ+E4C6mgeH8p
 PA2clwWLP0aFCjn2AsSL82rOjsoizevnH0EDQXoahMwUAzV5HmizoiDZ/WtCV2BGq3Ki
 dWgmpYtbJy8/kyTWoFNU/lF3OnWbi0rtjynyJIkM5pqxzummhQ4XpEOKoLT5PwrhAu6B
 ccuA==
X-Gm-Message-State: AOAM530AEpBfYiPu1ry9hzixdM00HhyDw1gdNL36qnNZtI3vJJi4VoJJ
 FN2uiTggjEy+sqpYRjW08ofQmyGjLqRGUi7fMHollA==
X-Google-Smtp-Source: ABdhPJyap8vRpVSNSVdBdbGckdNw7mLUH9MUFQlJyf5T/szq6kaMzrrZQvlT69dVS5v8ySeIEGZ7LGMmMwXf9AMVifI=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr2275733ywr.64.1647372616332; Tue, 15 Mar
 2022 12:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220315112052.515467-1-thuth@redhat.com>
 <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
In-Reply-To: <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 19:30:04 +0000
Message-ID: <CAFEAcA-C9Y1RKMfDWr132xCvXkoGovU8aK6Z6fjQ9LEZyeUtyg@mail.gmail.com>
Subject: Re: [PULL 0/8] s390x and misc fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 18:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 15 Mar 2022 at 11:20, Thomas Huth <thuth@redhat.com> wrote:
> >
> >  Hi Peter!
> >
> > The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:
> >
> >   Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-15
> >
> > for you to fetch changes up to 36149534792dcf07a3c59867f967eaee23ab906c:
> >
> >   meson: Update to version 0.61.3 (2022-03-15 10:32:36 +0100)
> >
> > ----------------------------------------------------------------
> > * Fixes for s390x branch instruction emulation
> > * Fixes for the tests/avocado/boot_linux.py:BootLinuxS390X test
> > * Fix for "-cpu help" output
> > * Bump meson to 0.61.3 to fix stderr log of the iotests
> >
> > ----------------------------------------------------------------
>
> This results in every "Linking" step on my macos box producing the
> warning:
>
> ld: warning: directory not found for option
> '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0'
>
> Obvious suspect here is the new meson version.

Also, after rolling this merge attempt back, older meson barfs
on whatever the new one left behind:


[0/1] Regenerating build files.
Traceback (most recent call last):
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonmain.py",
line 228, in run
    return options.run_func(options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 281, in run
    app.generate()
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 177, in generate
    env = environment.Environment(self.source_dir, self.build_dir, self.options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/environment.py",
line 462, in __init__
    self.coredata = coredata.load(self.get_build_dir())  # type:
coredata.CoreData
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/coredata.py",
line 1003, in load
    obj = pickle.load(f)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonlib/universal.py",
line 2076, in __setstate__
    self.__init__(**state)  # type: ignore
TypeError: __init__() got an unexpected keyword argument 'module'
FAILED: build.ninja
/usr/local/opt/python@3.9/bin/python3.9
/Users/pm215/src/qemu-for-merges/meson/meson.py --internal regenerate
/Users/pm215/src/qemu-for-merges
/Users/pm215/src/qemu-for-merges/build/all --backend ninja
ninja: error: rebuilding 'build.ninja': subcommand failed
/usr/local/bin/ninja  build.ninja && touch build.ninja.stamp
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
[0/1] Regenerating build files.
Traceback (most recent call last):
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonmain.py",
line 228, in run
    return options.run_func(options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 281, in run
    app.generate()
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 177, in generate
    env = environment.Environment(self.source_dir, self.build_dir, self.options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/environment.py",
line 462, in __init__
    self.coredata = coredata.load(self.get_build_dir())  # type:
coredata.CoreData
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/coredata.py",
line 1003, in load
    obj = pickle.load(f)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonlib/universal.py",
line 2076, in __setstate__
    self.__init__(**state)  # type: ignore
TypeError: __init__() got an unexpected keyword argument 'module'
FAILED: build.ninja


meson ought to be smart enough to spot that it's got data from an
incompatible version and just discard its cache rather than
choking on it.

thanks
-- PMM

