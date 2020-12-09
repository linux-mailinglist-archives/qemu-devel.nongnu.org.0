Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DA2D3F39
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:54:45 +0100 (CET)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwBH-000293-MB
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw5r-00058t-V8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw5q-0007Ka-2A
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7tzRPpr2QeAG7lCpoxxAlPLJsq1AVAlzIizF7mu9ZZM=;
 b=J8IKRHn7eIJbH5Cdj+UwdE9yhoT2HFrdAuEEL4w5Vny0QHZG0bcq54oUU7hbBtYgcxANsZ
 AMOUnWGj4D2Y0ha1NAqKjNPEsBeG5W0gqAIquXfb2TEegy/yycEsFUrQC3fsE2JDwbJqt6
 64LsDGNBN6uo8hHhfCbPqVSCTL61jIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-6fhvbJg4PGqukRflAdysmw-1; Wed, 09 Dec 2020 04:49:03 -0500
X-MC-Unique: 6fhvbJg4PGqukRflAdysmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3242B1927801;
 Wed,  9 Dec 2020 09:48:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72CDB5C23D;
 Wed,  9 Dec 2020 09:48:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/13] Gitlab-CI and test patches
Date: Wed,  9 Dec 2020 10:48:43 +0100
Message-Id: <20201209094856.17788-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:

  Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-09

for you to fetch changes up to b0bed2c916286326b248da05b2ca5f6d152aba44:

  hw/m68k/mcf5206: Don't leak IRQs in mcf5206_mbar_realize() (2020-12-09 08:04:34 +0100)

----------------------------------------------------------------
* Gitlab-CI improvement patches by Philippe
* Some small fixes for tests
* Fix coverity warning in the mcf5206 code
----------------------------------------------------------------

Alex Chen (1):
      test-qga: fix a resource leak in test_qga_guest_get_osinfo()

Alexander Bulekov (1):
      fuzz: avoid double-fetches by default

Peter Maydell (1):
      hw/m68k/mcf5206: Don't leak IRQs in mcf5206_mbar_realize()

Philippe Mathieu-Daudé (10):
      gitlab-ci: Document 'build-tcg-disabled' is a KVM X86 job
      gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)
      gitlab-ci: Introduce 'cross_accel_build_job' template
      gitlab-ci: Add KVM s390x cross-build jobs
      gitlab-ci: Add Xen cross-build jobs
      tests/qtest/fuzz-test: Quit test_lp1878642 once done
      gitlab-ci: Split CONFIGURE_ARGS one argument per line for build-disabled
      gitlab-ci: Update 'build-disabled' to cover all configurable options
      gitlab-ci: Move user-static test across to gitlab
      gitlab-ci: Move coroutine tests across to gitlab

 .gitlab-ci.d/crossbuilds.yml    |  78 +++++++++++++++++++--------
 .gitlab-ci.yml                  | 114 ++++++++++++++++++++++++++++++++++------
 .travis.yml                     |  19 -------
 hw/m68k/mcf5206.c               |  12 ++---
 tests/qtest/fuzz-test.c         |   1 +
 tests/qtest/fuzz/generic_fuzz.c |   1 +
 tests/test-qga.c                |   1 +
 7 files changed, 163 insertions(+), 63 deletions(-)


