Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312FD5EF186
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:12:04 +0200 (CEST)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpaN-0006EJ-9c
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2J-0000Ac-DE; Thu, 29 Sep 2022 04:36:51 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2H-0007gj-Eh; Thu, 29 Sep 2022 04:36:51 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so719171pjl.0; 
 Thu, 29 Sep 2022 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=abztJpBRwhu4pBlkWQKZWBz7Xn4lqpi7xSn/+xxKBUI=;
 b=p04Gyer4P7HXMNt/PXIpS1iaMYug6tDyyg6uFxoNcQCCYDOWSBNOYtyqOXlb94Lx8k
 QDp8wpGkrKyvF9E6aMifQOBYXdKqn5IoP53pfngmgnbAH9sZsQ7EmKSE+KIVpKCjpfgX
 Fz3zU1qE4R9UHNZIFk4JQECD/RWDWd9xTXVNT9tl9caEY2aIbU5MuKDd318dBZryLH6g
 xpf8pEaPWYFCC5VbzCtI0ZMTugSvJotV4JpfMzRr3MhrKYqYZB/yQlIjAcWPH9QwjSxo
 9IIDUxay0rkDr8/yLdjHWG6o7FdsY9olpV4Q6B9c1XeBZC50C9E0Mp82ay4tnfyDyK8R
 NVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=abztJpBRwhu4pBlkWQKZWBz7Xn4lqpi7xSn/+xxKBUI=;
 b=TbRswRAvkBPUrzlbHq7+rAqUO+ww+G12R4vPFPUG7fQPwQiO7Wp8T4b/++WeR/Tc3i
 W9mQDj4nadVL2eqSZXOZONjozo0bri3Io8mVT2u+GqeMGh5Gc+ZYPsXY1TO6NnXEgPB4
 2r3AlEV0URlK+mWpZ38/M+RqmaxhaXou+6YTGxo2Sexa2+LrIgmjMSirhUw4WnbiUSK5
 fMgeYCQd5xxERGBPC8ePJpumBVfGpdICpyU8OHU/ywelBLjYLVDU/PmviOx+jIzRGBDj
 UMiTW2NA10b00JX2/VWyef5ei/SE1Eqi6Fuye5K+J5otBnOo8B9Zab3p4C9vr5+LB5DO
 9EaA==
X-Gm-Message-State: ACrzQf24c3OOLyg8tEYrv3+7NZexOyzD6ODfNvCnt9hL9zpvMgWYrs8I
 +m4MEQFguaN2Fj7j6t2wzPYFLiF7POqY4g==
X-Google-Smtp-Source: AMsMyM537WZ0K4OUIdkNgkBMazUhU4Cmu+6wgNaUYhh58Li4DzoIbYbtqZ+1a2SIMCumn54qR0LL+A==
X-Received: by 2002:a17:903:18b:b0:176:afb8:b4ab with SMTP id
 z11-20020a170903018b00b00176afb8b4abmr2402393plg.80.1664440607134; 
 Thu, 29 Sep 2022 01:36:47 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b0017829a3df46sm5324233plg.204.2022.09.29.01.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:36:46 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 0/7] Add support for zoned device
Date: Thu, 29 Sep 2022 16:36:24 +0800
Message-Id: <20220929083631.61899-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
example, to test zone report using qemu-io:
$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
-c "zrp offset nr_zones"

v10:
- address review comments
  * deal with the last small zone case in zone_mgmt operations [Damien]
  * handle the capacity field outdated in old kernel(before 5.9) [Damien]
  * use byte unit in block layer to be consistent with QEMU [Eric]
  * fix coding style related problems [Stefan]

v9:
- address review comments
  * specify units of zone commands requests [Stefan]
  * fix some error handling in file-posix [Stefan]
  * introduce zoned_host_devcie in the commit message [Markus]

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
  file-posix: introduce helper functions for sysfs attributes
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
  raw-format: add zone operations to pass through requests
  config: add check to block layer
  qemu-iotests: test new zone operations
  docs/zoned-storage: add zoned device documentation

 block.c                                |  17 +
 block/block-backend.c                  | 146 ++++++++
 block/file-posix.c                     | 474 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  14 +
 docs/devel/zoned-storage.rst           |  40 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  47 +++
 include/block/block-io.h               |   7 +
 include/block/block_int-common.h       |  32 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  17 +
 meson.build                            |   4 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 148 ++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 17 files changed, 1106 insertions(+), 40 deletions(-)
 mode change 100644 => 100755 block.c
 mode change 100644 => 100755 block/file-posix.c
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.3


