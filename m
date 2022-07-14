Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB529574824
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:14:24 +0200 (CEST)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBuvP-000886-EK
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujn-0004xY-5v
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuji-0005sX-GZ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5WrNwF6OXCHFo+3l/98jNDwNm+SN0pzckmDsi19/lsc=;
 b=NPC83HLe/6qvnJ5MGUdmtOjaqiDbiQAw6raqHNfJ5YrUGatlWZ+5t/a9Q/V4TpKnW83Rwe
 Zf8oRXEoNI/WNhjDH4sM/ZSTr2zzejg7AqijEa7+xWjjQcPXS5HDJc2qPIBbnlAq95OdtW
 srw8aZDGpzPZnfxndbJFSI27rkFsl6A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-BEHGTOJfN4CDnNynmrBEAQ-1; Thu, 14 Jul 2022 05:02:15 -0400
X-MC-Unique: BEHGTOJfN4CDnNynmrBEAQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 hs16-20020a1709073e9000b0072b73a28465so502201ejc.17
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5WrNwF6OXCHFo+3l/98jNDwNm+SN0pzckmDsi19/lsc=;
 b=h8Hrn2sFSC2eaEa0D1Qs5o6k9guOEgJgHFRfosfVVj8O2sV3U1Q7/PASIwgW3KoYoj
 OLS5To8cccYOa6XS34paFeEIv9iunQu3Q0lmtU0hYtBKSLQS8YeV28PWDkN1KzYusOQY
 WL2HSbr36bW0c77XbBiXdufLQigaF61teTqlFMArr8yfMQDTOWJNm6wZoLLtrmRDOkFp
 GCwjxzt3i3Id+7/tAnrkRWuycczYrot1Yy7LGdt8FyF/8mKnIJaXhU+gskEMGvsWB1sE
 teCem2euXT4/KialdoT+OdBPMQxcOV/yWWPWg6fgODptaNP+DoAp1n7SluanV1KgEZGU
 wNQQ==
X-Gm-Message-State: AJIora/msrVuHIiEqF+jyVRxEde/R61Z4/68wrMsPuoSYv3Oh0sDw6XY
 CR268KfzcjWUR3kVTLEMULReG0iTPxJYHvVOcSzxp4uDKUSbHSDav5pNhgkmkjo80e1Q30fKFxU
 ycDcg8TrpMWH7E6OUTzVFGI20zrNftqXcO4wgZ7XGYLWuDF87AJqkZE9OJZL33KzQmIY=
X-Received: by 2002:a05:6402:190b:b0:43a:c95d:ec93 with SMTP id
 e11-20020a056402190b00b0043ac95dec93mr10786366edz.44.1657789334378; 
 Thu, 14 Jul 2022 02:02:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1P+LEiRNZ7XanXqgmPeBa+/zUgJQKaPRahFLCUJCcaS993H7+Tus5zJWx595vNDduP0XJHg==
X-Received: by 2002:a05:6402:190b:b0:43a:c95d:ec93 with SMTP id
 e11-20020a056402190b00b0043ac95dec93mr10786333edz.44.1657789333998; 
 Thu, 14 Jul 2022 02:02:13 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 g3-20020a170906538300b0072b14836087sm448289ejo.103.2022.07.14.02.02.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] SCSI, build system patches for 2022-07-13
Date: Thu, 14 Jul 2022 11:01:51 +0200
Message-Id: <20220714090211.304305-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f82:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-12 14:12:15 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to c0b3607d5938f5ee7fd16ff1e102afe938fd4b39:

  pc-bios/s390-ccw: add -Wno-array-bounds (2022-07-13 16:58:58 +0200)

----------------------------------------------------------------
* SCSI fuzzing fix (Mauro)
* pre-install data files in the build directory (Akihiko)
* SCSI fixes for Mac OS (Mark)

----------------------------------------------------------------
Akihiko Odaki (4):
      cutils: Introduce bundle mechanism
      datadir: Use bundle mechanism
      module: Use bundle mechanism
      meson: Prefix each element of firmware path

Mark Cave-Ayland (14):
      scsi-disk: add new quirks bitmap to SCSIDiskState
      scsi-disk: add MODE_PAGE_APPLE_VENDOR quirk for Macintosh
      q800: implement compat_props to enable quirk_mode_page_apple_vendor for scsi-cd devices
      scsi-disk: add SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD quirk for Macintosh
      q800: implement compat_props to enable quirk_mode_sense_rom_use_dbd for scsi-cd devices
      scsi-disk: add SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk for Macintosh
      q800: implement compat_props to enable quirk_mode_page_vendor_specific_apple for scsi devices
      scsi-disk: add FORMAT UNIT command
      scsi-disk: add SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED quirk for Macintosh
      q800: implement compat_props to enable quirk_mode_page_truncated for scsi-cd devices
      scsi-disk: allow the MODE_PAGE_R_W_ERROR AWRE bit to be changeable for CDROM drives
      scsi-disk: allow MODE SELECT block descriptor to set the block size
      q800: add default vendor and product information for scsi-hd devices
      q800: add default vendor and product information for scsi-cd devices

Mauro Matteo Cascella (1):
      scsi/lsi53c895a: really fix use-after-free in lsi_do_msgout (CVE-2022-0216)

Paolo Bonzini (1):
      pc-bios/s390-ccw: add -Wno-array-bounds

 .travis.yml                        |  2 +-
 Makefile                           |  2 +-
 configure                          | 15 ++++++
 docs/about/build-platforms.rst     |  2 +-
 hw/m68k/q800.c                     | 16 +++++++
 hw/scsi/lsi53c895a.c               |  3 +-
 hw/scsi/scsi-disk.c                | 96 +++++++++++++++++++++++++++++++++++---
 hw/scsi/trace-events               |  3 ++
 include/hw/scsi/scsi.h             |  6 +++
 include/qemu/cutils.h              | 18 +++++--
 include/scsi/constants.h           |  2 +
 meson.build                        | 15 +++++-
 meson_options.txt                  |  2 +-
 pc-bios/keymaps/meson.build        | 21 +++------
 pc-bios/meson.build                | 13 ++----
 pc-bios/s390-ccw/Makefile          |  1 +
 scripts/meson-buildoptions.py      |  7 ++-
 scripts/meson-buildoptions.sh      |  4 +-
 scripts/oss-fuzz/build.sh          |  8 ++--
 scripts/symlink-install-tree.py    | 33 +++++++++++++
 softmmu/datadir.c                  | 30 +++---------
 tests/qtest/fuzz-lsi53c895a-test.c | 76 ++++++++++++++++++++++++++++++
 tests/qtest/fuzz/fuzz.c            | 18 -------
 util/cutils.c                      | 66 ++++++++++++++++++--------
 util/meson.build                   |  1 +
 util/module.c                      |  1 -
 26 files changed, 348 insertions(+), 113 deletions(-)
 create mode 100644 scripts/symlink-install-tree.py
-- 
2.36.1


