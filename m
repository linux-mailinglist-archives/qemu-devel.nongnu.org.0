Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE45A2C85
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:42:45 +0200 (CEST)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcPs-0000ZL-Bl
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRcJi-0003ZJ-Si; Fri, 26 Aug 2022 12:36:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRcJd-0003Ix-G8; Fri, 26 Aug 2022 12:36:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id o4so2112815pjp.4;
 Fri, 26 Aug 2022 09:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=cA9qvWvt3Agsuzl2uQnN8tQbc5AAPd8bR9LyJjncB5s=;
 b=HZdUd55HA2HGFEN6OIeFXok4ALmRJc3w8aDAEkYEye2+HMjGg9NS9LibFLInaWAJ4O
 MjIiGxZFlOSVg4zdKMnSHH+MRAts4DujHU+C3CRc3HMoCcKtjTl+ZofzxMi0kheViRF8
 jxWyM0UhOtjdHRhpgbVwQthC1FTW2C6gMaKpko+JBizMYwSESPiRTruvIOm10ZfGq6JS
 vGwKcO0h33yX1jGYXOc6XJ3bXGdrkVNeIGgHS9sGhJBUzxVx4fYLQ/DQxyK+Cun1Ko/r
 92IaJR01EEz74kAVdE97DibsSL6OtfxqRC85FyfmZonaRtb0W2rGlnD6XEnW762f4AcZ
 bM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=cA9qvWvt3Agsuzl2uQnN8tQbc5AAPd8bR9LyJjncB5s=;
 b=s+1Nj+qwtohHEv+viKKNSyiszaTk+AUliICsPjd5b15Wbw9IH/FG11pPxwYvJeXLMi
 mgVYkj5HltnIuwE4SaqrF3ka8OYxYXF3GLEaQKrntz3egCZVzAnkdOqOEjMRTyoXVdth
 R6tSFjoYscURMmnOhcYxTJQUaSPKTNrEui+XhSlzm/URW5Wai8TrBjSWNabsxJSSTLpm
 n9Ph6gwE0rwWs4knC7jaytjO+JF6WQEajWQinbR/o27QvbqFQsaCMbflVDRm5tmIhCXP
 Uac2U0ftevNqNLfxLvVTvjiqk5SLfjBugPxzkUjTXivHuvgINzu2onbVsatD8sTeTrCs
 FL6Q==
X-Gm-Message-State: ACgBeo3swkHul2abwbTYzwn5FJOIS0Bw7f5dfL/r5ewZe59aOWx0ZQNb
 pzDr7fyizF5d4Vj7Hepx/iBXyDpVUqUNRg==
X-Google-Smtp-Source: AA6agR7grLs0f7TstGztCoMjFqreAIAkULq9Oc8K/McNxMqMr9j9mFlf3ERphcYEwIhJJ8iK1hU5zQ==
X-Received: by 2002:a17:902:e552:b0:16d:c98c:5954 with SMTP id
 n18-20020a170902e55200b0016dc98c5954mr4499052plf.111.1661531774378; 
 Fri, 26 Aug 2022 09:36:14 -0700 (PDT)
Received: from roots.. ([106.84.135.2]) by smtp.gmail.com with ESMTPSA id
 jo13-20020a170903054d00b001715a939ac5sm1772154plb.295.2022.08.26.09.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 09:36:13 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com, fam@euphon.net,
 kwolf@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 7/7] docs/zoned-storage: add zoned device documentation
Date: Sat, 27 Aug 2022 00:35:33 +0800
Message-Id: <20220826163533.9393-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Add the documentation about the zoned device support to virtio-blk
emulation.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/zoned-storage.rst           | 41 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 ++++
 2 files changed, 47 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
new file mode 100644
index 0000000000..ead2d149cc
--- /dev/null
+++ b/docs/devel/zoned-storage.rst
@@ -0,0 +1,41 @@
+=============
+zoned-storage
+=============
+
+Zoned Block Devices (ZBDs) devide the LBA space into block regions called zones
+that are larger than the LBA size. It can only allow sequential writes, which
+reduces write amplification in SSDs, leading to higher throughput and increased
+capacity. More details about ZBDs can be found at:
+
+https://zonedstorage.io/docs/introduction/zoned-storage
+
+1. Block layer APIs for zoned storage
+-------------------------------------
+QEMU block layer has three zoned storage model:
+- BLK_Z_HM: This model only allows sequential writes access. It supports a set
+of ZBD-specific I/O request that used by the host to manage device zones.
+- BLK_Z_HA: It deals with both sequential writes and random writes access.
+- BLK_Z_NONE: Regular block devices and drive-managed ZBDs are treated as
+non-zoned devices.
+
+The block device information resides inside BlockDriverState. QEMU uses
+BlockLimits struct(BlockDriverState::bl) that is continuously accessed by the
+block layer while processing I/O requests. A BlockBackend has a root pointer to
+a BlockDriverState graph(for example, raw format on top of file-posix). The
+zoned storage information can be propagated from the leaf BlockDriverState all
+the way up to the BlockBackend. If the zoned storage model in file-posix is
+set to BLK_Z_HM, then block drivers will declare support for zoned host device.
+
+The block layer APIs support commands needed for zoned storage devices,
+including report zones, four zone operations, and zone append.
+
+2. Emulating zoned storage controllers
+--------------------------------------
+When the BlockBackend's BlockLimits model reports a zoned storage device, users
+like the virtio-blk emulation or the qemu-io-cmds.c utility can use block layer
+APIs for zoned storage emulation or testing.
+
+For example, the command line for zone report testing a null_blk device of
+qemu-io-cmds.c is:
+$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0 -c
+"zrp offset nr_zones"
diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index dfe5d2293d..0b97227fd9 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -430,6 +430,12 @@ Hard disks
   you may corrupt your host data (use the ``-snapshot`` command
   line option or modify the device permissions accordingly).
 
+Zoned block devices
+  Zoned block devices can be passed through to the guest if the emulated storage
+  controller supports zoned storage. Use ``--blockdev zoned_host_device,
+  node-name=drive0,filename=/dev/nullb0`` to pass through ``/dev/nullb0``
+  as ``drive0``.
+
 Windows
 ^^^^^^^
 
-- 
2.37.2


