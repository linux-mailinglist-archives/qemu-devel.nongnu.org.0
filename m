Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F0217480
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:55:19 +0200 (CEST)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqsI-00038w-Iq
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jsqYw-0006b0-78
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:35:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36845
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jsqYs-0003su-Qh
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594139713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZwIpH3bcjCu8EaSgZTno6nq7V8U3hNjJcvfGN8xNK+Y=;
 b=aHVBUuKYuagi8HVppptQoxhzvlPevptBvGTLiaz/2Ku4SZIJRFU2lhhb2qPxoK+B7LLBxn
 2Oos+f8317pnCk2h6Js0aL/tOKF+wPQkLuFCWvF5NSsri/X+ICdt4RoSOdLlohnKuYiPxD
 49T82dU+wBgz8oD+DhLOdW+nuQ8LsDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-znPkpAkgPYGmITdWGbrwvQ-1; Tue, 07 Jul 2020 12:35:11 -0400
X-MC-Unique: znPkpAkgPYGmITdWGbrwvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61CF680040B;
 Tue,  7 Jul 2020 16:35:10 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-113.ams2.redhat.com
 [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D86D78463;
 Tue,  7 Jul 2020 16:35:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/12] Block layer patches
Date: Tue,  7 Jul 2020 18:34:52 +0200
Message-Id: <20200707163504.194740-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7623b5ba017f61de5d7c2bba12c6feb3d55091b1:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.1-pull-request' into staging (2020-07-06 11:40:10 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 7bf114070834e1b0c947b7c2a1c96cb734eb6b86:

  qemu-img: Deprecate use of -b without -F (2020-07-07 18:18:06 +0200)

----------------------------------------------------------------
Block layer patches:

- file-posix: Mitigate file fragmentation with extent size hints
- Tighten qemu-img rules on missing backing format
- qemu-img map: Don't limit block status request size

----------------------------------------------------------------
Eric Blake (10):
      qemu-img: Flush stdout before before potential stderr messages
      block: Finish deprecation of 'qemu-img convert -n -o'
      sheepdog: Add trivial backing_fmt support
      vmdk: Add trivial backing_fmt support
      qcow: Tolerate backing_fmt=
      block: Error if backing file fails during creation without -u
      qcow2: Deprecate use of qemu-img amend to change backing file
      iotests: Specify explicit backing format where sensible
      block: Add support to warn on backing file change without format
      qemu-img: Deprecate use of -b without -F

Kevin Wolf (2):
      qemu-img map: Don't limit block status request size
      file-posix: Mitigate file fragmentation with extent size hints

 qapi/block-core.json          | 11 ++++--
 docs/system/deprecated.rst    | 58 ++++++++++++++++++++++++----
 docs/tools/qemu-img.rst       |  4 ++
 include/block/block.h         |  4 +-
 include/block/block_int.h     |  1 +
 block.c                       | 53 +++++++++++++++++++-------
 block/file-posix.c            | 42 +++++++++++++++++++++
 block/qcow.c                  | 20 +++++++++-
 block/qcow2.c                 |  7 +++-
 block/sheepdog.c              | 18 ++++++++-
 block/stream.c                |  2 +-
 block/vmdk.c                  | 14 +++++++
 blockdev.c                    |  3 +-
 qemu-img.c                    | 20 ++++++----
 tests/qemu-iotests/017        |  2 +-
 tests/qemu-iotests/017.out    |  2 +-
 tests/qemu-iotests/018        |  2 +-
 tests/qemu-iotests/018.out    |  2 +-
 tests/qemu-iotests/019        |  5 ++-
 tests/qemu-iotests/019.out    |  2 +-
 tests/qemu-iotests/020        |  4 +-
 tests/qemu-iotests/020.out    |  4 +-
 tests/qemu-iotests/024        |  8 ++--
 tests/qemu-iotests/024.out    |  5 ++-
 tests/qemu-iotests/028        |  4 +-
 tests/qemu-iotests/028.out    |  2 +-
 tests/qemu-iotests/030        | 26 +++++++++----
 tests/qemu-iotests/034        |  2 +-
 tests/qemu-iotests/034.out    |  2 +-
 tests/qemu-iotests/037        |  2 +-
 tests/qemu-iotests/037.out    |  2 +-
 tests/qemu-iotests/038        |  2 +-
 tests/qemu-iotests/038.out    |  2 +-
 tests/qemu-iotests/039        |  3 +-
 tests/qemu-iotests/039.out    |  2 +-
 tests/qemu-iotests/040        | 47 ++++++++++++++++-------
 tests/qemu-iotests/041        | 37 ++++++++++++------
 tests/qemu-iotests/042        |  4 +-
 tests/qemu-iotests/043        | 18 ++++-----
 tests/qemu-iotests/043.out    | 16 +++++---
 tests/qemu-iotests/046        |  2 +-
 tests/qemu-iotests/046.out    |  2 +-
 tests/qemu-iotests/049.out    |  8 ++--
 tests/qemu-iotests/050        |  4 +-
 tests/qemu-iotests/050.out    |  2 +-
 tests/qemu-iotests/051        |  2 +-
 tests/qemu-iotests/051.out    |  2 +-
 tests/qemu-iotests/051.pc.out |  2 +-
 tests/qemu-iotests/054.out    |  2 +-
 tests/qemu-iotests/056        |  3 +-
 tests/qemu-iotests/060        |  2 +-
 tests/qemu-iotests/060.out    |  2 +-
 tests/qemu-iotests/061        | 10 ++---
 tests/qemu-iotests/061.out    | 11 +++---
 tests/qemu-iotests/069        |  2 +-
 tests/qemu-iotests/069.out    |  2 +-
 tests/qemu-iotests/073        |  2 +-
 tests/qemu-iotests/073.out    |  2 +-
 tests/qemu-iotests/079.out    |  2 +-
 tests/qemu-iotests/082        | 10 +++--
 tests/qemu-iotests/082.out    | 30 ++++++++++++---
 tests/qemu-iotests/085        |  4 +-
 tests/qemu-iotests/085.out    |  6 +--
 tests/qemu-iotests/089        |  2 +-
 tests/qemu-iotests/089.out    |  2 +-
 tests/qemu-iotests/095        |  4 +-
 tests/qemu-iotests/095.out    |  4 +-
 tests/qemu-iotests/097        |  4 +-
 tests/qemu-iotests/097.out    | 16 ++++----
 tests/qemu-iotests/098        |  2 +-
 tests/qemu-iotests/098.out    |  8 ++--
 tests/qemu-iotests/110        |  4 +-
 tests/qemu-iotests/110.out    |  4 +-
 tests/qemu-iotests/111.out    |  2 +-
 tests/qemu-iotests/112.out    |  4 +-
 tests/qemu-iotests/114        | 12 ++++++
 tests/qemu-iotests/114.out    |  9 +++++
 tests/qemu-iotests/122        | 34 +++++++++++------
 tests/qemu-iotests/122.out    | 12 ++++--
 tests/qemu-iotests/126        |  4 +-
 tests/qemu-iotests/126.out    |  4 +-
 tests/qemu-iotests/127        |  4 +-
 tests/qemu-iotests/127.out    |  4 +-
 tests/qemu-iotests/129        |  3 +-
 tests/qemu-iotests/133        |  2 +-
 tests/qemu-iotests/133.out    |  2 +-
 tests/qemu-iotests/139        |  2 +-
 tests/qemu-iotests/141        |  4 +-
 tests/qemu-iotests/141.out    |  4 +-
 tests/qemu-iotests/142        |  2 +-
 tests/qemu-iotests/142.out    |  2 +-
 tests/qemu-iotests/153        | 14 +++----
 tests/qemu-iotests/153.out    | 35 +++++++++--------
 tests/qemu-iotests/154        | 42 ++++++++++-----------
 tests/qemu-iotests/154.out    | 42 ++++++++++-----------
 tests/qemu-iotests/155        | 12 ++++--
 tests/qemu-iotests/156        |  9 +++--
 tests/qemu-iotests/156.out    |  6 +--
 tests/qemu-iotests/158        |  2 +-
 tests/qemu-iotests/158.out    |  2 +-
 tests/qemu-iotests/161        |  8 ++--
 tests/qemu-iotests/161.out    |  8 ++--
 tests/qemu-iotests/176        |  4 +-
 tests/qemu-iotests/176.out    | 32 ++++++++--------
 tests/qemu-iotests/177        |  2 +-
 tests/qemu-iotests/177.out    |  2 +-
 tests/qemu-iotests/179        |  2 +-
 tests/qemu-iotests/179.out    |  2 +-
 tests/qemu-iotests/189        |  2 +-
 tests/qemu-iotests/189.out    |  2 +-
 tests/qemu-iotests/191        | 12 +++---
 tests/qemu-iotests/191.out    | 12 +++---
 tests/qemu-iotests/195        |  6 +--
 tests/qemu-iotests/195.out    |  6 +--
 tests/qemu-iotests/198        |  2 +-
 tests/qemu-iotests/198.out    |  3 +-
 tests/qemu-iotests/204        |  2 +-
 tests/qemu-iotests/204.out    |  2 +-
 tests/qemu-iotests/216        |  2 +-
 tests/qemu-iotests/224        |  4 +-
 tests/qemu-iotests/225        |  2 +-
 tests/qemu-iotests/225.out    |  2 +-
 tests/qemu-iotests/228        |  5 ++-
 tests/qemu-iotests/243        |  7 ++--
 tests/qemu-iotests/243.out    | 16 ++++----
 tests/qemu-iotests/245        |  3 +-
 tests/qemu-iotests/249        |  4 +-
 tests/qemu-iotests/249.out    |  4 +-
 tests/qemu-iotests/252        |  2 +-
 tests/qemu-iotests/257        |  3 +-
 tests/qemu-iotests/259.out    |  2 +-
 tests/qemu-iotests/267        |  4 +-
 tests/qemu-iotests/267.out    |  6 +--
 tests/qemu-iotests/270        |  2 +-
 tests/qemu-iotests/270.out    |  2 +-
 tests/qemu-iotests/273        |  4 +-
 tests/qemu-iotests/273.out    |  4 +-
 tests/qemu-iotests/274        | 12 +++---
 tests/qemu-iotests/274.out    | 29 +++++++-------
 tests/qemu-iotests/279        |  4 +-
 tests/qemu-iotests/279.out    |  4 +-
 tests/qemu-iotests/290        |  2 +-
 tests/qemu-iotests/290.out    |  4 +-
 tests/qemu-iotests/293        | 88 +++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/293.out    | 59 +++++++++++++++++++++++++++++
 tests/qemu-iotests/group      |  1 +
 146 files changed, 871 insertions(+), 421 deletions(-)
 create mode 100755 tests/qemu-iotests/293
 create mode 100644 tests/qemu-iotests/293.out


