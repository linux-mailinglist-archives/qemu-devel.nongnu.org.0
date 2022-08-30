Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313FC5A6B14
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 19:45:51 +0200 (CEST)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT5J7-0007MU-Pb
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 13:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4u9-0006P3-KH
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4u4-0005hD-RU
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661879995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AD58IAYzzX60vR5gJOMoeAjQQSlNJxLqIPEjA5Pj40k=;
 b=fJYtb5tyh6gMSDdMNFHTTYHh8Nx31g8muElpkqnzL1HytMHexZL8oya7aa2FlgnKR8YAfk
 ZKIj31u1Efean+vP7GxjAMVSk1ralypHeEZfr37tg74n7x/R/0JtIzF9aZsQezO/mIsPwc
 t+iXXTFYUTsnE0H35eqrRYJqZQzM0XE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-anGKr3B3PMK1w7pGNKkwwg-1; Tue, 30 Aug 2022 13:19:51 -0400
X-MC-Unique: anGKr3B3PMK1w7pGNKkwwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29E3D80A0C3;
 Tue, 30 Aug 2022 17:19:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2D571121314;
 Tue, 30 Aug 2022 17:19:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 0/6] First s390x updates for QEMU 7.2
Date: Tue, 30 Aug 2022 19:19:41 +0200
Message-Id: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

 Hi Richard, hi Peter!

The following changes since commit 9a99f964b152f8095949bbddca7841744ad418da:

  Update version for v7.1.0-rc4 release (2022-08-24 19:27:56 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/s390x-pull-request-2022-08-30

for you to fetch changes up to 90d994619383c2665cf4f4712872c43ad2728bec:

  util/mmap-alloc: Remove qemu_mempath_getpagesize() (2022-08-26 13:34:21 +0200)

----------------------------------------------------------------
* Compat machine types for QEMU 7.2
* Add feature bit for the "processor-activity-instrumentation extension"
* Fix emulation of CLFIT and CLGIT instructions
* Fix hugepages support on s390x with the memfd memory-backend

----------------------------------------------------------------
Christian Borntraeger (1):
      s390x/cpumodel: add stfl197 processor-activity-instrumentation extension 1

Cornelia Huck (1):
      hw: Add compat machines for 7.2

Ilya Leoshkevich (1):
      target/s390x: Fix CLFIT and CLGIT immediate size

Thomas Huth (3):
      backends/hostmem: Fix support of memory-backend-memfd in qemu_maxrampagesize()
      softmmu/physmem: Remove the ifdef __linux__ around the pagesize functions
      util/mmap-alloc: Remove qemu_mempath_getpagesize()

 include/hw/boards.h                 |  3 +++
 include/hw/i386/pc.h                |  3 +++
 include/qemu/mmap-alloc.h           |  2 --
 target/s390x/cpu_features_def.h.inc |  1 +
 backends/hostmem.c                  | 14 ++------------
 hw/arm/virt.c                       |  9 ++++++++-
 hw/core/machine.c                   |  3 +++
 hw/i386/pc.c                        |  3 +++
 hw/i386/pc_piix.c                   | 14 +++++++++++++-
 hw/i386/pc_q35.c                    | 13 ++++++++++++-
 hw/m68k/virt.c                      |  9 ++++++++-
 hw/ppc/spapr.c                      | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c          | 15 ++++++++++++++-
 softmmu/physmem.c                   | 17 -----------------
 target/s390x/gen-features.c         |  2 ++
 util/mmap-alloc.c                   | 31 -------------------------------
 target/s390x/tcg/insn-data.def      |  4 ++--
 17 files changed, 87 insertions(+), 71 deletions(-)


