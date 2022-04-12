Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773064FDDE6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 13:43:30 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neEvh-0004Vi-6D
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 07:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neEqx-00034Z-9j
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neEqt-00035h-JL
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649763510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gc1mzdkZsq3HzQEd8C3kVAd70WJNr1x6mPofhyxy8+Q=;
 b=J0sq/Np1ZRiFEWwj9NJttAjmwXjwtpU3LJVBTj67RsSX1L7Sbzx4vqAX7WfO04Vjw6Ki2H
 lMFM5fXI3Q7/IV82FMwSiU99sv3b1pGK7gwhOyMQCvC5jttZeNGhv+W+rl6O18V54KUmMQ
 hZfH8cypkSAYmQ+AdHjPLdXNbOFm9JM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-lz-HTiozPJqzbQLHF_HBOg-1; Tue, 12 Apr 2022 07:38:27 -0400
X-MC-Unique: lz-HTiozPJqzbQLHF_HBOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C84373820F61;
 Tue, 12 Apr 2022 11:38:26 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19EFB2024CCF;
 Tue, 12 Apr 2022 11:38:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH for-7.1] target/mips: Remove stale TODO file
Date: Tue, 12 Apr 2022 13:38:24 +0200
Message-Id: <20220412113824.297108-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last change to this file has been done in 2012, so it
seems like this is not really used anymore, and the content
is likely very out of date now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/mips/TODO | 51 ------------------------------------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 target/mips/TODO

diff --git a/target/mips/TODO b/target/mips/TODO
deleted file mode 100644
index 1d782d8027..0000000000
--- a/target/mips/TODO
+++ /dev/null
@@ -1,51 +0,0 @@
-Unsolved issues/bugs in the mips/mipsel backend
------------------------------------------------
-
-General
--------
-- Unimplemented ASEs:
-  - MDMX
-  - SmartMIPS
-  - microMIPS DSP r1 & r2 encodings
-- MT ASE only partially implemented and not functional
-- Shadow register support only partially implemented,
-  lacks set switching on interrupt/exception.
-- 34K ITC not implemented.
-- A general lack of documentation, especially for technical internals.
-  Existing documentation is x86-centric.
-- Reverse endianness bit not implemented
-- The TLB emulation is very inefficient:
-  QEMU's softmmu implements a x86-style MMU, with separate entries
-  for read/write/execute, a TLB index which is just a modulo of the
-  virtual address, and a set of TLBs for each user/kernel/supervisor
-  MMU mode.
-  MIPS has a single entry for read/write/execute and only one MMU mode.
-  But it is fully associative with randomized entry indices, and uses
-  up to 256 ASID tags as additional matching criterion (which roughly
-  equates to 256 MMU modes). It also has a global flag which causes
-  entries to match regardless of ASID.
-  To cope with these differences, QEMU currently flushes the TLB at
-  each ASID change. Using the MMU modes to implement ASIDs hinges on
-  implementing the global bit efficiently.
-- save/restore of the CPU state is not implemented (see machine.c).
-
-MIPS64
-------
-- Userland emulation (both n32 and n64) not functional.
-
-"Generic" 4Kc system emulation
-------------------------------
-- Doesn't correspond to any real hardware. Should be removed some day,
-  U-Boot is the last remaining user.
-
-PICA 61 system emulation
-------------------------
-- No framebuffer support yet.
-
-MALTA system emulation
-----------------------
-- We fake firmware support instead of doing the real thing
-- Real firmware (YAMON) falls over when trying to init RAM, presumably
-  due to lacking system controller emulation.
-- Bonito system controller not implemented
-- MSC1 system controller not implemented
-- 
2.27.0


