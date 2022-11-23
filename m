Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1327C6361CA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:30:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqkW-0005zT-CL; Wed, 23 Nov 2022 09:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqkU-0005y1-IF
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:29:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqkE-0007rZ-JP
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669213731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vx8jwhZ5JA50XDvQkT9s3wUY4Qtm+zGpLtW/8BRstr8=;
 b=ZXMbS4qF4HRUCu0FZaVPoKxflAUfYtzzbuQaGn6O0cc3CFkjwXPDnngkW20D1yF0e2few9
 dOPFfxrpww7Xw0ZyHXKBbG1IYgclVuRhVjXw5dqGBWAZ5Xk7K1DbPxbXl0KSgfB7XIGRb+
 TXnoxT7l+fE9Fg4z/KzKLPyrX8Ltgf4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-IS3dNo1vOBytmWuj8g3vmw-1; Wed, 23 Nov 2022 09:28:49 -0500
X-MC-Unique: IS3dNo1vOBytmWuj8g3vmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5CB8101A56D
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 14:28:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4FD440C83BB;
 Wed, 23 Nov 2022 14:28:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 0/3] Avocado tests and qtests improvements
Date: Wed, 23 Nov 2022 15:28:40 +0100
Message-Id: <20221123142843.346105-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 7c09a7f6ae1770d15535980d15dffdb23f4d9786:

  Update VERSION for v7.2.0-rc2 (2022-11-22 18:59:56 -0500)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-11-23

for you to fetch changes up to 4189af72dd6fa74e2253f16c8078be52e55eb80e:

  tests/avocado: use new rootfs for orangepi test (2022-11-23 10:58:48 +0100)

----------------------------------------------------------------
* Shorten the amount of text from the qos-test to avoid hitting
  output size limits in the gitlab CI
* Update URLs of avocado tests

----------------------------------------------------------------
Alex Bennée (1):
      tests/avocado: use new rootfs for orangepi test

Thomas Huth (2):
      tests/avocado: Update the URLs of the advent calendar images
      tests/qtest: Decrease the amount of output from the qom-test

 tests/qtest/qom-test.c                  | 22 +++++++++++++++---
 tests/avocado/boot_linux_console.py     |  8 +++----
 tests/avocado/machine_arm_canona1100.py |  4 ++--
 tests/avocado/machine_microblaze.py     |  4 ++--
 tests/avocado/machine_sparc64_sun4u.py  |  4 ++--
 tests/avocado/ppc_mpc8544ds.py          |  6 ++---
 tests/avocado/ppc_virtex_ml507.py       |  6 ++---
 tests/avocado/replay_kernel.py          | 40 ++++++++++++++++-----------------
 8 files changed, 55 insertions(+), 39 deletions(-)


