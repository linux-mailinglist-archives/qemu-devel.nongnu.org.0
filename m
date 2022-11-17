Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BAD62D610
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:11:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovauY-0007Xa-PP; Thu, 17 Nov 2022 04:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovauX-0007XQ-5I
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovauV-0001r2-7i
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668676213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H2wTKl8VkUrYUAZhMx/lYdHKIvHcSNsi6m1FUTSnIGM=;
 b=TDpDw1bk/Qso8bUuwm3hyuCbJjFtBAafk7ZicZLTZW2J/S2rp2aHHML+UmJLIXPWF2pKah
 BnOGu+bBzSEzIjzsV7s/uN1OeEI4G0CRnO7oRaiPJxWUy7ZK0UGHyGMG0klaOVQo/2FrqA
 zvgADI94nn+3XoHu617WxhOd0zMD46c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-cHtjOZYhPFe4lNjM_nBZYg-1; Thu, 17 Nov 2022 04:10:12 -0500
X-MC-Unique: cHtjOZYhPFe4lNjM_nBZYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3C72803481
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:10:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45AAC2028E94;
 Thu, 17 Nov 2022 09:10:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 0/4] Some small s390x and testing fixes
Date: Thu, 17 Nov 2022 10:10:02 +0100
Message-Id: <20221117091006.525072-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi Stefan!

The following changes since commit 2c8311241d1f7377bb4ff76064b1d1fe15166413:

  Update VERSION for v7.2.0-rc1 (2022-11-15 18:56:38 -0500)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-11-17

for you to fetch changes up to 1b7a07c4414323d985e89c4e78a4c30cba0e7a85:

  acpi/tests/avocado/bits: some misc fixes (2022-11-17 09:58:22 +0100)

----------------------------------------------------------------
* Add s390x documentation for the "loadparm" machine parameter
* Spelling fixes in the s390x code
* Update the macOS Cirrus-CI job to use aarch64 hosts
* Increase timeout and fix comments in the acpi avacodo test

----------------------------------------------------------------
Ani Sinha (1):
      acpi/tests/avocado/bits: some misc fixes

Daniel P. Berrangé (1):
      ci: replace x86_64 macos-11 with aarch64 macos-12

Thomas Huth (2):
      s390x: Fix spelling errors
      docs/system/s390x: Document the "loadparm" machine property

 docs/devel/acpi-bits.rst                           | 12 ++++------
 docs/system/s390x/bootdevices.rst                  | 26 ++++++++++++++++++++++
 hw/s390x/ipl.h                                     |  2 +-
 pc-bios/s390-ccw/cio.h                             |  2 +-
 pc-bios/s390-ccw/iplb.h                            |  2 +-
 target/s390x/cpu_models.h                          |  4 ++--
 hw/s390x/s390-pci-vfio.c                           |  2 +-
 hw/s390x/s390-virtio-ccw.c                         |  6 ++---
 target/s390x/ioinst.c                              |  2 +-
 target/s390x/tcg/excp_helper.c                     |  2 +-
 target/s390x/tcg/fpu_helper.c                      |  2 +-
 target/s390x/tcg/misc_helper.c                     |  2 +-
 target/s390x/tcg/translate.c                       |  4 ++--
 target/s390x/tcg/translate_vx.c.inc                |  6 ++---
 .gitlab-ci.d/cirrus.yml                            | 12 +++++-----
 .../cirrus/{macos-11.vars => macos-12.vars}        | 12 +++++-----
 pc-bios/s390-ccw/start.S                           |  2 +-
 tests/avocado/acpi-bits.py                         |  3 +++
 tests/lcitool/libvirt-ci                           |  2 +-
 tests/lcitool/refresh                              |  2 +-
 20 files changed, 66 insertions(+), 41 deletions(-)
 rename .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} (74%)


