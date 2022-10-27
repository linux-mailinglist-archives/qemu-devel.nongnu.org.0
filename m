Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50460FB2C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:08:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo4TL-00081S-5H; Thu, 27 Oct 2022 11:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oo4TH-0007fz-37; Thu, 27 Oct 2022 11:07:03 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oo4TC-00017d-98; Thu, 27 Oct 2022 11:07:02 -0400
Received: by mail-qv1-xf30.google.com with SMTP id j6so1515285qvn.12;
 Thu, 27 Oct 2022 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqsUH/ZbJNlB7tkIQ5206kiYeOa3soWa9T8wywPkkDk=;
 b=ERcZJ/6n2mWvI/MZcLZNKQH6wkwqD9OE6OZeSyWO0wz7Jer5AJruDuf8Mf+boYQ8Pg
 FEr0zFn54Ys2aNEJXcUmkPQ2OEvCn9U3UGlM1tENHW4i1ClAI3U3Dj+RfLz/FrljLNd2
 H5zdkp5/TdP5vbZZcCQzBTkkzoE4+ehL6UCpEZwpevBY81WwNPXwigQPQpVB3+PWe4VK
 ih/7fhdS40qa1jzCWHgb2/Wmc7cGDEkgJD4M5bRvf06nuNUgXi+hsoJJrDKTLA8c0ITa
 1rhkS2SIGHeIPOgGvvzfEJ5BEwXWKR0imETR3p8UgOz5C/qaqykJrDDbOTtRsqpExNdT
 0/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqsUH/ZbJNlB7tkIQ5206kiYeOa3soWa9T8wywPkkDk=;
 b=AVzrFJy+A/1kyNuYmUxRgeQnCYq5VWnxvp+FJQT6Lpq85LPL97r9t4gkScdttFhYX+
 gwizVa5afdWdLCXETTSqfH8YuY8TvJHxrE87v0F2RcHzmyuhoo3/vBjDHt4JGnR7qXeM
 1UzqwsDDcxWEFCvxhq2OEzt7MboQ/qh3IjnEa/b0BIukWFbMMgeFSUzhmGt0WV1rfTLi
 K6+8aWoi+pXMq5yzdDj/+JFjsekdLtwB6s0RHb5aXbvl0Ao3RIFnKcVncGsS/dV2jxVp
 7zpyocX01pdjah8gML9nMZAs1/v5T8QHToWTalYfT7ejg/hZCI9JW98uCW2cd0nw7JVt
 uAfA==
X-Gm-Message-State: ACrzQf2VACzBpjkR5MfM/vRf8oQqbCCOe1SJnzxmD/Jla2B72sL/Fltf
 QjcGOkfwFcG/tU7y7d0qRTYTimNSXjmeHLiQ5FM=
X-Google-Smtp-Source: AMsMyM5mKE4eaLEWih7skwWOUzxQVbDVxxbhKFOymfcf3++uJP3BfkGfSAnrvXtBEkd/Wfhv6o/xbw1oEJSKSQxQcio=
X-Received: by 2002:a05:6214:2b06:b0:4bb:5716:d1c3 with SMTP id
 jx6-20020a0562142b0600b004bb5716d1c3mr26786953qvb.85.1666883216493; Thu, 27
 Oct 2022 08:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 27 Oct 2022 23:06:44 +0800
Message-ID: <CAEUhbmVfPzw0R3GgitUGVTTOA9GvHNRRv40FTGvW5352w+rsHA@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] testing/next (docker, avocado, s390x,
 MAINTAINERS)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com, Cornelia Huck <cohuck@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex,

On Thu, Oct 20, 2022 at 9:53 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Hi,
>
> The testing/next changes have accumulated a few more fixes since the
> last posting. Including:
>
>   - a bunch of Bin Meng's test cleanups for windows
>   - some avocado test fixes and tweaks
>   - disabling an sh4 avocado test (possibly a missed recent intermittent =
regression)
>   - enabling some sh4 check-tcg tests (now bugs are fixed)
>   - a minor excursion into the s390 translator
>
> The following still need review:
>
>   - target/s390x: fake instruction loading when handling 'ex'
>   - target/s390x: don't probe next pc for EXecuted insns
>   - target/s390x: don't use ld_code2 to probe next pc
>   - tests/tcg: re-enable threadcount for sh4
>   - tests/tcg: re-enable linux-test for sh4
>   - tests/avocado: disable sh4 rd2 tests on Gitlab
>   - tests/avocado: set -machine none for userfwd and vnc tests
>   - MAINTAINERS: fix-up for check-tcg Makefile changes
>   - MAINTAINERS: add features_to_c.sh to gdbstub files
>   - MAINTAINERS: add entries for the key build bits
>   - tests/tcg: use regular semihosting for nios2-softmmu
>   - tests/avocado: extend the timeout for x86_64 tcg tests
>   - configure: fix the --enable-static --disable-pie case
>   - configure: don't enable cross compilers unless in target_list
>   - tests/docker: update fedora-win[32|64]-cross with lcitool
>
> Alex Benn=C3=A9e (16):
>   tests/docker: update fedora-win[32|64]-cross with lcitool
>   tests/docker: update test-mingw to run single build
>   configure: don't enable cross compilers unless in target_list
>   configure: fix the --enable-static --disable-pie case
>   tests/avocado: extend the timeout for x86_64 tcg tests
>   tests/tcg: use regular semihosting for nios2-softmmu
>   MAINTAINERS: add entries for the key build bits
>   MAINTAINERS: add features_to_c.sh to gdbstub files
>   MAINTAINERS: fix-up for check-tcg Makefile changes
>   tests/avocado: set -machine none for userfwd and vnc tests
>   tests/avocado: disable sh4 rd2 tests on Gitlab
>   tests/tcg: re-enable linux-test for sh4
>   tests/tcg: re-enable threadcount for sh4
>   target/s390x: don't use ld_code2 to probe next pc
>   target/s390x: don't probe next pc for EXecuted insns
>   target/s390x: fake instruction loading when handling 'ex'
>
> Anton Johansson (2):
>   tests/docker: Add flex/bison to `debian-all-test`
>   tests/docker: Add flex/bison to `debian-hexagon-cross`
>
> Bin Meng (6):
>   semihosting/arm-compat-semi: Avoid using hardcoded /tmp
>   tcg: Avoid using hardcoded /tmp
>   util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
>     temporary files
>   block/vvfat: Unify the mkdir() call
>   fsdev/virtfs-proxy-helper: Use g_mkdir()
>   hw/usb: dev-mtp: Use g_mkdir()
>
> Paolo Bonzini (1):
>   tests/tcg: include CONFIG_PLUGIN in config-host.mak
>
> Peter Maydell (1):
>   tests/avocado: raspi2_initrd: Wait for guest shutdown message before
>     stopping
>

Will the PR be sent soon? Thanks!

Regards,
Bin

