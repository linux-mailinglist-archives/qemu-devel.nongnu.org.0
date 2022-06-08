Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9C54329B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:32:01 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywj1-0005YB-9u
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1nywBb-0007GN-J1
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:57:31 -0400
Received: from mail.bwidawsk.net ([107.170.211.233]:60326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1nywBZ-00053M-EQ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:57:26 -0400
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 1906C123290; Wed,  8 Jun 2022 06:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bwidawsk.net;
 s=zangief; t=1654696643;
 bh=aDQLqr0vrF2R3oiCtdY65kALwj6c7m7w71NWjftZyUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ff7drHpjKalNaiJqn6+QIoPEoxKsebqz9qV5j3Dxsu78R5XnxBXhQHEnTjOa6DqeH
 hNDzzPOaGjFGp5QHuHFXePpi0L5+uWkgmmLdgC42Kd73qJtccCnzutGfcOuZNRn7Hx
 mrpSzniJhskUWVpqcc17qNdYVfE6iEiCbHPSG3mo=
X-Spam-ASN: 
Received: from saberhagen.. (c-73-25-157-11.hsd1.or.comcast.net [73.25.157.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id CC8C912322C;
 Wed,  8 Jun 2022 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bwidawsk.net;
 s=zangief; t=1654696637;
 bh=aDQLqr0vrF2R3oiCtdY65kALwj6c7m7w71NWjftZyUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=snIDwyCUtU6Cq7qOpJTteK8tNPeSY/XoXz/QK5+hkd0I7FzS+xcA8qc0M7ao5ugpo
 l8vH7aIcPqNCjcPlfqCTzbfDEFR6VI46suTf+il6AE31Pbu4XpeKz6fR143ayxJZvw
 oMcfLkS9509z9iSre9Qoeh61zT151dGGAQBD15jw=
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Ben Widawsky <ben@bwidawsk.net>
Subject: [PATCH v2] MAINTAINERS: change Ben Widawsky's email address
Date: Wed,  8 Jun 2022 06:57:06 -0700
Message-Id: <20220608135706.503956-1-ben@bwidawsk.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607162628.372400-1-ben@bwidawsk.net>
References: <20220607162628.372400-1-ben@bwidawsk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Ben Widawsky <ben@bwidawsk.net>
From:  Ben Widawsky via <qemu-devel@nongnu.org>

ben.widawsky@intel.com will stop working on 2022-06-20, change it to my
personal email address.

Update .mailmap to handle previously authored commits.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ben Widawsky <ben@bwidawsk.net>

---
v2:
  Fix typo in commit message
  change author to ben@bwidawsk.net from @intel.com
  Swap mailmap direction (Jonathan)
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 8c326709cfab..e92e268b9230 100644
--- a/.mailmap
+++ b/.mailmap
@@ -54,6 +54,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
+Ben Widawsky <ben@bwidawsk.net> <ben.widawsky@intel.com>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 5580a36b68e1..89da5755116b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2574,7 +2574,7 @@ F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
 
 Compute Express Link
-M: Ben Widawsky <ben.widawsky@intel.com>
+M: Ben Widawsky <ben@bwidawsk.net>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
 S: Supported
 F: hw/cxl/

base-commit: 9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5
-- 
2.36.1


