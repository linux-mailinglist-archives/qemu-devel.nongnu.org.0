Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576D38F25C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:38:09 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEWm-00030U-7w
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE1f-0003Ua-Lv
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:59 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE1b-0004Tu-1m
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:59 -0400
Received: by mail-ej1-x633.google.com with SMTP id l1so42896594ejb.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NRZ2lJLGVwsTq60JF9ixCxISriWyDA34H/1+cYHr9+0=;
 b=nf5VBR+CqvCB/G1HKSWF/MGkqG102mRB1KQaM2BTZuI7b3q+aydLv6dbiDlVLkP/si
 qXwK1Dqs3QcR3xcS7uOyc7gw9k3Kpxkl/9H0ep1p8Iqz/sxopa++Q0mL34u+VGF5LHai
 jTCYpdIIEXNhPeZMcD65EZhpJPMdPGtvm3OgtxJebcrd09NfSnk+LDQ7lUCkuBToLCx3
 kfyH+BdCDVdX4zeEBVBukDjPJuhb13IIuqReipec+xGeJYAi9t3F52DpXD/j0V2hoT+H
 9aU63DdAv/kKtxn/8ioKTgxwgZMnhIqxrz3xsjcJEvJCv2VyH1MNvyyx+0EMmZ716dfZ
 3kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NRZ2lJLGVwsTq60JF9ixCxISriWyDA34H/1+cYHr9+0=;
 b=nuv0HpniEFzqwQKOWWAM7hnqFzEwvKbNuxtzW75fvJIfhAD4h/gmSVWKXi9O7jvdEJ
 uBrBWeobm+OsHbEvGWKe3wGhy8hnyETWN02oyh35jEbNsulblpdYN5gwkJObg8UYQEsQ
 z0mUyLK7sh6dXlfMRr2ANmT/MOPgB2TJe3o/JAf9zu8Z1TwAh+98Ml2kRDMyQWlgAv7z
 D6IPE1H+O+Nn+hbPoFnu4ZmnB9hpVWLAHea3y6JA+m6gf2pjjp+FLdWxDpiUIddFvKSj
 6tju50vzBUJPpLeqgqo/x4zmfH4a4tyWZ2BSZYDWqywNitCgO2kZlOKWclPRJitUdqQ3
 DjPw==
X-Gm-Message-State: AOAM533vEcRzwa6ejsbrkwESnTkZfqTdXRg9WSUPz3wdZc9SjSF+LRvS
 VYvIir2Vcb0F9Ny3A7kWOe+Pg8Z69Bu4mfshhlYCJg==
X-Google-Smtp-Source: ABdhPJxdu5sTi6+BbwjtLu2u+OQSgTNJb0NSfdPBAKjkmMB66eEluCK9Hf0Rn2aeuJrQud+5g/4IbBmVqGGc5UoXGlo=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr24470754ejb.56.1621875953313; 
 Mon, 24 May 2021 10:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210503105747.703149-1-f4bug@amsat.org>
 <e8ed8f29-ba55-0325-6916-faf0e3bcc67d@amsat.org>
 <CAFEAcA87HWGd9Kuqzq9pzNNyF+tQ7E8buCSZkqA7k-6d=GOPgg@mail.gmail.com>
In-Reply-To: <CAFEAcA87HWGd9Kuqzq9pzNNyF+tQ7E8buCSZkqA7k-6d=GOPgg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 18:05:30 +0100
Message-ID: <CAFEAcA_wJm9n14a6SO_WGUo1nRtd5yrj+voHtmjF0x7DrsFciQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 at 13:07, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 11 May 2021 at 04:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> >
> > Hi Peter,
> >
> > Can this patch go via your qemu-arm tree (it is reviewed)?
>
> Sure.
>
> Applied to target-arm.next, thanks.

This breaks 'make check' because some bits of the test suite are still
using the old machine names. The error message is a bit opaque:

MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=3D./qemu-img
G_TEST_DBUS_DAEMON=3D/home/petmay01/linaro/qemu-from-laptop/qemu/tests/dbus=
-vmstate-daemon.sh
QTEST_QEMU_BINARY=3D./qemu-system-arm
QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon
tests/qtest/boot-serial-test --tap -k
qemu-system-arm: -bios /tmp/qtest-boot-serial-c3pthL6: unsupported machine =
type
Use -machine help to list supported machines
socket_accept failed: Resource temporarily unavailable
**
ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
ERROR qtest-arm/boot-serial-test - Bail out!
ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
Makefile.mtest:80: recipe for target 'run-test-8' failed
make: *** [run-test-8] Error 1
make: Leaving directory
'/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'

"git grep raspi[23] tests" suggests there may be other uses beyond just
the boot-serial-test one.

Dropped.

thanks
-- PMM

