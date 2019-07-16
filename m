Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69D6B0CD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 23:14:00 +0200 (CEST)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnUlr-0005DZ-Kw
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 17:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnUlf-0004ox-Mi
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 17:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnUle-0001xE-Mw
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 17:13:47 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41298)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hnUle-0001wk-Eq
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 17:13:46 -0400
Received: by mail-wr1-x444.google.com with SMTP id c2so19249002wrm.8
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkxi8Qd5rS56qj0N0BZ0qFaVJHaEIlyRCtaZ+TYN9oE=;
 b=RLDzNhPvz2kpKtVLtg0neJMkIMGhAuB9G5stvDxFKbUhy+3vVCG1cYeQZxp9q454DY
 W2g9ltzvKgBSX/lgqAK1LeLda3upbZ+KvhaItFVt8c69d4l7U7/RncYuR92ilpSkRi49
 eKS3YtjaW9ANc8PL5uS094ipJjJk0GtxYLjNSmBVm+Ywi74FoH4AQRlB2ijdktzq5BTu
 a2a68hOpszzWwMR6epJe+YhoZKnrSeeENL86dEIQ2G67Gcj5oNi2N9DC2VsK2Aiawhiv
 RXOPKSCQb4XWYE6gKCxocs1N9Hv6EeLe6MyhDcM16euMujUBRpPYXOJhmc+BZl1uEFIu
 ZfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jkxi8Qd5rS56qj0N0BZ0qFaVJHaEIlyRCtaZ+TYN9oE=;
 b=Uz4ndg7/JP1UXD1dGQuSpBspnLEAF0CY3CpXPTnsnUQTfPwQyZPgglKBlPwqrgCEYV
 kt72SyMejxHKjmFVrcMPbv8xSM0reHbR/Ga4pIAxpnHf7vSeja5JV1+objqBunILinoX
 Scn6xdREgUkx4ucnIa+hhPC1gQ9NShdvf8jMln9LyBEi1hjYpR4ngOa7I31YAVURaDsI
 +pZbF8S3pDRM8TOLo88vBo2GJyTMzl40VqC46g/bojcpwChR34CsuvaZS6nvrEtZC50h
 uDXD+TsG8QX8+me7jR/0cbWdniljaOi8mXVFM+Ri0LlMoYu+FrDCKt8uUzyWrb/oITEE
 WuEg==
X-Gm-Message-State: APjAAAXfjUzCjC6aDMfWJF60dwUlRWY0nd1o8XwOexIGu+rF4TE5EAsx
 xGgU6mSmEiEt1sTxI8siGJMWkv6TXRI=
X-Google-Smtp-Source: APXvYqzvYuvHeHap3VohMrArxAHa3FlrDyLcgpoISEUTkfMy2Z3F6tGNhKZao6DlLuaRBpkJ3i36VA==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr8163156wru.297.1563311624963; 
 Tue, 16 Jul 2019 14:13:44 -0700 (PDT)
Received: from donizetti.lan ([2001:b07:6468:f312:b159:8d52:3041:ae0d])
 by smtp.gmail.com with ESMTPSA id b15sm35622970wrt.77.2019.07.16.14.13.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 14:13:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 23:13:43 +0200
Message-Id: <20190716211343.10792-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH] kconfig: do not select VMMOUSE
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
Cc: Julio Montes <julio.montes@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just make it a default device, so that it is automatically removed if VMPORT
is not included in the binary (as is the case with --with-default-devices).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index b9c96ac361..83a5d9c7c4 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -59,7 +59,6 @@ config I440FX
     select IDE_PIIX
     select DIMM
     select SMBIOS
-    select VMMOUSE
     select FW_CFG_DMA
 
 config ISAPC
@@ -85,7 +84,6 @@ config Q35
     select AHCI_ICH9
     select DIMM
     select SMBIOS
-    select VMMOUSE
     select FW_CFG_DMA
 
 config VTD
@@ -99,4 +97,5 @@ config VMPORT
 
 config VMMOUSE
     bool
+    default y
     depends on VMPORT
-- 
2.21.0


