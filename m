Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D4E339620
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:19:56 +0100 (CET)
Received: from localhost ([::1]:44900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmOB-00079n-U4
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWN-0007gv-5E
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWG-0000hO-WD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2Zx8wUOM1vg07TLznlF4gVeNMs8f/3T+XnOIogA2lc=;
 b=C2u+eG9PuvMkqwHAePaSf5xxBEm0iFn5Gm4RnL3iEN+2JTFnipNEsOJlm5rTKg3/seVgJE
 Himc9V6vx1IeQubZfx4FaVGUf/1q4rSLF4ZdfKhu4NljnfxHKaztOka5LVbTq8cdTYeJ/m
 7XsmB9wEP3HbcAfclllQ5i+6fiPU5Sk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-Z14HnrxMOKy48Vz1l9GFnA-1; Fri, 12 Mar 2021 12:24:02 -0500
X-MC-Unique: Z14HnrxMOKy48Vz1l9GFnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E409100C664;
 Fri, 12 Mar 2021 17:24:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A71E19744;
 Fri, 12 Mar 2021 17:23:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/9] tests: Move unit tests into a separate directory
Date: Fri, 12 Mar 2021 18:23:48 +0100
Message-Id: <20210312172356.968219-2-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
References: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main tests directory still looks very crowded, and it's not
clear which files are part of a unit tests and which belong to
a different test subsystem. Let's clean up the mess and move the
unit tests to a separate directory.

Message-Id: <20210310063314.1049838-1-thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                                   |  68 +++----
 tests/meson.build                             | 182 +----------------
 tests/{ => unit}/check-block-qdict.c          |   0
 tests/{ => unit}/check-qdict.c                |   0
 tests/{ => unit}/check-qjson.c                |   0
 tests/{ => unit}/check-qlist.c                |   0
 tests/{ => unit}/check-qlit.c                 |   0
 tests/{ => unit}/check-qnull.c                |   0
 tests/{ => unit}/check-qnum.c                 |   0
 tests/{ => unit}/check-qobject.c              |   0
 tests/{ => unit}/check-qom-interface.c        |   0
 tests/{ => unit}/check-qom-proplist.c         |   0
 tests/{ => unit}/check-qstring.c              |   0
 tests/{ => unit}/crypto-tls-psk-helpers.c     |   0
 tests/{ => unit}/crypto-tls-psk-helpers.h     |   0
 tests/{ => unit}/crypto-tls-x509-helpers.c    |   0
 tests/{ => unit}/crypto-tls-x509-helpers.h    |   0
 tests/{ => unit}/io-channel-helpers.c         |   0
 tests/{ => unit}/io-channel-helpers.h         |   0
 tests/{ => unit}/iothread.c                   |   0
 tests/{ => unit}/iothread.h                   |   0
 tests/unit/meson.build                        | 184 ++++++++++++++++++
 tests/{ => unit}/pkix_asn1_tab.c              |   2 +-
 tests/{ => unit}/ptimer-test-stubs.c          |   0
 tests/{ => unit}/ptimer-test.c                |   0
 tests/{ => unit}/ptimer-test.h                |   0
 tests/{ => unit}/rcutorture.c                 |   0
 tests/{ => unit}/socket-helpers.c             |   0
 tests/{ => unit}/socket-helpers.h             |   0
 tests/{ => unit}/test-aio-multithread.c       |   0
 tests/{ => unit}/test-aio.c                   |   0
 tests/{ => unit}/test-authz-list.c            |   0
 tests/{ => unit}/test-authz-listfile.c        |   0
 tests/{ => unit}/test-authz-pam.c             |   0
 tests/{ => unit}/test-authz-simple.c          |   0
 tests/{ => unit}/test-base64.c                |   0
 tests/{ => unit}/test-bdrv-drain.c            |   0
 tests/{ => unit}/test-bdrv-graph-mod.c        |   0
 tests/{ => unit}/test-bitcnt.c                |   0
 tests/{ => unit}/test-bitmap.c                |   0
 tests/{ => unit}/test-bitops.c                |   0
 tests/{ => unit}/test-block-backend.c         |   0
 tests/{ => unit}/test-block-iothread.c        |   0
 tests/{ => unit}/test-blockjob-txn.c          |   0
 tests/{ => unit}/test-blockjob.c              |   0
 tests/{ => unit}/test-bufferiszero.c          |   0
 tests/{ => unit}/test-char.c                  |   0
 tests/{ => unit}/test-clone-visitor.c         |   0
 tests/{ => unit}/test-coroutine.c             |   0
 tests/{ => unit}/test-crypto-afsplit.c        |   0
 tests/{ => unit}/test-crypto-block.c          |   0
 tests/{ => unit}/test-crypto-cipher.c         |   0
 tests/{ => unit}/test-crypto-hash.c           |   0
 tests/{ => unit}/test-crypto-hmac.c           |   0
 tests/{ => unit}/test-crypto-ivgen.c          |   0
 tests/{ => unit}/test-crypto-pbkdf.c          |   0
 tests/{ => unit}/test-crypto-secret.c         |   0
 tests/{ => unit}/test-crypto-tlscredsx509.c   |   0
 tests/{ => unit}/test-crypto-tlssession.c     |   0
 tests/{ => unit}/test-crypto-xts.c            |   0
 tests/{ => unit}/test-cutils.c                |   0
 tests/{ => unit}/test-fdmon-epoll.c           |   0
 tests/{ => unit}/test-hbitmap.c               |   0
 tests/{ => unit}/test-image-locking.c         |   0
 tests/{ => unit}/test-int128.c                |   0
 tests/{ => unit}/test-io-channel-buffer.c     |   0
 tests/{ => unit}/test-io-channel-command.c    |   0
 tests/{ => unit}/test-io-channel-file.c       |   0
 tests/{ => unit}/test-io-channel-socket.c     |   0
 tests/{ => unit}/test-io-channel-tls.c        |   0
 tests/{ => unit}/test-io-task.c               |   0
 tests/{ => unit}/test-iov.c                   |   0
 tests/{ => unit}/test-keyval.c                |   0
 tests/{ => unit}/test-logging.c               |   0
 tests/{ => unit}/test-mul64.c                 |   0
 tests/{ => unit}/test-opts-visitor.c          |   0
 tests/{ => unit}/test-qapi-util.c             |   0
 tests/{ => unit}/test-qdev-global-props.c     |   0
 tests/{ => unit}/test-qdist.c                 |   0
 tests/{ => unit}/test-qemu-opts.c             |   0
 tests/{ => unit}/test-qga.c                   |   2 +-
 tests/{ => unit}/test-qgraph.c                |   4 +-
 tests/{ => unit}/test-qht.c                   |   0
 tests/{ => unit}/test-qmp-cmds.c              |   0
 tests/{ => unit}/test-qmp-event.c             |   0
 tests/{ => unit}/test-qobject-input-visitor.c |   0
 .../{ => unit}/test-qobject-output-visitor.c  |   0
 tests/{ => unit}/test-rcu-list.c              |   0
 tests/{ => unit}/test-rcu-simpleq.c           |   0
 tests/{ => unit}/test-rcu-slist.c             |   0
 tests/{ => unit}/test-rcu-tailq.c             |   0
 tests/{ => unit}/test-replication.c           |   0
 tests/{ => unit}/test-shift128.c              |   0
 tests/{ => unit}/test-string-input-visitor.c  |   0
 tests/{ => unit}/test-string-output-visitor.c |   0
 tests/{ => unit}/test-thread-pool.c           |   0
 tests/{ => unit}/test-throttle.c              |   0
 tests/{ => unit}/test-timed-average.c         |   0
 tests/{ => unit}/test-util-filemonitor.c      |   0
 tests/{ => unit}/test-util-sockets.c          |   0
 tests/{ => unit}/test-uuid.c                  |   0
 tests/{ => unit}/test-visitor-serialization.c |   0
 tests/{ => unit}/test-vmstate.c               |   0
 tests/{ => unit}/test-write-threshold.c       |   0
 tests/{ => unit}/test-x86-cpuid.c             |   0
 tests/{ => unit}/test-xbzrle.c                |   0
 106 files changed, 223 insertions(+), 219 deletions(-)
 rename tests/{ => unit}/check-block-qdict.c (100%)
 rename tests/{ => unit}/check-qdict.c (100%)
 rename tests/{ => unit}/check-qjson.c (100%)
 rename tests/{ => unit}/check-qlist.c (100%)
 rename tests/{ => unit}/check-qlit.c (100%)
 rename tests/{ => unit}/check-qnull.c (100%)
 rename tests/{ => unit}/check-qnum.c (100%)
 rename tests/{ => unit}/check-qobject.c (100%)
 rename tests/{ => unit}/check-qom-interface.c (100%)
 rename tests/{ => unit}/check-qom-proplist.c (100%)
 rename tests/{ => unit}/check-qstring.c (100%)
 rename tests/{ => unit}/crypto-tls-psk-helpers.c (100%)
 rename tests/{ => unit}/crypto-tls-psk-helpers.h (100%)
 rename tests/{ => unit}/crypto-tls-x509-helpers.c (100%)
 rename tests/{ => unit}/crypto-tls-x509-helpers.h (100%)
 rename tests/{ => unit}/io-channel-helpers.c (100%)
 rename tests/{ => unit}/io-channel-helpers.h (100%)
 rename tests/{ => unit}/iothread.c (100%)
 rename tests/{ => unit}/iothread.h (100%)
 create mode 100644 tests/unit/meson.build
 rename tests/{ => unit}/pkix_asn1_tab.c (99%)
 rename tests/{ => unit}/ptimer-test-stubs.c (100%)
 rename tests/{ => unit}/ptimer-test.c (100%)
 rename tests/{ => unit}/ptimer-test.h (100%)
 rename tests/{ => unit}/rcutorture.c (100%)
 rename tests/{ => unit}/socket-helpers.c (100%)
 rename tests/{ => unit}/socket-helpers.h (100%)
 rename tests/{ => unit}/test-aio-multithread.c (100%)
 rename tests/{ => unit}/test-aio.c (100%)
 rename tests/{ => unit}/test-authz-list.c (100%)
 rename tests/{ => unit}/test-authz-listfile.c (100%)
 rename tests/{ => unit}/test-authz-pam.c (100%)
 rename tests/{ => unit}/test-authz-simple.c (100%)
 rename tests/{ => unit}/test-base64.c (100%)
 rename tests/{ => unit}/test-bdrv-drain.c (100%)
 rename tests/{ => unit}/test-bdrv-graph-mod.c (100%)
 rename tests/{ => unit}/test-bitcnt.c (100%)
 rename tests/{ => unit}/test-bitmap.c (100%)
 rename tests/{ => unit}/test-bitops.c (100%)
 rename tests/{ => unit}/test-block-backend.c (100%)
 rename tests/{ => unit}/test-block-iothread.c (100%)
 rename tests/{ => unit}/test-blockjob-txn.c (100%)
 rename tests/{ => unit}/test-blockjob.c (100%)
 rename tests/{ => unit}/test-bufferiszero.c (100%)
 rename tests/{ => unit}/test-char.c (100%)
 rename tests/{ => unit}/test-clone-visitor.c (100%)
 rename tests/{ => unit}/test-coroutine.c (100%)
 rename tests/{ => unit}/test-crypto-afsplit.c (100%)
 rename tests/{ => unit}/test-crypto-block.c (100%)
 rename tests/{ => unit}/test-crypto-cipher.c (100%)
 rename tests/{ => unit}/test-crypto-hash.c (100%)
 rename tests/{ => unit}/test-crypto-hmac.c (100%)
 rename tests/{ => unit}/test-crypto-ivgen.c (100%)
 rename tests/{ => unit}/test-crypto-pbkdf.c (100%)
 rename tests/{ => unit}/test-crypto-secret.c (100%)
 rename tests/{ => unit}/test-crypto-tlscredsx509.c (100%)
 rename tests/{ => unit}/test-crypto-tlssession.c (100%)
 rename tests/{ => unit}/test-crypto-xts.c (100%)
 rename tests/{ => unit}/test-cutils.c (100%)
 rename tests/{ => unit}/test-fdmon-epoll.c (100%)
 rename tests/{ => unit}/test-hbitmap.c (100%)
 rename tests/{ => unit}/test-image-locking.c (100%)
 rename tests/{ => unit}/test-int128.c (100%)
 rename tests/{ => unit}/test-io-channel-buffer.c (100%)
 rename tests/{ => unit}/test-io-channel-command.c (100%)
 rename tests/{ => unit}/test-io-channel-file.c (100%)
 rename tests/{ => unit}/test-io-channel-socket.c (100%)
 rename tests/{ => unit}/test-io-channel-tls.c (100%)
 rename tests/{ => unit}/test-io-task.c (100%)
 rename tests/{ => unit}/test-iov.c (100%)
 rename tests/{ => unit}/test-keyval.c (100%)
 rename tests/{ => unit}/test-logging.c (100%)
 rename tests/{ => unit}/test-mul64.c (100%)
 rename tests/{ => unit}/test-opts-visitor.c (100%)
 rename tests/{ => unit}/test-qapi-util.c (100%)
 rename tests/{ => unit}/test-qdev-global-props.c (100%)
 rename tests/{ => unit}/test-qdist.c (100%)
 rename tests/{ => unit}/test-qemu-opts.c (100%)
 rename tests/{ => unit}/test-qga.c (99%)
 rename tests/{ => unit}/test-qgraph.c (99%)
 rename tests/{ => unit}/test-qht.c (100%)
 rename tests/{ => unit}/test-qmp-cmds.c (100%)
 rename tests/{ => unit}/test-qmp-event.c (100%)
 rename tests/{ => unit}/test-qobject-input-visitor.c (100%)
 rename tests/{ => unit}/test-qobject-output-visitor.c (100%)
 rename tests/{ => unit}/test-rcu-list.c (100%)
 rename tests/{ => unit}/test-rcu-simpleq.c (100%)
 rename tests/{ => unit}/test-rcu-slist.c (100%)
 rename tests/{ => unit}/test-rcu-tailq.c (100%)
 rename tests/{ => unit}/test-replication.c (100%)
 rename tests/{ => unit}/test-shift128.c (100%)
 rename tests/{ => unit}/test-string-input-visitor.c (100%)
 rename tests/{ => unit}/test-string-output-visitor.c (100%)
 rename tests/{ => unit}/test-thread-pool.c (100%)
 rename tests/{ => unit}/test-throttle.c (100%)
 rename tests/{ => unit}/test-timed-average.c (100%)
 rename tests/{ => unit}/test-util-filemonitor.c (100%)
 rename tests/{ => unit}/test-util-sockets.c (100%)
 rename tests/{ => unit}/test-uuid.c (100%)
 rename tests/{ => unit}/test-visitor-serialization.c (100%)
 rename tests/{ => unit}/test-vmstate.c (100%)
 rename tests/{ => unit}/test-write-threshold.c (100%)
 rename tests/{ => unit}/test-x86-cpuid.c (100%)
 rename tests/{ => unit}/test-xbzrle.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e04ae21a2f..e6c43c6833 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1537,7 +1537,7 @@ F: include/hw/southbridge/piix.h
 F: hw/misc/sga.c
 F: hw/isa/apm.c
 F: include/hw/isa/apm.h
-F: tests/test-x86-cpuid.c
+F: tests/unit/test-x86-cpuid.c
 F: tests/qtest/test-x86-cpuid-compat.c
 
 PC Chipset
@@ -2212,7 +2212,7 @@ F: qemu-io*
 F: tests/qemu-iotests/
 F: util/qemu-progress.c
 F: qobject/block-qdict.c
-F: tests/check-block-qdict.c
+F: tests/unit/check-block-qdict.c
 T: git https://repo.or.cz/qemu/kevin.git block
 
 Storage daemon
@@ -2238,7 +2238,7 @@ F: migration/block*
 F: include/block/aio.h
 F: include/block/aio-wait.h
 F: scripts/qemugdb/aio.py
-F: tests/test-fdmon-epoll.c
+F: tests/unit/test-fdmon-epoll.c
 T: git https://github.com/stefanha/qemu.git block
 
 Block SCSI subsystem
@@ -2298,7 +2298,7 @@ F: block/dirty-bitmap.c
 F: block/qcow2-bitmap.c
 F: migration/block-dirty-bitmap.c
 F: util/hbitmap.c
-F: tests/test-hbitmap.c
+F: tests/unit/test-hbitmap.c
 F: docs/interop/bitmaps.rst
 T: git https://repo.or.cz/qemu/ericb.git bitmaps
 
@@ -2319,8 +2319,8 @@ Command line option argument parsing
 M: Markus Armbruster <armbru@redhat.com>
 S: Supported
 F: include/qemu/option.h
-F: tests/test-keyval.c
-F: tests/test-qemu-opts.c
+F: tests/unit/test-keyval.c
+F: tests/unit/test-qemu-opts.c
 F: util/keyval.c
 F: util/qemu-option.c
 
@@ -2438,8 +2438,8 @@ Read, Copy, Update (RCU)
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/rcu*.h
-F: tests/rcutorture.c
-F: tests/test-rcu-*.c
+F: tests/unit/rcutorture.c
+F: tests/unit/test-rcu-*.c
 F: util/rcu.c
 
 Human Monitor (HMP)
@@ -2517,10 +2517,10 @@ F: include/qapi/
 X: include/qapi/qmp/
 F: include/qapi/qmp/dispatch.h
 F: tests/qapi-schema/
-F: tests/test-*-visitor.c
-F: tests/test-qapi-*.c
-F: tests/test-qmp-*.c
-F: tests/test-visitor-serialization.c
+F: tests/unit/test-*-visitor.c
+F: tests/unit/test-qapi-*.c
+F: tests/unit/test-qmp-*.c
+F: tests/unit/test-visitor-serialization.c
 F: scripts/qapi-gen.py
 F: scripts/qapi/*
 F: docs/sphinx/qapidoc.py
@@ -2541,14 +2541,14 @@ F: qobject/
 F: include/qapi/qmp/
 X: include/qapi/qmp/dispatch.h
 F: scripts/coccinelle/qobject.cocci
-F: tests/check-qdict.c
-F: tests/check-qjson.c
-F: tests/check-qlist.c
-F: tests/check-qlit.c
-F: tests/check-qnull.c
-F: tests/check-qnum.c
-F: tests/check-qobject.c
-F: tests/check-qstring.c
+F: tests/unit/check-qdict.c
+F: tests/unit/check-qjson.c
+F: tests/unit/check-qlist.c
+F: tests/unit/check-qlit.c
+F: tests/unit/check-qnull.c
+F: tests/unit/check-qnum.c
+F: tests/unit/check-qobject.c
+F: tests/unit/check-qstring.c
 F: tests/data/qobject/qdict.txt
 T: git https://repo.or.cz/qemu/armbru.git qapi-next
 
@@ -2559,7 +2559,7 @@ F: qga/
 F: docs/interop/qemu-ga.rst
 F: docs/interop/qemu-ga-ref.rst
 F: scripts/qemu-guest-agent/
-F: tests/test-qga.c
+F: tests/unit/test-qga.c
 T: git https://github.com/mdroth/qemu.git qga
 
 QOM
@@ -2580,9 +2580,9 @@ F: scripts/coccinelle/qom-parent-type.cocci
 F: softmmu/qdev-monitor.c
 F: stubs/qdev.c
 F: qom/
-F: tests/check-qom-interface.c
-F: tests/check-qom-proplist.c
-F: tests/test-qdev-global-props.c
+F: tests/unit/check-qom-interface.c
+F: tests/unit/check-qom-proplist.c
+F: tests/unit/test-qdev-global-props.c
 
 QOM boilerplate conversion script
 M: Eduardo Habkost <ehabkost@redhat.com>
@@ -2721,10 +2721,10 @@ S: Maintained
 F: crypto/
 F: include/crypto/
 F: qapi/crypto.json
-F: tests/test-crypto-*
+F: tests/unit/test-crypto-*
 F: tests/benchmark-crypto-*
-F: tests/crypto-tls-*
-F: tests/pkix_asn1_tab.c
+F: tests/unit/crypto-tls-*
+F: tests/unit/pkix_asn1_tab.c
 F: qemu.sasl
 
 Coroutines
@@ -2733,7 +2733,7 @@ M: Kevin Wolf <kwolf@redhat.com>
 S: Maintained
 F: util/*coroutine*
 F: include/qemu/coroutine*
-F: tests/test-coroutine.c
+F: tests/unit/test-coroutine.c
 
 Buffers
 M: Daniel P. Berrange <berrange@redhat.com>
@@ -2746,7 +2746,7 @@ M: Daniel P. Berrange <berrange@redhat.com>
 S: Maintained
 F: io/
 F: include/io/
-F: tests/test-io-*
+F: tests/unit/test-io-*
 
 User authorization
 M: Daniel P. Berrange <berrange@redhat.com>
@@ -2754,7 +2754,7 @@ S: Maintained
 F: authz/
 F: qapi/authz.json
 F: include/authz/
-F: tests/test-authz-*
+F: tests/unit/test-authz-*
 
 Sockets
 M: Daniel P. Berrange <berrange@redhat.com>
@@ -2769,7 +2769,7 @@ M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
 F: util/filemonitor*.c
 F: include/qemu/filemonitor.h
-F: tests/test-util-filemonitor.c
+F: tests/unit/test-util-filemonitor.c
 
 Throttling infrastructure
 M: Alberto Garcia <berto@igalia.com>
@@ -2779,7 +2779,7 @@ F: include/block/throttle-groups.h
 F: include/qemu/throttle*.h
 F: util/throttle.c
 F: docs/throttle.txt
-F: tests/test-throttle.c
+F: tests/unit/test-throttle.c
 L: qemu-block@nongnu.org
 
 UUID
@@ -2787,7 +2787,7 @@ M: Fam Zheng <fam@euphon.net>
 S: Supported
 F: util/uuid.c
 F: include/qemu/uuid.h
-F: tests/test-uuid.c
+F: tests/unit/test-uuid.c
 
 Yank feature
 M: Lukas Straub <lukasstraub2@web.de>
@@ -3237,7 +3237,7 @@ M: Xie Changlong <xiechanglong.d@gmail.com>
 S: Supported
 F: replication*
 F: block/replication.c
-F: tests/test-replication.c
+F: tests/unit/test-replication.c
 F: docs/block-replication.txt
 
 PVRDMA
diff --git a/tests/meson.build b/tests/meson.build
index 656d211e25..af43fd1eaf 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -69,59 +69,6 @@ endforeach
 libtestqapi = static_library('testqapi', sources: [genh, test_qapi_sources])
 testqapi = declare_dependency(link_with: libtestqapi, sources: [genh, test_qapi_headers])
 
-testblock = declare_dependency(dependencies: [block], sources: 'iothread.c')
-
-tests = {
-  'check-block-qdict': [],
-  'check-qdict': [],
-  'check-qnum': [],
-  'check-qstring': [],
-  'check-qlist': [],
-  'check-qnull': [],
-  'check-qobject': [],
-  'check-qjson': [],
-  'check-qlit': [],
-  'test-qobject-output-visitor': [testqapi],
-  'test-clone-visitor': [testqapi],
-  'test-qobject-input-visitor': [testqapi],
-  'test-string-input-visitor': [testqapi],
-  'test-string-output-visitor': [testqapi],
-  'test-opts-visitor': [testqapi],
-  'test-visitor-serialization': [testqapi],
-  'test-bitmap': [],
-  # all code tested by test-x86-cpuid is inside topology.h
-  'test-x86-cpuid': [],
-  'test-cutils': [],
-  'test-shift128': [],
-  'test-mul64': [],
-  # all code tested by test-int128 is inside int128.h
-  'test-int128': [],
-  'rcutorture': [],
-  'test-rcu-list': [],
-  'test-rcu-simpleq': [],
-  'test-rcu-tailq': [],
-  'test-rcu-slist': [],
-  'test-qdist': [],
-  'test-qht': [],
-  'test-bitops': [],
-  'test-bitcnt': [],
-  'test-qgraph': ['qtest/libqos/qgraph.c'],
-  'check-qom-interface': [qom],
-  'check-qom-proplist': [qom],
-  'test-qemu-opts': [],
-  'test-keyval': [testqapi],
-  'test-logging': [],
-  'test-uuid': [],
-  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
-  'test-qapi-util': [],
-}
-
-if have_system or have_tools
-  tests += {
-    'test-qmp-event': [testqapi],
-  }
-endif
-
 test_deps = {
   'test-qht-par': qht_bench,
 }
@@ -129,65 +76,6 @@ test_deps = {
 benchs = {}
 
 if have_block
-  tests += {
-    'test-coroutine': [testblock],
-    'test-aio': [testblock],
-    'test-aio-multithread': [testblock],
-    'test-throttle': [testblock],
-    'test-thread-pool': [testblock],
-    'test-hbitmap': [testblock],
-    'test-bdrv-drain': [testblock],
-    'test-bdrv-graph-mod': [testblock],
-    'test-blockjob': [testblock],
-    'test-blockjob-txn': [testblock],
-    'test-block-backend': [testblock],
-    'test-block-iothread': [testblock],
-    'test-write-threshold': [testblock],
-    'test-crypto-hash': [crypto],
-    'test-crypto-hmac': [crypto],
-    'test-crypto-cipher': [crypto],
-    'test-crypto-secret': [crypto, keyutils],
-    'test-authz-simple': [authz],
-    'test-authz-list': [authz],
-    'test-authz-listfile': [authz],
-    'test-io-task': [testblock],
-    'test-io-channel-socket': ['socket-helpers.c', 'io-channel-helpers.c', io],
-    'test-io-channel-file': ['io-channel-helpers.c', io],
-    'test-io-channel-command': ['io-channel-helpers.c', io],
-    'test-io-channel-buffer': ['io-channel-helpers.c', io],
-    'test-crypto-ivgen': [io],
-    'test-crypto-afsplit': [io],
-    'test-crypto-block': [io],
-  }
-  if 'CONFIG_GNUTLS' in config_host and \
-     'CONFIG_TASN1' in config_host and \
-     'CONFIG_POSIX' in config_host
-    tests += {
-      'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
-                                   tasn1, crypto, gnutls],
-      'test-crypto-tlssession': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c', 'crypto-tls-psk-helpers.c',
-                                 tasn1, crypto, gnutls],
-      'test-io-channel-tls': ['io-channel-helpers.c', 'crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
-                              tasn1, io, crypto, gnutls]}
-  endif
-  if 'CONFIG_AUTH_PAM' in config_host
-    tests += {'test-authz-pam': [authz]}
-  endif
-  if 'CONFIG_QEMU_PRIVATE_XTS' in config_host
-    tests += {'test-crypto-xts': [crypto, io]}
-  endif
-  if 'CONFIG_POSIX' in config_host
-    tests += {'test-image-locking': [testblock]}
-  endif
-  if 'CONFIG_REPLICATION' in config_host
-    tests += {'test-replication': [testblock]}
-  endif
-  if 'CONFIG_NETTLE' in config_host or 'CONFIG_GCRYPT' in config_host
-    tests += {'test-crypto-pbkdf': [io]}
-  endif
-  if 'CONFIG_EPOLL_CREATE1' in config_host
-    tests += {'test-fdmon-epoll': [testblock]}
-  endif
   benchs += {
      'benchmark-crypto-hash': [crypto],
      'benchmark-crypto-hmac': [crypto],
@@ -195,75 +83,6 @@ if have_block
   }
 endif
 
-if have_system
-  tests += {
-    'test-iov': [],
-    'test-qmp-cmds': [testqapi],
-    'test-xbzrle': [migration],
-    'test-timed-average': [],
-    'test-util-sockets': ['socket-helpers.c'],
-    'test-base64': [],
-    'test-bufferiszero': [],
-    'test-vmstate': [migration, io]
-  }
-  if 'CONFIG_INOTIFY1' in config_host
-    tests += {'test-util-filemonitor': []}
-  endif
-
-  # Some tests: test-char, test-qdev-global-props, and test-qga,
-  # are not runnable under TSan due to a known issue.
-  # https://github.com/google/sanitizers/issues/1116
-  if 'CONFIG_TSAN' not in config_host
-    if 'CONFIG_POSIX' in config_host
-        tests += {
-          'test-char': ['socket-helpers.c', qom, io, chardev]
-        }
-    endif
-
-    tests += {
-      'test-qdev-global-props': [qom, hwcore, testqapi]
-    }
-  endif
-endif
-
-if 'CONFIG_TSAN' not in config_host and \
-   'CONFIG_GUEST_AGENT' in config_host and \
-   'CONFIG_LINUX' in config_host
-  tests += {'test-qga': ['qtest/libqtest.c']}
-  test_deps += {'test-qga': qga}
-endif
-
-test_env = environment()
-test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
-test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
-
-slow_tests = {
-  'test-crypto-tlscredsx509': 45,
-  'test-crypto-tlssession': 45
-}
-
-foreach test_name, extra: tests
-  src = [test_name + '.c']
-  deps = [qemuutil]
-  if extra.length() > 0
-    # use a sourceset to quickly separate sources and deps
-    test_ss = ss.source_set()
-    test_ss.add(extra)
-    src += test_ss.all_sources()
-    deps += test_ss.all_dependencies()
-  endif
-  exe = executable(test_name, src, genh, dependencies: deps)
-
-  test(test_name, exe,
-       depends: test_deps.get(test_name, []),
-       env: test_env,
-       args: ['--tap', '-k'],
-       protocol: 'tap',
-       timeout: slow_tests.get(test_name, 30),
-       priority: slow_tests.get(test_name, 30),
-       suite: ['unit'])
-endforeach
-
 foreach bench_name, deps: benchs
   exe = executable(bench_name, bench_name + '.c',
                    dependencies: [qemuutil] + deps)
@@ -299,6 +118,7 @@ if not get_option('tcg').disabled()
   endif
 endif
 
+subdir('unit')
 subdir('qapi-schema')
 subdir('qtest')
 subdir('migration')
diff --git a/tests/check-block-qdict.c b/tests/unit/check-block-qdict.c
similarity index 100%
rename from tests/check-block-qdict.c
rename to tests/unit/check-block-qdict.c
diff --git a/tests/check-qdict.c b/tests/unit/check-qdict.c
similarity index 100%
rename from tests/check-qdict.c
rename to tests/unit/check-qdict.c
diff --git a/tests/check-qjson.c b/tests/unit/check-qjson.c
similarity index 100%
rename from tests/check-qjson.c
rename to tests/unit/check-qjson.c
diff --git a/tests/check-qlist.c b/tests/unit/check-qlist.c
similarity index 100%
rename from tests/check-qlist.c
rename to tests/unit/check-qlist.c
diff --git a/tests/check-qlit.c b/tests/unit/check-qlit.c
similarity index 100%
rename from tests/check-qlit.c
rename to tests/unit/check-qlit.c
diff --git a/tests/check-qnull.c b/tests/unit/check-qnull.c
similarity index 100%
rename from tests/check-qnull.c
rename to tests/unit/check-qnull.c
diff --git a/tests/check-qnum.c b/tests/unit/check-qnum.c
similarity index 100%
rename from tests/check-qnum.c
rename to tests/unit/check-qnum.c
diff --git a/tests/check-qobject.c b/tests/unit/check-qobject.c
similarity index 100%
rename from tests/check-qobject.c
rename to tests/unit/check-qobject.c
diff --git a/tests/check-qom-interface.c b/tests/unit/check-qom-interface.c
similarity index 100%
rename from tests/check-qom-interface.c
rename to tests/unit/check-qom-interface.c
diff --git a/tests/check-qom-proplist.c b/tests/unit/check-qom-proplist.c
similarity index 100%
rename from tests/check-qom-proplist.c
rename to tests/unit/check-qom-proplist.c
diff --git a/tests/check-qstring.c b/tests/unit/check-qstring.c
similarity index 100%
rename from tests/check-qstring.c
rename to tests/unit/check-qstring.c
diff --git a/tests/crypto-tls-psk-helpers.c b/tests/unit/crypto-tls-psk-helpers.c
similarity index 100%
rename from tests/crypto-tls-psk-helpers.c
rename to tests/unit/crypto-tls-psk-helpers.c
diff --git a/tests/crypto-tls-psk-helpers.h b/tests/unit/crypto-tls-psk-helpers.h
similarity index 100%
rename from tests/crypto-tls-psk-helpers.h
rename to tests/unit/crypto-tls-psk-helpers.h
diff --git a/tests/crypto-tls-x509-helpers.c b/tests/unit/crypto-tls-x509-helpers.c
similarity index 100%
rename from tests/crypto-tls-x509-helpers.c
rename to tests/unit/crypto-tls-x509-helpers.c
diff --git a/tests/crypto-tls-x509-helpers.h b/tests/unit/crypto-tls-x509-helpers.h
similarity index 100%
rename from tests/crypto-tls-x509-helpers.h
rename to tests/unit/crypto-tls-x509-helpers.h
diff --git a/tests/io-channel-helpers.c b/tests/unit/io-channel-helpers.c
similarity index 100%
rename from tests/io-channel-helpers.c
rename to tests/unit/io-channel-helpers.c
diff --git a/tests/io-channel-helpers.h b/tests/unit/io-channel-helpers.h
similarity index 100%
rename from tests/io-channel-helpers.h
rename to tests/unit/io-channel-helpers.h
diff --git a/tests/iothread.c b/tests/unit/iothread.c
similarity index 100%
rename from tests/iothread.c
rename to tests/unit/iothread.c
diff --git a/tests/iothread.h b/tests/unit/iothread.h
similarity index 100%
rename from tests/iothread.h
rename to tests/unit/iothread.h
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
new file mode 100644
index 0000000000..4bfe4627ba
--- /dev/null
+++ b/tests/unit/meson.build
@@ -0,0 +1,184 @@
+
+testblock = declare_dependency(dependencies: [block], sources: 'iothread.c')
+
+tests = {
+  'check-block-qdict': [],
+  'check-qdict': [],
+  'check-qnum': [],
+  'check-qstring': [],
+  'check-qlist': [],
+  'check-qnull': [],
+  'check-qobject': [],
+  'check-qjson': [],
+  'check-qlit': [],
+  'test-qobject-output-visitor': [testqapi],
+  'test-clone-visitor': [testqapi],
+  'test-qobject-input-visitor': [testqapi],
+  'test-string-input-visitor': [testqapi],
+  'test-string-output-visitor': [testqapi],
+  'test-opts-visitor': [testqapi],
+  'test-visitor-serialization': [testqapi],
+  'test-bitmap': [],
+  # all code tested by test-x86-cpuid is inside topology.h
+  'test-x86-cpuid': [],
+  'test-cutils': [],
+  'test-shift128': [],
+  'test-mul64': [],
+  # all code tested by test-int128 is inside int128.h
+  'test-int128': [],
+  'rcutorture': [],
+  'test-rcu-list': [],
+  'test-rcu-simpleq': [],
+  'test-rcu-tailq': [],
+  'test-rcu-slist': [],
+  'test-qdist': [],
+  'test-qht': [],
+  'test-bitops': [],
+  'test-bitcnt': [],
+  'test-qgraph': ['../qtest/libqos/qgraph.c'],
+  'check-qom-interface': [qom],
+  'check-qom-proplist': [qom],
+  'test-qemu-opts': [],
+  'test-keyval': [testqapi],
+  'test-logging': [],
+  'test-uuid': [],
+  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
+  'test-qapi-util': [],
+}
+
+if have_system or have_tools
+  tests += {
+    'test-qmp-event': [testqapi],
+  }
+endif
+
+if have_block
+  tests += {
+    'test-coroutine': [testblock],
+    'test-aio': [testblock],
+    'test-aio-multithread': [testblock],
+    'test-throttle': [testblock],
+    'test-thread-pool': [testblock],
+    'test-hbitmap': [testblock],
+    'test-bdrv-drain': [testblock],
+    'test-bdrv-graph-mod': [testblock],
+    'test-blockjob': [testblock],
+    'test-blockjob-txn': [testblock],
+    'test-block-backend': [testblock],
+    'test-block-iothread': [testblock],
+    'test-write-threshold': [testblock],
+    'test-crypto-hash': [crypto],
+    'test-crypto-hmac': [crypto],
+    'test-crypto-cipher': [crypto],
+    'test-crypto-secret': [crypto, keyutils],
+    'test-authz-simple': [authz],
+    'test-authz-list': [authz],
+    'test-authz-listfile': [authz],
+    'test-io-task': [testblock],
+    'test-io-channel-socket': ['socket-helpers.c', 'io-channel-helpers.c', io],
+    'test-io-channel-file': ['io-channel-helpers.c', io],
+    'test-io-channel-command': ['io-channel-helpers.c', io],
+    'test-io-channel-buffer': ['io-channel-helpers.c', io],
+    'test-crypto-ivgen': [io],
+    'test-crypto-afsplit': [io],
+    'test-crypto-block': [io],
+  }
+  if 'CONFIG_GNUTLS' in config_host and \
+     'CONFIG_TASN1' in config_host and \
+     'CONFIG_POSIX' in config_host
+    tests += {
+      'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
+                                   tasn1, crypto, gnutls],
+      'test-crypto-tlssession': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c', 'crypto-tls-psk-helpers.c',
+                                 tasn1, crypto, gnutls],
+      'test-io-channel-tls': ['io-channel-helpers.c', 'crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
+                              tasn1, io, crypto, gnutls]}
+  endif
+  if 'CONFIG_AUTH_PAM' in config_host
+    tests += {'test-authz-pam': [authz]}
+  endif
+  if 'CONFIG_QEMU_PRIVATE_XTS' in config_host
+    tests += {'test-crypto-xts': [crypto, io]}
+  endif
+  if 'CONFIG_POSIX' in config_host
+    tests += {'test-image-locking': [testblock]}
+  endif
+  if 'CONFIG_REPLICATION' in config_host
+    tests += {'test-replication': [testblock]}
+  endif
+  if 'CONFIG_NETTLE' in config_host or 'CONFIG_GCRYPT' in config_host
+    tests += {'test-crypto-pbkdf': [io]}
+  endif
+  if 'CONFIG_EPOLL_CREATE1' in config_host
+    tests += {'test-fdmon-epoll': [testblock]}
+  endif
+endif
+
+if have_system
+  tests += {
+    'test-iov': [],
+    'test-qmp-cmds': [testqapi],
+    'test-xbzrle': [migration],
+    'test-timed-average': [],
+    'test-util-sockets': ['socket-helpers.c'],
+    'test-base64': [],
+    'test-bufferiszero': [],
+    'test-vmstate': [migration, io]
+  }
+  if 'CONFIG_INOTIFY1' in config_host
+    tests += {'test-util-filemonitor': []}
+  endif
+
+  # Some tests: test-char, test-qdev-global-props, and test-qga,
+  # are not runnable under TSan due to a known issue.
+  # https://github.com/google/sanitizers/issues/1116
+  if 'CONFIG_TSAN' not in config_host
+    if 'CONFIG_POSIX' in config_host
+        tests += {
+          'test-char': ['socket-helpers.c', qom, io, chardev]
+        }
+    endif
+
+    tests += {
+      'test-qdev-global-props': [qom, hwcore, testqapi]
+    }
+  endif
+endif
+
+if 'CONFIG_TSAN' not in config_host and \
+   'CONFIG_GUEST_AGENT' in config_host and \
+   'CONFIG_LINUX' in config_host
+  tests += {'test-qga': ['../qtest/libqtest.c']}
+  test_deps += {'test-qga': qga}
+endif
+
+test_env = environment()
+test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
+test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
+
+slow_tests = {
+  'test-crypto-tlscredsx509': 45,
+  'test-crypto-tlssession': 45
+}
+
+foreach test_name, extra: tests
+  src = [test_name + '.c']
+  deps = [qemuutil]
+  if extra.length() > 0
+    # use a sourceset to quickly separate sources and deps
+    test_ss = ss.source_set()
+    test_ss.add(extra)
+    src += test_ss.all_sources()
+    deps += test_ss.all_dependencies()
+  endif
+  exe = executable(test_name, src, genh, dependencies: deps)
+
+  test(test_name, exe,
+       depends: test_deps.get(test_name, []),
+       env: test_env,
+       args: ['--tap', '-k'],
+       protocol: 'tap',
+       timeout: slow_tests.get(test_name, 30),
+       priority: slow_tests.get(test_name, 30),
+       suite: ['unit'])
+endforeach
diff --git a/tests/pkix_asn1_tab.c b/tests/unit/pkix_asn1_tab.c
similarity index 99%
rename from tests/pkix_asn1_tab.c
rename to tests/unit/pkix_asn1_tab.c
index 4aaf736d3f..15397cf77a 100644
--- a/tests/pkix_asn1_tab.c
+++ b/tests/unit/pkix_asn1_tab.c
@@ -4,7 +4,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "tests/crypto-tls-x509-helpers.h"
+#include "crypto-tls-x509-helpers.h"
 
 #ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
 
diff --git a/tests/ptimer-test-stubs.c b/tests/unit/ptimer-test-stubs.c
similarity index 100%
rename from tests/ptimer-test-stubs.c
rename to tests/unit/ptimer-test-stubs.c
diff --git a/tests/ptimer-test.c b/tests/unit/ptimer-test.c
similarity index 100%
rename from tests/ptimer-test.c
rename to tests/unit/ptimer-test.c
diff --git a/tests/ptimer-test.h b/tests/unit/ptimer-test.h
similarity index 100%
rename from tests/ptimer-test.h
rename to tests/unit/ptimer-test.h
diff --git a/tests/rcutorture.c b/tests/unit/rcutorture.c
similarity index 100%
rename from tests/rcutorture.c
rename to tests/unit/rcutorture.c
diff --git a/tests/socket-helpers.c b/tests/unit/socket-helpers.c
similarity index 100%
rename from tests/socket-helpers.c
rename to tests/unit/socket-helpers.c
diff --git a/tests/socket-helpers.h b/tests/unit/socket-helpers.h
similarity index 100%
rename from tests/socket-helpers.h
rename to tests/unit/socket-helpers.h
diff --git a/tests/test-aio-multithread.c b/tests/unit/test-aio-multithread.c
similarity index 100%
rename from tests/test-aio-multithread.c
rename to tests/unit/test-aio-multithread.c
diff --git a/tests/test-aio.c b/tests/unit/test-aio.c
similarity index 100%
rename from tests/test-aio.c
rename to tests/unit/test-aio.c
diff --git a/tests/test-authz-list.c b/tests/unit/test-authz-list.c
similarity index 100%
rename from tests/test-authz-list.c
rename to tests/unit/test-authz-list.c
diff --git a/tests/test-authz-listfile.c b/tests/unit/test-authz-listfile.c
similarity index 100%
rename from tests/test-authz-listfile.c
rename to tests/unit/test-authz-listfile.c
diff --git a/tests/test-authz-pam.c b/tests/unit/test-authz-pam.c
similarity index 100%
rename from tests/test-authz-pam.c
rename to tests/unit/test-authz-pam.c
diff --git a/tests/test-authz-simple.c b/tests/unit/test-authz-simple.c
similarity index 100%
rename from tests/test-authz-simple.c
rename to tests/unit/test-authz-simple.c
diff --git a/tests/test-base64.c b/tests/unit/test-base64.c
similarity index 100%
rename from tests/test-base64.c
rename to tests/unit/test-base64.c
diff --git a/tests/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
similarity index 100%
rename from tests/test-bdrv-drain.c
rename to tests/unit/test-bdrv-drain.c
diff --git a/tests/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
similarity index 100%
rename from tests/test-bdrv-graph-mod.c
rename to tests/unit/test-bdrv-graph-mod.c
diff --git a/tests/test-bitcnt.c b/tests/unit/test-bitcnt.c
similarity index 100%
rename from tests/test-bitcnt.c
rename to tests/unit/test-bitcnt.c
diff --git a/tests/test-bitmap.c b/tests/unit/test-bitmap.c
similarity index 100%
rename from tests/test-bitmap.c
rename to tests/unit/test-bitmap.c
diff --git a/tests/test-bitops.c b/tests/unit/test-bitops.c
similarity index 100%
rename from tests/test-bitops.c
rename to tests/unit/test-bitops.c
diff --git a/tests/test-block-backend.c b/tests/unit/test-block-backend.c
similarity index 100%
rename from tests/test-block-backend.c
rename to tests/unit/test-block-backend.c
diff --git a/tests/test-block-iothread.c b/tests/unit/test-block-iothread.c
similarity index 100%
rename from tests/test-block-iothread.c
rename to tests/unit/test-block-iothread.c
diff --git a/tests/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
similarity index 100%
rename from tests/test-blockjob-txn.c
rename to tests/unit/test-blockjob-txn.c
diff --git a/tests/test-blockjob.c b/tests/unit/test-blockjob.c
similarity index 100%
rename from tests/test-blockjob.c
rename to tests/unit/test-blockjob.c
diff --git a/tests/test-bufferiszero.c b/tests/unit/test-bufferiszero.c
similarity index 100%
rename from tests/test-bufferiszero.c
rename to tests/unit/test-bufferiszero.c
diff --git a/tests/test-char.c b/tests/unit/test-char.c
similarity index 100%
rename from tests/test-char.c
rename to tests/unit/test-char.c
diff --git a/tests/test-clone-visitor.c b/tests/unit/test-clone-visitor.c
similarity index 100%
rename from tests/test-clone-visitor.c
rename to tests/unit/test-clone-visitor.c
diff --git a/tests/test-coroutine.c b/tests/unit/test-coroutine.c
similarity index 100%
rename from tests/test-coroutine.c
rename to tests/unit/test-coroutine.c
diff --git a/tests/test-crypto-afsplit.c b/tests/unit/test-crypto-afsplit.c
similarity index 100%
rename from tests/test-crypto-afsplit.c
rename to tests/unit/test-crypto-afsplit.c
diff --git a/tests/test-crypto-block.c b/tests/unit/test-crypto-block.c
similarity index 100%
rename from tests/test-crypto-block.c
rename to tests/unit/test-crypto-block.c
diff --git a/tests/test-crypto-cipher.c b/tests/unit/test-crypto-cipher.c
similarity index 100%
rename from tests/test-crypto-cipher.c
rename to tests/unit/test-crypto-cipher.c
diff --git a/tests/test-crypto-hash.c b/tests/unit/test-crypto-hash.c
similarity index 100%
rename from tests/test-crypto-hash.c
rename to tests/unit/test-crypto-hash.c
diff --git a/tests/test-crypto-hmac.c b/tests/unit/test-crypto-hmac.c
similarity index 100%
rename from tests/test-crypto-hmac.c
rename to tests/unit/test-crypto-hmac.c
diff --git a/tests/test-crypto-ivgen.c b/tests/unit/test-crypto-ivgen.c
similarity index 100%
rename from tests/test-crypto-ivgen.c
rename to tests/unit/test-crypto-ivgen.c
diff --git a/tests/test-crypto-pbkdf.c b/tests/unit/test-crypto-pbkdf.c
similarity index 100%
rename from tests/test-crypto-pbkdf.c
rename to tests/unit/test-crypto-pbkdf.c
diff --git a/tests/test-crypto-secret.c b/tests/unit/test-crypto-secret.c
similarity index 100%
rename from tests/test-crypto-secret.c
rename to tests/unit/test-crypto-secret.c
diff --git a/tests/test-crypto-tlscredsx509.c b/tests/unit/test-crypto-tlscredsx509.c
similarity index 100%
rename from tests/test-crypto-tlscredsx509.c
rename to tests/unit/test-crypto-tlscredsx509.c
diff --git a/tests/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
similarity index 100%
rename from tests/test-crypto-tlssession.c
rename to tests/unit/test-crypto-tlssession.c
diff --git a/tests/test-crypto-xts.c b/tests/unit/test-crypto-xts.c
similarity index 100%
rename from tests/test-crypto-xts.c
rename to tests/unit/test-crypto-xts.c
diff --git a/tests/test-cutils.c b/tests/unit/test-cutils.c
similarity index 100%
rename from tests/test-cutils.c
rename to tests/unit/test-cutils.c
diff --git a/tests/test-fdmon-epoll.c b/tests/unit/test-fdmon-epoll.c
similarity index 100%
rename from tests/test-fdmon-epoll.c
rename to tests/unit/test-fdmon-epoll.c
diff --git a/tests/test-hbitmap.c b/tests/unit/test-hbitmap.c
similarity index 100%
rename from tests/test-hbitmap.c
rename to tests/unit/test-hbitmap.c
diff --git a/tests/test-image-locking.c b/tests/unit/test-image-locking.c
similarity index 100%
rename from tests/test-image-locking.c
rename to tests/unit/test-image-locking.c
diff --git a/tests/test-int128.c b/tests/unit/test-int128.c
similarity index 100%
rename from tests/test-int128.c
rename to tests/unit/test-int128.c
diff --git a/tests/test-io-channel-buffer.c b/tests/unit/test-io-channel-buffer.c
similarity index 100%
rename from tests/test-io-channel-buffer.c
rename to tests/unit/test-io-channel-buffer.c
diff --git a/tests/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
similarity index 100%
rename from tests/test-io-channel-command.c
rename to tests/unit/test-io-channel-command.c
diff --git a/tests/test-io-channel-file.c b/tests/unit/test-io-channel-file.c
similarity index 100%
rename from tests/test-io-channel-file.c
rename to tests/unit/test-io-channel-file.c
diff --git a/tests/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
similarity index 100%
rename from tests/test-io-channel-socket.c
rename to tests/unit/test-io-channel-socket.c
diff --git a/tests/test-io-channel-tls.c b/tests/unit/test-io-channel-tls.c
similarity index 100%
rename from tests/test-io-channel-tls.c
rename to tests/unit/test-io-channel-tls.c
diff --git a/tests/test-io-task.c b/tests/unit/test-io-task.c
similarity index 100%
rename from tests/test-io-task.c
rename to tests/unit/test-io-task.c
diff --git a/tests/test-iov.c b/tests/unit/test-iov.c
similarity index 100%
rename from tests/test-iov.c
rename to tests/unit/test-iov.c
diff --git a/tests/test-keyval.c b/tests/unit/test-keyval.c
similarity index 100%
rename from tests/test-keyval.c
rename to tests/unit/test-keyval.c
diff --git a/tests/test-logging.c b/tests/unit/test-logging.c
similarity index 100%
rename from tests/test-logging.c
rename to tests/unit/test-logging.c
diff --git a/tests/test-mul64.c b/tests/unit/test-mul64.c
similarity index 100%
rename from tests/test-mul64.c
rename to tests/unit/test-mul64.c
diff --git a/tests/test-opts-visitor.c b/tests/unit/test-opts-visitor.c
similarity index 100%
rename from tests/test-opts-visitor.c
rename to tests/unit/test-opts-visitor.c
diff --git a/tests/test-qapi-util.c b/tests/unit/test-qapi-util.c
similarity index 100%
rename from tests/test-qapi-util.c
rename to tests/unit/test-qapi-util.c
diff --git a/tests/test-qdev-global-props.c b/tests/unit/test-qdev-global-props.c
similarity index 100%
rename from tests/test-qdev-global-props.c
rename to tests/unit/test-qdev-global-props.c
diff --git a/tests/test-qdist.c b/tests/unit/test-qdist.c
similarity index 100%
rename from tests/test-qdist.c
rename to tests/unit/test-qdist.c
diff --git a/tests/test-qemu-opts.c b/tests/unit/test-qemu-opts.c
similarity index 100%
rename from tests/test-qemu-opts.c
rename to tests/unit/test-qemu-opts.c
diff --git a/tests/test-qga.c b/tests/unit/test-qga.c
similarity index 99%
rename from tests/test-qga.c
rename to tests/unit/test-qga.c
index eb33264e8e..5cb140d1b5 100644
--- a/tests/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -4,7 +4,7 @@
 #include <sys/socket.h>
 #include <sys/un.h>
 
-#include "qtest/libqos/libqtest.h"
+#include "../qtest/libqos/libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 
diff --git a/tests/test-qgraph.c b/tests/unit/test-qgraph.c
similarity index 99%
rename from tests/test-qgraph.c
rename to tests/unit/test-qgraph.c
index ae2f7b2dd8..f819430e2c 100644
--- a/tests/test-qgraph.c
+++ b/tests/unit/test-qgraph.c
@@ -17,8 +17,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "qtest/libqos/qgraph.h"
-#include "qtest/libqos/qgraph_internal.h"
+#include "../qtest/libqos/qgraph.h"
+#include "../qtest/libqos/qgraph_internal.h"
 
 #define MACHINE_PC "x86_64/pc"
 #define MACHINE_RASPI2 "arm/raspi2"
diff --git a/tests/test-qht.c b/tests/unit/test-qht.c
similarity index 100%
rename from tests/test-qht.c
rename to tests/unit/test-qht.c
diff --git a/tests/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
similarity index 100%
rename from tests/test-qmp-cmds.c
rename to tests/unit/test-qmp-cmds.c
diff --git a/tests/test-qmp-event.c b/tests/unit/test-qmp-event.c
similarity index 100%
rename from tests/test-qmp-event.c
rename to tests/unit/test-qmp-event.c
diff --git a/tests/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
similarity index 100%
rename from tests/test-qobject-input-visitor.c
rename to tests/unit/test-qobject-input-visitor.c
diff --git a/tests/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
similarity index 100%
rename from tests/test-qobject-output-visitor.c
rename to tests/unit/test-qobject-output-visitor.c
diff --git a/tests/test-rcu-list.c b/tests/unit/test-rcu-list.c
similarity index 100%
rename from tests/test-rcu-list.c
rename to tests/unit/test-rcu-list.c
diff --git a/tests/test-rcu-simpleq.c b/tests/unit/test-rcu-simpleq.c
similarity index 100%
rename from tests/test-rcu-simpleq.c
rename to tests/unit/test-rcu-simpleq.c
diff --git a/tests/test-rcu-slist.c b/tests/unit/test-rcu-slist.c
similarity index 100%
rename from tests/test-rcu-slist.c
rename to tests/unit/test-rcu-slist.c
diff --git a/tests/test-rcu-tailq.c b/tests/unit/test-rcu-tailq.c
similarity index 100%
rename from tests/test-rcu-tailq.c
rename to tests/unit/test-rcu-tailq.c
diff --git a/tests/test-replication.c b/tests/unit/test-replication.c
similarity index 100%
rename from tests/test-replication.c
rename to tests/unit/test-replication.c
diff --git a/tests/test-shift128.c b/tests/unit/test-shift128.c
similarity index 100%
rename from tests/test-shift128.c
rename to tests/unit/test-shift128.c
diff --git a/tests/test-string-input-visitor.c b/tests/unit/test-string-input-visitor.c
similarity index 100%
rename from tests/test-string-input-visitor.c
rename to tests/unit/test-string-input-visitor.c
diff --git a/tests/test-string-output-visitor.c b/tests/unit/test-string-output-visitor.c
similarity index 100%
rename from tests/test-string-output-visitor.c
rename to tests/unit/test-string-output-visitor.c
diff --git a/tests/test-thread-pool.c b/tests/unit/test-thread-pool.c
similarity index 100%
rename from tests/test-thread-pool.c
rename to tests/unit/test-thread-pool.c
diff --git a/tests/test-throttle.c b/tests/unit/test-throttle.c
similarity index 100%
rename from tests/test-throttle.c
rename to tests/unit/test-throttle.c
diff --git a/tests/test-timed-average.c b/tests/unit/test-timed-average.c
similarity index 100%
rename from tests/test-timed-average.c
rename to tests/unit/test-timed-average.c
diff --git a/tests/test-util-filemonitor.c b/tests/unit/test-util-filemonitor.c
similarity index 100%
rename from tests/test-util-filemonitor.c
rename to tests/unit/test-util-filemonitor.c
diff --git a/tests/test-util-sockets.c b/tests/unit/test-util-sockets.c
similarity index 100%
rename from tests/test-util-sockets.c
rename to tests/unit/test-util-sockets.c
diff --git a/tests/test-uuid.c b/tests/unit/test-uuid.c
similarity index 100%
rename from tests/test-uuid.c
rename to tests/unit/test-uuid.c
diff --git a/tests/test-visitor-serialization.c b/tests/unit/test-visitor-serialization.c
similarity index 100%
rename from tests/test-visitor-serialization.c
rename to tests/unit/test-visitor-serialization.c
diff --git a/tests/test-vmstate.c b/tests/unit/test-vmstate.c
similarity index 100%
rename from tests/test-vmstate.c
rename to tests/unit/test-vmstate.c
diff --git a/tests/test-write-threshold.c b/tests/unit/test-write-threshold.c
similarity index 100%
rename from tests/test-write-threshold.c
rename to tests/unit/test-write-threshold.c
diff --git a/tests/test-x86-cpuid.c b/tests/unit/test-x86-cpuid.c
similarity index 100%
rename from tests/test-x86-cpuid.c
rename to tests/unit/test-x86-cpuid.c
diff --git a/tests/test-xbzrle.c b/tests/unit/test-xbzrle.c
similarity index 100%
rename from tests/test-xbzrle.c
rename to tests/unit/test-xbzrle.c
-- 
2.27.0


