Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FC3747DF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 20:13:07 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leM17-0001KM-0Y
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 14:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leLwE-0000Zz-9b
 for qemu-devel@nongnu.org; Wed, 05 May 2021 14:07:58 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leLwB-0007FB-J6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 14:07:58 -0400
Received: by mail-ej1-x62a.google.com with SMTP id n2so4265885ejy.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DpD/X67yWsM9UX+/SSu5bmxAVEipxHjZgSCUIka1Cy8=;
 b=v06kZlGJ+SwC4ukV3/GVT+DBTGdtz+wK2/bTff9W5ZxLhaWogOSA6JnmBVJRE4zorC
 TrtLC5cyaS+4+iGTpvlzbOJhHClpnR/jyjLfXD/hAD/4We+ezcXZTFhZ3u2R3iBxOUqw
 lJS/ic/N20zSoE9m653NNQuD3P+qvHsEgzSHcWFXyhkFmMdSaP/KqJvNTGIVXInWhC1I
 5KPHxVV2l8w2ftb6cUodEGQMEmf+DbchL+of75+ku0npum4NHKH0XbqJhoBCHlwIkWWc
 i2DM8ZEQnf1NhWhKmnwY44Nse/Wmh6Feh6u/xT3xBPkOa8sjjD41pD7lZHwXFzSr7uYV
 XbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DpD/X67yWsM9UX+/SSu5bmxAVEipxHjZgSCUIka1Cy8=;
 b=HyGFZ+60KaEo8NwKKmnVJoKcFDJbTWU9Q/Kf8OHFDUN6V6dxMa/ysTK78PJEOTE624
 LMSb3L++iM2M6BiesqY+hGi+OIbujiaSyGR8NAB45hAYPouvj1tnRPlBto9Z6UdtkuvB
 n9A4+/W3DHKa/IgU2I6VfU9mcEnloLKJZdC9/5DRTkV0KEiGdKZb/KmHV9COju90jvgY
 DVBdKFWWX2QU7CozOfqPhjIaUF0H5wKHbmtbj2wUT5Y/EZYWPAsX01PlUuz1Kd6lUMK+
 cOD/OMqJISkHaklkMtwo58Th0PvTB6Y0aTDDahJ5H8a5mjvGUaw4S1GlYvSk4Gou8LF9
 +I/g==
X-Gm-Message-State: AOAM531Gtq8EwpSQwDsA7wn5ra81tVnmQKVNWsNngWxkw39Ylaso+G9j
 lVRlWu0I8TK3Pa1IiglBwggyV0AQRyQhNtV6XrMqBg==
X-Google-Smtp-Source: ABdhPJz5Ysd4riHTN56FjuGdnBynzI0q4WJB4xw+0oH9Ms5mtL6rfE/4IRQZSF7Oh86jSvkFkusY5SRyqMlWBD0mpW4=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr39679ejb.382.1620238072412; 
 Wed, 05 May 2021 11:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210503104456.1036472-1-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 19:06:45 +0100
Message-ID: <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Thomas Huth <thuth@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 11:45, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03
>
> for you to fetch changes up to 8f582fa290e5d5d0a00db23eaf1ab1bb3d3ae68d:
>
>   util/compatfd.c: Replaced a malloc call with g_malloc. (2021-05-03 11:40:40 +0200)
>
> ----------------------------------------------------------------
> * Removal of the deprecated moxie target
> * Replace some YAML anchors by "extends" in the Gitlab-CI
> * Some small improvements for using the qtests
> * Some other small misc patches

This fails to build as an incremental (not from-clean) build:

make: Entering directory '/home/ubuntu/qemu/build/all'
/usr/bin/ninja -v build.ninja && touch build.ninja.stamp
(GIT="git" "/home/ubuntu/qemu/scripts/git-submodule.sh" update
ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 meson dtc capstone slirp roms/SLOF)
[0/1] /usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
The Meson build system
Version: 0.55.3
Source dir: /home/ubuntu/qemu
Build dir: /home/ubuntu/qemu/build/all
Build type: native build
Project name: qemu
Project version: 6.0.50
C compiler for the host machine: cc (gcc 7.5.0 "cc (Ubuntu
7.5.0-3ubuntu1~18.04) 7.5.0")
C linker for the host machine: cc ld.bfd 2.30
Host machine cpu family: s390x
Host machine cpu: s390x
../../meson.build:10: WARNING: Module unstable-keyval has no backwards
or forwards compatibility and might not exist in future releases.
Program sh found: YES
Program python3 found: YES (/usr/bin/python3)
[...]
Checking for function "system" : YES (cached)
Checking for function "preadv" : YES (cached)
Program scripts/minikconf.py found: YES
Configuring aarch64-softmmu-config-target.h using configuration
Configuring aarch64-softmmu-config-devices.mak with command
Reading depfile:
/home/ubuntu/qemu/build/all/meson-private/aarch64-softmmu-config-devices.mak.d
Configuring aarch64-softmmu-config-devices.h using configuration
[...]
Reading depfile:
/home/ubuntu/qemu/build/all/meson-private/mipsel-softmmu-config-devices.mak.d
Configuring mipsel-softmmu-config-devices.h using configuration

../../meson.build:1291:2: ERROR: Failed to load
/home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak: [Errno 2]
No such file or directory:
'/home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak'

A full log can be found at /home/ubuntu/qemu/build/all/meson-logs/meson-log.txt
FAILED: build.ninja
/usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
ninja: error: rebuilding 'build.ninja': subcommand failed
/usr/bin/ninja -d keepdepfile -v     all | cat
make  -C pc-bios/s390-ccw/ V="1" TARGET_DIR="pc-bios/s390-ccw/" all
make[1]: Entering directory '/home/ubuntu/qemu/build/all/pc-bios/s390-ccw'
make[1]: Leaving directory '/home/ubuntu/qemu/build/all/pc-bios/s390-ccw'
[0/1] /usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
[...]
Reading depfile:
/home/ubuntu/qemu/build/all/meson-private/mipsel-softmmu-config-devices.mak.d
Configuring mipsel-softmmu-config-devices.h using configuration

../../meson.build:1291:2: ERROR: Failed to load
/home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak: [Errno 2]
No such file or directory:
'/home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak'

A full log can be found at /home/ubuntu/qemu/build/all/meson-logs/meson-log.txt
FAILED: build.ninja
/usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
ninja: error: rebuilding 'build.ninja': subcommand failed
Makefile:152: recipe for target 'run-ninja' failed
make: *** [run-ninja] Error 1
make: Leaving directory '/home/ubuntu/qemu/build/all'


thanks
-- PMM

