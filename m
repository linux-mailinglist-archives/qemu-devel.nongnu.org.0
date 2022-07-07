Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293FF569C4C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:58:17 +0200 (CEST)
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MOt-0005V4-N7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLL-0002Sx-Uc
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLI-0007S1-Mj
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PCDtht3J/FBgD00rgGALrLajE+7nZJetDgBwcc+QyXw=;
 b=G1iJyLnQ8Zd+hAoNB+OaIhG2Nbyy90qkFrnket6wCB0ULa42N2pdEuRuPM5Fhqd11/tlnb
 nLO7/AYvRYWp9V4/5yplX4ONK3HZSciXKY2/wD7b1S4aXFTQ0WQE1LjO/DC9/29crNn+Ro
 z9fNEtT9ePTVKynJS3AJ316r3eMvKDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-mMCjlGuxMHyxlkzq9h9BcQ-1; Thu, 07 Jul 2022 03:54:30 -0400
X-MC-Unique: mMCjlGuxMHyxlkzq9h9BcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3E9D3817A61;
 Thu,  7 Jul 2022 07:54:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C11B040CFD0A;
 Thu,  7 Jul 2022 07:54:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 00/18] s390x updates
Date: Thu,  7 Jul 2022 09:54:08 +0200
Message-Id: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Richard!

The following changes since commit 39e19f5f67d925c60278a6156fd1776d04495a93:

  Merge tag 'pull-xen-20220705' of https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging (2022-07-05 22:13:51 +0530)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-07

for you to fetch changes up to 3d8111fd3bf7298486bcf1a72013b44c9044104e:

  target/s390x: Exit tb after executing ex_value (2022-07-06 19:04:57 +0200)

----------------------------------------------------------------
* Check validity of the address in the SET PREFIX instruction
* Fix booting from devices that use 4k sectors, but are not like DASDs
* Re-evaluate pending interrupts after EXECUTE of certain instructions

----------------------------------------------------------------
Janis Schoetterl-Glausch (1):
  target/s390x/tcg: SPX: check validity of new prefix

Richard Henderson (4):
  target/s390x: Remove DISAS_GOTO_TB
  target/s390x: Remove DISAS_PC_STALE
  target/s390x: Remove DISAS_PC_STALE_NOCHAIN
  target/s390x: Exit tb after executing ex_value

Thomas Huth (13):
  pc-bios/s390-ccw: Add a proper prototype for main()
  pc-bios/s390-ccw/virtio: Introduce a macro for the DASD block size
  pc-bios/s390-ccw/bootmap: Improve the guessing logic in
    zipl_load_vblk()
  pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
    virtio_ipl_disk_is_valid()
  pc-bios/s390-ccw/virtio-blkdev: Remove virtio_assume_scsi()
  pc-bios/s390-ccw/virtio: Set missing status bits while initializing
  pc-bios/s390-ccw/virtio: Read device config after feature negotiation
  pc-bios/s390-ccw/virtio: Beautify the code for reading virtqueue
    configuration
  pc-bios/s390-ccw: Split virtio-scsi code from
    virtio_blk_setup_device()
  pc-bios/s390-ccw/virtio-blkdev: Request the right feature bits
  pc-bios/s390-ccw/virtio: Remove "extern" keyword from prototypes
  pc-bios/s390-ccw/netboot.mak: Ignore Clang's warnings about GNU
    extensions
  pc-bios/s390-ccw: Update the s390-ccw bios binaries with the
    virtio-blk fixes

 pc-bios/s390-ccw/netboot.mak     |   7 ++-
 pc-bios/s390-ccw/s390-ccw.h      |   1 +
 pc-bios/s390-ccw/virtio-scsi.h   |   2 +-
 pc-bios/s390-ccw/virtio.h        |  16 +++---
 pc-bios/s390-ccw/bootmap.c       |  27 +++++++--
 pc-bios/s390-ccw/main.c          |  27 ++++++---
 pc-bios/s390-ccw/virtio-blkdev.c |  91 +++++--------------------------
 pc-bios/s390-ccw/virtio-scsi.c   |  19 ++++++-
 pc-bios/s390-ccw/virtio.c        |  28 ++++++----
 target/s390x/tcg/misc_helper.c   |   7 +++
 target/s390x/tcg/translate.c     |  42 ++++++--------
 pc-bios/s390-ccw.img             | Bin 50936 -> 42608 bytes
 pc-bios/s390-netboot.img         | Bin 79688 -> 67232 bytes
 13 files changed, 129 insertions(+), 138 deletions(-)

-- 
2.31.1


