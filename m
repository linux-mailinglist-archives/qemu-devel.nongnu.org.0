Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB55EF116
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:59:56 +0200 (CEST)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpOd-0006LU-Oi
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp3I-0000kw-Hr; Thu, 29 Sep 2022 04:38:05 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp3E-0007mI-8C; Thu, 29 Sep 2022 04:37:52 -0400
Received: by mail-pf1-x435.google.com with SMTP id y136so842582pfb.3;
 Thu, 29 Sep 2022 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=M31EW5S6vG1yBLEmkW0Pm4rG7QGT7vbmcxx33vJeyFw=;
 b=J3bP1TUePMC4/Y1XI5LC+A1J52nXehPyKAN5brorPDhyjZ5HDrD6iM5AhE5XjhJ+Jv
 A+aP6GwxuiauJN5IFOkw2ZVkOIoB/NkqFhXc8W0yu4RTiE2HlTdjJeajPUa98PjHJksu
 y2MPZbbFyPU00N+PmOwTVLRG2MHRNutMjiRVGyYt/6atZmiA6Qp+Zojl9FfqKZThMOOp
 wkgq+/9OjsNYngs0CSEGhD875gQ07+2xWmj2Ik2zAkpq+Rfdj9CtiV9AFKRFb3mzRN4i
 vgiKT+K7lZtRW89U/yy/4dl27ulaWTI47QbLviQ7xhfF+Lb/5IdtvW+ZYbvPxMQkGumc
 6s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=M31EW5S6vG1yBLEmkW0Pm4rG7QGT7vbmcxx33vJeyFw=;
 b=3rIZAD3/qNCMXDmhXXXoNX6LFI9PbsDcp8S0wvOsjQTjmmP5uxnRpPCCY3ATEtZp7T
 uWLBATqhwZbyyOzSPZTKZHv0ikvkDsflC2D1kTnSw6VwfuikFZ9ZX6hpUvW2o2oJZNzc
 Y5Ue7sUNbiIsOdoWVU0hsVeFSmPkI3D9wW6AYE9IpUGwsDmaiGQQlDGUJsKd8k3zCMeW
 Z9JQL22LKXbmEw/s2C5+AAtAsnkDgWGY0iutuFyPCBVuF2qTA/9KuInx7yTDKJp2dv6P
 W0TNHT7invtsLAs6ClJaEHDQNrXDnTdX3gL3hAx3fb65GD25Bn2HO0/iDuM1FzpbwCSW
 J/Vw==
X-Gm-Message-State: ACrzQf2ofukatH4h2OcPEfVpliGHa9Qq/BSnun5IJc+YoTtfZvzxmrp5
 5bFNVyn9SshXCE/ktNziY/jjgHvBUfF9xw==
X-Google-Smtp-Source: AMsMyM4/pt87q6oqldWyPu7VWrD0y3mVDe6EsVampqejGwNSQzixv6uGwAf2lHgsFzeSs4mjtTuBbQ==
X-Received: by 2002:a63:f5e:0:b0:434:d532:aad4 with SMTP id
 30-20020a630f5e000000b00434d532aad4mr1890958pgp.175.1664440664027; 
 Thu, 29 Sep 2022 01:37:44 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b0017829a3df46sm5324233plg.204.2022.09.29.01.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:37:43 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 7/7] docs/zoned-storage: add zoned device documentation
Date: Thu, 29 Sep 2022 16:36:31 +0800
Message-Id: <20220929083631.61899-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929083631.61899-1-faithilikerun@gmail.com>
References: <20220929083631.61899-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x435.google.com
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

Add the documentation about the zoned device support to virtio-blk
emulation.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/zoned-storage.rst           | 40 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 ++++
 2 files changed, 46 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
new file mode 100644
index 0000000000..deaa4ce99b
--- /dev/null
+++ b/docs/devel/zoned-storage.rst
@@ -0,0 +1,40 @@
+=============
+zoned-storage
+=============
+
+Zoned Block Devices (ZBDs) devide the LBA space into block regions called zones
+that are larger than the LBA size. They can only allow sequential writes, which
+can reduce write amplification in SSDs, and potentially lead to higher
+throughput and increased capacity. More details about ZBDs can be found at:
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
+For example, to test zone_report on a null_blk device using qemu-io is:
+$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
+-c "zrp offset nr_zones"
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
2.37.3


