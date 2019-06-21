Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434E4E7AA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:59:31 +0200 (CEST)
Received: from localhost ([::1]:60086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heICY-0007ZF-M0
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49084)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHke-0000l0-G5
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHka-0005jZ-Bc
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHkY-0005Yh-Au
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id g135so6000133wme.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bNCR6BSZrVAsd51s0wYru1/heSmPhGDxRbakfLjjL5g=;
 b=lqUPF8DEj0x9oC3vQD68TqYZaBfQvBn+2p+u8AaxKfUTtUKLrTmnVZfYuuoa9IabhF
 p7FJ/3T9MYNtCYDbOZVBrsl3vLoaLn1B0Nz8Dwp2KGgQkZ0sadmFxcJtQrBOUUWfcs9Z
 BQGDEMRQYGXyeestjR/l08ILDIapq+IMgSZ8mvHsdFqZvD77hLlnD0DpQnjANSjfOKjQ
 njNC+aep7B/N0j4UMavnAN9q8g949yRFQc1xw3gqm4L/aB+evbDWiu2xKB0FcGTQ/aPH
 WNG1jRv38aGlV6p8vn8TsIZZG+jhmZIl2z5j8/s7OR0FnUF79/gAwzWrJIDhqXDmXlaE
 QVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=bNCR6BSZrVAsd51s0wYru1/heSmPhGDxRbakfLjjL5g=;
 b=kGHRYuHlZ18vm3EVolB9w9Xew84lzGtlZeF3aSiOGmY0gUNpoFTsqkZ1AqsDYk2CoQ
 29KNH5actrCO5SK67WbbCD9CMCIdeIvZl+sqR/JStj2ualRnHx0JH+h1xpAaAuQe5xFd
 d7G8pvtsYl5hwJ7+8uS4Z70tb7FVN9NCh/pCBGt7YaNSOW/6slJt2o6WtrM1F+83bfpO
 xGXamxce2BCzGuMc1whsCbvkK4DltvPaDO0XNG3rdmCQ8qgvGp5JH/VQ8Tc3WtHHPpNb
 du16f888LNp9ONOjLAZRSgH1R1lQne/0DBtRzH25aOsEnfmMG4sg/djxiqmBGsU090ri
 nzUA==
X-Gm-Message-State: APjAAAUS79BOx6TwoCNJkHKvY0lpbDdH9i2IyzJC95hlj2PU/xxZFDYU
 6FVaquqMvI5A5MPNYTUaeQj1Ydyy
X-Google-Smtp-Source: APXvYqxA63/Ji+nLiab2a//vfVdX2782XThRYa9NQjZbtNzArvJDcYYfFqH2LWGJBCq3xKxwQvsllw==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr4027146wme.81.1561116631750; 
 Fri, 21 Jun 2019 04:30:31 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r3sm2712851wrr.61.2019.06.21.04.30.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:30:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:30:04 +0200
Message-Id: <1561116620-22245-10-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
Subject: [Qemu-devel] [PULL 09/25] i386/kvm: hv-tlbflush/ipi require
 hv-vpindex
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

The corresponding hypercalls require using VP indexes.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20190517141924.19024-8-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 58afa31..1dfa282 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -782,7 +782,8 @@ static struct {
             {.fw = FEAT_HV_RECOMM_EAX,
              .bits = HV_REMOTE_TLB_FLUSH_RECOMMENDED |
              HV_EX_PROCESSOR_MASKS_RECOMMENDED}
-        }
+        },
+        .dependencies = BIT(HYPERV_FEAT_VPINDEX)
     },
     [HYPERV_FEAT_EVMCS] = {
         .desc = "enlightened VMCS (hv-evmcs)",
@@ -797,7 +798,8 @@ static struct {
             {.fw = FEAT_HV_RECOMM_EAX,
              .bits = HV_CLUSTER_IPI_RECOMMENDED |
              HV_EX_PROCESSOR_MASKS_RECOMMENDED}
-        }
+        },
+        .dependencies = BIT(HYPERV_FEAT_VPINDEX)
     },
 };
 
-- 
1.8.3.1



