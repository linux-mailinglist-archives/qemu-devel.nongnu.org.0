Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2976B6CD9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 01:40:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbWD5-0008Tu-S3; Sun, 12 Mar 2023 20:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=429508162=wilfred.mallawa@opensource.wdc.com>)
 id 1pbWD3-0008TT-DB
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 20:38:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=429508162=wilfred.mallawa@opensource.wdc.com>)
 id 1pbWD1-0005Ya-PZ
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 20:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678667919; x=1710203919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6RKkm9ZGX7nqLW2HD4QefBjLBP98Dxrj0YX8DVCRes8=;
 b=Kwco0nNbz/NufD8A/Jo+CfM6T2s27WYwROeB5ZWyEPNTmMN00MDY8NvV
 sdnQCOOI3iUT5EN8azKaJwNPUuU4LxZLxVQuMHZnsgJLeGCLlswgm5Z7/
 zDCMXMXHpK1UlL/6uQRvOf9bnhTLM40n9PHud/PUwzaJmoG4zYUkbh644
 DYvEYn7M2JA7+Xs+FWRH+66VVqYKBvnm9aMRWcq0IbtBFLD3jscmb27GN
 dtNkHl7ds4YEdBc4BQyc/m1llsPLM9yVpz0k2asuKdUWOzzCh4HUIP5K2
 Lddq/NgFOUIvH3rtdvMnDGVHlDLAJV9wJkeKlHba+rgil0tOtVbB4/CQY A==;
X-IronPort-AV: E=Sophos;i="5.98,254,1673884800"; d="scan'208";a="223743898"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2023 08:38:33 +0800
IronPort-SDR: Pq49iOXCQzEZ5Gjw/g/HFf7Wnj2d/hgZOFlVEkW2O9WBla9+Y8ln4q79JKjk2pAbnaxkTycsBW
 oylIr6POeR+iWvhleURNLwScOefCeHPfSMDLKN/RKRNUQEczhgtlvaFUemWhjJUAk2c3SgjkOY
 Yn7BoBy4qwMwUXAnf9EjLUF/jE8Scc5Ds080fqV2BVGrrPs76x8j4oqOvmPvsdHwHoYZCZ9VRb
 VE+zLVtmEq3lM8Nz8wlEA8D59khe0RQNurWZeJKGv8Fs0HCaB4e3Jx3PyoCSsIxHw/jcd1yMv8
 Lj0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Mar 2023 16:55:03 -0700
IronPort-SDR: EAFowjHwNSepPlF7XB1b5BPcEt9/wuDg2BC9beUrro95yCw4HwsGzARmPPmElyIdfdPddjRkBC
 aprZPTmKkXL6/O5VhWDxszvJpn/H7A8+D3Z5RL5xggZdTWwZCaLge0CTj7FVduN710i0zv9piT
 54udH6WfMgEuEwK23wXqn9cqQR6Ww+mg9kvgYpW38p4D1LOaujyqSNSNKl0SyEYUPhHWMqKVQ4
 0VWg6VWHf6YZWq7G6C0MG63FYpbGLL73/zE597zqfPegEvGrWMY64WcDMXboSFyfwbFrNXw2g0
 saI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Mar 2023 17:38:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PZd7F52v8z1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 17:38:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1678667913;
 x=1681259914; bh=6RKkm9ZGX7nqLW2HD4QefBjLBP98Dxrj0YX8DVCRes8=; b=
 AeuAvfUVD0jk1o1dth4EJKhqm8mO29K8RGl2cdizUiQkH2zPGshSg4QXJQDibdce
 KDphuMHvLetFXCtrmpKcFyDTchRM7WB50ZxrbugCmgpSo9wG8L84K9WKoPDnrVdm
 ce55j9K6u4KjNzO+uRZKH8+PN3d6QJsF44bd/NVdXQfbZV7qvcbl0a4WonQCVhP0
 Jb/PP28Dm59t6weRtf6iU9zTAHZp9zzv1nEQZVXNeLch7Y4psu4KnLIHZ6/Vm2rL
 Zr0A0K7danFD/TZqgAOiB3kdfR4QMrcol5USU44xrxfmkAceDCHIHVdMNjg3Kjzu
 WI1IyKPFfWBzhbhnfGab4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GJhPWTG2_LDD for <qemu-devel@nongnu.org>;
 Sun, 12 Mar 2023 17:38:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PZd7B28ktz1RvLy;
 Sun, 12 Mar 2023 17:38:29 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: stefanha@redhat.com, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v2] include/block: fixup typos
Date: Mon, 13 Mar 2023 10:37:45 +1000
Message-Id: <20230313003744.55476-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=429508162=wilfred.mallawa@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Fixup a few minor typos

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---

 v2:
 - Fixup typo in commit msg.

 include/block/aio-wait.h         | 2 +-
 include/block/block_int-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index da13357bb8..6e43e3b7bb 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -63,7 +63,7 @@ extern AioWait global_aio_wait;
  * @ctx: the aio context, or NULL if multiple aio contexts (for which th=
e
  *       caller does not hold a lock) are involved in the polling condit=
ion.
  * @cond: wait while this conditional expression is true
- * @unlock: whether to unlock and then lock again @ctx. This apples
+ * @unlock: whether to unlock and then lock again @ctx. This applies
  * only when waiting for another AioContext from the main loop.
  * Otherwise it's ignored.
  *
diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
index d419017328..ce51c1f7f9 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1254,7 +1254,7 @@ extern QemuOptsList bdrv_create_opts_simple;
 /*
  * Common functions that are neither I/O nor Global State.
  *
- * See include/block/block-commmon.h for more information about
+ * See include/block/block-common.h for more information about
  * the Common API.
  */
=20
--=20
2.39.2


