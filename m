Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C577054A3DF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:53:29 +0200 (CEST)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0vkG-0001L2-Tv
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vhm-0006hb-Pi
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vhi-0006O4-8A
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655171449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ytaHvhyYoeZqWjRtDF0Jy4Q8ZT6LJST05BANkovAJxs=;
 b=MzKVLiPuVKM+SRdnT0zUA69m3/8ZWoki5MqtzJliOvymIXV1rGj6V9wZ/Hb6EFLi6odzDj
 MUa7Hw6UEHlBnJt8KBh7BWrVKG4NvW0GF04mJfzcy6pkIwrGinNXQmKuRqIECVN2t4cg+N
 vDMCrWtQD9ebT+48GS+Hkt+lAe5hQDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-zbe5AQwxPvaIog51lH2pmw-1; Mon, 13 Jun 2022 21:50:46 -0400
X-MC-Unique: zbe5AQwxPvaIog51lH2pmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8813101AA47;
 Tue, 14 Jun 2022 01:50:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 412F62026D64;
 Tue, 14 Jun 2022 01:50:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 0/5] Update CentOS VM tests
Date: Mon, 13 Jun 2022 21:50:39 -0400
Message-Id: <20220614015044.2501806-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series attempts to revive the CentOS VM test targets, because=0D
both appear to be presently non-functional.=0D
=0D
I didn't quite get it working 100%, but I'm sending anyway to ask for=0D
help in solving straggler problems.=0D
=0D
My experience testing these is that CentOS 8 (x86_64) fails on test-qga:=0D
=0D
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=0D
stderr: ** ERROR:../src/tests/unit/test-qga.c:321:test_qga_get_fsinfo:=0D
assertion failed ret: GenericError realpath(\ "/sys/dev/block/252:1"):=0D
No such file or directory=0D
=0D
(test program exited with status code -6)=0D
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=0D
=0D
... I'm assuming this is something to do with the docker environment in=0D
which the test is being run, but I don't know exactly what right now.=0D
=0D
See the tail of this cover letter for more failures found when running=0D
the docker tests manually, outside of the VM.=0D
=0D
Meanwhile, the aarch64 VM appears to fail on a few different cases:=0D
=0D
  3/586 qemu:qtest+qtest-arm / qtest-arm/qom-test=0D
  ERROR          1022.98s   killed by signal 6 SIGABRT=0D
=0D
  1/586 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test=0D
  ERROR          1023.86s   killed by signal 6 SIGABRT=0D
=0D
 39/586 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp=0D
 ERROR          184.02s   killed by signal 6 SIGABRT=0D
=0D
 41/586 qemu:qtest+qtest-arm / qtest-arm/test-hmp=0D
 ERROR          178.55s   killed by signal 6 SIGABRT=0D
=0D
... Unfortunately, I wasn't able to rescue the log for this one in time,=0D
so I don't have record of the failure. I guess I'll run again overnight=0D
and see if I can capture it this time.=0D
=0D
Following up from the CentOS8 VM failure up top; running "make=0D
docker-test-block@centos8" on my development machine (not in any VM)=0D
*also* seems to fail, but in a manner differently than the same test=0D
step appears to from within the CentOS 8 Stream VM:=0D
=0D
Failures: 086 150 221 253=0D
Failed 4 of 61 iotests=0D
Test failed: iotests raw=0D
=0D
--- /tmp/qemu-test/src/tests/qemu-iotests/086.out=0D
+++ /tmp/qemu-test/086.out.bad=0D
@@ -9,9 +9,69 @@=0D
 wrote 1048576/1048576 bytes at offset 33554432=0D
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)=0D
     (0.00/100%)=0D
+    (1.56/100%)=0D
=0D
(And so on. This looks like a race.)=0D
=0D
--- /tmp/qemu-test/src/tests/qemu-iotests/150.out.raw=0D
+++ /tmp/qemu-test/150.out.bad=0D
@@ -3,7 +3,7 @@=0D
 =3D=3D=3D Mapping sparse conversion =3D=3D=3D=0D
=0D
 Offset          Length          File=0D
-0               0x1000          TEST_DIR/t.IMGFMT=0D
+0               0x100000        TEST_DIR/t.IMGFMT=0D
=0D
 =3D=3D=3D Mapping non-sparse conversion =3D=3D=3D=0D
=0D
--- /tmp/qemu-test/src/tests/qemu-iotests/221.out=0D
+++ /tmp/qemu-test/221.out.bad=0D
@@ -5,14 +5,13 @@=0D
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D65537=0D
 discard 65537/65537 bytes at offset 0=0D
 64.001 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)=0D
-[{ "start": 0, "length": 66048, "depth": 0, "present": true, "zero": true,=
 "data": false, "offset": OFFSET}]=0D
-[{ "start": 0, "length": 66048, "depth": 0, "present": true, "zero": true,=
 "data": false, "offset": OFFSET}]=0D
+[{ "start": 0, "length": 66048, "depth": 0, "present": true, "zero": false=
, "data": true, "offset": OFFSET}]=0D
+[{ "start": 0, "length": 65537, "depth": 0, "present": true, "zero": false=
, "data": true, "offset": OFFSET},=0D
+{ "start": 65537, "length": 511, "depth": 0, "present": true, "zero": true=
, "data": false, "offset": OFFSET}]=0D
 wrote 1/1 bytes at offset 65536=0D
 1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)=0D
-[{ "start": 0, "length": 65536, "depth": 0, "present": true, "zero": true,=
 "data": false, "offset": OFFSET},=0D
-{ "start": 65536, "length": 1, "depth": 0, "present": true, "zero": false,=
 "data": true, "offset": OFFSET},=0D
+[{ "start": 0, "length": 65537, "depth": 0, "present": true, "zero": false=
, "data": true, "offset": OFFSET},=0D
 { "start": 65537, "length": 511, "depth": 0, "present": true, "zero": true=
, "data": false, "offset": OFFSET}]=0D
-[{ "start": 0, "length": 65536, "depth": 0, "present": true, "zero": true,=
 "data": false, "offset": OFFSET},=0D
-{ "start": 65536, "length": 1, "depth": 0, "present": true, "zero": false,=
 "data": true, "offset": OFFSET},=0D
+[{ "start": 0, "length": 65537, "depth": 0, "present": true, "zero": false=
, "data": true, "offset": OFFSET},=0D
 { "start": 65537, "length": 511, "depth": 0, "present": true, "zero": true=
, "data": false, "offset": OFFSET}]=0D
 *** done=0D
=0D
--- /tmp/qemu-test/src/tests/qemu-iotests/253.out=0D
+++ /tmp/qemu-test/253.out.bad=0D
@@ -3,16 +3,10 @@=0D
 =3D=3D=3D Check mapping of unaligned raw image =3D=3D=3D=0D
=0D
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048575=0D
-[{ "start": 0, "length": 4096, "depth": 0, "present": true, "zero": false,=
 "data": true, "offset": OFFSET},=0D
-{ "start": 4096, "length": 1044480, "depth": 0, "present": true, "zero": t=
rue, "data": false, "offset": OFFSET}]=0D
-[{ "start": 0, "length": 4096, "depth": 0, "present": true, "zero": false,=
 "data": true, "offset": OFFSET},=0D
-{ "start": 4096, "length": 1044480, "depth": 0, "present": true, "zero": t=
rue, "data": false, "offset": OFFSET}]=0D
+[{ "start": 0, "length": 1048576, "depth": 0, "present": true, "zero": fal=
se, "data": true, "offset": OFFSET}]=0D
+[{ "start": 0, "length": 1048576, "depth": 0, "present": true, "zero": fal=
se, "data": true, "offset": OFFSET}]=0D
 wrote 65535/65535 bytes at offset 983040=0D
 63.999 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)=0D
-[{ "start": 0, "length": 4096, "depth": 0, "present": true, "zero": false,=
 "data": true, "offset": OFFSET},=0D
-{ "start": 4096, "length": 978944, "depth": 0, "present": true, "zero": tr=
ue, "data": false, "offset": OFFSET},=0D
-{ "start": 983040, "length": 65536, "depth": 0, "present": true, "zero": f=
alse, "data": true, "offset": OFFSET}]=0D
-[{ "start": 0, "length": 4096, "depth": 0, "present": true, "zero": false,=
 "data": true, "offset": OFFSET},=0D
-{ "start": 4096, "length": 978944, "depth": 0, "present": true, "zero": tr=
ue, "data": false, "offset": OFFSET},=0D
-{ "start": 983040, "length": 65536, "depth": 0, "present": true, "zero": f=
alse, "data": true, "offset": OFFSET}]=0D
+[{ "start": 0, "length": 1048576, "depth": 0, "present": true, "zero": fal=
se, "data": true, "offset": OFFSET}]=0D
+[{ "start": 0, "length": 1048576, "depth": 0, "present": true, "zero": fal=
se, "data": true, "offset": OFFSET}]=0D
 *** done=0D
=0D
... I'll work my way through trying to understand all of these failures,=0D
but any help would be appreciated to get these tests humming again.=0D
=0D
Meanwhile, VM tests that I have observed to be in non-working condition=0D
on latest upstream:=0D
=0D
- centos (x86_64) - CentOS 8 is EOL=0D
- centos.aarch64 - CentOS 8 is EOL, image is MIA=0D
- haiku.x86_64 - build issues=0D
- openbsd - virtio-net-failover tests hang indefinitely=0D
- ubuntu.aarch64 - Honestly, I don't recall. I'm re-running overnight to=0D
  find out.=0D
=0D
I'll continue to try and sort out the issues with all of the tests I am=0D
seeing fail and gather better diagnostics and intel for each.=0D
=0D
:(=0D
=0D
--js=0D
=0D
John Snow (5):=0D
  tests/qemu-iotests: hotfix for 307, 223 output=0D
  tests/qemu-iotests: skip 108 when FUSE is not loaded=0D
  tests/vm: use 'cp' instead of 'ln' for temporary vm images=0D
  tests/vm: switch CentOS 8 to CentOS 8 Stream=0D
  tests/vm: switch centos.aarch64 to CentOS 8 Stream=0D
=0D
 tests/qemu-iotests/108     |   6 ++=0D
 tests/qemu-iotests/223.out |   4 +-=0D
 tests/qemu-iotests/307.out |   4 +-=0D
 tests/vm/centos            |  10 +--=0D
 tests/vm/centos.aarch64    | 174 ++++++-------------------------------=0D
 5 files changed, 41 insertions(+), 157 deletions(-)=0D
=0D
-- =0D
2.34.3=0D
=0D


