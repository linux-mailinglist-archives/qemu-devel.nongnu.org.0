Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BE4A0031
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:34:56 +0100 (CET)
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDW5H-0004ao-Lr
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:34:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW2W-0002dM-LJ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:32:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW2P-0000qa-9J
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W4TWj7QB+luGrN1sQHscPhqJ27DIpWsdT/o2ijiM99Q=;
 b=IyaNpi56GLQPBMkgJXY5HifTCnKRvzBV0XOBJDJ2z4O63XUq8+5dB08eG2N2u8IG+Ldi7Q
 ZxfiP7FCStCW8i9S3vIbDFEoxZu62MeS38WAl/EU9Z5nN5aWzxlnEYiMeg8q0QfNyLXL1L
 LU+pfPeXYZqSH/Glbn0Fc/+YC8xUZX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-fqwIN2QOMvK-Pq6sGDxa2w-1; Fri, 28 Jan 2022 13:31:53 -0500
X-MC-Unique: fqwIN2QOMvK-Pq6sGDxa2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA54189DF41;
 Fri, 28 Jan 2022 18:31:49 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0665677468;
 Fri, 28 Jan 2022 18:30:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/36] Migration 20220128 patches
Date: Fri, 28 Jan 2022 19:29:57 +0100
Message-Id: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b367db48126d4ee14579af6cf5cdbffeb9496627=
:=0D
=0D
  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20220127' int=
o staging (2022-01-28 11:05:29 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/juan.quintela/qemu.git tags/migration-20220128-pull-re=
quest=0D
=0D
for you to fetch changes up to 476ebf77fe8909ded10046edf26685bc28438162:=0D
=0D
  migration: Move temp page setup and cleanup into separate functions (2022=
-01-28 15:38:23 +0100)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request (Take 2)=0D
=0D
Hi=0D
=0D
This time I have disabled vmstate canary patches form Dave Gilbert.=0D
=0D
Let's see if it works.=0D
=0D
Later, Juan.=0D
=0D
----------------------------------------------------------------=0D
=0D
David Edmondson (3):=0D
  migration: Report the error returned when save_live_iterate fails=0D
  migration: Introduce ram_transferred_add()=0D
  migration: Tally pre-copy, downtime and post-copy bytes independently=0D
=0D
Juan Quintela (17):=0D
  migration: All this fields are unsigned=0D
  migration: We only need last_stage in two places=0D
  migration: ram_release_pages() always receive 1 page as argument=0D
  migration: Remove masking for compression=0D
  migration: simplify do_compress_ram_page=0D
  migration: Move ram_release_pages() call to save_zero_page_to_file()=0D
  multifd: Use proper maximum compression values=0D
  multifd: Move iov from pages to params=0D
  multifd: Make zlib use iov's=0D
  multifd: Make zstd use iov's=0D
  multifd: Remove send_write() method=0D
  multifd: Use a single writev on the send side=0D
  multifd: Unfold "used" variable by its value=0D
  multifd: Use normal pages array on the send side=0D
  multifd: Use normal pages array on the recv side=0D
  multifd: recv side only needs the RAMBlock host address=0D
  multifd: Rename pages_used to normal_pages=0D
=0D
Peter Maydell (1):=0D
  Remove unnecessary minimum_version_id_old fields=0D
=0D
Peter Xu (10):=0D
  migration: Drop dead code of ram_debug_dump_bitmap()=0D
  migration: Don't return for postcopy_chunk_hostpages()=0D
  migration: Drop postcopy_chunk_hostpages()=0D
  migration: Do chunk page in postcopy_each_ram_send_discard()=0D
  migration: Drop return code for disgard ram process=0D
  migration: No off-by-one for pss->page update in host page size=0D
  migration: Enable UFFD_FEATURE_THREAD_ID even without blocktime feat=0D
  migration: Add postcopy_has_request()=0D
  migration: Simplify unqueue_page()=0D
  migration: Move temp page setup and cleanup into separate functions=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  migration: Don't return for postcopy_send_discard_bm_ram()=0D
=0D
Xu Zheng (1):=0D
  migration/ram: clean up unused comment.=0D
=0D
Zhang Chen (3):=0D
  migration/migration.c: Add missed default error handler for migration=0D
    state=0D
  migration/migration.c: Avoid COLO boot in postcopy migration=0D
  migration/migration.c: Remove the MIGRATION_STATUS_ACTIVE when=0D
    migration finished=0D
=0D
 qapi/migration.json           |  13 +-=0D
 migration/multifd.h           |  33 ++--=0D
 migration/ram.h               |   4 +-=0D
 hw/acpi/cpu.c                 |   2 -=0D
 hw/acpi/ich9.c                |   3 -=0D
 hw/acpi/memory_hotplug.c      |   2 -=0D
 hw/acpi/piix4.c               |   2 -=0D
 hw/acpi/tco.c                 |   1 -=0D
 hw/audio/pcspk.c              |   1 -=0D
 hw/display/macfb.c            |   1 -=0D
 hw/dma/xlnx-zdma.c            |   1 -=0D
 hw/dma/xlnx_csu_dma.c         |   1 -=0D
 hw/gpio/imx_gpio.c            |   1 -=0D
 hw/misc/bcm2835_mbox.c        |   1 -=0D
 hw/net/can/can_kvaser_pci.c   |   1 -=0D
 hw/net/can/can_mioe3680_pci.c |   1 -=0D
 hw/net/can/can_pcm3680_pci.c  |   1 -=0D
 hw/net/can/can_sja1000.c      |   2 -=0D
 hw/net/can/ctucan_core.c      |   2 -=0D
 hw/net/can/ctucan_pci.c       |   1 -=0D
 hw/ppc/ppc.c                  |   1 -=0D
 hw/scsi/megasas.c             |   1 -=0D
 hw/scsi/mptsas.c              |   1 -=0D
 hw/virtio/virtio-mmio.c       |   1 -=0D
 hw/virtio/virtio-pci.c        |   1 -=0D
 hw/virtio/virtio.c            |   1 -=0D
 migration/migration.c         |  26 ++-=0D
 migration/multifd-zlib.c      |  61 +++----=0D
 migration/multifd-zstd.c      |  63 +++-----=0D
 migration/multifd.c           | 148 ++++++++---------=0D
 migration/postcopy-ram.c      |  96 ++++++-----=0D
 migration/ram.c               | 291 ++++++++++++----------------------=0D
 migration/savevm.c            |   5 +-=0D
 monitor/hmp-cmds.c            |  12 ++=0D
 target/openrisc/machine.c     |   1 -=0D
 target/ppc/machine.c          |   2 -=0D
 target/sparc/machine.c        |   4 -=0D
 migration/trace-events        |  29 ++--=0D
 38 files changed, 350 insertions(+), 468 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


