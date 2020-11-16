Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16162B45BE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:21:07 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kefNS-0007Pz-Qo
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kefLs-0006Oc-6O
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:19:29 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kefLp-0001ww-Mb
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:19:27 -0500
Received: by mail-ed1-x542.google.com with SMTP id d18so5977948edt.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 06:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=58trH8/5emAjVKNMuJWU8160nkvAP0ftbJnBXwOXFGU=;
 b=y/w2ZoyaE+rYsWkFcXDHPNDD4t0bZKs9eSxOg0M4YuVkmTdoxbUmcIHKJXnChFhUHF
 mcVbPZNacwGgVymW45ehzdESdA2ElP4Gt29zww0S1itJuuZ0WEoJ1RfamDQLKkKbjnjP
 YVR6Mnkq+ROY876fUZ3CxX2eiV9uYhM+LF3+CENA4x7L9zDjotDqlA8qwGTWPgtSkyTZ
 VV87jyHROWwoNdgfvOfH9BKBLTD6rr2wK9NRgqVK2oe3Vg04KCo4SWIqjVLTRwMHNp0d
 uVXFWqUsHkYEI9gbe7Pk/m5NuBrRVtqXRM4Xc1dsSP/ZFDwXfpUGWv88RtlI+SlYgrDm
 QhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=58trH8/5emAjVKNMuJWU8160nkvAP0ftbJnBXwOXFGU=;
 b=E25M61ILPELXfoNkWUFHgzzNVxUewcJcrDd6aOeJKWplIwXKqPrGOz0coR5f0Nsu8Q
 xh6Twkb9GL5lFAthiuuOQ4jZ7JOE4bgfkCscNyoEKqiKZyBt6aKR38+ZqRNZDt8qrjwN
 Roq63I2LLC07tag0SithYQyWASMimovXGkSv0DxWXIXzroU3NBdUSdqVKoBOYNvWEf74
 NXHmxfgOVhfvxwl0nNP1fHKJ7s5QGzCTb8fXrk1e9EdXEM4NBHbVn9s+IuTl8BA57tuG
 o639iatla3O+j2W5h2Uu86da41OH1pknr1Nf+LDxKBywSmrt0SLmDpq/mcvaxbw49Jdg
 go9Q==
X-Gm-Message-State: AOAM533P4KDD0DlrBHlTQyLK9nwKAEDHdq5bEkeu3ew9YESqoJrT1Fud
 3tmdqUE53T7BXEsZqoh9+KYxiLyt62lI2abisH/YQQ==
X-Google-Smtp-Source: ABdhPJzYmVZ/KKLscXoTjTXuWd7u9J40/ZVB9tG4O/RgGTiG+Nxgj7WdiLCDh7j49/+hp2rWtawS5inMbcjgzVTls1U=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr16255400edb.100.1605536362359; 
 Mon, 16 Nov 2020 06:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20201115220740.488850-1-mst@redhat.com>
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 14:19:11 +0000
Message-ID: <CAFEAcA9JdRPcEcKTqCHOMSeKpduy6jWS=kMa2sZCxa1BjGTzYg@mail.gmail.com>
Subject: Re: [PULL 00/17] pc,vhost: fixes, new test
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Sun, 15 Nov 2020 at 22:27, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:
>
>   Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to fe8d9946228d4df6c020f2cb38b6ac08981727cf:
>
>   vhost-user-blk/scsi: Fix broken error handling for socket call (2020-11-15 17:05:47 -0500)
>
> ----------------------------------------------------------------
> pc,vhost: fixes, new test
>
> Lots of fixes all over the place.
> A new test case which seems like a good idea even at
> this late stage: can't break things and will make
> sure we don't introduce regressions.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------

Something in this seems to cause hangs in 'make check' on
my x86-64 Linux box: sample 'ps wafux' output:

petmay01 30354  0.0  0.0  17392  9348 ?        S    13:40   0:00
                   \_ make --output-sync -C build/a
ll check V=1 -j8
petmay01  7093  0.0  0.0  13916  3608 ?        S    13:41   0:00
                       \_ bash -o pipefail -c echo
'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386 tests/qtest/qos-test --tap -k' &&
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386 tests/qtest/qos-test --tap -k <
/dev/null | ./scripts/tap-driver.pl --test-name="qtest-i386/qos-test"
petmay01  7095  0.0  0.0  37764 11744 ?        S    13:41   0:00
                       |   \_ perl ./scripts/tap-driver.pl
--test-name=qtest-i386/qos-test
petmay01 14023  0.0  0.0  13916  3568 ?        S    13:41   0:00
                       \_ bash -o pipefail -c echo
'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-ppc64 tests/qtest/qos-test --tap -k'
&& MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-ppc64 tests/qtest/qos-test --tap -k <
/dev/null | ./scripts/tap-driver.pl --test-name="qtest-ppc64/qos-test"
petmay01 14025  0.0  0.0  37828 11760 ?        S    13:41   0:00
                       |   \_ perl ./scripts/tap-driver.pl
--test-name=qtest-ppc64/qos-test
petmay01 22886  0.0  0.0  13916  3716 ?        S    13:42   0:00
                       \_ bash -o pipefail -c echo
'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test --tap -k'
&& MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test --tap -k <
/dev/null | ./scripts/tap-driver.pl
--test-name="qtest-x86_64/qos-test"
petmay01 22888  0.0  0.0  37764 11836 ?        S    13:42   0:00
                           \_ perl ./scripts/tap-driver.pl
--test-name=qtest-x86_64/qos-test


Something somewhere is also apparently leaving a qemu-storage-daemon
process running on bigendian hosts only (?): I see this on my s390x
test box:

ubuntu   26700  0.0  0.5 330776 21552 ?        Sl   08:40   0:00
./storage-daemon/qemu-storage-daemon --chardev
socket,id=qmp,fd=11,server,nowait --monitor chardev=qmp --blockdev
driver=file,node-name=disk0,filename=qtest.V5gfPm --export
type=vhost-user-blk,id=disk0,addr.type=fd,addr.str=16,node-name=disk0,writable=on,num-queues=8
--blockdev driver=file,node-name=disk1,filename=qtest.JM24xB --export
type=vhost-user-blk,id=disk1,addr.type=fd,addr.str=17,node-name=disk1,writable=on,num-queues=8

and similarly on the ppc64be box (but not on other machines).
This seems to be associated with this test failure:

ERROR:../../tests/qtest/vhost-user-blk-test.c:738:multiqueue:
assertion failed (num_queues == 8): (2048 == 8)
ERROR qtest-i386/qos-test - Bail out!
ERROR:../../tests/qtest/vhost-user-blk-test.c:738:multiqueue:
assertion failed (num_queues == 8): (2048 == 8)
Makefile.mtest:1857: recipe for target 'run-test-230' failed

which looks suspiciously like an endianness bug somewhere.

Ideally if the test case starts external processes it should
make sure they're cleaned up even if the test fails.

thanks
-- PMM

