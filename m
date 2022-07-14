Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919FD57487C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:20:35 +0200 (CEST)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv1O-0007Es-KU
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk4-0005Ar-JN
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk2-000603-Tk
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBH0BZGGgN90FMU8RzDf0O+2CnQGz444Niu23NFrxjI=;
 b=aypKoJ7ojJirZqrhNeIMriF5SB9OWhhCQJuS4poa9ZN7dGFscKi8UfC310V+7QqMuSXuQX
 sVoE3MZ2fQeDR51etJwc2xM7SIwplzAekB19O4g7X0QjVuz79J6ND+Pjs50+6FAFKW7HlL
 neEeeFmERH5/TWeaTO7/u5wVjOSQZGk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-tJRPuBgVNT6L8LQAv_ag-A-1; Thu, 14 Jul 2022 05:02:37 -0400
X-MC-Unique: tJRPuBgVNT6L8LQAv_ag-A-1
Received: by mail-ed1-f70.google.com with SMTP id
 h17-20020a056402281100b0043aa5c0493dso1094165ede.16
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBH0BZGGgN90FMU8RzDf0O+2CnQGz444Niu23NFrxjI=;
 b=T6IeaaqR7vroS9lBSReLJH0uLlrG5Jg765Ep+LdaTxYiV5TqdfHiz/A5r7OiZ83qDj
 RXZjlaMSm76D8vKF+evqThDZKPifIcJM3Zru8O3mSk7b8lm+g70NeVLPSvGzkbiqqH/G
 DRH9CFefq5UFmhfvua4JGVvjInJ+mpkR4LsC18rpYGOFYgVdRe6KWk2Jz4uXeL7ssphO
 Zq76YEJwNMjr/SUvKObE4bijAu9xribzUvhof1RtZyio0cCwIk3iFrG6cq80qugzFBMh
 DkODKajn/a8YMCeNm9IkwbsvDXvaOmMyjYG1ZduSlhhMRlPwbWmRqWJJEA1iPukVGuaL
 Nw9A==
X-Gm-Message-State: AJIora8y+hitS7lV3nrsfRWG1PYR/t/pdTDaMJumcJmWYC5bh6cWyWJL
 NKnqePzUtMG4WcmdJOM7yqLhMSROBdCGlDKIvjecGO7dLGFZQ8IeKRQ12Jv+3qbANyNNLLah4nt
 BbfksUkp2H0RGMaLcMv9LU2bkGNHH5L7TDB77ol1f4Dr/lBm078UYgq8jgInkQd2bgbw=
X-Received: by 2002:a05:6402:1e8f:b0:43a:ddfc:5c4e with SMTP id
 f15-20020a0564021e8f00b0043addfc5c4emr11004582edf.358.1657789355702; 
 Thu, 14 Jul 2022 02:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgSNv1sw8JRCuJANulOn8HVqgEoez3/orV9CoYniIta7i7eZyz4IRDM8muVAyRDGip6KVz0w==
X-Received: by 2002:a05:6402:1e8f:b0:43a:ddfc:5c4e with SMTP id
 f15-20020a0564021e8f00b0043addfc5c4emr11004553edf.358.1657789355451; 
 Thu, 14 Jul 2022 02:02:35 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 j4-20020aa7c0c4000000b0043a3b90748asm677549edp.26.2022.07.14.02.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 13/20] scsi-disk: add FORMAT UNIT command
Date: Thu, 14 Jul 2022 11:02:04 +0200
Message-Id: <20220714090211.304305-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When initialising a drive ready to install MacOS, Apple HD SC Setup first attempts
to format the drive. Add a simple FORMAT UNIT command which simply returns success
to allow the format to succeed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220622105314.802852-9-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c  | 4 ++++
 hw/scsi/trace-events | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 2cdbba7ccc..9413b33bac 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2180,6 +2180,9 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
         trace_scsi_disk_emulate_command_WRITE_SAME(
                 req->cmd.buf[0] == WRITE_SAME_10 ? 10 : 16, r->req.cmd.xfer);
         break;
+    case FORMAT_UNIT:
+        trace_scsi_disk_emulate_command_FORMAT_UNIT(r->req.cmd.xfer);
+        break;
     default:
         trace_scsi_disk_emulate_command_UNKNOWN(buf[0],
                                                 scsi_command_name(buf[0]));
@@ -2585,6 +2588,7 @@ static const SCSIReqOps *const scsi_disk_reqops_dispatch[256] = {
     [VERIFY_10]                       = &scsi_disk_emulate_reqops,
     [VERIFY_12]                       = &scsi_disk_emulate_reqops,
     [VERIFY_16]                       = &scsi_disk_emulate_reqops,
+    [FORMAT_UNIT]                     = &scsi_disk_emulate_reqops,
 
     [READ_6]                          = &scsi_disk_dma_reqops,
     [READ_10]                         = &scsi_disk_dma_reqops,
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 20fb0dc162..03b2640934 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -334,6 +334,7 @@ scsi_disk_emulate_command_UNMAP(size_t xfer) "Unmap (len %zd)"
 scsi_disk_emulate_command_VERIFY(int bytchk) "Verify (bytchk %d)"
 scsi_disk_emulate_command_WRITE_SAME(int cmd, size_t xfer) "WRITE SAME %d (len %zd)"
 scsi_disk_emulate_command_UNKNOWN(int cmd, const char *name) "Unknown SCSI command (0x%2.2x=%s)"
+scsi_disk_emulate_command_FORMAT_UNIT(size_t xfer) "Format Unit (len %zu)"
 scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 ", count %u)"
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
-- 
2.36.1



