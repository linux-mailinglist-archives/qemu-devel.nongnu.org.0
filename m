Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA729680B2B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:46:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMRfA-0006wI-H4; Mon, 30 Jan 2023 05:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMRej-0006us-8V
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:44:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMReg-0001Zw-Ij
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675075493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iagOvkw6dwxMbTVSGmYVy1yBnroxUTOrY6UCrvXs+F8=;
 b=KvAt2AOwP2qaSPUK/moduYFpOUEVJfT8Zt48vKGWqF9xwlXOXwq7RhXOu+zB52mSRYjRJv
 YYVLV+jbW+AXNpRxZWsl09BpD2hDrSMzgPDtxA/VoYVZ6K3jkdOtpHg6ek+b2/nbHe/iM3
 LPYSXkywzBhryJsdcg/Qc9XNckfEkQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-WFw-ercHM7SyGzgJ56i2VQ-1; Mon, 30 Jan 2023 05:44:50 -0500
X-MC-Unique: WFw-ercHM7SyGzgJ56i2VQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E3CE101A521;
 Mon, 30 Jan 2023 10:44:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BDD9492B01;
 Mon, 30 Jan 2023 10:44:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/6] Shorten the runtime of some gitlab-CI shared runner jobs
Date: Mon, 30 Jan 2023 11:44:40 +0100
Message-Id: <20230130104446.1286773-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

We're currently facing the problem that the gitlab-CI jobs for the
shared runners take too much of the limited CI minutes on gitlab.com.
Here are now some patches that optimize some of the jobs a little bit
to take less runtime. We slightly lose some test coverage by some of
these changes (e.g. by dropping ppc-softmmu from a Clang-based test
and only continue testing ppc64-softmmu with Clang in another job),
but that should still be much better than running out of CI minutes
after 3/4 of a month.

Thomas Huth (6):
  gitlab-ci.d/buildtest: Remove ppc-softmmu from the clang-system job
  gitlab-ci.d/buildtest: Remove aarch64-softmmu from the
    build-system-ubuntu job
  tests/qtest/display-vga-test: Add proper checks if a device is
    available
  gitlab-ci.d/buildtest: Merge the --without-default-* jobs
  gitlab-ci.d/buildtest: Merge the two gprof-gcov jobs
  gitlab-ci.d/buildtest: Disintegrate the build-coroutine-sigaltstack
    job

 tests/qtest/display-vga-test.c | 65 +++++++++++++---------------------
 .gitlab-ci.d/buildtest.yml     | 51 ++++++--------------------
 .gitlab-ci.d/crossbuilds.yml   |  2 +-
 3 files changed, 37 insertions(+), 81 deletions(-)

-- 
2.31.1


