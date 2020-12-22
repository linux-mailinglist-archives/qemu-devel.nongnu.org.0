Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019CA2E08EA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:47:19 +0100 (CET)
Received: from localhost ([::1]:53866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfCH-0006UR-OC
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAK-0004i5-VC
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAI-00072i-AL
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jxYGrRg6NKL6O/ePM/24U5/8SjW2gV7cps/4X/4LPyA=;
 b=XG/DUILpT1dZKDwg4HIaoRelDS2M+x2zFdQgdW253biGZEbxkFMBW0CEbqw5Y64GDvP27f
 75+zOfpufIWE6DL5+CrPXtqgQsBrWgBXgrpxdFDJJMWRZqJAyUUeQ2onD7xM75cl2ucbAt
 7dxGW25NZnnrZjIM/t1SX4IQhfTAzIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-nIuoGC3DOCuecOG6aozRrg-1; Tue, 22 Dec 2020 05:45:08 -0500
X-MC-Unique: nIuoGC3DOCuecOG6aozRrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DEF8801B2B;
 Tue, 22 Dec 2020 10:45:07 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5374C7A319;
 Tue, 22 Dec 2020 10:45:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/14] s390x update
Date: Tue, 22 Dec 2020 11:44:49 +0100
Message-Id: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201217-1' into staging (2020-12-18 11:12:35 +0000)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20201222

for you to fetch changes up to 24bfaae13958b823a4f33b70fca52f086851641f:

  tests/acceptance: Add a test with the Fedora 31 kernel and initrd (2020-12-22 09:23:09 +0100)

----------------------------------------------------------------
Further s390x updates:
- enhance the s390 devices acceptance test
- tcg: improve carry computation
- qga: send the ccw address with the fsinfo data
- fixes for protected virtualisation and zpci

----------------------------------------------------------------

CI: https://gitlab.com/cohuck/qemu/-/pipelines/233190604

[I've pushed out the same branch to

  https://github.com/cohuck/qemu tags/s390x-20201222

as well this time.]

Cornelia Huck (2):
  MAINTAINERS: move my git tree to gitlab
  tests/acceptance: test hot(un)plug of ccw devices

Janosch Frank (1):
  s390x: pv: Fence additional unavailable SCLP facilities for PV guests

Matthew Rosato (2):
  s390x/pci: fix pcistb length
  s390x/pci: Fix memory_region_access_valid call

Richard Henderson (4):
  target/s390x: Improve cc computation for ADD LOGICAL
  target/s390x: Improve ADD LOGICAL WITH CARRY
  target/s390x: Improve cc computation for SUBTRACT LOGICAL
  target/s390x: Improve SUB LOGICAL WITH BORROW

Thomas Huth (5):
  qga/commands-posix: Send CCW address on s390x with the fsinfo data
  tests/acceptance: Extract the code to clear dmesg and wait for CRW
    reports
  tests/acceptance: Test virtio-rng on s390 via /dev/hwrng
  tests/acceptance: Test the virtio-balloon device on s390x
  tests/acceptance: Add a test with the Fedora 31 kernel and initrd

 MAINTAINERS                                 |  10 +-
 hw/s390x/s390-pci-inst.c                    |  14 +-
 qga/commands-posix.c                        |  34 +++
 qga/qapi-schema.json                        |  20 +-
 target/s390x/cc_helper.c                    | 123 ++-------
 target/s390x/cpu_features.c                 |  39 ++-
 target/s390x/cpu_models.c                   |  25 +-
 target/s390x/helper.c                       |  10 +-
 target/s390x/insn-data.def                  |  76 +++---
 target/s390x/internal.h                     |  11 +-
 target/s390x/translate.c                    | 287 +++++++++++---------
 tests/acceptance/machine_s390_ccw_virtio.py | 169 +++++++++++-
 12 files changed, 507 insertions(+), 311 deletions(-)

-- 
2.26.2


