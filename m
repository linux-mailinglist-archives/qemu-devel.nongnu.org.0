Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB893AD32F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:54:25 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKZM-00025i-D5
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXl-00086N-Or
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXi-0006ky-UD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624045960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fqLtpCKpqVfkxofa4CIFnNCLx4XGjsM3t8t3PZ1OPuk=;
 b=cCsKkAHvJRT1SPBtiRS7ADwybPGfaZcsfyKGUPucNY0XSpMKNbQcqAQSYbjMHJ1IzGUqjX
 7bbdDZ9/1qix4HArK/BuFqGSOICyFqMK4kGh195pE2IDZ1zU2+Bnk0PfvrEexUHiTzOrgp
 SblcA5XzOo+GmrBO6Tu2C4pMLJ+8D2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-eocrm-WTMBWG1DXj_zDcwQ-1; Fri, 18 Jun 2021 15:52:39 -0400
X-MC-Unique: eocrm-WTMBWG1DXj_zDcwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CA1418D6A30;
 Fri, 18 Jun 2021 19:52:38 +0000 (UTC)
Received: from localhost (unknown [10.22.9.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C8FA5D6CF;
 Fri, 18 Jun 2021 19:52:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/7] x86 queue, 2021-06-18
Date: Fri, 18 Jun 2021 15:52:30 -0400
Message-Id: <20210618195237.442548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's still a lot to review/queue on the list, but I'm flush my=0D
current queue so it doesn't get stale.=0D
=0D
The following changes since commit 18e53dff939898c6dd00d206a3c2f5cd3d6669db=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-c11-20210615' =
into staging (2021-06-17 10:42:57 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request=0D
=0D
for you to fetch changes up to 4e2f5f3a9db06e87a73eb60a7cc9754fc13596ee:=0D
=0D
  scripts: helper to generate x86_64 CPU ABI compat info (2021-06-17 14:11:=
06 -0400)=0D
=0D
----------------------------------------------------------------=0D
x86 queue, 2021-06-18=0D
=0D
Features:=0D
* Add ratelimit for bus locks acquired in guest (Chenyi Qiang)=0D
=0D
Documentation:=0D
* SEV documentation updates (Tom Lendacky)=0D
* Add a table showing x86-64 ABI compatibility levels (Daniel P. Berrang=C3=
=A9)=0D
=0D
Automated changes:=0D
* Update Linux headers to 5.13-rc4 (Eduardo Habkost)=0D
=0D
----------------------------------------------------------------=0D
=0D
Chenyi Qiang (1):=0D
  i386: Add ratelimit for bus locks acquired in guest=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  docs: add a table showing x86-64 ABI compatibility levels=0D
  scripts: helper to generate x86_64 CPU ABI compat info=0D
=0D
Eduardo Habkost (1):=0D
  Update Linux headers to 5.13-rc4=0D
=0D
Tom Lendacky (3):=0D
  doc: Fix some mistakes in the SEV documentation=0D
  docs: Add SEV-ES documentation to amd-memory-encryption.txt=0D
  docs/interop/firmware.json: Add SEV-ES support=0D
=0D
 include/hw/i386/x86.h                         |   8 +=0D
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |  35 -=0D
 include/standard-headers/drm/drm_fourcc.h     |  23 +-=0D
 include/standard-headers/linux/ethtool.h      | 109 ++-=0D
 include/standard-headers/linux/fuse.h         |  17 +-=0D
 include/standard-headers/linux/input.h        |   2 +-=0D
 include/standard-headers/linux/virtio_bt.h    |  31 +=0D
 include/standard-headers/linux/virtio_ids.h   |   2 +=0D
 include/standard-headers/linux/virtio_snd.h   | 334 +++++++=0D
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |   7 +=0D
 linux-headers/asm-generic/unistd.h            |  13 +-=0D
 linux-headers/asm-mips/unistd_n32.h           | 751 +++++++--------=0D
 linux-headers/asm-mips/unistd_n64.h           | 703 +++++++-------=0D
 linux-headers/asm-mips/unistd_o32.h           | 843 ++++++++---------=0D
 linux-headers/asm-powerpc/kvm.h               |   2 +=0D
 linux-headers/asm-powerpc/unistd_32.h         | 856 +++++++++---------=0D
 linux-headers/asm-powerpc/unistd_64.h         | 800 ++++++++--------=0D
 linux-headers/asm-s390/unistd_32.h            |   4 +=0D
 linux-headers/asm-s390/unistd_64.h            |   4 +=0D
 linux-headers/asm-x86/kvm.h                   |   3 +=0D
 linux-headers/asm-x86/unistd_32.h             |   4 +=0D
 linux-headers/asm-x86/unistd_64.h             |   4 +=0D
 linux-headers/asm-x86/unistd_x32.h            |   4 +=0D
 linux-headers/linux/kvm.h                     | 131 ++-=0D
 linux-headers/linux/userfaultfd.h             |  36 +-=0D
 linux-headers/linux/vfio.h                    |  35 +=0D
 MAINTAINERS                                   |   2 +-=0D
 docs/amd-memory-encryption.txt                |  89 +-=0D
 docs/interop/firmware.json                    |  47 +-=0D
 docs/system/cpu-models-x86-abi.csv            |  67 ++=0D
 docs/system/cpu-models-x86.rst.inc            |  22 +=0D
 hw/i386/x86.c                                 |  24 +=0D
 scripts/cpu-x86-uarch-abi.py                  | 194 ++++=0D
 target/i386/kvm/kvm.c                         |  41 +=0D
 34 files changed, 3174 insertions(+), 2073 deletions(-)=0D
 create mode 100644 include/standard-headers/linux/virtio_bt.h=0D
 create mode 100644 include/standard-headers/linux/virtio_snd.h=0D
 create mode 100644 docs/system/cpu-models-x86-abi.csv=0D
 create mode 100644 scripts/cpu-x86-uarch-abi.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


