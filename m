Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102DF340B94
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:19:16 +0100 (CET)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwIk-00087A-QI
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lMvn5-0007Hn-7e
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:46:31 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lMvn2-0006LX-BV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:46:30 -0400
Received: by mail-lj1-x22e.google.com with SMTP id f16so8380710ljm.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YUfg/y9mXG64pSar2o79ek4IJA66DmiZUFokjUnZc9Y=;
 b=M6v+Tw58iiKJJDEt3WIfU0f/O7h+oVFVz2rKS43htjmIhkowhRsdnyhnLAawN6E18N
 aemngK727afLfQPyvNoEoe2K/D/NFXHvBm5qvm+RL8v1ZzU0B75bSjvNRWArbsxPMaDv
 yy+8DtperJLx8CXlD8dRg8oe7W4XcmBzBJ9qIQXIUVkHinprRtfkOZsdzGF3iyE1AK6t
 I+6JLtx08BbmCoacH8Slip/2SlviDRZN8bTE3ePlEq4Mbd/vmvN57iux8+12yDTJA1ZJ
 665qh7T7SrYP6FDovgK5aMuscXF9qzWM5q8KDf5PmQc9UDgCiMrGlyHG4vxAgTaDo1ei
 Hihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YUfg/y9mXG64pSar2o79ek4IJA66DmiZUFokjUnZc9Y=;
 b=Z8vsQgS3VjTGoduCB0rizU2UbdniACK3WurczchBRy0+weolNGVkb+9ZxnC4jiwZLb
 RrsK6NYW2F1uoopw4nBWN6tWdWXt+rKR9u+/KpPiVrcVH18Nt+V1y5z1AeSoe4uMajyV
 MbfkZtfxLbu+NwPA2/fMLp0iYV0kw23YjD+uXEzOVfIEhNgfeLOWm2YlXnDbF/XONec0
 T5qQlALapNpp5CAxez+2HNan4RZTI86vABot/Q4mrM6Ag4euHQly/6xlXJdDr0Ch2O61
 tMpsKPP7pVn2fwzYLiifBeRgCI0NuCK0p/RrkId2ry8bg1tTfs9B1rgciYvwJb9yPpSn
 zgBQ==
X-Gm-Message-State: AOAM5326bh7JTCnsjBZDe/4LWigAsPGoonT4ApdQvdGcvxieeUtMR3/K
 i6EpVrHR5rbZuMFLxcFsgRQy9881AKBfUQ==
X-Google-Smtp-Source: ABdhPJzS5aN5AIJYGEqiPwWH0W90LHod5YVntIE6bDXDuGb8a6ZG/Jz6pd06CgGRVcl+SVicqymWsw==
X-Received: by 2002:a2e:b4b4:: with SMTP id q20mr5802369ljm.45.1616085984960; 
 Thu, 18 Mar 2021 09:46:24 -0700 (PDT)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id h11sm281885lfc.191.2021.03.18.09.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 09:46:24 -0700 (PDT)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gdb-xml/avr-cpu.xml: fix pc and sp dimension
Date: Thu, 18 Mar 2021 19:46:01 +0300
Message-Id: <20210318164601.20926-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: S.E.Harris@kent.ac.uk, f4bug@amsat.org, NDNF <arkaisp2021@gmail.com>,
 Arkasha <ivanovrkasha@gmail.com>, mrolnik@gmail.com, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: NDNF <arkaisp2021@gmail.com>

fix pc and sp dimension in xml for avr-gdb

Signed-off-by: Arkasha <ivanovrkasha@gmail.com>
---
 gdb-xml/avr-cpu.xml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdb-xml/avr-cpu.xml b/gdb-xml/avr-cpu.xml
index c4747f5b40..89458b717f 100644
--- a/gdb-xml/avr-cpu.xml
+++ b/gdb-xml/avr-cpu.xml
@@ -10,7 +10,7 @@
      register descriptions.  -->
 
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.riscv.cpu">
+<feature name="org.gnu.gdb.avr.cpu">
   <reg name="r0" bitsize="8" type="int" regnum="0"/>
   <reg name="r1" bitsize="8" type="int"/>
   <reg name="r2" bitsize="8" type="int"/>
@@ -44,6 +44,6 @@
   <reg name="r30" bitsize="8" type="int"/>
   <reg name="r31" bitsize="8" type="int"/>
   <reg name="sreg" bitsize="8" type="int"/>
-  <reg name="sp" bitsize="8" type="int"/>
-  <reg name="pc" bitsize="8" type="int"/>
+  <reg name="sp" bitsize="16" type="data_ptr"/>
+  <reg name="pc" bitsize="22" type="code_ptr"/>
 </feature>
-- 
2.17.1


