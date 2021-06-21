Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8EB3AE6A7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:01:00 +0200 (CEST)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGjj-0007yf-4P
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhg-0005OZ-Cs
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:58:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhe-0006QH-6l
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zA/1t7nPp+rEpvyGFHNzsRGgfx1eVX4Vi7riH6Fbpbg=;
 b=Sb/KsNXGN5T3Y6LGPrkAbXDVkB0YNHs8IUZLyLGflIIke27lHLx9yAf4ZIuPHKDooLbYQC
 z/VR5GXobjeFGo2QragJ+Bk/CLrBgdT7dOPF72HREpraGrvrPGlZMDLuQl3TF9Jdm8+GZ1
 ElFNh2/W8aFVdWkS/rj9XMpi9GXWPCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-hYLgVSYiOiWqSajG5czvng-1; Mon, 21 Jun 2021 05:58:47 -0400
X-MC-Unique: hYLgVSYiOiWqSajG5czvng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A02F7800D62;
 Mon, 21 Jun 2021 09:58:46 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87BA33AC1;
 Mon, 21 Jun 2021 09:58:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/37] s390x update
Date: Mon, 21 Jun 2021 11:58:05 +0200
Message-Id: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8f521741e1280f0957ac1b873292c19219e1fb9a:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20210618.0' into staging (2021-06-18 16:42:25 +0100)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20210621

for you to fetch changes up to c626710fc755628d0d6b88aab0514c9238a84522:

  s390x/css: Add passthrough IRB (2021-06-21 08:48:21 +0200)

----------------------------------------------------------------
s390x update:
- tcg: implement the vector enhancements facility and bump the
  'qemu' cpu model to a stripped-down z14 GA2
- fix psw.mask handling in signals
- fix vfio-ccw sense data handling

----------------------------------------------------------------

Cornelia Huck (1):
  s390x/kvm: remove unused gs handling

David Hildenbrand (26):
  s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN handling
  s390x/tcg: Fix instruction name for VECTOR FP LOAD
    (LENGTHENED|ROUNDED)
  s390x/tcg: Simplify vop64_3() handling
  s390x/tcg: Simplify vop64_2() handling
  s390x/tcg: Simplify vfc64() handling
  s390x/tcg: Simplify vftci64() handling
  s390x/tcg: Simplify vfma64() handling
  s390x/tcg: Simplify vfll32() handling
  s390x/tcg: Simplify vflr64() handling
  s390x/tcg: Simplify wfc64() handling
  s390x/tcg: Implement VECTOR BIT PERMUTE
  s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL
  s390x/tcg: Implement 32/128 bit for VECTOR FP
    (ADD|DIVIDE|MULTIPLY|SUBTRACT)
  s390x/tcg: Implement 32/128 bit for VECTOR (LOAD FP INTEGER|FP SQUARE
    ROOT)
  s390x/tcg: Implement 32/128 bit for VECTOR FP COMPARE *
  s390x/tcg: Implement 32/128 bit for VECTOR FP COMPARE (AND SIGNAL)
    SCALAR
  s390x/tcg: Implement 64 bit for VECTOR FP LOAD LENGTHENED
  s390x/tcg: Implement 128 bit for VECTOR FP LOAD ROUNDED
  s390x/tcg: Implement 32/128 bit for VECTOR FP PERFORM SIGN OPERATION
  s390x/tcg: Implement 32/128 bit for VECTOR FP TEST DATA CLASS
    IMMEDIATE
  s390x/tcg: Implement 32/128 bit for VECTOR FP MULTIPLY AND
    (ADD|SUBTRACT)
  s390x/tcg: Implement VECTOR FP NEGATIVE MULTIPLY AND (ADD|SUBTRACT)
  s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
  linux-user: elf: s390x: Prepare for Vector enhancements facility
  s390x/tcg: We support Vector enhancements facility
  s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z14 GA2

Eric Farman (4):
  s390x/css: Introduce an ESW struct
  s390x/css: Split out the IRB sense data
  s390x/css: Refactor IRB construction
  s390x/css: Add passthrough IRB

Richard Henderson (5):
  target/s390x: Expose load_psw and get_psw_mask to cpu.h
  target/s390x: Do not modify cpu state in s390_cpu_get_psw_mask
  target/s390x: Improve s390_cpu_dump_state vs cc_op
  target/s390x: Use s390_cpu_{set_psw, get_psw_mask} in gdbstub
  linux-user/s390x: Save and restore psw.mask properly

Thomas Huth (1):
  configure: Check whether we can compile the s390-ccw bios with
    -msoft-float

 configure                       |    2 +-
 hw/s390x/3270-ccw.c             |    1 +
 hw/s390x/css.c                  |   87 ++-
 hw/s390x/s390-ccw.c             |    1 +
 hw/s390x/s390-virtio-ccw.c      |    3 +
 hw/s390x/virtio-ccw.c           |    1 +
 hw/vfio/ccw.c                   |    4 +
 include/elf.h                   |    7 +
 include/hw/s390x/css.h          |    5 +
 include/hw/s390x/ioinst.h       |   12 +-
 linux-user/elfload.c            |    1 +
 linux-user/s390x/signal.c       |   37 +-
 target/s390x/cc_helper.c        |    2 +-
 target/s390x/cpu.h              |    3 +
 target/s390x/cpu_models.c       |    4 +-
 target/s390x/excp_helper.c      |   28 +-
 target/s390x/fpu_helper.c       |   41 +-
 target/s390x/gdbstub.c          |   15 +-
 target/s390x/gen-features.c     |   14 +-
 target/s390x/helper.c           |  101 +--
 target/s390x/helper.h           |   70 +-
 target/s390x/insn-data.def      |   16 +-
 target/s390x/internal.h         |   14 +-
 target/s390x/kvm-stub.c         |    5 -
 target/s390x/kvm.c              |   10 +-
 target/s390x/kvm_s390x.h        |    1 -
 target/s390x/sigp.c             |    3 +-
 target/s390x/translate_vx.c.inc |  633 ++++++++++++++----
 target/s390x/vec_fpu_helper.c   | 1079 ++++++++++++++++++++++---------
 target/s390x/vec_helper.c       |   22 +
 30 files changed, 1626 insertions(+), 596 deletions(-)

-- 
2.31.1


