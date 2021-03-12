Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575833395F5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:15:25 +0100 (CET)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmJo-0001rZ-Ah
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWE-0007JV-4H
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWA-0000aD-4p
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FZVFZJFBCSTWt3vdqMXGGm5nmMRHiY4R5WIgvUhyqP8=;
 b=B7cBhqkD++8whC+zDRX+q91L7pU6FyvqSsKOxM1FNo0sZ0w0x5oEenxn5SfZd6c2KzzRbc
 KoCitvAVnFrLG/o8z1Eqk+xSi3RfUlJtE4YVFXsANNdll+rI6VgZLUbVCX11r9ZH2sgHzV
 5MoOQshVr+ciozT2uzFFtyGcfNGb/fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Os_DsHm3PAOFyUltrsG9gg-1; Fri, 12 Mar 2021 12:24:01 -0500
X-MC-Unique: Os_DsHm3PAOFyUltrsG9gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE986100C661;
 Fri, 12 Mar 2021 17:23:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92C5B19744;
 Fri, 12 Mar 2021 17:23:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/9] Gitlab-CI, tests and docs
Date: Fri, 12 Mar 2021 18:23:47 +0100
Message-Id: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 363fc963054d8e82cfd55fa9b9aa130692a8dbd7:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-aspeed-20210309' into staging (2021-03-11 11:18:27 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-03-12

for you to fetch changes up to 33bf47291ed575847d7de26b503c50e72f5aa6c3:

  README: Add Documentation blurb (2021-03-12 15:46:30 +0100)

----------------------------------------------------------------
* Move unit and bench tests into separate directories
* Clean-up and improve gitlab-ci jobs
* Drop the non-working "check-speed" makefile target
* Minor documentation updates
----------------------------------------------------------------

John Snow (1):
  README: Add Documentation blurb

Paolo Bonzini (1):
  tests: remove "make check-speed" in favor of "make bench"

Thomas Huth (7):
  tests: Move unit tests into a separate directory
  tests: Move benchmarks into a separate folder
  gitlab-ci.yml: Move build-tools-and-docs-debian to a better place
  gitlab-ci.yml: Add some missing dependencies to the jobs
  gitlab-ci.yml: Merge one of the coroutine jobs with the tcg-disabled
    job
  gitlab-ci.yml: Merge check-crypto-old jobs into the build-crypto-old
    jobs
  MAINTAINERS: Merge the Gitlab-CI section into the generic CI section

 .gitlab-ci.yml                                |  95 +++-----
 MAINTAINERS                                   |  93 ++++----
 README.rst                                    |  11 +
 tests/Makefile.include                        |   8 +-
 tests/{ => bench}/atomic64-bench.c            |   0
 tests/{ => bench}/atomic_add-bench.c          |   0
 tests/{ => bench}/benchmark-crypto-cipher.c   |   0
 tests/{ => bench}/benchmark-crypto-hash.c     |   0
 tests/{ => bench}/benchmark-crypto-hmac.c     |   0
 tests/bench/meson.build                       |  34 +++
 tests/{ => bench}/qht-bench.c                 |   0
 tests/meson.build                             | 216 +-----------------
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
 tests/unit/meson.build                        | 184 +++++++++++++++
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
 116 files changed, 311 insertions(+), 338 deletions(-)
 rename tests/{ => bench}/atomic64-bench.c (100%)
 rename tests/{ => bench}/atomic_add-bench.c (100%)
 rename tests/{ => bench}/benchmark-crypto-cipher.c (100%)
 rename tests/{ => bench}/benchmark-crypto-hash.c (100%)
 rename tests/{ => bench}/benchmark-crypto-hmac.c (100%)
 create mode 100644 tests/bench/meson.build
 rename tests/{ => bench}/qht-bench.c (100%)
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

-- 
2.27.0


