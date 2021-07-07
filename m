Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB53BF05B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:37:13 +0200 (CEST)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DM8-0000lm-Is
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DHw-0001Dc-09
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DHt-0007c6-Ag
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625686367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DP+D4yVV1sVwgY/PW4LakAOuJvhGk61J4bgS2qbl/qs=;
 b=ZJ2OuyM+/bIY+9Zpb/3yF0pGVooYqkVMeZLWpFlvVEhD/VM+IZqqyglx7FEezEtvPydm5B
 amdeb2P1xC9HO53hA6T6loUfzYiMJwMNpRaFOEeYQDjDpkXm+w9lkgsJNqlpYOwFxPUHFE
 ssPj4dgQQGY5xiTJTwYQjaJBe3LV7IU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-O8aRZuYuPWeJmH2Ge6nNFg-1; Wed, 07 Jul 2021 15:32:44 -0400
X-MC-Unique: O8aRZuYuPWeJmH2Ge6nNFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC4688042FE;
 Wed,  7 Jul 2021 19:32:42 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 806CC5D705;
 Wed,  7 Jul 2021 19:32:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/15] Machine queue, 2021-07-07
Date: Wed,  7 Jul 2021 15:32:26 -0400
Message-Id: <20210707193241.2659335-1-ehabkost@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-07-06 11:24:58 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to 4dc87143b9dbc0ae5719b67b4e533c824b239f00:=0D
=0D
  vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus (2021-07-=
06 18:05:26 -0400)=0D
=0D
----------------------------------------------------------------=0D
Machine queue, 2021-07-07=0D
=0D
Deprecation:=0D
* Deprecate pmem=3Don with non-DAX capable backend file=0D
  (Igor Mammedov)=0D
=0D
Feature:=0D
* virtio-mem: vfio support (David Hildenbrand)=0D
=0D
Cleanup:=0D
* vmbus: Don't make QOM property registration conditional=0D
  (Eduardo Habkost)=0D
=0D
----------------------------------------------------------------=0D
=0D
David Hildenbrand (13):=0D
  memory: Introduce RamDiscardManager for RAM memory regions=0D
  memory: Helpers to copy/free a MemoryRegionSection=0D
  virtio-mem: Factor out traversing unplugged ranges=0D
  virtio-mem: Don't report errors when ram_block_discard_range() fails=0D
  virtio-mem: Implement RamDiscardManager interface=0D
  vfio: Support for RamDiscardManager in the !vIOMMU case=0D
  vfio: Query and store the maximum number of possible DMA mappings=0D
  vfio: Sanity check maximum number of DMA mappings with=0D
    RamDiscardManager=0D
  vfio: Support for RamDiscardManager in the vIOMMU case=0D
  softmmu/physmem: Don't use atomic operations in=0D
    ram_block_discard_(disable|require)=0D
  softmmu/physmem: Extend ram_block_discard_(require|disable) by two=0D
    discard types=0D
  virtio-mem: Require only coordinated discards=0D
  vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus=0D
=0D
Eduardo Habkost (1):=0D
  vmbus: Don't make QOM property registration conditional=0D
=0D
Igor Mammedov (1):=0D
  Deprecate pmem=3Don with non-DAX capable backend file=0D
=0D
 include/exec/memory.h          | 324 +++++++++++++++++++++++++--=0D
 include/hw/vfio/vfio-common.h  |  12 +=0D
 include/hw/virtio/virtio-mem.h |   3 +=0D
 include/migration/vmstate.h    |   1 +=0D
 docs/system/deprecated.rst     |  18 ++=0D
 hw/hyperv/vmbus.c              |  20 +-=0D
 hw/vfio/common.c               | 315 +++++++++++++++++++++++++-=0D
 hw/virtio/virtio-mem.c         | 391 ++++++++++++++++++++++++++++-----=0D
 softmmu/memory.c               |  98 +++++++++=0D
 softmmu/physmem.c              | 108 ++++++---=0D
 util/mmap-alloc.c              |   2 +=0D
 11 files changed, 1168 insertions(+), 124 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


