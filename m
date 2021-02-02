Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61130CF48
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:47:10 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74Rw-0007IB-RC
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l74Pb-0006jJ-Gl
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:44:43 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l74PZ-0005BV-Ax
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:44:43 -0500
Received: by mail-ej1-x62d.google.com with SMTP id rv9so32485214ejb.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 14:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f1alwEfU1EFJ4rmNU5K1RQNOIOQ0w4JX6mVL551L8lQ=;
 b=AnQPVbxktfBEaqiEoj7ku+g04EZq1TR9k7z2x//xalxGw5PgZ7FWB8ju7+vPc7oN09
 UlMG1ot2ISPCoIenIn4hrDBywzMI6G8NalxWq5xmCN6vUCWe+vlgpi3Gsq00eR1H7a93
 rDT0/6H5Ih8Z6F1TX4cUoSl51c4O+ux4kpQkivp+zjArujnhxLyrii6tnqrsRVhFW5cd
 YsEysl9/noogpRCxZ4XvswG4imI5ok8j4aquy9w+sXoC2znxRZT3P+8LleeleeZtXDcM
 yQLj9zRELZYBrkPicagru4yk6h96xWW/FzO0/qevXXaHD5XMsgNlkH07AaZgTIPgqVxA
 V3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f1alwEfU1EFJ4rmNU5K1RQNOIOQ0w4JX6mVL551L8lQ=;
 b=r9z6r/VMqD4ogjrRWiTWXOaJQqtdBI+4Auu2FieoHrUyf1jptWrdXHhOaQ37YMHAF2
 HKsxfFOJGwLPs3jXNcilJ1E1MoogzwV3ZXgn/MPaMKxp6JqE2h0KIBCEkld9DuElUk+L
 /S6M1vSWyPizzhRhdwyHDC2rIvL9OpV2hOz/1Zhuj+49roIvgzMCk6hUEbzSu0jOAjD4
 QwIqPn6YxesAfG0z4/Y0YhWWrOhlXdszKkQMxpQeYTXVbgXj1KnKvYgBncVZUaOSSTY7
 HewDL7vH0ys2NXWsDTws8PR6GT0vXNCYDGNasllmAU2z+RhyvWx/jKq24i7n5k/R8npb
 kmwA==
X-Gm-Message-State: AOAM530F1wUYZ8cVeMnfm5u7OEMBDQEOx90vPgcLGrlBb/usaCGpVjR4
 VawJAmp5NIJ3EKj7Y0HIp1lbEsvemT6sKhL36g8n1g==
X-Google-Smtp-Source: ABdhPJy6IYFwCFzQBH3+cbrNEI/R2IJrPehehMFJtdxah2mIa8FkygXl5oMhsZHB08J8NCPhO8+4rxLVpOSRcWKGZbQ=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr228348ejc.482.1612305879779; 
 Tue, 02 Feb 2021 14:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20210202151116.1573669-1-mst@redhat.com>
In-Reply-To: <20210202151116.1573669-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 22:44:28 +0000
Message-ID: <CAFEAcA8aZ6qTLjp00FyqYUwtqk0tAFYUpjW0FeepPMMVfOUbPg@mail.gmail.com>
Subject: Re: [PULL 0/9] pc,virtio: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 2 Feb 2021 at 15:12, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d60=
3f:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-0=
1-25-1' into staging (2021-01-26 09:51:02 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 737242ed5be0a7119aad55894148b3f5dec41200:
>
>   virtio-pmem: add trace events (2021-01-27 08:02:39 -0500)
>
> ----------------------------------------------------------------
> pc,virtio: fixes, features
>
> Fixes all over the place.
> Ability to control ACPI OEM ID's.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------
> Eugenio P=C3=A9rez (1):
>       virtio: Add corresponding memory_listener_unregister to unrealize
>
> Laurent Vivier (1):
>       virtio-mmio: fix guest kernel crash with SHM regions
>
> Marian Postevca (5):
>       tests/acpi: allow updates for expected data files
>       acpi: Permit OEM ID and OEM table ID fields to be changed
>       tests/acpi: add OEM ID and OEM TABLE ID test
>       tests/acpi: update expected data files
>       tests/acpi: disallow updates for expected data files
>
> Pankaj Gupta (1):
>       virtio-pmem: add trace events
>
> Stefano Garzarella (1):
>       virtio: move 'use-disabled-flag' property to hw_compat_4_2

Fails to build, aarch64:

In file included from /usr/include/string.h:495,
                 from /home/pm/qemu/include/qemu/osdep.h:87,
                 from ../../hw/arm/virt.c:31:
In function =E2=80=98strncpy=E2=80=99,
    inlined from =E2=80=98virt_set_oem_table_id=E2=80=99 at ../../hw/arm/vi=
rt.c:2197:5:
/usr/include/aarch64-linux-gnu/bits/string_fortified.h:106:10: error:
=E2=80=98__builtin_strncpy=E2=80=99 specified bound depends on the length o=
f the
source argument [-Werror=3Dstringop-overflow=3D]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__de=
st));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
../../hw/arm/virt.c: In function =E2=80=98virt_set_oem_table_id=E2=80=99:
../../hw/arm/virt.c:2190:18: note: length computed here
 2190 |     size_t len =3D strlen(value);
      |                  ^~~~~~~~~~~~~
In file included from /usr/include/string.h:495,
                 from /home/pm/qemu/include/qemu/osdep.h:87,
                 from ../../hw/arm/virt.c:31:
In function =E2=80=98strncpy=E2=80=99,
    inlined from =E2=80=98virt_set_oem_id=E2=80=99 at ../../hw/arm/virt.c:2=
176:5:
/usr/include/aarch64-linux-gnu/bits/string_fortified.h:106:10: error:
=E2=80=98__builtin_strncpy=E2=80=99 specified bound depends on the length o=
f the
source argument [-Werror=3Dstringop-overflow=3D]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__de=
st));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
../../hw/arm/virt.c: In function =E2=80=98virt_set_oem_id=E2=80=99:
../../hw/arm/virt.c:2168:18: note: length computed here
 2168 |     size_t len =3D strlen(value);
      |                  ^~~~~~~~~~~~~


Also iotest 030 failed on openbsd, which might be an intermittent rather
than anything to do with this patchset:

  TEST   iotest-qcow2: 030 [fail]
QEMU          --
"/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-system-aar=
ch64"
-nodefaults -di
splay none -accel qtest -machine virt
QEMU_IMG      --
"/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio thr
eads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- OpenBSD/amd64 openbsd.localnet 6.8
TEST_DIR      -- /home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/scrat=
ch
SOCK_DIR      -- /tmp/tmpu4236zgh
SOCKET_SCM_HELPER --
--- /home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/030.out
+++ 030.out.bad
@@ -1,5 +1,17 @@
-...........................
+.........F.................
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
fcntl(): Invalid argument
+FAIL: test_overlapping_5 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/030", line
424, in test_overlapping_5
+    self.assert_qmp(result, 'return', {})
+  File "/home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/iotests.py",
line 925, in assert_qmp
+    result =3D self.dictpath(d, path)
+  File "/home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/iotests.py",
line 899, in dictpath
+    self.fail(f'failed path traversal for "{path}" in "{d}"')
+AssertionError: failed path traversal for "return" in "{'error':
{'class': 'DeviceNotActive', 'desc': "Block job
 'drive0' not found"}}"
+
 ----------------------------------------------------------------------
 Ran 27 tests

-OK
+FAILED (failures=3D1, skipped=3D1)

-- PMM

