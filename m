Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3009439529D
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 21:12:42 +0200 (CEST)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnQrZ-0001Ba-9t
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 15:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQpO-0008WD-Pn
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:10:27 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQpJ-0006qv-V0
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:10:26 -0400
Received: by mail-ej1-x62a.google.com with SMTP id g8so4844772ejx.1
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 12:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AsUuq+0zFMpI0FUkkICt/pLC1DX1XMZWgw1P1CDuzTs=;
 b=rHpCckU853feJSpAUjoOfVKqg5nlDrHPcKDjiaJOrPVBAfSwm5TkubkExh7ITs8FPt
 O0igFtkZ5LQWeeTpk9G9DXFGON74xnsgnE01ucK9jz8c/p4mHYoFsO7imJAWai47Vk54
 08tvFx/v5Pg0ZuFnVCWfzYiw0czX/t7QTQXR83DB9mbE8s4paj5svR0WKWsNrrP7C1qH
 VlUsz6nTFyQIs02WnJQW3w6t2N+0tEQ7eWJpumtu08mD55evIWwuiKbG80t04NrHiolS
 cg+5EOncOK4DvCDLt6W1dsm/SqEXXt3kle3Ze5JQlximMZ9hxU4Vg1HdOqCgr6pZ2n2t
 waVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AsUuq+0zFMpI0FUkkICt/pLC1DX1XMZWgw1P1CDuzTs=;
 b=aPz2p3ZxSwMHA3TVMQycV6FO1yV/mUg7Hv1E+jplAaLRxxufK6mUF2KiXwItJiryAx
 tNTaP2QYE3qDEcojxfgRjpUvBssm0CFiCLiWIqEo7uU7on/iJrLgjgbVOY7c/bhl44yn
 p0ikaNsGThOtJLbdzM1TtACVwCWF3grqnIPe9r0gaYNOuyBseAVOxa0IHWzpfXIgd+ea
 D+To9aEo3iCPo7tqqYMwGheC+p4DJzA6ah001QMd4ZRON5fIDwOYvqdFjJOQI6UpIJim
 pll0p9/DgNFnuKxnaFHjbmAMqMs5W6uvGwUp1Eaf2Rfd1TDd5zw3qQJADoLmDUXKqBkA
 yzhw==
X-Gm-Message-State: AOAM530Vv78FEeqSZnV9ZP/4rkiixLbb5Ll2VkCsjMKilGAs9JVIO8ag
 L11zNiQo1rjquzelYZL8FnHgqiA8IfsxdsiDOYnhYA==
X-Google-Smtp-Source: ABdhPJwMUu2VpXH3zmcL3ZkDrNkZmiFn633/qw8KTpHYEbwsj37vr6fwPuguV1IreWFfgI1jAcM2th7u3zoCuLqzRNs=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr3657236ejm.85.1622401820255; 
 Sun, 30 May 2021 12:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210528023220.417057-1-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 20:09:51 +0100
Message-ID: <CAFEAcA_Kws=q73Yhe-AeuGhtx3V0uQOwaEG9+oRvcaROed8uNg@mail.gmail.com>
Subject: Re: [PULL 00/44] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 May 2021 at 03:32, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit c8616fc7670b884de5f74d2767aade224c1c5c3a:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/gitlab-ci-20210527' into staging (2021-05-27 16:32:57 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to faa40e297406445ab8814844bd9aa532a7538cde:
>
>   gitlab: add python linters to CI (2021-05-27 18:11:17 -0400)
>
> ----------------------------------------------------------------
> Python pull request
>
> Python packaging & CI implementation
> Acceptance tests sent w/ Cleber's blessing.
> New CI tests send w/ stsquad's RB.
>
> --js
>
> ----------------------------------------------------------------

Fails to build on my machine that runs the BSD VMs, apparently
before it gets to the point of launching the VM:

make: Entering directory '/home/peter.maydell/qemu-freebsd/build'
/usr/bin/python3 -B /home/peter.maydell/qemu-freebsd/meson/meson.py
introspect --targets --tests --benchmarks | /usr/bin/python3 -B
scripts/mtest2make.py > Makefile.mtest
{ \
  echo 'ninja-targets = \'; \
  /usr/bin/ninja -t targets all | sed 's/:.*//; $!s/$/ \\/'; \
  echo 'build-files = \'; \
  /usr/bin/ninja -t query build.ninja | sed -n '1,/^  input:/d; /^
outputs:/q; s/$/ \\/p'; \
} > Makefile.ninja.tmp && mv Makefile.ninja.tmp Makefile.ninja
(GIT="git" "/home/peter.maydell/qemu-freebsd/scripts/git-submodule.sh"
update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp)
(GIT="git" "/home/peter.maydell/qemu-freebsd/scripts/git-submodule.sh"
update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp)
/usr/bin/python3 -B /home/peter.maydell/qemu-freebsd/tests/vm/freebsd
--debug --genisoimage /usr/bin/genisoimage    --image
"/home/peter.maydell/.cache/qemu-vm/images/freebsd.img" --force
--build-image /home/peter.maydell/.cache/qemu-vm/images/freebsd.img
Traceback (most recent call last):
  File "/home/peter.maydell/qemu-freebsd/tests/vm/freebsd", line 21, in <module>
    import basevm
  File "/home/peter.maydell/qemu-freebsd/tests/vm/basevm.py", line 22,
in <module>
    from qemu.machine import QEMUMachine
ImportError: bad magic number in 'qemu': b'\x03\xf3\r\n'
/home/peter.maydell/qemu-freebsd/tests/vm/Makefile.include:79: recipe
for target '/home/peter.maydell/.cache/qemu-vm/images/freebsd.img'
failed
make: *** [/home/peter.maydell/.cache/qemu-vm/images/freebsd.img] Error 1
make: Leaving directory '/home/peter.maydell/qemu-freebsd/build'

thanks
-- PMM

