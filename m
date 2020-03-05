Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74A17AA98
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:36:05 +0100 (CET)
Received: from localhost ([::1]:52483 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tTg-0001oH-5f
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tOv-0003H2-Q6
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tOu-00026p-PW
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55805)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tOu-00026R-IY
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 6so7070285wmi.5
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/PZhJSySPN1YW4Bj6r0qdRVaYj511W7grsZV1hLEBIE=;
 b=c5yfdy9Hwb5AtnhhTgkuSKk5+05krDu8XaXyJsB644JLCen1dFEiIk5npuby30/Ft0
 yNRYme8vZ3G+ggfvRSj9VFJoo5xQtPtnL/dDl/0indxnsowMjr9vzABKt7GDUtFtPvko
 ljMe/ffLWbzlvLHjEiLNZCfFfRTJz7K1BuUOQ2luhjpivOQH8okzllpXr664usxfFdPA
 GaPS8uZ3etgJIJOX+EosqN1AJzNQ7/r4XuYuz6aJltwNuOxnAryXu/L2k+tvEsKtE/b9
 wL82NM4Xrof4FZ5rClkTHdqG7wyPuILJs+LNkpB6+1ARCnf81AE34ChH2meOd0TcCNEE
 XwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PZhJSySPN1YW4Bj6r0qdRVaYj511W7grsZV1hLEBIE=;
 b=qx03airdiVNjNLI9fWvHLdsvd/be11QUDqcRh5pr507PnFgjPijIGkrSKWIUD0tTGk
 hx+t2sS0wpVboL66OYYYgM+lnV6MTFK/LTgp8LZM90WLNI9AFsNzYgt6aszNK9fO6feY
 ucdUjCwVWQ+y+srcppzDnA7X+nbS1GM9YO2X4s2XkKsD0x7MFY5UBRIPCgymb+85K4fi
 +XDlee8V6isjb9gQGfiUpWgLpbmHeYcmy/e4jEmQX2Wy8k4fdPIhhxHATcC1r5DkC/K5
 NZw0N3z0eInEXehCCc0dH4sq66ujHorSJ4XqX2rj4O6tqmsCB5L4n7MhUzLmPHYPPWp0
 YYrg==
X-Gm-Message-State: ANhLgQ2+JicYfwk+hEWZia4f1tsSv72wrNzvmKo3MgchsBCEjCRIT4bz
 MNDVm8Zb1jIQuQEP8UbDeP08h0wUWA1iVw==
X-Google-Smtp-Source: ADFU+vtotPycQnCrxMRb/qRFZU2vpMWrL0MbSBVTw7CPEwu+tScAxptxdXVFX1Vt6yaUvFzm0eulHQ==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr10157468wmk.19.1583425867159; 
 Thu, 05 Mar 2020 08:31:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w22sm10310729wmk.34.2020.03.05.08.31.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:31:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/37] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
Date: Thu,  5 Mar 2020 16:30:27 +0000
Message-Id: <20200305163100.22912-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
References: <20200305163100.22912-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
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

From: Eric Auger <eric.auger@redhat.com>

Make sure a null SMMUPciBus is returned in case we were
not able to identify a pci bus matching the @bus_num.

This matches the fix done on intel iommu in commit:
a2e1cd41ccfe796529abfd1b6aeb1dd4393762a2

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20200226172628.17449-1-eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0f2573f0045..67d7b2d0fd9 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -301,6 +301,7 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
                 return smmu_pci_bus;
             }
         }
+        smmu_pci_bus = NULL;
     }
     return smmu_pci_bus;
 }
-- 
2.20.1


