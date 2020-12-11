Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452232D759A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:29:47 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhYP-0005wo-H9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhVv-0004Nk-Jc
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhVs-0000xX-Rt
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nuJSxJzKQ1ayfu3dZUrQFZtNX10JTlggfwkcFz+1K1U=;
 b=BmIXH71mIKFphKy27ODnMfBk9ZsneQlC0y6J6jPLb3LhxWj0qbIUSBVs4EVele3XLFtOAu
 1++li42Q59ixjtg2BQuYWihykO3kAk4aM5WxhWXW36I/5Ik3t7bm3Yv6IjCHHX8QeIsEfY
 PuIERuuiMSl9zFu9IXp9EsKmpTkHQ54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-_YeV--KrN5q0uXdltyQJJg-1; Fri, 11 Dec 2020 07:27:03 -0500
X-MC-Unique: _YeV--KrN5q0uXdltyQJJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA8E1005504;
 Fri, 11 Dec 2020 12:27:02 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D99C10016F4;
 Fri, 11 Dec 2020 12:27:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/6] s390x update
Date: Fri, 11 Dec 2020 13:26:52 +0100
Message-Id: <20201211122658.24481-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20201211

for you to fetch changes up to c7454f05171405b8013a9d6b57045cd614ccc386:

  s390x/cpu: Use timer_free() in the finalize function to avoid memleaks (2020-12-11 11:38:10 +0100)

----------------------------------------------------------------
First set of 6.0 patches for s390x:
- acceptance test for device detection
- bugfixes

----------------------------------------------------------------


CI: https://gitlab.com/cohuck/qemu/-/pipelines/228422460

Cornelia Huck (4):
  tests/acceptance: add a test for devices on s390x
  tests/acceptance: test virtio-ccw revision handling
  tests/acceptance: verify s390x device detection
  tests/acceptance: test s390x zpci fid propagation

Gan Qixin (1):
  s390x/cpu: Use timer_free() in the finalize function to avoid memleaks

Thomas Huth (1):
  hw/watchdog/wdt_diag288: Remove unnecessary includes

 MAINTAINERS                                 |   1 +
 hw/watchdog/wdt_diag288.c                   |   2 -
 target/s390x/cpu.c                          |   5 +
 tests/acceptance/machine_s390_ccw_virtio.py | 101 ++++++++++++++++++++
 4 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 tests/acceptance/machine_s390_ccw_virtio.py

-- 
2.26.2


