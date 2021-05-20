Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C0538B4E3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:07:06 +0200 (CEST)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljm8X-0003lC-Bo
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm72-0001Cp-Py
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm6z-0005XM-J8
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621530328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ACfmMUsWKTmoRy79FtQeGuuY/cfdG++NA4f2Vd4YU/o=;
 b=RaIll9owNB77ihu9WjwvB5WZ2P3BMOQRR2cGbmTSIFX4D9X/R33Zr8JJ4vV1sWbCLpn2gg
 Upe4uPPkIeRHSxvmfkN0UMVgKBupZk+uDaIYzHZAEudRuFIUFDeNMqZ/nZ/UM46ncg4kUC
 3n/Ix839zYLfInAXuJbjE/HfxDBU6Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-0aKLP3w3NFWvsGWq3k1_0g-1; Thu, 20 May 2021 13:05:26 -0400
X-MC-Unique: 0aKLP3w3NFWvsGWq3k1_0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6FCE8030CF;
 Thu, 20 May 2021 17:05:25 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A263D5D6D5;
 Thu, 20 May 2021 17:05:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 0/9] s390x update
Date: Thu, 20 May 2021 19:05:10 +0200
Message-Id: <20210520170519.300951-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

[Note: there's an unrelated hexagon failure in the CI for this tag;
 fixed by <20210520153831.11873-1-alex.bennee@linaro.org>]

The following changes since commit fea2ad71c3e23f743701741346b51fdfbbff5ebf:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-plugin-updates-180521-2' into staging (2021-05-20 10:00:58 +0100)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20210520-v2

for you to fetch changes up to f66487756b0553b156d8e3e81bc6411cfc38176e:

  tests/tcg/x86_64: add vsyscall smoke test (2021-05-20 14:19:30 +0200)

----------------------------------------------------------------
s390x fixes and cleanups; also related fixes in xtensa,
arm, and x86 code

----------------------------------------------------------------

Eric Farman (2):
  vfio-ccw: Permit missing IRQs
  vfio-ccw: Attempt to clean up all IRQs on error

Ilya Leoshkevich (6):
  target/s390x: Fix translation exception on illegal instruction
  target/arm: Make sure that commpage's tb->size != 0
  target/xtensa: Make sure that tb->size != 0
  accel/tcg: Assert that tb->size != 0 after translation
  target/i386: Make sure that vsyscall's tb->size != 0
  tests/tcg/x86_64: add vsyscall smoke test

Philippe Mathieu-Daudé (1):
  hw/s390x/ccw: Register qbus type in abstract TYPE_CCW_DEVICE parent

 accel/tcg/translate-all.c        |  1 +
 hw/s390x/3270-ccw.c              |  1 -
 hw/s390x/ccw-device.c            |  1 +
 hw/s390x/ccw-device.h            |  1 +
 hw/s390x/s390-ccw.c              |  2 --
 hw/s390x/virtio-ccw.c            |  1 -
 hw/vfio/ccw.c                    | 18 +++++++++++-------
 target/arm/translate.c           |  2 ++
 target/i386/tcg/translate.c      |  1 +
 target/s390x/translate.c         | 16 +++++++++++-----
 target/xtensa/translate.c        |  3 +++
 tests/tcg/x86_64/Makefile.target |  6 +++++-
 tests/tcg/x86_64/vsyscall.c      | 12 ++++++++++++
 13 files changed, 48 insertions(+), 17 deletions(-)
 create mode 100644 tests/tcg/x86_64/vsyscall.c

-- 
2.31.1


