Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FCC4E3DE8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:59:03 +0100 (CET)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdAE-0005ad-3y
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:59:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8F-00028J-4J
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8B-0006NS-KO
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XOhlu2RWwB/sD0jpYKUv4dNXuq7D2U1FkXpPQZInz3A=;
 b=GyfeL6ozsz6FwiZGD42wX1riJdZCL2gusM5l7LSpaNVe05GfEyMvtdLNWFvmIWmSJSGvMQ
 +R3qyjcbzVbscXI0VJcEYkzdRj7p3MP7aMUKuxsXVJMa1+ze2OSuOgOKVoE+4pow/NVFTl
 LajmSkHBH931rUblvSPuuaMhCokgX9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-Zrqlujd2PgKUcD2rUDzOdg-1; Tue, 22 Mar 2022 07:56:49 -0400
X-MC-Unique: Zrqlujd2PgKUcD2rUDzOdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63CE885A5BE;
 Tue, 22 Mar 2022 11:56:49 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 205FA403D188;
 Tue, 22 Mar 2022 11:56:48 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/25] Block patches for 7.0-rc1
Date: Tue, 22 Mar 2022 12:56:22 +0100
Message-Id: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 330724977b10f5b92610817e8b7d1dfed122df87:

  Merge tag 'pull-misc-2022-03-21' of git://repo.or.cz/qemu/armbru into staging (2022-03-21 17:46:40 +0000)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-03-22

for you to fetch changes up to 48f1fcd5c87cadef331a2cd08e67e37a789e8347:

  iotests/207: Filter host fingerprint (2022-03-22 10:50:10 +0100)

----------------------------------------------------------------
Block patches for 7.0-rc1:
- iotest fixes:
  - Fix some iotests for riscv targets
  - Use GNU sed in more places where required
  - Meson-related fixes (i.e. to print errors when they occur)
  - Have qemu-img calls (from Python tests) generally raise nicely
    formattable exceptions on errors
  - Fix iotest 207
- Allow RBD images to be growable by writing zeroes past the end of
  file, fixing qcow2 on rbd

----------------------------------------------------------------
Hanna Reitz (2):
  iotests.py: Filters for VM.run_job()
  iotests/207: Filter host fingerprint

John Snow (18):
  python/utils: add add_visual_margin() text decoration utility
  python/utils: add VerboseProcessError
  iotests: Remove explicit checks for qemu_img() == 0
  iotests: make qemu_img raise on non-zero rc by default
  iotests: fortify compare_images() against crashes
  iotests: add qemu_img_json()
  iotests: use qemu_img_json() when applicable
  iotests: add qemu_img_info()
  iotests/remove-bitmap-from-backing: use qemu_img_info()
  iotests: add qemu_img_map() function
  iotests: change supports_quorum to use qemu_img
  iotests: replace unchecked calls to qemu_img_pipe()
  iotests/149: Remove qemu_img_pipe() call
  iotests: remove remaining calls to qemu_img_pipe()
  iotests: use qemu_img() in has_working_luks()
  iotests: replace qemu_img_log('create', ...) calls
  iotests: remove qemu_img_pipe_and_status()
  iotests: make qemu_img_log and img_info_log raise on error

Stefano Garzarella (1):
  block/rbd: fix write zeroes with growing images

Thomas Huth (3):
  tests/qemu-iotests: Use GNU sed in two more spots where it is
    necessary
  tests: Do not treat the iotests as separate meson test target anymore
  tests/qemu-iotests/testrunner: Supply a test plan in TAP mode

laokz (1):
  tests: add (riscv virt) machine mapping to testenv

 meson.build                                   |   6 +-
 block/rbd.c                                   |  26 +--
 python/qemu/utils/__init__.py                 | 117 +++++++++++
 scripts/mtest2make.py                         |   4 -
 tests/Makefile.include                        |   9 +-
 tests/qemu-iotests/041                        |   5 +-
 tests/qemu-iotests/065                        |   7 +-
 tests/qemu-iotests/149                        |   7 +-
 tests/qemu-iotests/149.out                    |  21 --
 tests/qemu-iotests/163                        |   9 +-
 tests/qemu-iotests/194                        |   4 +-
 tests/qemu-iotests/202                        |   4 +-
 tests/qemu-iotests/203                        |   4 +-
 tests/qemu-iotests/207                        |   7 +-
 tests/qemu-iotests/207.out                    |   6 +-
 tests/qemu-iotests/211                        |   6 +-
 tests/qemu-iotests/211.out                    |  10 +-
 tests/qemu-iotests/216                        |   6 +-
 tests/qemu-iotests/218                        |   2 +-
 tests/qemu-iotests/224                        |  11 +-
 tests/qemu-iotests/228                        |  12 +-
 tests/qemu-iotests/234                        |   4 +-
 tests/qemu-iotests/237                        |   3 +-
 tests/qemu-iotests/237.out                    |   3 -
 tests/qemu-iotests/242                        |   7 +-
 tests/qemu-iotests/255                        |   8 +-
 tests/qemu-iotests/255.out                    |   4 -
 tests/qemu-iotests/257                        |  11 +-
 tests/qemu-iotests/258                        |   4 +-
 tests/qemu-iotests/262                        |   2 +-
 tests/qemu-iotests/266                        |   2 +-
 tests/qemu-iotests/274                        |  17 +-
 tests/qemu-iotests/274.out                    |  29 ---
 tests/qemu-iotests/280                        |   2 +-
 tests/qemu-iotests/280.out                    |   1 -
 tests/qemu-iotests/296                        |  12 +-
 tests/qemu-iotests/303                        |   2 +-
 tests/qemu-iotests/310                        |  13 +-
 tests/qemu-iotests/common.filter              |   4 +-
 tests/qemu-iotests/iotests.py                 | 196 +++++++++++++-----
 tests/qemu-iotests/testenv.py                 |   2 +
 tests/qemu-iotests/testrunner.py              |   1 +
 tests/qemu-iotests/tests/block-status-cache   |  14 +-
 .../qemu-iotests/tests/graph-changes-while-io |   7 +-
 tests/qemu-iotests/tests/image-fleecing       |  10 +-
 .../tests/mirror-ready-cancel-error           |   6 +-
 tests/qemu-iotests/tests/mirror-top-perms     |   3 +-
 .../qemu-iotests/tests/parallels-read-bitmap  |   6 +-
 .../tests/remove-bitmap-from-backing          |  14 +-
 .../qemu-iotests/tests/stream-error-on-reset  |   4 +-
 50 files changed, 402 insertions(+), 272 deletions(-)

-- 
2.35.1


