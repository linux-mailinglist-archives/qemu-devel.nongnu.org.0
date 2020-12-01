Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09432CAB8F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:14:13 +0100 (CET)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkB6L-0008GR-0Q
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB32-0004MD-JJ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB2x-00019z-VK
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606849843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjqfFE4wAjPA6W+4g0HRWJuF/SKb/AgR1wTwW244iqE=;
 b=bK0YI9eTetImOiLEueI/tYdcZ8vNygNqus2lBS9G8XCWjtw8xbAe6XFv21rsFbsRCibLnZ
 zebznyIvQkjYnJqt/edL0viSNFygOsa7h1brq5i0QgYvfwb56+/a/dnmX8gf35vMqI6f0r
 2Mg5VtcfKK6nq5SNePxMH0PzojQWx54=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-PEQVjSgvPauF7gxAstC0iA-1; Tue, 01 Dec 2020 14:10:40 -0500
X-MC-Unique: PEQVjSgvPauF7gxAstC0iA-1
Received: by mail-wr1-f69.google.com with SMTP id b1so1416053wrc.14
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjqfFE4wAjPA6W+4g0HRWJuF/SKb/AgR1wTwW244iqE=;
 b=gigKvrMp2awHPFfYYfv03JlslhZ9MTQzbmcPFowu9Q1Ka54PyY8SvgcD1CpKlKbU1T
 vE07hah8Mq/kVp9nLY70M/oVFEm9LHqbMdahNL3Tfy6oBgiuxKRnQqDQQ1ZZP+SEqQb0
 C2Rar/Z00HP74lnSpO5mmKqkVvjoos91II3ppO/BJQHSp1R6rbKvCm1kyQEAxaBstjAe
 lIqAi9Y5nsO9vCUM6r7EkpeHpJFvE9iPCqX/tdItHUuKJcTzI7ySGPGDilxQ9ITQm5kl
 y9deIwSiM0vOe8WNSrtAsugnisk62M6hlFWDNvv4TcBeP4F36T7nhrDoVwXTwG6uRQwK
 duWg==
X-Gm-Message-State: AOAM531Q5cvubV+LofgSzcA2EH0g+k2QZ2nfGRf89NwAAgRYe4QOyYOf
 +f6nL4NbLzVOHCHW+OoR0EtTYJcLVVV+mt1mC4zYCvWRTF+CDSbUhwsvYkymmVTK2LkvUKYIWDI
 QzTEE/DXN7+TZVrV3DCmP0OwjqYXgVV0ouWBifwa3WipBzQ3kSEnSy0xMsaUZw5By
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr4219513wmj.115.1606849839415; 
 Tue, 01 Dec 2020 11:10:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYV+xBkY4QniZVOYMWFPWaKiS9tJyJbhljO0KUVTIejeKa9QDyJkFA4gfoElhZ5XaWqqJ4ew==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr4219481wmj.115.1606849839168; 
 Tue, 01 Dec 2020 11:10:39 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d2sm814662wrn.43.2020.12.01.11.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:10:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/scsi/megasas: Assert cdb_len is valid in
 megasas_handle_scsi()
Date: Tue,  1 Dec 2020 20:10:24 +0100
Message-Id: <20201201191026.4149955-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201191026.4149955-1-philmd@redhat.com>
References: <20201201191026.4149955-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cdb_len can not be zero... (or less than 6) here, else we have a
out-of-bound read first in scsi_cdb_length():

 71 int scsi_cdb_length(uint8_t *buf)
 72 {
 73     int cdb_len;
 74
 75     switch (buf[0] >> 5) {
 76     case 0:
 77         cdb_len = 6;
 78         break;

Then another out-of-bound read when the size returned by
scsi_cdb_length() is used.

Figured out after reviewing:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg757937.html

And reproduced fuzzing:

  qemu-fuzz-i386: hw/scsi/megasas.c:1679: int megasas_handle_scsi(MegasasState *, MegasasCmd *, int):
  Assertion `len > 0 && cdb_len >= len' failed.
  ==1689590== ERROR: libFuzzer: deadly signal
      #8 0x7f7a5d918e75 in __assert_fail (/lib64/libc.so.6+0x34e75)
      #9 0x55a1b95cf6d4 in megasas_handle_scsi hw/scsi/megasas.c:1679:5
      #10 0x55a1b95cf6d4 in megasas_handle_frame hw/scsi/megasas.c:1975:24
      #11 0x55a1b95cf6d4 in megasas_mmio_write hw/scsi/megasas.c:2132:9
      #12 0x55a1b981972e in memory_region_write_accessor softmmu/memory.c:491:5
      #13 0x55a1b981972e in access_with_adjusted_size softmmu/memory.c:552:18
      #14 0x55a1b981972e in memory_region_dispatch_write softmmu/memory.c:1501:16
      #15 0x55a1b97f0ab0 in flatview_write_continue softmmu/physmem.c:2759:23
      #16 0x55a1b97ec3f2 in flatview_write softmmu/physmem.c:2799:14
      #17 0x55a1b97ec3f2 in address_space_write softmmu/physmem.c:2891:18
      #18 0x55a1b985c7cd in cpu_outw softmmu/ioport.c:70:5
      #19 0x55a1b99577ac in qtest_process_command softmmu/qtest.c:481:13

Inspired-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Inspired-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/megasas.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 1a5fc5857db..f5ad4425b5b 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1667,6 +1667,7 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
 {
     uint8_t *cdb;
     int target_id, lun_id, cdb_len;
+    int len = -1;
     bool is_write;
     struct SCSIDevice *sdev = NULL;
     bool is_logical = (frame_cmd == MFI_CMD_LD_SCSI_IO);
@@ -1676,6 +1677,10 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
     lun_id = cmd->frame->header.lun_id;
     cdb_len = cmd->frame->header.cdb_len;
 
+    if (cdb_len > 0) {
+        len = scsi_cdb_length(cdb);
+    }
+    assert(len > 0 && cdb_len >= len);
     if (is_logical) {
         if (target_id >= MFI_MAX_LD || lun_id != 0) {
             trace_megasas_scsi_target_not_present(
-- 
2.26.2


