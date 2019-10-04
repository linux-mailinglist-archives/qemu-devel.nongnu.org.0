Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E883CC167
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 19:10:47 +0200 (CEST)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGR6M-0005y9-Jw
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 13:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iGQvY-0007PP-2T
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 12:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iGQvX-0001wB-3G
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 12:59:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51111)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iGQvW-0001vs-So
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 12:59:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id 5so6578955wmg.0
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2019 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=3dvmDFlr0gurTBYD4r1hBqQhpgoTuiAsAyqm2OCYvPs=;
 b=pNd/ckuwt/fsXG0r4Tb8IXqykU8b9Rn+ohBteAU3bBCyY8J2nLNylFf5eC6mO7B2QR
 RLgJjBpYVfK14AgjJiuTSwhZfErAPOSDMIH5/e7vtAhtYuRBvF+daG83coo4qP47wTwI
 r745r0iBr18KUyrgW0f1dsgNQLD+uTiPB3HYXepYQatZIwzC+HsmpbP8o8zkHRGlOvdR
 rATu2ssZXIDoPZoyEOTFAWx/up67MLpI6QH5fdRNodFabEwzWYsGOQVjZReNvKGNc8RR
 4hHiXWBnNQdmp0wpACIV8CUz0iwIC37FSkT7rePH1X2pwqj/mDct2434PcQe2hQR/XW6
 XavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=3dvmDFlr0gurTBYD4r1hBqQhpgoTuiAsAyqm2OCYvPs=;
 b=DSpogP/jsA/aQQl9BGcXXz52RKVnqOmG2pN483XYsn7CJLCa7sCpp8nshjCJ1Gsdj3
 xGxntfuks2K4B19B++58Mr3Y9oKpPHLRMnA5ivQWyePg8hPM2qv3HMFYVp9wCX+s83oJ
 hUFhG0nl9u9DDFU2HPtqkC1NkxDQ+10GghpT0SR0YUu593vzZaLCXuviD22bRJH+PwzQ
 u5EIY8F693scpBhZ+IHoBxCUtFkbpQ78Lhda7S7NyiGbg8nD99uY6LGzur6MsZeaW7H2
 D9ixX37fCbK2Gpm+sk/vFzs7OPHrjBMRWJsqAeb3/ygLAOozjPtg52562EvDTbWEP68b
 c52Q==
X-Gm-Message-State: APjAAAXnGVNMJ6o9ck+S9TMfUZh/rU0hehM0ItqgX+85f6/3JcnECKGV
 NikeAsuIcfP0bb3ZuHPx4cJ6Ywv7
X-Google-Smtp-Source: APXvYqy2iPl3gNKa4SIHNeXIFtGNa9GU5d4YLqFqr/zFEW7baWFjqmg2uH0j7PG9MQPFRG2ETBwzRw==
X-Received: by 2002:a1c:29c4:: with SMTP id p187mr12355421wmp.28.1570208373446; 
 Fri, 04 Oct 2019 09:59:33 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id u7sm7041270wrp.19.2019.10.04.09.59.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Oct 2019 09:59:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/29] vmxcap: correct the name of the variables
Date: Fri,  4 Oct 2019 18:59:20 +0200
Message-Id: <1570208363-11948-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1570208363-11948-1-git-send-email-pbonzini@redhat.com>
References: <1570208363-11948-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The low bits are 1 if the control must be one, the high bits
are 1 if the control can be one.  Correct the variable names
as they are very confusing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kvm/vmxcap | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index d8c7d6d..5dfeb2e 100755
--- a/scripts/kvm/vmxcap
+++ b/scripts/kvm/vmxcap
@@ -51,15 +51,15 @@ class Control(object):
         return (val & 0xffffffff, val >> 32)
     def show(self):
         print(self.name)
-        mbz, mb1 = self.read2(self.cap_msr)
-        tmbz, tmb1 = 0, 0
+        mb1, cb1 = self.read2(self.cap_msr)
+        tmb1, tcb1 = 0, 0
         if self.true_cap_msr:
-            tmbz, tmb1 = self.read2(self.true_cap_msr)
+            tmb1, tcb1 = self.read2(self.true_cap_msr)
         for bit in sorted(self.bits.keys()):
-            zero = not (mbz & (1 << bit))
-            one = mb1 & (1 << bit)
-            true_zero = not (tmbz & (1 << bit))
-            true_one = tmb1 & (1 << bit)
+            zero = not (mb1 & (1 << bit))
+            one = cb1 & (1 << bit)
+            true_zero = not (tmb1 & (1 << bit))
+            true_one = tcb1 & (1 << bit)
             s= '?'
             if (self.true_cap_msr and true_zero and true_one
                 and one and not zero):
-- 
1.8.3.1



