Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC4B637D6C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 17:00:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEdA-0002WF-9R; Thu, 24 Nov 2022 10:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd3-0002NP-Kw; Thu, 24 Nov 2022 10:59:09 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd1-0005IO-5I; Thu, 24 Nov 2022 10:59:09 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E32BE411FD;
 Thu, 24 Nov 2022 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1669305540; x=1671119941; bh=JrTtmOCQPXqPEEEM7T5Cp9/Ai
 O+hRlHM74J3LFX39dc=; b=HH+Rchl+xQjv02KaWIOz8oNeHEJ8dABqzgZ4hp4TA
 p5W/7vcfKlpA3WPcllxw7JtAkCte6JCVeYMf/uLKMb1twOJD2rohLPi3Yk9lz920
 5gKSsBDlctMYDYpIYnudaNo5nwB1kzBt0bqukFUflkhlEdTi/2bzEY0MzTo51FtX
 qw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9YzQfdMY05j; Thu, 24 Nov 2022 18:59:00 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5E4D940311;
 Thu, 24 Nov 2022 18:59:00 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 24 Nov 2022 18:59:00 +0300
Received: from archlinux.yadro.com (10.178.113.54) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 24 Nov
 2022 18:58:59 +0300
From: Dmitry Tihov <d.tihov@yadro.com>
To: <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, <kbusch@kernel.org>, <its@irrelevant.dk>,
 <linux@yadro.com>, <m.malygin@yadro.com>, <a.buev@yadro.com>,
 <ddtikhov@gmail.com>
Subject: [RFC 1/5] docs/nvme: add new feature summary
Date: Thu, 24 Nov 2022 18:58:17 +0300
Message-ID: <20221124155821.1501969-2-d.tihov@yadro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124155821.1501969-1-d.tihov@yadro.com>
References: <20221124155821.1501969-1-d.tihov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Describe use of new protection info block-level passthrough nvme feature.

Signed-off-by: Dmitry Tihov <d.tihov@yadro.com>
---
 docs/system/devices/nvme.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index 30f841ef62..7375379810 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -240,6 +240,21 @@ The virtual namespace device supports DIF- and DIX-based protection information
   metadata. Otherwise, the protection information is transferred as the last
   eight bytes.
 
+Virtual namespace device can also be backed by integrity capable host block
+device. This way protection information is passed through to/from the host block
+device from/to the guest and checked by the host block device itself instead of QEMU.
+
+``pip=BOOL`` (default: ``off``)
+  Set to ``on`` to allow host block device protection information passthrough.
+
+To use this feature nvme-ns backend drive must have Linux io_uring AIO backend
+and host page cache must be avoided. E.g. the following parameters should be used:
+
+.. code-block:: console
+
+   -drive file=/dev/nvme0n1,cache.direct=on,aio=io_uring,format=raw,if=none,id=dif_drive_0
+   -device nvme-ns,logical_block_size=4096,physical_block_size=4096,drive=dif_drive_0,pip=on
+
 Virtualization Enhancements and SR-IOV (Experimental Support)
 -------------------------------------------------------------
 
-- 
2.38.1


