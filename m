Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C48D50885E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:43:52 +0200 (CEST)
Received: from localhost ([::1]:54828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9gV-0005jQ-CK
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e0-00029z-7G
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9dw-00043D-Vy
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650458471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PlAtJd/ib5HG16jUT0zq/9x9mTX/rN2Pr/yChIfzrP8=;
 b=C8h96fg31Od+zDFDsfBJN+jKRfLs/jAAkcCXFmVTNQ4zfp4IN3BZciCO+eDdso8V7TCSwN
 0KavUZF3z9tCewH69quXtljyW/WoUUgCf2PQJPF4WzvwpsvKqRulaM2GzjaK/J3QVNseoh
 k07+jI8SAl6Y0Rrxddr4SPo+HJL1TDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-V8l3YDHMOQW5li0ssGqNcg-1; Wed, 20 Apr 2022 08:41:10 -0400
X-MC-Unique: V8l3YDHMOQW5li0ssGqNcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92B5010AF654;
 Wed, 20 Apr 2022 12:41:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D0AC8144;
 Wed, 20 Apr 2022 12:41:05 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/8] Block patches
Date: Wed, 20 Apr 2022 14:40:56 +0200
Message-Id: <20220420124104.795836-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1be5a765c08cee3a9587c8a8d3fc2ea247b13f9c:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-04-19 18:22:16 -0700)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-04-20

for you to fetch changes up to 0423f75351ab83b844a31349218b0eadd830e07a:

  qcow2: Add errp to rebuild_refcount_structure() (2022-04-20 12:09:17 +0200)

----------------------------------------------------------------
Block patches:
- Some changes for qcow2's refcount repair algorithm to make it work for
  qcow2 images stored on block devices
- Skip test cases that require zstd when support for it is missing
- Some refactoring in the iotests' meson.build

----------------------------------------------------------------
Hanna Reitz (6):
  iotests.py: Add supports_qcow2_zstd_compression()
  iotests/065: Check for zstd support
  iotests/303: Check for zstd support
  qcow2: Improve refcount structure rebuilding
  iotests/108: Test new refcount rebuild algorithm
  qcow2: Add errp to rebuild_refcount_structure()

Thomas Huth (2):
  tests/qemu-iotests/meson.build: Improve the indentation
  tests/qemu-iotests: Move the bash and sanitizer checks to meson.build

 block/qcow2-refcount.c         | 353 +++++++++++++++++++++++----------
 tests/check-block.sh           |  26 ---
 tests/qemu-iotests/065         |  24 ++-
 tests/qemu-iotests/108         | 259 +++++++++++++++++++++++-
 tests/qemu-iotests/108.out     |  81 ++++++++
 tests/qemu-iotests/303         |   4 +-
 tests/qemu-iotests/iotests.py  |  20 ++
 tests/qemu-iotests/meson.build |  73 ++++---
 8 files changed, 673 insertions(+), 167 deletions(-)

-- 
2.35.1


