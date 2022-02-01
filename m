Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E974A60F8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:07:13 +0100 (CET)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvgV-0003nV-Fp
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSL-0003B5-7q
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSE-0004Bk-IT
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=71xzAF4tiCWuJyMFU6E+5kvMFCN6RdkjpqWraWDDCBg=;
 b=PR/sy5YmgQtGJOHcfcUvD916bE9dwZAb4AaoEqU4nxjDsrpVGlLtEmdmLm54aWAqYPJIjF
 iLc23BwENk5dfPDiNn4j9ysOrJH0ND3oxcj5QB9VYnx5BPElmxa/3Hlj2ptc0kTAG61Btc
 dnQZI4fQshTa8ECBZsi2y3K+S1RuaxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-QDn5K76nPCaTEACv_RzcdQ-1; Tue, 01 Feb 2022 09:42:43 -0500
X-MC-Unique: QDn5K76nPCaTEACv_RzcdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E38814255;
 Tue,  1 Feb 2022 14:42:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6742B4BA;
 Tue,  1 Feb 2022 14:42:35 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/24] Block patches
Date: Tue,  1 Feb 2022 15:42:09 +0100
Message-Id: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 804b30d25f8d70dc2dea951883ea92235274a50c:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220130' into staging (2022-01-31 11:10:08 +0000)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-02-01

for you to fetch changes up to 751486c18555169ca4baf59440275d5831140822:

  block.h: remove outdated comment (2022-02-01 13:28:53 +0100)

----------------------------------------------------------------
Block patches:
- Add support to the iotests to test qcow2's zstd compression mode
- Fix post-migration block node permissions
- iotests fixes (051 and mirror-ready-cancel-error)
- Remove an outdated comment

----------------------------------------------------------------
Emanuele Giuseppe Esposito (1):
  block.h: remove outdated comment

Hanna Reitz (3):
  iotests/MRCE: Write data to source
  block-backend: Retain permissions after migration
  iotests/migration-permissions: New test

Thomas Huth (1):
  tests/qemu-iotests: Fix 051 for binaries without 'lsi53c895a'

Vladimir Sementsov-Ogievskiy (19):
  iotests.py: img_info_log(): rename imgopts argument
  iotests.py: implement unsupported_imgopts
  iotests: specify some unsupported_imgopts for python iotests
  iotests.py: qemu_img*("create"): support
    IMGOPTS='compression_type=zstd'
  iotests: drop qemu_img_verbose() helper
  iotests.py: rewrite default luks support in qemu_img
  iotest 303: explicit compression type
  iotest 065: explicit compression type
  iotests.py: filter out successful output of qemu-img create
  iotests.py: filter compression type out
  iotest 302: use img_info_log() helper
  qcow2: simple case support for downgrading of qcow2 images with zstd
  iotests/common.rc: introduce _qcow2_dump_header helper
  iotests: massive use _qcow2_dump_header
  iotest 39: use _qcow2_dump_header
  iotests: bash tests: filter compression type
  iotests 60: more accurate set dirty bit in qcow2 header
  iotest 214: explicit compression type
  iotests: declare lack of support for compresion_type in IMGOPTS

 include/block/block.h                         |   1 -
 block/block-backend.c                         |  11 ++
 block/qcow2.c                                 |  58 +++++++++-
 tests/qemu-iotests/031                        |  11 +-
 tests/qemu-iotests/036                        |   6 +-
 tests/qemu-iotests/039                        |  22 ++--
 tests/qemu-iotests/044                        |   8 +-
 tests/qemu-iotests/044.out                    |   1 +
 tests/qemu-iotests/051                        |   9 +-
 tests/qemu-iotests/060                        |  22 ++--
 tests/qemu-iotests/060.out                    |   2 +-
 tests/qemu-iotests/061                        |  42 ++++----
 tests/qemu-iotests/061.out                    |  12 +--
 tests/qemu-iotests/065                        |  19 ++--
 tests/qemu-iotests/082.out                    |  14 +--
 tests/qemu-iotests/112                        |   3 +-
 tests/qemu-iotests/137                        |   2 +-
 tests/qemu-iotests/149.out                    |  21 ----
 tests/qemu-iotests/163                        |   3 +-
 tests/qemu-iotests/165                        |   3 +-
 tests/qemu-iotests/196                        |   3 +-
 tests/qemu-iotests/198.out                    |   4 +-
 tests/qemu-iotests/206.out                    |  10 +-
 tests/qemu-iotests/209                        |   7 +-
 tests/qemu-iotests/209.out                    |   2 +
 tests/qemu-iotests/210                        |   8 +-
 tests/qemu-iotests/214                        |   2 +-
 tests/qemu-iotests/237.out                    |   3 -
 tests/qemu-iotests/242                        |   3 +-
 tests/qemu-iotests/242.out                    |  10 +-
 tests/qemu-iotests/246                        |   3 +-
 tests/qemu-iotests/254                        |   3 +-
 tests/qemu-iotests/255.out                    |   4 -
 tests/qemu-iotests/260                        |   3 +-
 tests/qemu-iotests/274                        |   3 +-
 tests/qemu-iotests/274.out                    |  39 +------
 tests/qemu-iotests/280.out                    |   1 -
 tests/qemu-iotests/281                        |   3 +-
 tests/qemu-iotests/287                        |   8 +-
 tests/qemu-iotests/290                        |   2 +-
 tests/qemu-iotests/296.out                    |  10 +-
 tests/qemu-iotests/302                        |   4 +-
 tests/qemu-iotests/302.out                    |   7 +-
 tests/qemu-iotests/303                        |  26 +++--
 tests/qemu-iotests/303.out                    |  30 +++++-
 tests/qemu-iotests/common.filter              |   8 ++
 tests/qemu-iotests/common.rc                  |  22 ++++
 tests/qemu-iotests/iotests.py                 |  99 +++++++++++------
 .../tests/migrate-bitmaps-postcopy-test       |   3 +-
 tests/qemu-iotests/tests/migrate-bitmaps-test |   3 +-
 .../qemu-iotests/tests/migration-permissions  | 101 ++++++++++++++++++
 .../tests/migration-permissions.out           |   5 +
 .../tests/mirror-ready-cancel-error           |   7 +-
 .../tests/remove-bitmap-from-backing          |   3 +-
 54 files changed, 483 insertions(+), 236 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/migration-permissions
 create mode 100644 tests/qemu-iotests/tests/migration-permissions.out

-- 
2.34.1


