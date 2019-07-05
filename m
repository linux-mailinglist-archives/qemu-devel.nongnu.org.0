Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0B60BF0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 21:55:23 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjUIk-00029Y-8D
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 15:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUEJ-0005LB-IX
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 15:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUEI-00045S-Ig
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 15:50:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hjUEI-000443-9A
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 15:50:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id b2so9732155wrx.11
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 12:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uj5oH2lIOzQhbVvPGa1CJyfr5Ywg7honDl46Ua9isOg=;
 b=e5pxmWZ2x/jzmd+RME9rArhSd0/w0Vi9e31BTWwALanK87fWMVEx3M0etf5vu5TDXN
 O2e8DaKadtltS0hO/WIPNUIVNvG5iamw0kUMVgotOf7KAwJAIDFmGZuMiWEIdeiyY1Tv
 un4XOoZ+6d2WNBL23xHXL8LzFOC4Pgdb6kQRfqqfnkcssvmYdch1xW+RjOhuuOWqJru4
 rflbiofpPsnR0DRmT2R39evgVCvI5iJGOAj+0hRxcd4aohFzqmB2lFmf0j9QyuTMfxkR
 CkmquloIsvIn3CD7kDCRiTFUVHLQUsElGc0OGn++wjSUOHoHDHllwe+3jyn+Ht4LjFJS
 +MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=uj5oH2lIOzQhbVvPGa1CJyfr5Ywg7honDl46Ua9isOg=;
 b=f3qoEDJshqg01pPjqjO0L7RIHGu9Zpoujg7TqkLAO5MgNnahCPqV1Xd7T19VqoZAJn
 sPPfDlYSuoR57ckb/fZY1gG1ZGbcjyfRTbhza2kjcUoMu8cGaVio01tGTQ4AN3XqDhb+
 wfxUJUQj19F4A0fb9EzsanZ3xIsDRm7wec7Nbz65xXrro5Ftiy4gE3dVBWwjMWg0AQWI
 kbVgT0Ef3o5Bv71OzOGa/WeXvBJGFA+VY5ytWQ13WwR+YGOWJMT+BhEKVK3TNGUsGuvv
 RVPYHZu9AhsYcUBYouiZGy8+limT73Xz7cRVnFQqcVoA+f90Ecmb54H4ocyDZBxgwgkX
 GYZw==
X-Gm-Message-State: APjAAAUk/wDZA+w9ZI9HWrXULA4oAZyeS2vjwkx8dQBS6lvmvXppUcvl
 djKnlyFql8pn+nvjKBZGjpuEeOdl2ks=
X-Google-Smtp-Source: APXvYqzmfCXV3CdgQICaUQf5wpuYRSPAtWCNBwDigJy94AGzPVD1r/sRcH7YFC2hSvdSwMRNkD3kGw==
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr322476wrq.193.1562356244178;
 Fri, 05 Jul 2019 12:50:44 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d10sm11478625wro.18.2019.07.05.12.50.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 12:50:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 21:50:28 +0200
Message-Id: <1562356239-19391-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
References: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: [Qemu-devel] [PULL 01/12] pc: fix possible NULL pointer dereference
 in pc_machine_get_device_memory_region_size()
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

QEMU will crash when device-memory-region-size property is read if ms->device_memory
wasn't initialized yet.

Crash can be reproduced with:
 $QEMU -preconfig -qmp unix:qmp_socket,server,nowait &
 ./scripts/qmp/qom-get -s qmp_socket /machine.device-memory-region-size

Instead of crashing return 0 if ms->device_memory hasn't been initialized.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1560174635-22602-1-git-send-email-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e96360b..552f340 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2458,7 +2458,11 @@ pc_machine_get_device_memory_region_size(Object *obj, Visitor *v,
                                          Error **errp)
 {
     MachineState *ms = MACHINE(obj);
-    int64_t value = memory_region_size(&ms->device_memory->mr);
+    int64_t value = 0;
+
+    if (ms->device_memory) {
+        value = memory_region_size(&ms->device_memory->mr);
+    }
 
     visit_type_int(v, name, &value, errp);
 }
-- 
1.8.3.1



