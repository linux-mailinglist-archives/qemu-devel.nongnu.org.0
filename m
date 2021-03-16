Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5733D258
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 12:02:00 +0100 (CET)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7SZ-0002W0-Jo
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 07:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM7Qo-0001xY-BD
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:00:10 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM7Qi-0007Cb-G7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:00:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b16so8184290eds.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6ty3QwH1/N0OUy44wyEZjHd2VLz6sA4/YGm7cBnge8=;
 b=N2YRI2SGjfv2+dWAWbq28pkINBydl4wty7FRLDF71miYjRdQqADdpC/RWbWtIO0016
 v7ObmYxvpAPCbItvN6GBf8ezVKhQDgZhqgGdfLQf5DiYcCQiIz+2/zwalohjd3kgm+Mi
 LUcPJNDzJXslSdRB+dMkrXrx2jRr6toJpvyj9j9PtClPMMVuKti9ERkM7KxxQItLrAiN
 cRYKY0DJde/ZUHZjlprH3nnkrj2fUtOxrcN5h7tQZvhQ4P7GOGLVpsAmjNTPvHISCBwx
 FykSJOG+Wv8vwD5Bd5BzyvL5txvlIHmPUXoeWbdnhprTHxt7PQCRoDvfdqKhJa/aqVrz
 TJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6ty3QwH1/N0OUy44wyEZjHd2VLz6sA4/YGm7cBnge8=;
 b=NZJdqXCyJCUPqIUOzZJD383svk+n87QGBpUTQWD8/lO5SE81PCnztevP8YSPKUUev7
 Xg51UODE17aIPrDLMXPpFMKj2CwKb20MvpeTn1vY4FXjC+qG3wrvq/ORMYwOH3pTKmIM
 3dlqu4/3lb6y4GhunNX9b3mgLNGBP4XV/Atla+X7fp7A+Uy/oZ385KzzEPmkij8+cEd8
 CkqlkSp10RQg9bsatpErKH28sv4Sy5x76LFRo5nRNAazSZG4XQs90qsSOIkeT7Sg4K4O
 MAbFN5KO4EYra2bug4KGh3BV9WP4fh74WV07B7WBQ06mjN9BONi2bWIjHTTB+Atsf8La
 w/EQ==
X-Gm-Message-State: AOAM532yTT3x8J7caLcMXVI5WM+d4Bny31rJhy95hoWz7q6lki1Tx62u
 TtLBGbYjKPfAh/SYzQ+84IMAktjzH2UqGqHKrXwsHA==
X-Google-Smtp-Source: ABdhPJwR/f3PHWijXY8J1NtRNqQdJuz6FINzSHRCmLXvGQ1BeMeTnV8JHsMjrvZCV38mSFBcquT+swKULsqP1fUAi1U=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr34747135edt.251.1615892402443; 
 Tue, 16 Mar 2021 04:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210315173912.197857-1-pbonzini@redhat.com>
 <CAFEAcA-XrOsZnUmxTCA+YbaL3rXxLMMmW5-bXJkRc0h_7v2E+A@mail.gmail.com>
In-Reply-To: <CAFEAcA-XrOsZnUmxTCA+YbaL3rXxLMMmW5-bXJkRc0h_7v2E+A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 10:59:39 +0000
Message-ID: <CAFEAcA8ku-32=G=Q9iFa41vLnT7+CfjWTmsyxXtvruQM2X7W=A@mail.gmail.com>
Subject: Re: [PULL v2 0/5] Meson version update
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Mon, 15 Mar 2021 at 22:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 15 Mar 2021 at 17:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit 51204c2f188ec1e2a38f14718d38a3772f850a4b:
> >
> >   Merge remote-tracking branch 'remotes/bkoppelmann2/tags/pull-tricore-20210314' into staging (2021-03-15 15:34:27 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream-meson-0.57
> >
> > for you to fetch changes up to 57d42c3b774d0716b9ad1a5a576480521edc7201:
> >
> >   hexagon: use env keyword argument to pass PYTHONPATH (2021-03-15 18:06:21 +0100)
> >
> > v1->v2: rebased
> >
> > ----------------------------------------------------------------
> > Update Meson to 0.57.
> >
> > ----------------------------------------------------------------
> > Paolo Bonzini (5):
> >       hexagon: do not specify executables as inputs
> >       hexagon: do not specify Python scripts as inputs
> >       meson: bump submodule to 0.57.1
> >       meson: switch minimum meson version to 0.57.0
> >       hexagon: use env keyword argument to pass PYTHONPATH
>
> Fails to build, on at least x86-64, s390, ppc, aarch32, aarch64
> Linux hosts:

This pullreq also caused a build failure on OSX when trying to build
something else after rolling back the merge (but only on OSX, oddly):

make: Entering directory '/Users/pm215/src/qemu-for-merges/build/all'
config-host.mak is out-of-date, running configure
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 meson dtc capstone slirp
Disabling PIE due to missing toolchain support
/usr/local/bin/ninja  build.ninja && touch build.ninja.stamp
[0/1] Regenerating build files.
Traceback (most recent call last):
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonmain.py",
line 140, in run
    return options.run_func(options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 245, in run
    app.generate()
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
line 154, in generate
    env = environment.Environment(self.source_dir, self.build_dir, self.options)
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/environment.py",
line 523, in __init__
    self.coredata = coredata.load(self.get_build_dir())
  File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/coredata.py",
line 1016, in load
    obj = pickle.load(f)
ModuleNotFoundError: No module named 'mesonbuild.mesonlib.universal';
'mesonbuild.mesonlib' is not a package
FAILED: build.ninja
/usr/local/opt/python@3.8/bin/python3.8
/Users/pm215/src/qemu-for-merges/meson/meson.py --internal regenerate
/Users/pm215/src/qemu-for-merges
/Users/pm215/src/qemu-for-merges/build/all --backend ninja
ninja: error: rebuilding 'build.ninja': subcommand failed

This kind of "breaks the build tree such that you can't
just 'git reset' back to master" bug is irritating. Doesn't
meson have an "is this the right version" check on the cached
data it's loading out of the build tree ?

thanks
-- PMM

