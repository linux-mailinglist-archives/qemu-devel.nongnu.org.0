Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A43722EA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:20:17 +0200 (CEST)
Received: from localhost ([::1]:59542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgvI-0001SZ-2T
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpB-0004WN-G8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:13:58 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgp2-00008S-ED
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080028; x=1651616028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v9dngNOlYI6M8UvqCNI7Vz66vBQPm9MreWEGG7vUnp8=;
 b=Y7ny2e6VqZonhP2x99XZSGphVuJE1p5raXpt6ANsxGhFs2wjXSZXJFPk
 q8OCLxHXgzGspyqifdkJz493249gpjeB58PNE66IP/gWDGrjiD9b/eetS
 dHqBS4yM99FXaFxgBvW7LqESyeGF7y31LAM/coTDD+h3LcmGfW8ggUfX2
 U5kWdNi1y4ebEoBMQo2zJTZ3Wj/iNwraham4fa2YYF/nTdAY+xXPcEvS2
 MmWONFE+2A28N+m6D5rjGg/J/9IYuRw7cK5C5O5VOIOVZ3UXTiQt8cfE6
 KjQ4wk1ASxTfQTVkXmjlvnPdYlUmo0chvDbGcJ3cf2sIL8qzImxuuKpnM g==;
IronPort-SDR: dhazBUAxyURqvyG9WrnebSa0SaGKaMXNNQ8LN1hQnOmwtngTXXmF96zdfKS1OhOhHyrrORj1Xu
 tRhjYMtawt+i0JogCgogYEsoOUsrSMBBKCpPeCG8QS8axKa4xSRsGmkwZyxXvw/kCyfeIoM3wi
 lnOXp3NIC0coFpVODM55GQCysa/8P/6et2eJFfEXI9ErAoQzjuh2075d/4P0pF45qmQKucunBY
 LsGJAml7MJ6KbN2DJFrJC8/jsmu4sKnB/yME5O4FRNs69M6VjK6SggA1HidUqjouoEjysk0sii
 FE0=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114592"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:13:46 +0800
IronPort-SDR: 4Di/J6iMiWKc+e24UYBB9BRmYJb9vp0bb8Hg1EW2lGZ6koSnP8gyrbjRFYgq99K+8lPOdBHpPo
 52+hYN/Z+1/R/aJLtlVt8p9F3w76BMdGndqV86tWcqvqES7Mlvt1L9sjMAUb8c9k/8tfTdlnCi
 dgFbvckuMVWgjSevUZe+plmfOAW3kSf11smrz8ZgfrGMB2cVQKJAV1+5XnCOgXe3+rJNRnGKFG
 hmGtQWHU+Bw8gKvn3Ic+GXR2J6pbbNMnRB6mi22B7SaZilfnLB2jkYihES487P5Ht16fR/HNzC
 XG/iHdRnYL2FrhIabBCPXynx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:53:57 -0700
IronPort-SDR: KJRpmvIUVpweNtnlM0UGNoOujj1KsfFJ9uq+exH4SETjo4LiGiM8YR5dmpCqU3T1ycQI8iFvec
 S5J2IcmSwc8k+3X5cwjaUF0DFp/eFh6E8MQGiJ7EmgA1D2yL+FR2Lf8XyVnYvLyg5BsR2bY4NM
 YNlmsdLlc9VwEx3p5kdAhsKHJpDZ+1L6c93Nb6Bu5c8U1qcHAMEQdmde2rPR/AqfQCthJdlfhv
 ZAwUVdKsC5RBFrWvUBPt/92ZZeNkDo0CNL9gcYIJ8iagISggInYZLy5PJ3GfgBhO//vMoYloYN
 l5s=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:13:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 02/42] docs/system/generic-loader.rst: Fix style
Date: Tue,  4 May 2021 08:12:47 +1000
Message-Id: <20210503221327.3068768-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Axel Heider <axelheider@gmx.de>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Axel Heider <axelheider@gmx.de>

Fix style to have a proper description of the parameter 'force-raw'.

Signed-off-by: Axel Heider <axelheider@gmx.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: a7e50a64-1c7c-2d41-96d3-d8a417a659ac@gmx.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/generic-loader.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
index 6bf8a4eb48..531ddbc8e3 100644
--- a/docs/system/generic-loader.rst
+++ b/docs/system/generic-loader.rst
@@ -92,9 +92,12 @@ shown below:
   specified in the executable format header. This option should only
   be used for the boot image. This will also cause the image to be
   written to the specified CPU's address space. If not specified, the
-  default is CPU 0. <force-raw> - Setting force-raw=on forces the file
-  to be treated as a raw image. This can be used to load supported
-  executable formats as if they were raw.
+  default is CPU 0.
+
+``<force-raw>``
+  Setting 'force-raw=on' forces the file to be treated as a raw image.
+  This can be used to load supported executable formats as if they
+  were raw.
 
 All values are parsed using the standard QemuOpts parsing. This allows the user
 to specify any values in any format supported. By default the values
-- 
2.31.1


