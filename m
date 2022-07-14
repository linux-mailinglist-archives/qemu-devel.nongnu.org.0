Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE285748CE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:27:05 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv7g-0000cw-O7
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBukB-0005Gl-Vv
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk9-00061T-V1
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPD8blOr1AR3/0Ri08H8H3SESXGTpuldMPhthhSsgzQ=;
 b=aSR/muMAPOQn3LsK+8lin0txDCC7gcKqCnMk+1QPWAV1p7/KgoAolui76f151AJEyRa9Uv
 AY1DW1lgJeaE9zpSyDZ+sN7GFGXR2/eQq7LD4R6cK4MGcarAVoPa5hjiPTIbOj5h3ptQR/
 mMRk2oJP4UHxO+7GfpdKhlBTSLPK5bk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-TTiWOHV4MCKX31xlzt5Kwg-1; Thu, 14 Jul 2022 05:02:44 -0400
X-MC-Unique: TTiWOHV4MCKX31xlzt5Kwg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x8-20020a056402414800b0042d8498f50aso1082130eda.23
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aPD8blOr1AR3/0Ri08H8H3SESXGTpuldMPhthhSsgzQ=;
 b=fe83ND4e+aw2D4LyXWnZdf4S/S9x0tHLUvmzXumafboKCg4S3FSNRrMhYNX/0oEq7q
 ApchAw6cmzhxr3EZdlXjmAACHK+9VSNHu89nm96VEyl6540Ok/9IJe0o8mHayhCOLBN0
 h4BhpsmE6n33p4tW7Lwo5S89g2qph5jf64T36ISaBccIFPEER+Xoslk4/tZa1jNvzEkc
 u0IdSY9Gskrvkl3WH3moL7haGErVmBz5gcPrJWMq4WCqCplOcwWMmV+v70hniisWap9p
 DjcdnMqQa9sqq1GNf9UFJLYQfFJHpGR7VU9UN1xbEG0KwhohIzb0XjiB4PvvKBjf/StD
 nuwQ==
X-Gm-Message-State: AJIora9fo5MxAc9ehlYnIGrUeDTY3fxvNKdv+mf4TqgpBHCBZInzi/Lx
 BZ+zcfQL7jirWd8+XeP+/LJGJB6cBrcTxPsGKD/xNPOUkbJa0+avRVZO/mGi2vPMr2L2xIuCZ3i
 cA1oRb+rOG0lG5WnTixM6ftw5AYZsT9Vf8TypmL7iVloOTXtH+lVYbSIwXPPX8qV9Gk8=
X-Received: by 2002:a17:906:c150:b0:726:b4e7:772 with SMTP id
 dp16-20020a170906c15000b00726b4e70772mr7516851ejc.499.1657789362428; 
 Thu, 14 Jul 2022 02:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZC6eTWm+qLaCgaIxi/PKWoiqvkcO3rzcLI4L6I880zVM9qv+6Z7o2f3pYn4Bom9qjtNDzbA==
X-Received: by 2002:a17:906:c150:b0:726:b4e7:772 with SMTP id
 dp16-20020a170906c15000b00726b4e70772mr7516827ejc.499.1657789362050; 
 Thu, 14 Jul 2022 02:02:42 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a17090623f100b0072b1cb2818csm456673ejg.158.2022.07.14.02.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 17/20] scsi-disk: allow MODE SELECT block descriptor to set the
 block size
Date: Thu, 14 Jul 2022 11:02:08 +0200
Message-Id: <20220714090211.304305-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The MODE SELECT command can contain an optional block descriptor that can be used
to set the device block size. If the block descriptor is present then update the
block size on the SCSI device accordingly.

This allows CDROMs to be used with A/UX which requires a CDROM drive which is
capable of switching from a 2048 byte sector size to a 512 byte sector size.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-13-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c  | 6 ++++++
 hw/scsi/trace-events | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index db27e834da..f5cdb9ad4b 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1616,6 +1616,12 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
         goto invalid_param;
     }
 
+    /* Allow changing the block size */
+    if (bd_len && p[6] != (s->qdev.blocksize >> 8)) {
+        s->qdev.blocksize = p[6] << 8;
+        trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+    }
+
     len -= bd_len;
     p += bd_len;
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 8e927ff62d..ab238293f0 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -340,6 +340,7 @@ scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(se
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
 scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
 scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d expected length %d but received length %d"
+scsi_disk_mode_select_set_blocksize(int blocksize) "set block size to %d"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
-- 
2.36.1



