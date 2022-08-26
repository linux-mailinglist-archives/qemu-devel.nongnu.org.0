Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E74D5A2B31
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:27:40 +0200 (CEST)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbFD-0007x4-9B
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRb3o-0002C5-2N; Fri, 26 Aug 2022 11:15:55 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRb3l-000620-48; Fri, 26 Aug 2022 11:15:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id l3so1817702plb.10;
 Fri, 26 Aug 2022 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=HpbkDjtDMde4sf26BvG6z411p2baF6M02LXxuU43Y3E=;
 b=myl9ewolwrkrcwTacTvqkwrEmABE6Q895iDzlnzTvg6ADI18FS3wi+aBa3pD0bEObw
 Jd1N2IJTLFUqsp8cvUu/d1A7vNi9pwjmfeIfZe3MtfrALe/VXtCLlyTHZqiueYCBJlBP
 DXMnKtUEdCXARSCzuPKz29MtKm4Hccz0jQ1i6mBJ0hbKytmbQTZCAi34lQfDP63n/d/+
 S8QCGik9X4u7sGtRuw7a0tJUri7G3LP2fCyoCZnJP3kyCkGJ48rX3e27OSeKWdbUBAkf
 ePzXOz+ofScrvqMeSF7vGWTy11CB1nRJv0XRYypltTpa8nuITrpiTQwvb/Xi7bBy6jiy
 tmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=HpbkDjtDMde4sf26BvG6z411p2baF6M02LXxuU43Y3E=;
 b=kg5InJb4xKXCaNTDxBjxQOycotfbNdFxEQN6mhlEioQgArs9e6381jwVHN0AWpaxZj
 jNkur5ZI8yVAyzb/D3VOB4aJIU3MwOxwQeIonWQVL94ji1SyEILqCs+j+pVnF2vGoPQW
 fdU+N6qlRzAdIGp05B7RK5W2Zjw/A89p4m4n6M9tOas5rigE20SIlS0+lL54rO4yBeti
 lenqsDbghyK1D8v7KfzKC/OBRtwaTLbr9grFoNc2tYmKH+9fTyvIlMuFsTvzlCLqjf+b
 fj0I+16eKO7GWly0AQq9vNFTjLahuUCTYTJrL1Ruhuo7LFOk/8eYfNZO7GJ/UX+uIzKN
 sHvQ==
X-Gm-Message-State: ACgBeo21ltg+nvzB+s+/Nz0ufPPMgIuMyUG50bhopcnKjc7Ccdk7N/bs
 jBpyy+l/HrxSojEXb1efpdoXINBEvtbS0w==
X-Google-Smtp-Source: AA6agR4vh1rMAfA3/CoQkl2YeZrRzjSgTc/nhLaM6j4uQfKgFDLEC+7rK4t/mVO/pCJFBPnaXz6yFw==
X-Received: by 2002:a17:90b:2643:b0:1fb:707d:af1f with SMTP id
 pa3-20020a17090b264300b001fb707daf1fmr4979138pjb.7.1661526947016; 
 Fri, 26 Aug 2022 08:15:47 -0700 (PDT)
Received: from roots.. ([106.84.135.2]) by smtp.gmail.com with ESMTPSA id
 h6-20020aa79f46000000b0052d4b0d0c74sm1870003pfr.70.2022.08.26.08.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 08:15:46 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com, fam@euphon.net,
 kwolf@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 0/7] Add support for zoned device
Date: Fri, 26 Aug 2022 23:15:29 +0800
Message-Id: <20220826151529.6601-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Zoned Block Devices (ZBDs) devide the LBA space to block regions called zones
that are larger than the LBA size. It can only allow sequential writes, which
reduces write amplification in SSD, leading to higher throughput and increased
capacity. More details about ZBDs can be found at:

https://zonedstorage.io/docs/introduction/zoned-storage

The zoned device support aims to let guests (virtual machines) access zoned
storage devices on the host (hypervisor) through a virtio-blk device. This
involves extending QEMU's block layer and virtio-blk emulation code.  In its
current status, the virtio-blk device is not aware of ZBDs but the guest sees
host-managed drives as regular drive that will runs correctly under the most
common write workloads.

This patch series extend the block layer APIs with the minimum set of zoned
commands that are necessary to support zoned devices. The commands are - Report
Zones, four zone operations and Zone Append (developing).

It can be tested on a null_blk device using qemu-io or qemu-iotests. For
example, the command line for zone report using qemu-io is:
$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
-c "zrp offset nr_zones"

v8:
- address review comments
  * solve patch conflicts and merge sysfs helper funcations into one patch
  * add cache.direct=on check in config

v7:
- address review comments
  * modify sysfs attribute helper funcations
  * move the input validation and error checking into raw_co_zone_* function
  * fix checks in config

v6:
- drop virtio-blk emulation changes
- address Stefan's review comments
  * fix CONFIG_BLKZONED configs in related functions
  * replace reading fd by g_file_get_contents() in get_sysfs_str_val()
  * rewrite documentation for zoned storage

v5:
- add zoned storage emulation to virtio-blk device
- add documentation for zoned storage
- address review comments
  * fix qemu-iotests
  * fix check to block layer
  * modify interfaces of sysfs helper functions
  * rename zoned device structs according to QEMU styles
  * reorder patches

v4:
- add virtio-blk headers for zoned device
- add configurations for zoned host device
- add zone operations for raw-format
- address review comments
  * fix memory leak bug in zone_report
  * add checks to block layers
  * fix qemu-iotests format
  * fix sysfs helper functions

v3:
- add helper functions to get sysfs attributes
- address review comments
  * fix zone report bugs
  * fix the qemu-io code path
  * use thread pool to avoid blocking ioctl() calls

v2:
- add qemu-io sub-commands
- address review comments
  * modify interfaces of APIs

v1:
- add block layer APIs resembling Linux ZoneBlockDevice ioctls

Sam Li (7):
  include: add zoned device structs
  file-posix: introduce helper funcations for sysfs attributes
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
  raw-format: add zone operations to pass through requests
  config: add check to block layer
  qemu-iotests: test new zone operations
  docs/zoned-storage: add zoned device documentation

 block.c                                |  14 +
 block/block-backend.c                  |  51 +++
 block/file-posix.c                     | 460 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  14 +
 docs/devel/zoned-storage.rst           |  41 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  43 +++
 include/block/block-io.h               |   7 +
 include/block/block_int-common.h       |  29 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  17 +
 meson.build                            |   1 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 143 ++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 17 files changed, 980 insertions(+), 40 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.2


