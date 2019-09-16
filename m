Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD9B3DC3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:36:48 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9t3W-0000lf-Mo
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCq-0006Lr-9g
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCo-0007Qy-77
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i9sCn-0007QZ-RL
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id v17so67965wml.4
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+yIB4TtQhEbL/mvyJX2uAbbwQXERvRXJT6x1cyUEp28=;
 b=gGctzBmDa0dX/K+PN9zIT/2Cyfz2c9jVUZVsmnAzkqtqU96ioIRFWLTFWtaf/FY4kQ
 0WvygNVjnhczvv1DUdL6ZqTXRKQ+9P+MZBIXnRnSR/Jo7isP/DN4f636YPhzpe3L3QlL
 bEjSt9Uaguc5XxAkk43E5ynmqKhJp5dR5rax0p4M7o94AhOGwb0ra/61LR8+ibkRu+hT
 12D+ef7UJR4j+NpryoB7zstLsZoLvoJ16DBHEFiqbTAHaii2IfsFHT3vcoqjwY015Vrh
 DZbRU5VOPxi8HEgQqqpX5dyZHezY9Q0Fsj2Cp25Is9ce2nbgC9s0epEqwBAquLdREGUV
 MhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=+yIB4TtQhEbL/mvyJX2uAbbwQXERvRXJT6x1cyUEp28=;
 b=Cx4mPAXnTGxQDaN337jeLXdy+4QUMh1chX4G+irelX0ac9PrmGmAYo5q5ZeDIa50u6
 +KBmUTZ7dpCyoQjn+LQ1yZdIsV7U8DoNm20FYUYDicjBl1xAJNsu5lhL4FFjTgMYLJJT
 le4OMVs+h3IZBZTlTozMXQVDP04t0YhGcmgUDx/BrRhLaCaa9d0IGaohCnH/55LzVOhY
 Ba0c+jjSGyo8l4JuGMQw9+Ek/RXR5vaWB3BJpOUu+3ZQweua2WvOA8+VywTY55kndnJ/
 r8R/hkmKa06QzLAqJ4Az8btrjwgL3LllQn0VPluF519iBbizvNv0a3tYY5ZLl+NbWnFd
 2xlg==
X-Gm-Message-State: APjAAAX3Q4QfOi+OsFMyYIAcmxvenwAEp40++0tASP5H6Zil+j5Qe0tA
 9K2pFHgINWTakjbREvPzvA+84OvJ
X-Google-Smtp-Source: APXvYqyDz/3AbEWbzAvt5nwmmzrcx1dfFYP7ZrtH4DDSQOfQc+zLzwiIyxktchUcllZc4PKbOiwxWw==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr64703wmk.84.1568644936605; 
 Mon, 16 Sep 2019 07:42:16 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i14sm17024298wra.78.2019.09.16.07.42.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 07:42:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 16:41:46 +0200
Message-Id: <1568644929-9124-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
References: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
Subject: [Qemu-devel] [PULL 06/29] exec.c: add a check between constants to
 see whether we could skip
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
Cc: Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

The maximum level is defined as P_L2_LEVELS and skip is defined with 6
bits, which means if P_L2_LEVELS < (1 << 6), skip never exceeds the
boundary.

Since this check is between two constants, which leverages compiler
to optimize the code based on different configuration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190321082555.21118-7-richardw.yang@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index d1969bb..b9511be 100644
--- a/exec.c
+++ b/exec.c
@@ -324,7 +324,8 @@ static void phys_page_compact(PhysPageEntry *lp, Node *nodes)
     assert(valid_ptr < P_L2_SIZE);
 
     /* Don't compress if it won't fit in the # of bits we have. */
-    if (lp->skip + p[valid_ptr].skip >= (1 << 6)) {
+    if (P_L2_LEVELS >= (1 << 6) &&
+        lp->skip + p[valid_ptr].skip >= (1 << 6)) {
         return;
     }
 
-- 
1.8.3.1



