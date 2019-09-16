Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5008B3D0D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:01:55 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9sVm-0007yS-5n
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCl-0006GR-UG
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCk-0007PG-D0
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53569)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i9sCk-0007Oi-5e
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id i16so66444wmd.3
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BH5zjCOPtAcwRwF/m1vkOuO1t45pMW2sTYdJyy0lbOE=;
 b=UqqP7Y2KphmLVWZ68/JQagmEJxYPp8k5fZQG1sZzXLc9Clnq+orm67ReBhXlq8Ikg/
 Kwn/hXUNMtkLXoq6dUtCCIFsAN/jbJ7g0FO8laCR8QAhDotkgOKsIvEd2JJY6yp6YYr3
 pq1mGCln9rdlv+ewZ78ZrmAQJ7P7KXptOzyRgYsj6rOTNBeOL0+qcVWgNlmt1PikO2qE
 zyjmEm72KhMHWxDFRMIVVDOskQ7lZx9xqyVHlTTQQSTonhDCOx+SDhbK7UJVKBjjIVY8
 oiHS+Is0pGPVs65QL1IkEn+ZuIo8bHEGqQRRgKDz0vJDJJ6TDJSppJG4tkeOKdZ6pyZf
 T3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=BH5zjCOPtAcwRwF/m1vkOuO1t45pMW2sTYdJyy0lbOE=;
 b=HD4AnwbdN2sBV35aQlIiImm3bCxa77M/Rtm2tZ/2bNgisyyT+RBUYcFCJ6GHbw55pc
 kLi0LjYTSRSWCoj+0/WlJs4MwrP6600ACMqqPMo6QgDWHUFQs/tVvXI9OwXejj6gQPMI
 OLa2uVHBSwAVqkhfNNw66Z2fuv4V8gS9z+32mWd6fhu8FyVzQybOvouA1xR9a/ymktOE
 9vhzbUxKce/AHJR4fRdlmIGw/ovkeCntwRv7XJg7pdGDzqWE6ntazUJbNxviLFtdRqKN
 Ii7Q/T1/fvgMAq47OUS7l68sO6m83XRAzedgyPTFzJELEMkOZfu2igYbYsaQtbI6kSkl
 0P/g==
X-Gm-Message-State: APjAAAX1zFcd13MHZyBKj3fQ59aKVTKpOnHuZ1uelHyp6qSCYzkChGEg
 CgjLb5AwPIXru3cSByuM615bASg/
X-Google-Smtp-Source: APXvYqxTKQNw+1a8VwcnTWccU78ZRFUAOeaoYc/8Lo45cafMBndCJz0P3IC6hbpemJty8cakzb53vg==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr50394wmi.156.1568644932764;
 Mon, 16 Sep 2019 07:42:12 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i14sm17024298wra.78.2019.09.16.07.42.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 07:42:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 16:41:42 +0200
Message-Id: <1568644929-9124-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
References: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: [Qemu-devel] [PULL 02/29] exec.c: replace hwaddr with uint64_t for
 better understanding
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

Function phys_page_set() and phys_page_set_level() 's argument *nb*
stands for number of pages to set instead of hardware address.

This would be more proper to use uint64_t instead of hwaddr for its
type.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190321082555.21118-2-richardw.yang@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 235d6bc..8e0c400 100644
--- a/exec.c
+++ b/exec.c
@@ -255,7 +255,7 @@ static uint32_t phys_map_node_alloc(PhysPageMap *map, bool leaf)
 }
 
 static void phys_page_set_level(PhysPageMap *map, PhysPageEntry *lp,
-                                hwaddr *index, hwaddr *nb, uint16_t leaf,
+                                hwaddr *index, uint64_t *nb, uint16_t leaf,
                                 int level)
 {
     PhysPageEntry *p;
@@ -281,7 +281,7 @@ static void phys_page_set_level(PhysPageMap *map, PhysPageEntry *lp,
 }
 
 static void phys_page_set(AddressSpaceDispatch *d,
-                          hwaddr index, hwaddr nb,
+                          hwaddr index, uint64_t nb,
                           uint16_t leaf)
 {
     /* Wildly overreserve - it doesn't matter much. */
-- 
1.8.3.1



