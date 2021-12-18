Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39151479BB1
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 17:11:26 +0100 (CET)
Received: from localhost ([::1]:59558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mycIu-0002lZ-Q8
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 11:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycH1-0001K8-J1
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycGy-0001E0-Np
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639843763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHvhFoJYpxrKY7F/gSTUJxZZxv0vnELqns4DeM0yqMI=;
 b=JaMhW8UyP0eD62o6ws6n6RJreIpWNj+eR2Tb0oxmPrNG6VP9OLrVI9spgz5cvkI+bzq4Vr
 wON+EWU3ync9gMBdSlCNoxafhdCRBep/koBd1z7fEXTYK7+t//Dv0CQQ3iZdfmWqKSIVnX
 adD16YTRZbDHj1OuM919Fan8B8cTeWI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-CmMFoVqZOamtXORQtN-ouA-1; Sat, 18 Dec 2021 11:09:22 -0500
X-MC-Unique: CmMFoVqZOamtXORQtN-ouA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso1565829wrg.11
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 08:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KHvhFoJYpxrKY7F/gSTUJxZZxv0vnELqns4DeM0yqMI=;
 b=2EI2qeiqH4Fijj+lRyXHU0OFB0qzLr7LTZq+HbvGj9HPPZdcnUCK88iLgvAseWYuxF
 ev4mPFFk/4wvaih2DvdCUpD2SV2xFgq0oOsBFHewMdywzvbDArehFDC4Bx08P90ntS3l
 ad8SEVmyrowPSuElnoR1F1GPJjKdhgW1Dk3bKUmb+nh+4DNeGkSW0/DHKQwxldj1sJfV
 hBpql9MqI9YhnD0rB19kEIWqNYk2btgwCBJs0nkFb4MzB9duer3dSNHu6sb14Gt0nwn/
 oeN1R8rYjdopFU/A1liK9IUj9AyfI13jrWqWrxz561NhOUrlwO5eKrs4yVNHhVFqXN8e
 o0og==
X-Gm-Message-State: AOAM531ghIsTyaS0ITxYqYBQa6B3Wauo/jTCXqiHKjHCEnylc2HvEwG/
 2yKVZphOwf6afwzIFJnfRS3Gx/SryDHz0zF0RUJT0wXTSLJ8mgpAXpIJx9rgeVHtJrFp1INSw5T
 vpt3uyyIKBrkbgvs0N8E+4G32NmjNQe59Be+2AeRUlyptnO9qXXbv70A5odbcGPqh
X-Received: by 2002:a5d:6702:: with SMTP id o2mr6263912wru.292.1639843760862; 
 Sat, 18 Dec 2021 08:09:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydhNuSyoNSHMqg9Xpi8ZPhL+v2vvtPFjLa7od9ARzn9n8KLsxEvmZM7tTMqyTTG/YKDBkoVg==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr6263877wru.292.1639843760492; 
 Sat, 18 Dec 2021 08:09:20 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id s8sm12307770wra.9.2021.12.18.08.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 08:09:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] hw/audio/intel-hda: Do not ignore DMA overrun errors
Date: Sat, 18 Dec 2021 17:09:10 +0100
Message-Id: <20211218160912.1591633-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218160912.1591633-1-philmd@redhat.com>
References: <20211218160912.1591633-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Martin Schrodt <martin@schrodt.org>,
 Thomas Huth <thuth@redhat.com>,
 Gianluca Gabruelli <gianluca.gabrielli@suse.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Li Qiang <liq3ea@gmail.com>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jon Maloy <jmaloy@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, crazybyte@protonmail.com,
 Matt Parker <mtparkr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "High Definition Audio Specification" manual (rev. 1.0a),
section "3.3.30 Offset 5Dh: RIRBSTS - RIRB Status":

  Response Overrun Interrupt Status (RIRBOIS):

  Hardware sets this bit to a 1 when an overrun occurs in the RIRB.
  An interrupt may be generated if the Response Overrun Interrupt
  Control bit is set.

  This bit will be set if the RIRB DMA engine is not able to write
  the incoming responses to memory before additional incoming
  responses overrun the internal FIFO.

  When hardware detects an overrun, it will drop the responses which
  overrun the buffer and set the RIRBOIS status bit to indicate the
  error condition. Optionally, if the RIRBOIC is set, the hardware
  will also generate an error to alert software to the problem.

QEMU emulates the DMA engine with the stl_le_pci_dma() calls. This
function returns a MemTxResult indicating whether the DMA access
was successful.
Handle any MemTxResult error as "DMA engine is not able to write the
incoming responses to memory" and raise the Overrun Interrupt flag
when this case occurs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/audio/intel-hda.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 2b55d521503..0c1017edbbf 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -350,6 +350,7 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
     uint32_t wp, ex;
+    MemTxResult res = MEMTX_OK;
 
     if (d->ics & ICH6_IRS_BUSY) {
         dprint(d, 2, "%s: [irr] response 0x%x, cad 0x%x\n",
@@ -368,8 +369,12 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
     ex = (solicited ? 0 : (1 << 4)) | dev->cad;
     wp = (d->rirb_wp + 1) & 0xff;
     addr = intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
-    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
-    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
+    res |= stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
+    res |= stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
+    if (res != MEMTX_OK && (d->rirb_ctl & ICH6_RBCTL_OVERRUN_EN)) {
+        d->rirb_sts |= ICH6_RBSTS_OVERRUN;
+        intel_hda_update_irq(d);
+    }
     d->rirb_wp = wp;
 
     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
-- 
2.33.1


