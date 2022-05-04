Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FA8519E46
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:43:27 +0200 (CEST)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDPh-0008SJ-Sb
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCp5-0001d4-0B
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCoz-0001Wv-M5
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dQJ+GDJS5cj/DXSsVGUV43cvdjL0Vqf8adu7SGACZ1E=;
 b=TGJ+xcO/P9cuQMf/1U+wGk03JHSk9tagaLoGx56eb2KV8IzoDh6vrvPS2WGl9FHBWurLKA
 83kLrQMv21iLoe1c2gHH9Tu2eKuRIjAUx3dAiYJ3JYtiZaDFKyOM37Rz2Thw76o95L4Qy4
 ujUlYSI6ZnFcokdh6wqrzWwVlYjC9GM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-6Y0MNhIHPragzu5C5oXhIg-1; Wed, 04 May 2022 07:05:26 -0400
X-MC-Unique: 6Y0MNhIHPragzu5C5oXhIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2B0F8039D7;
 Wed,  4 May 2022 11:05:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7002111E40B;
 Wed,  4 May 2022 11:05:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PULL 00/15] s390x patches
Date: Wed,  4 May 2022 13:05:06 +0200
Message-Id: <20220504110521.343519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:

  Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-04

for you to fetch changes up to 0c5c4d5b3c1cb594e808dd4120cc56ee28fa31dd:

  tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c (2022-05-04 08:47:19 +0200)

----------------------------------------------------------------
* Silence the warning about the msa5 feature when using the "max" CPU on s390x
* Implement the s390x Vector-Enhancements Facility 2
* Remove the old libopcode-based s390 disassembler
* Fix branch-relative-long test compilation with Clang

----------------------------------------------------------------
David Hildenbrand (2):
      s390x/cpu_models: drop "msa5" from the TCG "max" model
      s390x/cpu_models: make "max" match the unmodified "qemu" CPU model under TCG

David Miller (9):
      target/s390x: vxeh2: vector convert short/32b
      target/s390x: vxeh2: vector string search
      target/s390x: vxeh2: Update for changes to vector shifts
      target/s390x: vxeh2: vector shift double by bit
      target/s390x: vxeh2: vector {load, store} elements reversed
      target/s390x: vxeh2: vector {load, store} byte reversed elements
      target/s390x: vxeh2: vector {load, store} byte reversed element
      target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
      tests/tcg/s390x: Tests for Vector Enhancements Facility 2

Ilya Leoshkevich (1):
      tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c

Richard Henderson (2):
      target/s390x: Fix writeback to v1 in helper_vstl
      tcg: Implement tcg_gen_{h,w}swap_{i32,i64}

Thomas Huth (1):
      disas: Remove old libopcode s390 disassembler

 include/disas/dis-asm.h                |    1 -
 include/tcg/tcg-op.h                   |    6 +
 target/s390x/helper.h                  |   13 +
 tests/tcg/s390x/vx.h                   |   19 +
 disas.c                                |    1 -
 disas/s390.c                           | 1892 --------------------------------
 hw/s390x/s390-virtio-ccw.c             |    3 +
 target/s390x/cpu.c                     |    1 -
 target/s390x/cpu_models.c              |   26 +-
 target/s390x/gen-features.c            |   14 +-
 target/s390x/tcg/translate.c           |    3 +-
 target/s390x/tcg/vec_fpu_helper.c      |   31 +
 target/s390x/tcg/vec_helper.c          |    2 -
 target/s390x/tcg/vec_int_helper.c      |   55 +
 target/s390x/tcg/vec_string_helper.c   |   99 ++
 tcg/tcg-op.c                           |   30 +
 tests/tcg/s390x/branch-relative-long.c |    4 +-
 tests/tcg/s390x/vxeh2_vcvt.c           |   88 ++
 tests/tcg/s390x/vxeh2_vlstr.c          |  139 +++
 tests/tcg/s390x/vxeh2_vs.c             |   93 ++
 target/s390x/tcg/translate_vx.c.inc    |  461 +++++++-
 MAINTAINERS                            |    2 -
 disas/meson.build                      |    1 -
 target/s390x/tcg/insn-data.def         |   40 +-
 tests/tcg/s390x/Makefile.target        |    8 +
 25 files changed, 1053 insertions(+), 1979 deletions(-)
 create mode 100644 tests/tcg/s390x/vx.h
 delete mode 100644 disas/s390.c
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c


