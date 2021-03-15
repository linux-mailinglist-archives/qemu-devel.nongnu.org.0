Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6633C904
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:05:43 +0100 (CET)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvLK-0006tg-Jq
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLvKN-0006R5-Ks
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:04:43 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLvKK-0005wF-ER
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:04:43 -0400
Received: by mail-ed1-x530.google.com with SMTP id bx7so19151066edb.12
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZNLVo4soouhgIL2UFDF6ngScWf4b2AWgQYl8+xZ7YDY=;
 b=tNsy93PoOZVU0zami5QVvExcxT4SuazaR6mMsYn9MjZS4RCFOMzvWYw+Flj+NW95jo
 5JNFxPWyeBNB8kbIVEDeBSJhmn5SRgCW2s9oXlDx0Gs3jpOy7FDHUoaGaY6Vmu7eQzI3
 v+6Ja0rPWzAjYiT4QbmJgNW+CRELy1YBnfaTK6dunbNx6Xd6catJ2RICthG9z90+y3mM
 DHmelAWJjdZNM8yZZ7bJdcPtLuaLWcLzo+zTZH4SNDd0WvNMimmo8GFgFYPCMYAfkUk1
 ykGQjJj6ef4JC99GjBwuZmEz9bjhLlz7S/R0UCzSMfqKd1QpX1B2tt3Q9tZIjxYYFCF8
 Ie4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZNLVo4soouhgIL2UFDF6ngScWf4b2AWgQYl8+xZ7YDY=;
 b=uI96jdXkPNs6ghd6+H+mhW1M0jueHDIGWnJQkN+RpkhiBZmetvqKhMpbrM1vaD7ft+
 rmcRctDz8LWUFD33ECSu09qRFU7p3fwJpyz2o/2gOdAiHTO2c6fdfvL33Jd1h6Q338Uo
 pphtUKlfsFT0WiPW8/fkZfZUta/JNtNY7fQ6DVAvzRm9zNuODrthX2MgyI0TrO/f0JBi
 PSxmbDIYN/YMVspnToZFydWfcQ/YtcSsczzMVAqKEp1sADfov0l6Od7HBWqHSr59vMEJ
 EQETUiQJsBNFUJ2XXBAy6V1Z57wIbjpnF1fKZl51+sn9/oPSjeDdqO+EHneWVJ8vJcta
 5a3A==
X-Gm-Message-State: AOAM531b97aT4TxoNMBrjvsqBumOPsHpeKl6cJHpWRLA+BC6dszWbNp+
 4yeMIdWUGYGD7vkYse3g5g1LCf0JfRVhWv6DSeXf5g==
X-Google-Smtp-Source: ABdhPJzP32alcWp0QQkMVXw2RT45KkZYCQT3JbuZEOtj0R6RLexxFsEmCVZXAb+Ffsi/OHKeUkmrweUCCZf1dbVLzO0=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr31994488edr.52.1615845878693; 
 Mon, 15 Mar 2021 15:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210315173912.197857-1-pbonzini@redhat.com>
In-Reply-To: <20210315173912.197857-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 22:04:17 +0000
Message-ID: <CAFEAcA-XrOsZnUmxTCA+YbaL3rXxLMMmW5-bXJkRc0h_7v2E+A@mail.gmail.com>
Subject: Re: [PULL v2 0/5] Meson version update
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 17:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 51204c2f188ec1e2a38f14718d38a3772f850a4b:
>
>   Merge remote-tracking branch 'remotes/bkoppelmann2/tags/pull-tricore-20210314' into staging (2021-03-15 15:34:27 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream-meson-0.57
>
> for you to fetch changes up to 57d42c3b774d0716b9ad1a5a576480521edc7201:
>
>   hexagon: use env keyword argument to pass PYTHONPATH (2021-03-15 18:06:21 +0100)
>
> v1->v2: rebased
>
> ----------------------------------------------------------------
> Update Meson to 0.57.
>
> ----------------------------------------------------------------
> Paolo Bonzini (5):
>       hexagon: do not specify executables as inputs
>       hexagon: do not specify Python scripts as inputs
>       meson: bump submodule to 0.57.1
>       meson: switch minimum meson version to 0.57.0
>       hexagon: use env keyword argument to pass PYTHONPATH

Fails to build, on at least x86-64, s390, ppc, aarch32, aarch64
Linux hosts:

make: Entering directory '/home/ubuntu/qemu/build/all'
(GIT="git" "/home/ubuntu/qemu/scripts/git-submodule.sh" update
ui/keycodemapdb tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 meson dtc capstone slirp roms/SLOF)
config-host.mak is out-of-date, running configure
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
Version: 0.57.1
Source dir: /home/ubuntu/qemu
Build dir: /home/ubuntu/qemu/build/all
Build type: native build

../../meson.build:1:0: ERROR: Value "true" (of type "string") for
combo option "Localization of the GTK+ user interface" is not one of
the choices. Possible choices are (as string): "enabled", "disabled",
"auto".

A full log can be found at /home/ubuntu/qemu/build/all/meson-logs/meson-log.txt
FAILED: build.ninja
/usr/bin/python3 /home/ubuntu/qemu/meson/meson.py --internal
regenerate /home/ubuntu/qemu /home/ubuntu/qemu/build/all --backend
ninja
ninja: error: rebuilding 'build.ninja': subcommand failed
/usr/bin/ninja -v build.ninja && touch build.ninja.stamp

(repeats same error another 3 times)

thanks
-- PMM

