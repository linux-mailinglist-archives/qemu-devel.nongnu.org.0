Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7077D5F96C1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:24:01 +0200 (CEST)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohiSV-00067U-6l
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQB-00028m-Sd; Sun, 09 Oct 2022 22:21:35 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQ9-0006Ii-Gh; Sun, 09 Oct 2022 22:21:35 -0400
Received: by mail-pg1-x529.google.com with SMTP id 128so1480590pga.1;
 Sun, 09 Oct 2022 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9gdI6MRkWlm/oaHkeaHchejUNlXfEo2FXTzA+MtFdHo=;
 b=WB4GS1EORMHzXWWwwsrtxBrIDX9kMiS8Ghl4KXT0BR9Y/c90IiUHMpFlOgMXR1Gopn
 oejayQTMH3ovGG2VYv4qq7JfPRTikNzWGj+7bfq2dqTdFKQCM16eT0HmD7UxTAUgA2i2
 Xy/+AEZErq1rDgeiIKQUhWk9CLHhLy0knk7JNX6jG5vWeyJg/ot41Sc8Tf2aAk4p2hrQ
 tjxNPNNdre9soETh3BMFYdZVJ7Y1A2GttjFZtZs4Kmvk9+WGnmEBN27f8wXTzvcq8Odx
 5p++LRPg5p2XaJ1I0Fz/VwMVgqab76k6zXV/vA8lG2CkXrCDGk9oK8Xt6sI/4Gl25hrR
 iNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9gdI6MRkWlm/oaHkeaHchejUNlXfEo2FXTzA+MtFdHo=;
 b=8MuLMOpN3u2DAz1WXyUOSBqfqcnsrCAhYQvjgDAQT09FiENlt5LB//ReBY75uEEUi2
 Il/yw5QuZHMXiR8MbRIn+ZSbctNIP7PQDR9Fq7CRbClnYoeEFzCaSrEjHljeXznOIIlH
 1tQv5BpHc5Q9AGZxbGZ7A0QN+ZRQbUvMfYSuOhViVV49bspu2OpfJGaqi7mMXzGjY9iy
 V8KRtWTMV3N6nGITHiuvtMDgJt4TA48G2vznUz11z7LZomsIoKFGoCH4JOhexmdqLgj8
 JtXEEE6vbuWAvOi687fwieA5lIezmfpwbgoO2Uae5DZqeTh/yplKfPqX3Q1aOaZwdELg
 MfQA==
X-Gm-Message-State: ACrzQf0OeR4DQwAVcnxrU717DAyNSGWZ/HjRjwahyvi1Lmjj7if9g49o
 lDCndQdZNhSMgI6a9NJGBiO+UNdVjvEZ8KmMhb4=
X-Google-Smtp-Source: AMsMyM4VlX3lj/udMFlm59XuuDu1MJAjxRxO4bOW2M7XTmezQrivqsIhPyF83rhvclmNB/9TNTdJNQ==
X-Received: by 2002:a05:6a00:27a0:b0:54b:e645:d5d8 with SMTP id
 bd32-20020a056a0027a000b0054be645d5d8mr16850904pfb.86.1665368491406; 
 Sun, 09 Oct 2022 19:21:31 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170902f68c00b00178323e689fsm5372740plg.171.2022.10.09.19.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:21:31 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, damien.lemoal@opensource.wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 0/7] Add support for zoned device
Date: Mon, 10 Oct 2022 10:21:09 +0800
Message-Id: <20221010022116.41942-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x529.google.com
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

 block.c                                |  17 +
 block/block-backend.c                  | 146 ++++++++
 block/file-posix.c                     | 463 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  14 +
 docs/devel/zoned-storage.rst           |  40 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  44 +++
 include/block/block-io.h               |   7 +
 include/block/block_int-common.h       |  32 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  17 +
 meson.build                            |   4 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 148 ++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 17 files changed, 1093 insertions(+), 39 deletions(-)
 mode change 100644 => 100755 block.c
 mode change 100644 => 100755 block/file-posix.c
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.3


