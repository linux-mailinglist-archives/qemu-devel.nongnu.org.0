Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B12E8528
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 18:10:55 +0100 (CET)
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNwz-0006vv-Vk
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 12:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvNrp-0003ik-2O
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 12:05:33 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvNrl-0003cE-Lb
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 12:05:32 -0500
Received: by mail-ed1-x529.google.com with SMTP id cm17so20573114edb.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 09:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FNP+Epp9C+Xad29eJ3EUzzfvO6hA++LlLJlPjFJsYek=;
 b=Hqg0LZDdoNbZ+EjkxCwVpLfHOwNegxm926AsIWV7p/xBc++AYTnqBIo2cT9DGMhJSC
 3MGgKH7285YBhtQkw+Q4UTPND+IXwxOdrZOLtn3vmx3lB4lqyf9FVXRgLqYwkqv72yoF
 +x/1ZgdimTJ91KYe9VpqCebx1W/8eeute3Smgf9Z5pBsqpvCGuJ565XpdVx/t/E9LiXf
 XenX/b4Pg3tq06CggvU9Tq8dcEM+SxKfJdazyT1m9XzfcDq6NAHNaj4CjKYwi+jUYKf6
 /gIlHgNtFNdpkOZxl+dbFyAlua26Rc3cTIlULpjAhKEK4otPHmsqMFofy1PlB4lffCse
 4KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FNP+Epp9C+Xad29eJ3EUzzfvO6hA++LlLJlPjFJsYek=;
 b=ZRJvM+P34EqPlcSyKaeQOMnsOke12+hpHr/B3jWJZAx1GxVG3dyZsEB/16SGY4bRiw
 WmRSORo9oGzCdzvJMGYgxL0ZH5fyYQN+VYN+E9XmGM5uLD5qdeYwBFEnsBrg4AEGkZ2N
 UsldntPZZe4gu93bpYXczZfI1ydehOsRT3PVDEUrWGVkciI2my0nfUVYDa5Q2hBPHcbd
 5QhQuuPtIbWL4615uLFTBkudCSzEra3KngxBKaILFouu54AT6SzvjgBu2jiT/q9W7cRj
 tENzlY0GvzOsbSkSNpvsnpaBRAbKu3bNCGCZjM6PuJEY1UKUY+SySnmiqpTs2zBJmyBw
 DfCg==
X-Gm-Message-State: AOAM532PhRwnLJ5Op2J1F9eYhiWaBesyUqnoAcCdrmGW7WeWqmyXKHOi
 cDe36LArvmhoOPnsQnXKMA/kanByMfzrQHaeGoMUHQ==
X-Google-Smtp-Source: ABdhPJyGPQhnFNZ5SlxH0FSqCTno9wtNYxybejgUXH1vle427K4Fy2IAIEzv4qsDQYjdlRN0DSL2U089PuWjU1v6qw0=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr59505611edw.44.1609520727963; 
 Fri, 01 Jan 2021 09:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20201221144447.26161-1-pbonzini@redhat.com>
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 17:05:16 +0000
Message-ID: <CAFEAcA-h90X=-aXdgz=9YmQuSSa7xWvOU61thcYp+0p+y3ZGSg@mail.gmail.com>
Subject: Re: [PULL 00/55] Misc patches for 2020-12-21
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Mon, 21 Dec 2020 at 14:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5=
b8:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply=
-20201217-1' into staging (2020-12-18 11:12:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 16efbeeb765944fdda71862b40d60f0abeb1e200:
>
>   win32: drop fd registration to the main-loop on setting non-block (2020=
-12-21 13:53:24 +0100)
>
> ----------------------------------------------------------------
> From Alex's pull request:
> * improve cross-build KVM coverage
> * new --without-default-features configure flag
> * add __repr__ for ConsoleSocket for debugging
> * build tcg tests with -Werror
> * test 32 bit builds with fedora
> * remove last traces of debian9
> * hotfix for centos8 powertools repo
>
> * Move lots of feature detection code to meson (Alex, myself)
> * CFI and LTO support (Daniele)
> * test-char dangling pointer (Eduardo)
> * Build system and win32 fixes (Marc-Andr=C3=A9)
> * Initialization fixes (myself)
> * TCG include cleanup (Richard, myself)
> * x86 'int N' fix (Peter)

Fails to build, all hosts:

make: Entering directory '/home/ubuntu/qemu/build/all'
(cd /home/ubuntu/qemu && GIT=3D"git" ./scripts/git-submodule.sh update
ui/keycodemapdb tests/fp/berkeley-testfloat-3 te
sts/fp/berkeley-softfloat-3 meson dtc capstone slirp roms/SLOF)
config-host.mak is out-of-date, running configure
cross containers  no

NOTE: guest cross-compilers enabled: cc cc
/usr/bin/ninja -v build.ninja && touch build.ninja.stamp
[0/1] /usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/bui
ld/all --backend ninja
WARNING: Regenerating configuration from scratch.
Reason: Coredata file
'/home/ubuntu/qemu/build/all/meson-private/coredata.dat' references
functions or classes that d
on't exist. This probably means that it was generated with an old
version of meson.
The Meson build system
Version: 0.56.0
Source dir: /home/ubuntu/qemu
Build dir: /home/ubuntu/qemu/build/all
Build type: native build

../../meson.build:1:0: ERROR: Value "true" (of type "string") for
combo option "Localization of the GTK+ user interface" is not one of
the choices. Possible choices are (as string): "enabled", "disabled",
"auto".

A full log can be found at /home/ubuntu/qemu/build/all/meson-logs/meson-log=
.txt
FAILED: build.ninja
/usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
ninja: error: rebuilding 'build.ninja': subcommand failed
/usr/bin/ninja -v build.ninja && touch build.ninja.stamp
[0/1] /usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
WARNING: Regenerating configuration from scratch.
Reason: Coredata file
'/home/ubuntu/qemu/build/all/meson-private/coredata.dat' references
functions or classes that don't exist. This probably means that it was
generated with an old version of meson.
The Meson build system
Version: 0.56.0
Source dir: /home/ubuntu/qemu
Build dir: /home/ubuntu/qemu/build/all
Build type: native build

../../meson.build:1:0: ERROR: Value "true" (of type "string") for
combo option "Localization of the GTK+ user interface" is not one of
the choices. Possible choices are (as string): "enabled", "disabled",
"auto".

A full log can be found at /home/ubuntu/qemu/build/all/meson-logs/meson-log=
.txt
FAILED: build.ninja
/usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
ninja: error: rebuilding 'build.ninja': subcommand failed
/usr/bin/ninja -v     all | cat
make  -C pc-bios/s390-ccw/ V=3D"1" TARGET_DIR=3D"pc-bios/s390-ccw/" all
make[1]: Entering directory '/home/ubuntu/qemu/build/all/pc-bios/s390-ccw'
make[1]: Leaving directory '/home/ubuntu/qemu/build/all/pc-bios/s390-ccw'
[0/1] /usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
WARNING: Regenerating configuration from scratch.
Reason: Coredata file
'/home/ubuntu/qemu/build/all/meson-private/coredata.dat' references
functions or classes that don't exist. This probably means that it was
generated with an old version of meson.
The Meson build system
Version: 0.56.0
Source dir: /home/ubuntu/qemu
Build dir: /home/ubuntu/qemu/build/all
Build type: native build

../../meson.build:1:0: ERROR: Value "true" (of type "string") for
combo option "Localization of the GTK+ user interface" is not one of
the choices. Possible choices are (as string): "enabled", "disabled",
"auto".

A full log can be found at /home/ubuntu/qemu/build/all/meson-logs/meson-log=
.txt
ninja: error: rebuilding 'build.ninja': subcommand failed
FAILED: build.ninja
/usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
Makefile:172: recipe for target 'run-ninja' failed
make: *** [run-ninja] Error 1
make: Leaving directory '/home/ubuntu/qemu/build/all'


(why does it print the same failure three times rather than
stopping after the first one?)

thanks
-- PMM

