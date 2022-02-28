Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB034C6E9B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:51:28 +0100 (CET)
Received: from localhost ([::1]:50282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgQw-00021H-VS
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg5y-0007HW-06
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg5v-00031z-RA
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646054983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5G/e/mrgwhrkdTKYkM+fdTHM93nWq79L6ol1Bnb9xPM=;
 b=Rd0p0r8UrtO1cEDzHNhm+7Cj2tMEuU5qY7w23JH2WMIGwxNtEuOVxggQWNa9+HLdocIvsl
 j3ACeA5zXMzFqH5ovFB06xQGmufmqXzKK8bUdJ53DAIZEmURxz8N7I2AN6qkz5BHo/9pD/
 GHB7dhqpBgNziDqhMsaWJXYhAvx/eBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-2zoHzWNzOmC3IXDwN6D3ow-1; Mon, 28 Feb 2022 08:29:39 -0500
X-MC-Unique: 2zoHzWNzOmC3IXDwN6D3ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8686824FA6;
 Mon, 28 Feb 2022 13:29:38 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C80377A3F3;
 Mon, 28 Feb 2022 13:29:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] s390x patches
Date: Mon, 28 Feb 2022 14:29:30 +0100
Message-Id: <20220228132936.1411176-1-thuth@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b08:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-02-24 12:48:14 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-02-28

for you to fetch changes up to e2c3fb069994858fea9aca9a4e64fa5afd34021a:

  tests/tcg/s390x: Tests for Miscellaneous-Instruction-Extensions Facility 3 (2022-02-28 11:29:15 +0100)

----------------------------------------------------------------
* Fix emulation of the SET CLOCK instruction
* Fix the s390x avocado test with Fedora
* Update the s390x Travis jobs to Focal (instead of Bionic)
* Implement the z15 Misc Instruction Extension 3 Facility

----------------------------------------------------------------
David Miller (3):
      s390x/tcg: Implement Miscellaneous-Instruction-Extensions Facility 3 for the s390x
      s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z15 GA1
      tests/tcg/s390x: Tests for Miscellaneous-Instruction-Extensions Facility 3

Nico Boehr (1):
      s390x: sck: load into a temporary not into in1

Thomas Huth (2):
      tests/avocado/machine_s390_ccw_virtio: Adapt test to new default resolution
      travis.yml: Update the s390x jobs to Ubuntu Focal

 .travis.yml                              | 12 +++---
 hw/s390x/s390-virtio-ccw.c               |  3 ++
 target/s390x/cpu_models.c                |  6 +--
 target/s390x/gen-features.c              |  6 ++-
 target/s390x/helper.h                    |  1 +
 target/s390x/tcg/insn-data.def           | 32 ++++++++++++++--
 target/s390x/tcg/mem_helper.c            | 20 ++++++++++
 target/s390x/tcg/translate.c             | 63 ++++++++++++++++++++++++++++++--
 tests/avocado/machine_s390_ccw_virtio.py |  2 +-
 tests/tcg/s390x/Makefile.target          |  3 ++
 tests/tcg/s390x/mie3-compl.c             | 48 ++++++++++++++++++++++++
 tests/tcg/s390x/mie3-mvcrl.c             | 27 ++++++++++++++
 tests/tcg/s390x/mie3-sel.c               | 38 +++++++++++++++++++
 13 files changed, 241 insertions(+), 20 deletions(-)
 create mode 100644 tests/tcg/s390x/mie3-compl.c
 create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
 create mode 100644 tests/tcg/s390x/mie3-sel.c


