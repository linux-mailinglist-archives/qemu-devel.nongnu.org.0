Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE0E1246BB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:23:47 +0100 (CET)
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYMk-0008AF-80
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY37-0006Hh-Cm
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY35-0000UR-Sw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50299)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY35-0000Sy-5P
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id a5so1562352wmb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=HDTYKQfotEZNCNNOb0BXo5V66sef5b68rxGZly+OEbw=;
 b=GTqPHkJec84E7vCDNGzQVNMF52SwmR09e55dkb8HGQySz7taDeejFxYqjDePGvkFSU
 q8HEsQECqwgUuwR98ECP7BJnAhrPSDE+CI7wzKfqxX2dcmX8Efp3i6svX1Dz2UJkWIhs
 3FmH21WiWx710nYnVGDYUWMfFvYYrkJu4DB9yxcL/pN3KhCnzx1veA1fvJCNGMvC8Fr5
 L6XYRRm+Osj4R4C812kXg6OHZvCbp07RyKYdk92SWu1xM+JCmHBQqRcXdnZ95CYjls6n
 xeo15HZEk9TcZp4i5gzuKbdsQ4uzd0WLVc5E9QbxW110NMnf+Ho5oELFrQ0TgjupIn/e
 f2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=HDTYKQfotEZNCNNOb0BXo5V66sef5b68rxGZly+OEbw=;
 b=Oi4fOUZodflGRbC9hKMl8Icx91eJnWCaCufXZpG5oninxkllOXV7s67tdB4QgNMmXC
 qgr2/yXs9OFOXG6/A1CN0yF6BWkk+dSfOiraQXUHE0p+j42huianXp25WcVEEYMIlv4B
 8jaqQuYQKQwEANdf0z8uD5m0ojLFoSeXBwdmJNe2ckp6345xPdLSkxuXcQVElqG32WQT
 fiNxzUeetnfceqH/LgJpRH3ReZtF5yN1fBdgQuqV2OmxNOi8cqs28+/LUiBHovqoRohq
 UjvkZajwkZ+4dKJjiT0xIoKVMUWT/Z1R5R5FpBRAUIAo30bnKEfafZS4kiHZ9ao3zOtB
 Tg3Q==
X-Gm-Message-State: APjAAAWC2uZ9kqBdFy+RyshHWqk+cJFQnI+lXT57xpBJHng8Ua6oegl3
 U8nJ/WQ9v9qqwxbwT/BntPtpDOKY
X-Google-Smtp-Source: APXvYqzUa9LgNBI63zogv8pVSln3x50q2gr4LpOH7RcvXTZ9rCVdRO+Gel2dZzvvzr1/66TI24M58g==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr2951165wmc.111.1576670605225; 
 Wed, 18 Dec 2019 04:03:25 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/87] Makefile: remove unused variables
Date: Wed, 18 Dec 2019 13:01:56 +0100
Message-Id: <1576670573-48048-31-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
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

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 1361def..a2acef3 100644
--- a/Makefile
+++ b/Makefile
@@ -445,10 +445,6 @@ dummy := $(call unnest-vars,, \
                 io-obj-y \
                 common-obj-y \
                 common-obj-m \
-                ui-obj-y \
-                ui-obj-m \
-                audio-obj-y \
-                audio-obj-m \
                 trace-obj-y)
 
 include $(SRC_PATH)/tests/Makefile.include
-- 
1.8.3.1



