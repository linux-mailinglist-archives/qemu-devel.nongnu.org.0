Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBC4EAFC2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:02:28 +0200 (CEST)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDMY-0007rV-Ob
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:02:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJE-0005C9-Py
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJB-000388-ND
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648565934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=drwK0u3Jga9xcr7hq45ZoE88VaOqTTOl5EHFDWV2dY8=;
 b=GgN6ohwiMQDRAnxWMfmnL2oKpHhCuu0F2nIDZm4uRSEZENEhThsRMugMdWAhS1FZ3mz8PR
 63KS4MVfPQuC3OULQfpQAmBqu/ICw3SyyhivygTAiqwLbJYMkWVDV84ZX4VPO7AjVBSgNP
 lrIyW6M2IzMmsAQvamUGpk/J8xYFOP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-CTj0vxKTORyiTZxUUFHIoQ-1; Tue, 29 Mar 2022 10:58:51 -0400
X-MC-Unique: CTj0vxKTORyiTZxUUFHIoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DB54108C1CB;
 Tue, 29 Mar 2022 14:58:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 599EF40D2822;
 Tue, 29 Mar 2022 14:58:50 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/4] Block patches for 7.0-rc2
Date: Tue, 29 Mar 2022 16:58:45 +0200
Message-Id: <20220329145849.121051-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 44064550d98a680e2ff55fdd783ac19d850ac8ca:

  Merge tag 'darwin-20220329' of https://github.com/philmd/qemu into staging (2022-03-29 15:17:53 +0100)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-03-29

for you to fetch changes up to d5699c0d4b29e919b87049d948a30527897b7e8a:

  iotests: Fix status checks (2022-03-29 16:30:55 +0200)

----------------------------------------------------------------
Block patches for 7.0-rc2:
- Disable GLOBAL_STATE_CODE() assertion for the 7.0 release: We got
  another bug report for this, and we do not have the time to
  investigate before 7.0, so disable the assertion for the release, to
  re-enable and continue investigation in the 7.1 cycle

- stream job fix (regarding interaction with concurrent block jobs)

- iotests fixes

----------------------------------------------------------------
Hanna Reitz (3):
  main-loop: Disable GLOBAL_STATE_CODE() assertions
  block/stream: Drain subtree around graph change
  iotests: Fix status checks

John Snow (1):
  iotests: update test owner contact information

 include/qemu/main-loop.h |  3 ++-
 block/stream.c           | 15 ++++++++++++++-
 tests/qemu-iotests/025   |  2 +-
 tests/qemu-iotests/027   |  2 +-
 tests/qemu-iotests/028   |  2 +-
 tests/qemu-iotests/030   | 30 +++++++++++++++++++++++++-----
 tests/qemu-iotests/036   |  2 +-
 tests/qemu-iotests/039   |  2 +-
 tests/qemu-iotests/041   | 26 +++++++++++++++++++-------
 tests/qemu-iotests/059   |  2 +-
 tests/qemu-iotests/060   |  2 +-
 tests/qemu-iotests/061   |  2 +-
 tests/qemu-iotests/062   |  2 +-
 tests/qemu-iotests/064   |  2 +-
 tests/qemu-iotests/066   |  2 +-
 tests/qemu-iotests/068   |  2 +-
 tests/qemu-iotests/069   |  2 +-
 tests/qemu-iotests/070   |  2 +-
 tests/qemu-iotests/071   |  2 +-
 tests/qemu-iotests/072   |  2 +-
 tests/qemu-iotests/074   |  2 +-
 tests/qemu-iotests/084   |  2 +-
 tests/qemu-iotests/085   |  2 +-
 tests/qemu-iotests/089   |  2 +-
 tests/qemu-iotests/090   |  2 +-
 tests/qemu-iotests/091   |  2 +-
 tests/qemu-iotests/094   |  2 +-
 tests/qemu-iotests/095   |  2 +-
 tests/qemu-iotests/097   |  2 +-
 tests/qemu-iotests/098   |  2 +-
 tests/qemu-iotests/099   |  2 +-
 tests/qemu-iotests/102   |  2 +-
 tests/qemu-iotests/103   |  2 +-
 tests/qemu-iotests/105   |  2 +-
 tests/qemu-iotests/106   |  2 +-
 tests/qemu-iotests/107   |  2 +-
 tests/qemu-iotests/108   |  2 +-
 tests/qemu-iotests/110   |  2 +-
 tests/qemu-iotests/111   |  2 +-
 tests/qemu-iotests/112   |  2 +-
 tests/qemu-iotests/113   |  2 +-
 tests/qemu-iotests/115   |  2 +-
 tests/qemu-iotests/117   |  2 +-
 tests/qemu-iotests/119   |  2 +-
 tests/qemu-iotests/120   |  2 +-
 tests/qemu-iotests/121   |  2 +-
 tests/qemu-iotests/123   |  2 +-
 tests/qemu-iotests/125   |  2 +-
 tests/qemu-iotests/126   |  2 +-
 tests/qemu-iotests/127   |  2 +-
 tests/qemu-iotests/135   |  2 +-
 tests/qemu-iotests/138   |  2 +-
 tests/qemu-iotests/140   |  2 +-
 tests/qemu-iotests/141   |  2 +-
 tests/qemu-iotests/143   |  2 +-
 tests/qemu-iotests/144   |  2 +-
 tests/qemu-iotests/146   |  2 +-
 tests/qemu-iotests/150   |  2 +-
 tests/qemu-iotests/153   |  2 +-
 tests/qemu-iotests/156   |  2 +-
 tests/qemu-iotests/162   |  2 +-
 tests/qemu-iotests/173   |  2 +-
 tests/qemu-iotests/176   |  2 +-
 tests/qemu-iotests/182   |  2 +-
 tests/qemu-iotests/192   |  2 +-
 tests/qemu-iotests/200   |  2 +-
 tests/qemu-iotests/216   |  2 +-
 tests/qemu-iotests/218   |  2 +-
 tests/qemu-iotests/224   |  2 +-
 tests/qemu-iotests/225   |  2 +-
 tests/qemu-iotests/228   |  2 +-
 tests/qemu-iotests/229   |  2 +-
 tests/qemu-iotests/231   |  2 +-
 tests/qemu-iotests/250   |  2 +-
 tests/qemu-iotests/251   |  2 +-
 tests/qemu-iotests/252   |  2 +-
 tests/qemu-iotests/258   |  2 +-
 tests/qemu-iotests/259   |  2 +-
 tests/qemu-iotests/261   |  2 +-
 tests/qemu-iotests/310   |  2 +-
 80 files changed, 136 insertions(+), 90 deletions(-)

-- 
2.35.1


