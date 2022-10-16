Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC7E600018
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 16:54:41 +0200 (CEST)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok52F-0002Wh-MJ
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 10:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4z8-0005nT-Eq; Sun, 16 Oct 2022 10:51:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4z6-0004ku-5s; Sun, 16 Oct 2022 10:51:25 -0400
Received: by mail-pl1-x630.google.com with SMTP id d24so8714619pls.4;
 Sun, 16 Oct 2022 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YeyuG770vSKD5hxwGddk7q1ipWgbR9pC2UgMnpxjPVw=;
 b=n+6vkskzJAxq4tGqBaNCpwidJXA0zeEeHu0ushELZ/22Myh6BvIKoEwrBfekibtHKl
 +CckoBRIzYyTqFMWADvNqmuFB+V6TWsb6QUyyXy0ijTSeqBQcbhlOn4TmhDCGlenN6Wk
 QayO3iXuBN9bId5jrwR9cx/e8VxgCIt9aXkQ62OnjSxJu22kVlPtUyw36aJRCPb46E2q
 l2LgCoOEfx3VBuwpx1WT8buiHaxUaLpv9D6AsoKp12aqQJgik8TMazaenpGDVAB0tdRn
 sWpHO05rewasZV+rz8Nx3ttDFixX3bg4q6BPZD4JZW8thqsq0CKAPlh0eNPLYx6MIFGc
 a5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YeyuG770vSKD5hxwGddk7q1ipWgbR9pC2UgMnpxjPVw=;
 b=d5nuKEme+HNVVFe8fKHhGUm1yeZnrwYLODmewQ/Qe1YFXnfuWehdW+qIg1DaNqWvYe
 QHh0MVL7xY4eVaf2GofDBuXYHEsN1pILwyefrrBGs+WMxFP0ki0yv1y4NHK/8BBcZFL1
 q6oXXixmtNLfpef/wmlWdYgmPrjbZI9lXy5BVsIPsz3kpH/dXR1kajph7tUCsbIZo5So
 BEvoNN7tU2xFDotpDnZ8WOl/EjpNP0pII7U57XjN/KNqDcF8E/wXWRW+Za4Os8lvcz3h
 o6sLbzfukjy8UfXwxREWBEGjHvfoG27wHkqMcuZ+ntDf6502E9qIMWGeTN9DRZ8PQPMR
 pSLQ==
X-Gm-Message-State: ACrzQf2ZJdXxxIPsxfn0UgEjgzUNVtnAfKcxRoG48yo9G2WVZbM56QL6
 7G73cP6ftI49lbtkRhmsnWXJdmz2Zi7ZFg==
X-Google-Smtp-Source: AMsMyM55ym+b2+tqTStmzZpMmOzA6FPR1FpA9aFBVLO4bXxJqzudhLXbrtvtNBN5xWE8sy48DpJJRQ==
X-Received: by 2002:a17:90a:1a43:b0:20a:ea98:b962 with SMTP id
 3-20020a17090a1a4300b0020aea98b962mr28352710pjl.118.1665931881765; 
 Sun, 16 Oct 2022 07:51:21 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa79e5b000000b005377c74c409sm5143619pfq.4.2022.10.16.07.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:51:21 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, hare@suse.de, Eric Blake <eblake@redhat.com>,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v12 0/7] Add support for zoned device
Date: Sun, 16 Oct 2022 22:51:03 +0800
Message-Id: <20221016145110.171262-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x630.google.com
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

v12:
- address review comments
  * drop BLK_ZO_RESET_ALL bit [Damien]
  * fix error messages, style, and typos[Damien, Hannes]

v11:
- address review comments
  * fix possible BLKZONED config compiling warnings [Stefan]
  * fix capacity field compiling warnings on older kernel [Stefan,Damien]

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

 block.c                                |  19 +
 block/block-backend.c                  | 148 ++++++++
 block/file-posix.c                     | 471 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  14 +
 docs/devel/zoned-storage.rst           |  43 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  43 +++
 include/block/block-io.h               |   7 +
 include/block/block_int-common.h       |  32 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  18 +
 meson.build                            |   4 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 149 ++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 17 files changed, 1109 insertions(+), 39 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.3


