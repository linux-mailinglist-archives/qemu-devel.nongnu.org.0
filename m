Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8D26AB1E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 19:51:00 +0200 (CEST)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIF6Z-0007IB-Bn
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 13:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIF2a-0001eQ-L3
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIF2V-0007GY-7t
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600192004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V9E5diWhrRbicYgJlE9jOABL332i7DZaKEazsBktu98=;
 b=Ky2QoLZjYiJS1BBu6kMYjyhQ7mZROjbW5Zp1ht3UfBfyec0KzoCdju6Ij/pD49VlwcuwQX
 YS0w7XIt/cOkbS7IncIytTfl0Wau2lkcJDAQJYvTnHtEec8gZLF/jRgXfa2NaBrFun330q
 wepwDqzGjeQU0c7ae1n0Ib1iAvkX7Mg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-dNGBRbycPgSHNNitZul8tA-1; Tue, 15 Sep 2020 13:46:43 -0400
X-MC-Unique: dNGBRbycPgSHNNitZul8tA-1
Received: by mail-wm1-f70.google.com with SMTP id b14so117165wmj.3
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 10:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9E5diWhrRbicYgJlE9jOABL332i7DZaKEazsBktu98=;
 b=cnZ2RaDLhUmN5/eK/PStoAMIvLJ7W1ibXxfT2aquRvLxHMfJcXgpFMhECjU2LUBkfe
 VH5KLvpKsRwo0oahZX34KzE2g/6VR1C8MfvpbDsnjcXQbXItoXffipvoZW38zCiXQEOG
 lSsBxanaXcB1VUiIr4iUCZOk5YkxoQZH0l/kbTsvE4+SnuPGTxphCR+4uGDf86c1GCYs
 2miimNSoy3xRZbyaJw/dvUjJNZyqgf64Ha8Mqun2IXdBMEoG4R3DSYsFMfHzuO0Ojye6
 DU1gJUEDrZv06a6FCRvNL2MwV3zo60tWTcIfNS8kJvfEZo6FLbmzpSftrCl6pJEfGkDf
 BpiA==
X-Gm-Message-State: AOAM533u3flHCs8cH4nJXu05kBRD74NDgLG/0fwC2zfPteEpG8iSe+XR
 Gs0SNBYTo8dPUcZzKXodWbDQgn2bv38iwFAfleAKwpkDKef1vqgoanImeMeYoXJYyPImFKZ3NZB
 3MzRUmF9HjaYC13w=
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr543204wmg.0.1600192001867;
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn8hlVTm9vMvPskzb2OpiF/YlQkmj82TAZVB/hRy4HshHRviUWl4L8IXZZzAr1cLVjur3vRg==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr543188wmg.0.1600192001640;
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id q84sm578177wme.23.2020.09.15.10.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/scsi/lsi53c895a: Sanitize some trace events format
Date: Tue, 15 Sep 2020 19:46:39 +0200
Message-Id: <20200915174639.1366226-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make some lsi53c895a trace events more understandable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 9a4a60ca635..ac4209f361e 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -234,9 +234,9 @@ spapr_vscsi_do_crq(unsigned c0, unsigned c1) "crq: %02x %02x ..."
 
 # lsi53c895a.c
 lsi_reset(void) "Reset"
-lsi_update_irq(int level, uint8_t dstat, uint8_t sist1, uint8_t sist0) "Update IRQ level %d dstat 0x%02x sist 0x%02x0x%02x"
+lsi_update_irq(int level, uint8_t dstat, uint8_t sist1, uint8_t sist0) "Update IRQ level %d dstat 0x%02x sist 1:0x%02x 0:0x%02x"
 lsi_update_irq_disconnected(void) "Handled IRQs & disconnected, looking for pending processes"
-lsi_script_scsi_interrupt(uint8_t stat1, uint8_t stat0, uint8_t sist1, uint8_t sist0) "SCSI Interrupt 0x%02x0x%02x prev 0x%02x0x%02x"
+lsi_script_scsi_interrupt(uint8_t stat1, uint8_t stat0, uint8_t sist1, uint8_t sist0) "SCSI Interrupt stat 1:0x%02x 0:0x%02x sist 1:0x%02x 0:0x%02x"
 lsi_script_dma_interrupt(uint8_t stat, uint8_t dstat) "DMA Interrupt 0x%x prev 0x%x"
 lsi_bad_phase_jump(uint32_t dsp) "Data phase mismatch jump to 0x%"PRIX32
 lsi_bad_phase_interrupt(void) "Phase mismatch interrupt"
-- 
2.26.2


