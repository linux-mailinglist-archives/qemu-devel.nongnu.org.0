Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924D45907B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:46:02 +0100 (CET)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAa0-0001pC-St
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:46:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXj-0007jR-GY
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXa-0004JL-7F
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o7NAPiNEPiJnypUNNSh+HF/ln7BRTBvSHCOC7QgRh+s=;
 b=MzOuFtoRhis0M6PMYIk0XaTSOt4Jqn2HBUKKpKCapVA+tdp5iNK54cET3kKZqUYqFssrlg
 qU8vucr5ydbUlRUXqBLM7C7XFw2LAP6JLgcNBMkmi6ur9aegM9c5xhLfLteoTH7MfxxSGF
 RRsl5dWt6LR3Z/0SQUeCmvR4ecDEqbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-AA2LzSd7PMSM3Cm2JypSww-1; Mon, 22 Nov 2021 09:43:27 -0500
X-MC-Unique: AA2LzSd7PMSM3Cm2JypSww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B33410151E0;
 Mon, 22 Nov 2021 14:43:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF37A607D5;
 Mon, 22 Nov 2021 14:43:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/6] Documentation updates
Date: Mon, 22 Nov 2021 15:43:14 +0100
Message-Id: <20211122144320.29178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 Hi Richard!

The following changes since commit c5fbdd60cf1fb52f01bdfe342b6fa65d5343e1b1:

  Merge tag 'qemu-sparc-20211121' of git://github.com/mcayland/qemu into staging (2021-11-21 14:12:25 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-11-22

for you to fetch changes up to c5ba62195427d65a44472901cff3dddffc14b3b3:

  docs: Render binary names as monospaced text (2021-11-22 15:02:38 +0100)

----------------------------------------------------------------
* Documentation updates

----------------------------------------------------------------
Kashyap Chamarthy (2):
      docs: Fix botched rST conversion of 'submitting-a-patch.rst'
      docs: List more commit-message tags in "submitting-a-patch"

Philippe Mathieu-Daudé (1):
      docs: Render binary names as monospaced text

Rao, Lei (2):
      docs: Drop deprecated 'props' from object-add
      docs: Use double quotes instead of single quotes for COLO

Stefan Weil (1):
      Fix some typos in documentation (found by codespell)

 docs/COLO-FT.txt                         | 106 ++++++++--------
 docs/about/removed-features.rst          |   8 +-
 docs/block-replication.txt               |  52 ++++----
 docs/devel/build-system.rst              |   6 +-
 docs/devel/multi-process.rst             |   8 +-
 docs/devel/qgraph.rst                    |   2 +-
 docs/devel/stable-process.rst            |   2 +
 docs/devel/style.rst                     |   2 +
 docs/devel/submitting-a-patch.rst        | 202 +++++++++++++++++++++++--------
 docs/devel/submitting-a-pull-request.rst |   9 +-
 docs/devel/testing.rst                   |   8 +-
 docs/devel/trivial-patches.rst           |   2 +
 docs/devel/writing-monitor-commands.rst  |   2 +-
 docs/hyperv.txt                          |   2 +-
 docs/image-fuzzer.txt                    |   6 +-
 docs/system/arm/orangepi.rst             |   2 +-
 docs/system/authz.rst                    |  26 ++--
 docs/system/cpu-models-x86.rst.inc       |   2 +-
 docs/system/devices/nvme.rst             |   2 +-
 docs/system/gdb.rst                      |   2 +-
 docs/system/images.rst                   |   2 +-
 docs/system/ppc/ppce500.rst              |   2 +-
 docs/system/qemu-block-drivers.rst.inc   |   6 +-
 docs/system/riscv/shakti-c.rst           |   2 +-
 docs/system/tls.rst                      |   2 +-
 docs/throttle.txt                        |   8 +-
 docs/tools/qemu-img.rst                  |  18 +--
 docs/tools/qemu-nbd.rst                  |   6 +-
 docs/tools/qemu-storage-daemon.rst       |   7 +-
 docs/tools/virtiofsd.rst                 |   4 +-
 30 files changed, 307 insertions(+), 201 deletions(-)


