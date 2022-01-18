Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876B4924B2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:24:55 +0100 (CET)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mbe-0001ch-MU
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:24:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n9mZb-0007WT-M4
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n9mZX-0007qU-6e
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642504961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBqWKQzvw+Dha5kjqWoYeuYgNBxD414ey+kZeT+555I=;
 b=HYed/EvlGIDEiSgtfzdQuPN1RbrkwSfiHkGcNw4YQffd1l+frwMp5YwWdY5eQPC4IK6w7d
 TVWTddALb3Y7YeSR/ycen/6Exn1phw7jIMZJmc2YRNHDBHXJ+7bcszGr5fZBBCn47U+/HZ
 1Xq03yKPLNaV3Oyvr0EzcNjMiUfBSdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-tYYwK1leN2mpmtLKmwyMAw-1; Tue, 18 Jan 2022 06:22:38 -0500
X-MC-Unique: tYYwK1leN2mpmtLKmwyMAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1DB2807901
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:22:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB0415E4AB;
 Tue, 18 Jan 2022 11:22:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1BF401800394; Tue, 18 Jan 2022 12:22:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] seabios: update submodule to snapshot
Date: Tue, 18 Jan 2022 12:22:31 +0100
Message-Id: <20220118112232.2396744-2-kraxel@redhat.com>
In-Reply-To: <20220118112232.2396744-1-kraxel@redhat.com>
References: <20220118112232.2396744-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most important update is smbios3 support being added, this update should
help getting the qemu side of things (flip to smbios3 by default for new
machine types) merged and tested.

Not fully clear yet when the next 1.16 seabios version will be released,
but it should be no later than end of February so we can pick it up for
qemu 7.0.

full shortlog
=============

Andy Pei (3):
      virtio-blk: add feature VIRTIO_BLK_F_SIZE_MAX and VIRTIO_BLK_F_SEG_MAX
      virtio-blk: abstract a function named virtio_blk_op_one_segment to handle r/w request
      virtio-blk: split large IO according to size_max

Eduardo Habkost (19):
      biostables: copy_fseg_table() function
      util.h: Delete unused get_smbios_entry_point() prototype
      smbios: Rename code specific for SMBIOS 2.1 entry points
      smbios: Generic smbios_next() function
      smbios: smbios_get_tables() function
      smbios: Use smbios_get_tables()/smbios_next() at display_uuid()
      smbios: smbios_major_version()/smbios_minor_version() helpers
      tpm: Use smbios_get_tables()
      csm: Don't check SMBios21Addr before calling copy_smbios_21()
      smbios: Make SMBios21Addr variable static
      smbios: Use smbios_next() at smbios_romfile_setup()
      smbios: Extract SMBIOS table building code to separate function
      smbios: Make smbios_build_tables() more generic
      smbios: smbios_21_setup_entry_point() function
      smbios: Make some smbios_build_tables() arguments optional
      smbios: Make smbios_build_tables() ready for 64-bit tables
      smbios: copy_smbios_30() function
      smbios: Support SMBIOS 3.0 entry point at copy_table()
      smbios: Support SMBIOS 3.0 entry point at smbios_romfile_setup()

Gerd Hoffmann (1):
      svgamodes: add standard 4k modes

Igor Mammedov (2):
      pci: reserve resources for pcie-pci-bridge to fix regressed hotplug on q35
      pci: let firmware reserve IO for pcie-pci-bridge

Kevin O'Connor (4):
      vgasrc: Don't use VAR16 in header files to fix gcc warning
      memmap: Fix gcc out-of-bounds warning
      readserial: Improve Python3 compatibility
      scripts: Remove python23compat.py

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/seabios | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/seabios b/roms/seabios
index 2dd4b9b3f840..6a62e0cb0dfe 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit 2dd4b9b3f84019668719344b40dba79d681be41c
+Subproject commit 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9
-- 
2.34.1


