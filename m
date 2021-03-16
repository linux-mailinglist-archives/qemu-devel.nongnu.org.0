Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D77D33D874
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:58:39 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMC5e-0008CE-8Y
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lMC1J-00042V-Or; Tue, 16 Mar 2021 11:54:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lMC1I-00059I-0S; Tue, 16 Mar 2021 11:54:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id a8so10637470plp.13;
 Tue, 16 Mar 2021 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08EwWD/Ek7Jj6/Lg5a1dq5ApcS1dBWNLc4XNCZ1UuJM=;
 b=AN/9N9Z07W/Os3B3UiF7DkaAZFJkubKkGTAyAJU2FM903DnPnC058+7JHA75J9ZwAx
 xHt7V+Y/vliJJoNjQNuOT7ZJynYkyfImIlwDe5M50BukF0fA0JgOfrQYvyM49SYdJ0UT
 JT9hThVdtSRqOxjVcLGhiO+OdXrNbvMPCpX5zxbWb9w9tGlPB7CifQDKqScqXYSw2vfx
 K/G8v5Igvq9HTl3G2e7YP5njer58JAJsSQ0MdxP1Kcr9nsGa+bl3XgXRHKjnYbDk4fDX
 T9J76EkKx3bYntopGufFGcgjsV3ufksCF/5n+x+6q+sOKdJFfdsa3lJDFbLcs7zPQv6W
 01Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08EwWD/Ek7Jj6/Lg5a1dq5ApcS1dBWNLc4XNCZ1UuJM=;
 b=f79vB/JH49oh0ESJKaxik38MBu9bi+kmt9nyN7RuT7ObZiHt90Kjz9LaTYpEVQt1NJ
 iVr50szS7SNCA+X7NgNUX9yRz2BgSMdNRzzWOE69plPpxoCavr7z9WfZeAknXMnXBqiv
 /yzOGVYLodvdu+b7Nt7aXzlZQDZe4MQuW0aoxhKotxDRVbf0h9r/yubkLhJVhsgpwgRZ
 sh7kCTPxw278fcEX+XYN1Gvvq9Vzo2koAmftZbeqPhu0ZeupoDEBLR6it+BXZr1a55cT
 G0RLL9okfbgLdIhHpOmJJ4JeCnD4w+tbsGMUgE4TIXYY0fQLop5pwumVRKRBDyCQqbDH
 Zk+w==
X-Gm-Message-State: AOAM533PqfXjkmWcGmYK17YUDgd8Hq+ojZZ4OO1j8tEggqyZfmaoHWFS
 +CImsVcu/TpzGlSJdTP8jpfrEkniTU7yjxJQISk=
X-Google-Smtp-Source: ABdhPJz9ArabcBOzXraTfCBKfHXRl+YMCVLc/hcztypHrumD5fjxNCiIT9+x791ZsZhntuNp+T1CBiOOwPwxUHk7V8s=
X-Received: by 2002:a17:90a:cb12:: with SMTP id
 z18mr313250pjt.132.1615910044436; 
 Tue, 16 Mar 2021 08:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210315123520.118752-1-kwolf@redhat.com>
 <CAFEAcA8ckSBYcONgQKXeWnSwL9inGAchUAAwy9=xcb2HEP=qVQ@mail.gmail.com>
 <YFDCSMHXeP/qbeUZ@merkur.fritz.box>
In-Reply-To: <YFDCSMHXeP/qbeUZ@merkur.fritz.box>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 16 Mar 2021 15:53:53 +0000
Message-ID: <CAJSP0QUwe1h6imCR+vBG2ybMWhQLdLwQ8iWDjZCVbd-H2NPvLA@mail.gmail.com>
Subject: Re: [PULL v2 00/42] Block layer patches and object-add QAPIfication
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=stefanha@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 2:36 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 16.03.2021 um 14:17 hat Peter Maydell geschrieben:
> > On Mon, 15 Mar 2021 at 12:35, Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
> > >
> > >   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> > >
> > > for you to fetch changes up to 078ee48ef7d172df1b3ad020255d1eb6beda2daf:
> > >
> > >   qom: Support JSON in HMP object_add and tools --object (2021-03-15 13:04:27 +0100)
> > >
> > > ----------------------------------------------------------------
> > > Block layer patches and object-add QAPIfication
> > >
> > > - QAPIfy object-add and --object for tools (keyval and JSON support)
> > > - Add vhost-user-blk-test
> > > - stream: Fail gracefully if permission is denied
> > > - storage-daemon: Fix crash on quit when job is still running
> > > - curl: Fix use after free
> > > - char: Deprecate backend aliases, fix QMP query-chardev-backends
> > > - Fix image creation option defaults that exist in both the format and
> > >   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
> > >   default was incorrectly applied to the rbd layer)
> > >
> > > ----------------------------------------------------------------
> >
> > Fails 'make check' on x86-64 linux:
> >
> > PASS 61 qtest-x86_64/qos-test
> > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/config
> > PASS 62 qtest-x86_64/qos-test
> > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/basic
> > PASS 63 qtest-x86_64/qos-test
> > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/resize
> > **
> > ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_no_isr:
> > assertion failed: (!d->bus->get_queue_isr_status(d, vq))
> > ERROR qtest-x86_64/qos-test - Bail out!
> > ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_no_isr:
> > assertion failed: (!d->bus->get_queue_isr_status(d, vq))
> > Makefile.mtest:1008: recipe for target 'run-test-124' failed
> > make: *** [run-test-124] Error 1
>
> It didn't fail to me, so the condition must be a little more specific
> than just x86_64 Linux.
>
> Stefan, can you have a look? I may have to drop these patches again.

This issue is related to the vhost-user-blk test case and the patches
can be dropped.

Stefan

