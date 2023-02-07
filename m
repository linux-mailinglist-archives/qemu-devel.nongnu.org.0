Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6647E68D05E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:16:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI9Y-00018E-1a; Tue, 07 Feb 2023 02:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8n-0000ot-1K
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:46 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8l-0000FW-4S
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753903; x=1707289903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufYiZCJb17W83Uqjf2s08zY+Ir+33n8NAc2wUshJSmw=;
 b=LMmGRypERBbR2/57XEkG6YRmYDK1xbXjHBN5lz7omviS+mC6c1tLDg08
 U4bDw1qwthiMkmH628dxUeQM3FZ61N3Dth3zTbQUdNt6yBykTuC85BSBb
 RahuJPvMQdp0Gki+o3F01QDe3n0up/o//FeqJsbFXgRXsqKxFhFJ49dwz
 979PqfzIRBDRy0hwLiuTdg9uI9WH6xM2rcqRStmN/ns79ixNxatXWOnUE
 ntxm1IPKrmdRVYkjXt82XTuQRt/j8sbQWFNl8RW4QH9c3fpFo8DWUhQ3z
 iLWwsexifq1Z4dJtEaC67FuIZ4Hleb9bTokjZALH88sLqMV1t/jzysUIA g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657584"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:50 +0800
IronPort-SDR: Z4Q+h5TqYUTXX2knAD7FGBLVhUMU9z3GKSiiWMsFPgrCv4D2Am8GhyFk2xlfJhQqcBklaqZAIk
 wYY8A8WCfDkw/9D5dwsz0Wy2Ae6aRBB+ur1mFIYfvNAMYfE7yQPOFfihxXTFSWhksaZA5lruC5
 CAzXwGtb8nqs/ebOsETLPWhrvIcosYcVVeZf7nQK7zyolbfGvLNw1RWc4YqU0GwLO9TelPcw6N
 jFTXa7nrJ73Gp9Q6WzfMs322rmcjgb5trXAVKybdYnr6PVkD4v7EuMeaZMiqiasrVP6dGN9Isv
 v1w=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:28:07 -0800
IronPort-SDR: hDKFEq1eHrkb/qkzdkzJQUrS/lPP3wTsc00N8zXZlTfmCA/ZuJNmK0ngMIw8rP2BWcFeQZ9EMH
 QMuDCtu4/ZZlOTG3q07Y133ZxQQX9t2vJBaSoIAOgSj6WIA9KI0PeAd+jvWSf5lC5SgAHE89KP
 sF+WRUxDjYitJigqN8858ESwpG7ooOR1hvZF0pV0COnB5ERg08DvJzCQERuKrD4SPNB8sInh5/
 G88INkIba+FU+2XLEWadO60SGKOXudZXgpN8hauSobBV6EznQLP9PWyXdSG2xEAG06HnGdHXkM
 PPU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRZ35bHz1RvTp
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:50 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753850; x=1678345851; bh=ufYiZCJb17W83Uqjf2
 s08zY+Ir+33n8NAc2wUshJSmw=; b=XPeEwjzd8zOF6gVUVlO+DpPLtJYjybb7eL
 ZP12neEJMEVDG9wDKV6QWg9oe+3z5a1lUH69eKFrSEsWp07julFNRYt4N0IbRRTJ
 hw1ax8X5FFtf7ftGc2HFvzWQGH1qJRpnXAZNfspU8HY9u1Se1pfOHjjAgqSPpRbI
 /xTtYwFgdiE3sPfQbaZYBT3NVE61fjuFJonl3ioYWzfv+3iOIhxQwXDBPhdlfugW
 yP10S007kxZKNZUawp/7K3G/3DBuHB1YiP+F1SbKQgZPt9TzxiRLhwRpyvIXo2Pi
 mn2b+4YGAK6D4NsoHDCDrBtcACnSU81M8TeWk7v3TVgm1F3l4ZFA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pBzhSpkV45Gf for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:50 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRX4vdvz1RwtC;
 Mon,  6 Feb 2023 23:10:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Vladimir Isaev <vladimir.isaev@syntacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/32] target/riscv: fix SBI getchar handler for KVM
Date: Tue,  7 Feb 2023 17:09:42 +1000
Message-Id: <20230207070943.2558857-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Isaev <vladimir.isaev@syntacore.com>

Character must be returned via ret[0] field (copied to a0 by KVM).

Return value should be set to 0 to indicate successful processing.

Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230203135155.12449-1-vladimir.isaev@syntacore.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 30f21453d6..0f932a5b96 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -467,10 +467,11 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struc=
t kvm_run *run)
     case SBI_EXT_0_1_CONSOLE_GETCHAR:
         ret =3D qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
         if (ret =3D=3D sizeof(ch)) {
-            run->riscv_sbi.args[0] =3D ch;
+            run->riscv_sbi.ret[0] =3D ch;
         } else {
-            run->riscv_sbi.args[0] =3D -1;
+            run->riscv_sbi.ret[0] =3D -1;
         }
+        ret =3D 0;
         break;
     default:
         qemu_log_mask(LOG_UNIMP,
--=20
2.39.1


