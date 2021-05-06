Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E23757D8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:48:01 +0200 (CEST)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legEK-0003z7-4t
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legB0-00027l-UO
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legAx-0002pC-M8
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jTrTFPA4fYAcZcK0I/MpaCp7sKBRy2Edg5KkkTb8nsA=;
 b=LwZgqecVW2rC6cwjfidPlzSt5lRwRK6APoKBN49qMXiKh6ggfcw0XGGHdmP4ksbuUf5/1E
 /hYVloRc9Bw4Uq+ZoxntLg3TTOOKZrHQEZ6otQ+D4XBvPF3xxaZL0OQYF0iOrndyfR8YkD
 nmkEVmpQ6blnd19cq0gITAEHWh4VUy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-JGGB1SEPMuqlexuurPjhdA-1; Thu, 06 May 2021 11:44:29 -0400
X-MC-Unique: JGGB1SEPMuqlexuurPjhdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E40311898296;
 Thu,  6 May 2021 15:44:27 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3C5819CBA;
 Thu,  6 May 2021 15:44:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/7] s390x update
Date: Thu,  6 May 2021 17:44:16 +0200
Message-Id: <20210506154423.459930-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit d45a5270d075ea589f0b0ddcf963a5fea1f500ac:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.1-pull-request' into staging (2021-05-05 13:52:00 +0100)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20210506

for you to fetch changes up to 2337ca0dd1747851cf596e90a2360578e3f9a473:

  vfio-ccw: Attempt to clean up all IRQs on error (2021-05-06 13:49:07 +0200)

----------------------------------------------------------------
s390x fixes and cleanups; also related fixes in xtensa and arm

----------------------------------------------------------------

Eric Farman (2):
  vfio-ccw: Permit missing IRQs
  vfio-ccw: Attempt to clean up all IRQs on error

Ilya Leoshkevich (4):
  target/s390x: Fix translation exception on illegal instruction
  target/arm: Make sure that commpage's tb->size != 0
  target/xtensa: Make sure that tb->size != 0
  accel/tcg: Assert that tb->size != 0 after translation

Philippe Mathieu-Daudé (1):
  hw/s390x/ccw: Register qbus type in abstract TYPE_CCW_DEVICE parent

 accel/tcg/translate-all.c |  1 +
 hw/s390x/3270-ccw.c       |  1 -
 hw/s390x/ccw-device.c     |  1 +
 hw/s390x/ccw-device.h     |  1 +
 hw/s390x/s390-ccw.c       |  2 --
 hw/s390x/virtio-ccw.c     |  1 -
 hw/vfio/ccw.c             | 18 +++++++++++-------
 target/arm/translate.c    |  2 ++
 target/s390x/translate.c  | 16 +++++++++++-----
 target/xtensa/translate.c |  3 +++
 10 files changed, 30 insertions(+), 16 deletions(-)

-- 
2.30.2


