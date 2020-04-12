Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4241A60A4
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Apr 2020 23:11:38 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNjtA-0001R9-Qx
	for lists+qemu-devel@lfdr.de; Sun, 12 Apr 2020 17:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrh-0008Ag-Cd
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrg-00055b-GS
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:10:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39877)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrg-00055B-AO; Sun, 12 Apr 2020 17:10:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id p10so8395402wrt.6;
 Sun, 12 Apr 2020 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWubfF2iDWfZ1hbsO/IXecVFoz0dDRJS/Xj5DAW2JNo=;
 b=TKsyfLjrtirKrDYfamB6nSrrR1fPhrULfxHjh5dsXKznOBbWceZZrZQvEgoeZxVwzh
 lyJwOD9688ualAfVSJptSzKTDdFxJmthHKBJK+Zzg977Bw1z5adwWSDk7qwbN0r+btX/
 VgcDBQWB1idyVqirNa1KnHS0CTnRxSpja5/oIGNROIK0uS38xV2hbPpj/ESifO26aecS
 t++f3fH9j6yhpg5IpeK0CdEbMOlUMsAvicHE/sEEZptPqxP5EE1D4KJgdxQse8zEOmnv
 WuYFZdR7TlOo5Wtd9u6MzWOwp5xvBCfBKt/2HASpFTnxjpmuCx3jFscSZH0JywZchrBM
 nEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eWubfF2iDWfZ1hbsO/IXecVFoz0dDRJS/Xj5DAW2JNo=;
 b=rG/tUU2KEKvJMOPs4HUnQpDPrRgqGYEp/v27IVaQW/vMd96gpLPnXOypNsI95uYb72
 d1K8PTEqLVRroIOtXr5qxTtghdEJD3Rszb94C2XRGUq5Ue9WujIPJwxH4reLD8UyLq5o
 W3aKXRQfLZ6P/LqU88vqGraCkHoBSxn9cPKFh7K2HvWc1sAlUhtna853yKTBZ7gqDV1C
 jSHo2Vlf/AXtHm0sCc2RgwM+zL29nisw29IKqm73/wCCIOLiEExWYV/ZR9Z0ybZtsbgr
 UOoihkomLruaSgJB5TDFqx6UAdaBmeuFZp8hagJAc2F6+Wc1NqakR7z7XBqZqJYRgh5o
 6aHA==
X-Gm-Message-State: AGi0PuaTdSljtQOpAsKjTf7yEV5yXorUk03JP4wMqrSd2n+ZJWukCqBt
 gWP4IOrFNiB096wqJ4+XivGgzUufK/k=
X-Google-Smtp-Source: APiQypIm1u1/S0kMjoDLIIDr4V7cLU5DYZtELtqiKjq5NrnqQBzkjtQPdfba4f3psDwbQLE84Uft9A==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr15464439wrj.165.1586725803042; 
 Sun, 12 Apr 2020 14:10:03 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o16sm12553602wrs.44.2020.04.12.14.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:10:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 1/3] target: Remove unnecessary CPU() cast
Date: Sun, 12 Apr 2020 23:09:52 +0200
Message-Id: <20200412210954.32313-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412210954.32313-1-f4bug@amsat.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPU() macro is defined as:

  #define CPU(obj) ((CPUState *)(obj))

Remove an unnecessary CPU() cast.

Patch created mechanically using spatch with this script:

  @@
  typedef CPUState;
  CPUState *s;
  @@
  -   CPU(s)
  +   s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 86c667b094..8972714775 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState *env, target_ulong BATu,
     if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
         /* Flushing 1024 4K pages is slower than a complete flush */
         LOG_BATS("Flush all BATs\n");
-        tlb_flush(CPU(cs));
+        tlb_flush(cs);
         LOG_BATS("Flush done\n");
         return;
     }
-- 
2.21.1


