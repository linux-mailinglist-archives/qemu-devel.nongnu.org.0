Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69EE377D40
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:37:15 +0200 (CEST)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0Ta-0004Bn-RQ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0Ry-0001UJ-Kn
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0Rx-0003Yi-1s
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620632132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c01T2ma2SFAe42n+w4vQmrhY2grI8W/CPfZQkshE+r0=;
 b=X0oFYWVhnLzQffek/jS6jKC+tAWgRmaK180wvZgZP5CQrTI+AsxFXNdD6xe89ibcU/K6eh
 eiDHBV0UOsDqEAhniNW29dGPkfIMLWO7TyE8aKvXo1dQ9ZsN8KFBKngvISfxxOu49dG/Nv
 yQJHJBDBGfY4E0mjh4RTCt6Cpv02c6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Y3tA3MQ0OWOJ_dwJsi9Wsg-1; Mon, 10 May 2021 03:35:30 -0400
X-MC-Unique: Y3tA3MQ0OWOJ_dwJsi9Wsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 353EB64157;
 Mon, 10 May 2021 07:35:29 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AAED17A9B;
 Mon, 10 May 2021 07:35:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/9] s390-ccw bios update
Date: Mon, 10 May 2021 09:35:15 +0200
Message-Id: <20210510073524.85951-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

the following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/s390-ccw-bios-2021-05-10

for you to fetch changes up to f612e211e515d3699b30be6fd1b5cd73c0259785:

  pc-bios/s390: Update the s390-ccw bios binaries with the Clang and other fixes (2021-05-10 08:08:40 +0200)

----------------------------------------------------------------
* Make the s390-ccw bios compilable with Clang
* Fix ECKD booting with null block numbers in the chain
----------------------------------------------------------------

Marc Hartmayer (1):
  pc-bios/s390-ccw: don't try to read the next block if end of chunk is
    reached

Philippe Mathieu-Daudé (1):
  pc-bios/s390-ccw: Silence GCC 11 stringop-overflow warning

Thomas Huth (7):
  pc-bios/s390-ccw/bootmap: Silence compiler warning from Clang
  pc-bios/s390-ccw: Use reset_psw pointer instead of hard-coded null
    pointer
  pc-bios/s390-ccw/netboot: Use "-Wl," prefix to pass parameter to the
    linker
  pc-bios/s390-ccw: Silence warning from Clang by marking panic() as
    noreturn
  pc-bios/s390-ccw: Fix the cc-option macro in the Makefile
  pc-bios/s390-ccw: Allow building with Clang, too
  pc-bios/s390: Update the s390-ccw bios binaries with the Clang and
    other fixes

 configure                    |   9 ++++++++-
 pc-bios/s390-ccw.img         | Bin 42608 -> 50936 bytes
 pc-bios/s390-ccw/Makefile    |   8 +++++---
 pc-bios/s390-ccw/bootmap.c   |   4 ++--
 pc-bios/s390-ccw/jump2ipl.c  |   4 ++--
 pc-bios/s390-ccw/netboot.mak |   2 +-
 pc-bios/s390-ccw/s390-ccw.h  |   1 +
 pc-bios/s390-netboot.img     | Bin 67232 -> 79688 bytes
 8 files changed, 19 insertions(+), 9 deletions(-)


