Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B544D06C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:42:09 +0100 (CET)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIJ6-0006Oz-BG
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:42:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI3r-0005gN-G1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI3k-0006sM-At
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646677574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EreJ8qXVmoCa7BeZFRZJJoA3n9Dy8rQ3LfmRfTzTlbE=;
 b=W2MhuFxrGcMBLCXHy1W+EofpJkW+HYJyP47KRYFKfYOHtJA71PwPkBdjcJCGRCW0/iiW9E
 xMGP+L07SJgOv/yRn6nQPMb5oaNbRvkT2QfE8DWM11m9QeIszG5rT2dcISQQdZt0K0Aw+f
 0i/qQ5RwwdEJ3PktnvjwH+QeySN57O8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-78zCTYebPzyTYbe5ZlyFQw-1; Mon, 07 Mar 2022 13:26:13 -0500
X-MC-Unique: 78zCTYebPzyTYbe5ZlyFQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5C4FC82;
 Mon,  7 Mar 2022 18:26:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDBBA80FC5;
 Mon,  7 Mar 2022 18:26:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] s390x, tests and misc patches
Date: Mon,  7 Mar 2022 19:26:02 +0100
Message-Id: <20220307182609.94466-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-07

for you to fetch changes up to 818e1636080768749dc826acd4825e71828ec7e6:

  Check and report for incomplete 'global' option format (2022-03-07 19:00:05 +0100)

----------------------------------------------------------------
* Fixes for s390x TCG tests
* Update Haiku VM to a usable level
* Some other miscellaneous small fixes

----------------------------------------------------------------
David Miller (1):
      tests/tcg/s390x: Cleanup of mie3 tests.

Rohit Kumar (1):
      Check and report for incomplete 'global' option format

Thomas Huth (5):
      tests/tcg/s390x: Fix mvc, mvo and pack tests with Clang
      tests/tcg/s390x: Fix the exrl-trt* tests with Clang
      MAINTAINERS: Update the files in the FreeBSD section
      tests/avocado: Cancel BootLinux tests in case there is no free port
      tests/vm: Update haiku test vm to R1/Beta3

 MAINTAINERS                            |  3 ++-
 softmmu/qdev-monitor.c                 |  7 +++++++
 tests/avocado/avocado_qemu/__init__.py |  2 ++
 tests/tcg/s390x/exrl-trt.c             |  8 +++-----
 tests/tcg/s390x/exrl-trtr.c            |  8 +++-----
 tests/tcg/s390x/mie3-mvcrl.c           | 10 ++++++----
 tests/tcg/s390x/mie3-sel.c             | 35 +++++++++++++++-------------------
 tests/tcg/s390x/mvc.c                  |  4 ++--
 tests/tcg/s390x/mvo.c                  |  4 ++--
 tests/tcg/s390x/pack.c                 |  2 +-
 tests/vm/haiku.x86_64                  |  8 ++++----
 11 files changed, 47 insertions(+), 44 deletions(-)


