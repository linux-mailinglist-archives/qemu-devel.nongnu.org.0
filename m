Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581901F7AD9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:27:08 +0200 (CEST)
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlaF-0002yh-DS
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl6D-0006l8-Rn
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:56:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37893
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl6B-0002LE-Dv
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8oMz8cU0uw+UrewEP7VqnSORJBEZFEU72TWJXbPFmA=;
 b=WHEcXoVsLSbrN5mI2Xiz2JgBeynbGiffBbYHaa8FaiQWmyS9ku1b3Aa4wxXEYmK5JW3239
 KNQ4lnDppsRXZO2hM0BOzEQaZaqA5s7clRKky9eStDI/aGHBLrft9XZRDj2r+6ffbD81/T
 cIR9YbsEYVuPcceeeWsQ/UgvrgmB5C4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-aYppKkerPOmpeohR7M90Mg-1; Fri, 12 Jun 2020 10:52:12 -0400
X-MC-Unique: aYppKkerPOmpeohR7M90Mg-1
Received: by mail-wm1-f69.google.com with SMTP id v24so2549761wmh.3
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 07:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S8oMz8cU0uw+UrewEP7VqnSORJBEZFEU72TWJXbPFmA=;
 b=CCDozYDFGCc7n0sqRCwu857CwN/AEBSLX+zragDx83YOdqLD2VHliorlbbdRDsJXCZ
 43u4QG6Tk0X8sKyBJ5z4alUYaFDmIvbUzJX1JJe8Tks8QiNeomDaspOoPt6X3DSEAAK7
 r0SaMUoJEP4+TVCQ2VjuCEcL+4pArFJhpxx6RsxNqhMlMjnmXpqhVbW9P4cV4NRqmzDL
 UEBQVmbWpqUu7A6R1bH4VG5fokUkn/ojiduUtRAC8Aazts37+J9CK0w2rrEn+zFffeWt
 sTssxiaRpNA115uFU8/AuCykm7lVe9XvfNcSs1vpUiS8XPPjzqgp78DWJplpYTBCcfTE
 kRMw==
X-Gm-Message-State: AOAM531cUlAtEX3kGFKD41u3XrGee/fhmF5lgTx7n8Kz337Wpkjqyi8d
 kfjiBxGzd0rhY9dqoNZBVt1g6UDpOV3t8UXLcnBpJSARPsA2f5IAgp91RrwW/ZMuxtI/8ti+a8X
 C6PE5TMxqQuBo2gI=
X-Received: by 2002:a5d:42cd:: with SMTP id t13mr15041002wrr.355.1591973531382; 
 Fri, 12 Jun 2020 07:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+A6exq6OqvNGftTsJHxfMengL/267vt4ac+nV6JcfDe0KjnY4nnv/qDhYIJCOV4IDNHja5g==
X-Received: by 2002:a5d:42cd:: with SMTP id t13mr15040986wrr.355.1591973531219; 
 Fri, 12 Jun 2020 07:52:11 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id 23sm8894999wmg.10.2020.06.12.07.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:52:10 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:52:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/58] hw/pci-host/prep: Correct RAVEN bus bridge memory
 region size
Message-ID: <20200612141917.9446-31-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:07:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value. This is not a problem
for the 32-bit maximum, 4 GiB.
By using the UINT32_MAX value, the bm-raven MemoryRegion
ends up missing 1 byte:

  $ qemu-system-ppc -M prep -S -monitor stdio -usb
  memory-region: bm-raven
    0000000000000000-00000000fffffffe (prio 0, i/o): bm-raven
      0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
      0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff

Fix by using the correct value. We now have:

  memory-region: bm-raven
    0000000000000000-00000000ffffffff (prio 0, i/o): bm-raven
      0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
      0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200601142930.29408-3-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/pci-host/prep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 1a02e9a670..88e2fc66a9 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -294,7 +294,7 @@ static void raven_pcihost_initfn(Object *obj)
                              &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
 
     /* Bus master address space */
-    memory_region_init(&s->bm, obj, "bm-raven", UINT32_MAX);
+    memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
     memory_region_init_alias(&s->bm_pci_memory_alias, obj, "bm-pci-memory",
                              &s->pci_memory, 0,
                              memory_region_size(&s->pci_memory));
-- 
MST


