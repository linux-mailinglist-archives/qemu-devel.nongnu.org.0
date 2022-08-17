Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE535968B2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 07:41:27 +0200 (CEST)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOBny-0006NK-0Y
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 01:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oOBj2-00024Q-1v
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 01:36:21 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oOBj0-0006GH-At
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 01:36:19 -0400
Received: by mail-pg1-x531.google.com with SMTP id r22so11119023pgm.5
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 22:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9oCcNDYGQ1FWE7uzxohbcLx1dh3+1TF72jrApKotbCE=;
 b=N5HRfBFuYputGkJ378rJPfapEPGp8XanVNkhRV4sqCTYDeHTCnSV0ENdDY5NRyY2GG
 /f24vMKVr7Ic/ItN7VRVj/DeE7ODJA88n3efs4r2gZYAjkrkXNML0k/0qMcRhZGq+kC/
 Cy0rj+P/htvg0C0NF0qNvVJW+bWIzNDoboMRobeO9QtRkyUrs2aU9rv9XplB3qBf29fm
 cPUZVR6hvsE77A1J/EjbxgQ5QCwso8/7xxY63+5KkcGr+iCHRndCUTttcrImOO6cabaa
 /FEZ5xPzKiRS/6G4OrP1pIL7KQLlld4NyHap7mh89s464jFqtR2c12jqwyb/63TkKS2I
 a1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9oCcNDYGQ1FWE7uzxohbcLx1dh3+1TF72jrApKotbCE=;
 b=UJ6NKXyMOJB02MQjzEWpVIwbDL35Ye08YTa6bZ9zHvZwaxDoEMedID74CcGFNlSaRD
 jfvJLOlrUqFM7/O/lL5OpxwVkxmKejK+/KjdZgG5jhfL69zKfhA12KOEbWuhancpcsjZ
 3+K7EKWyYqqwxKLA08WUkmP43DwVbE1N1ljpoJt+M/JoxnjW+ExoEnfR1LI6RrQhDHhD
 vEL5JAXx5IOM9NbaN/Boqn2SrloPuX3GEgZJUPtl2oqoEECCXXJs8+S6BKnQhvCrL1sm
 XBS3eQe6FXiDnSj3wwCIZUHSX4dtUufZ60g1+LIqK74ds0VuhgOB66QWhQkqPcpBwm4o
 cW1A==
X-Gm-Message-State: ACgBeo3ym/NsoT6mSvwBoBIixqGCLmpiRdAVYRT+d8xzzjxwoNk9MZfo
 QZ7/Yi57Af9eQYUy8mBlUGDCxEq5ZNwPBtqI
X-Google-Smtp-Source: AA6agR4oEvgNgr18QIZvH7BWn8LRXquZ2SUt01KGcWotg4FTwPfy0nbQpZ9G3HrYd7tD0kFNm0a45g==
X-Received: by 2002:aa7:9f1d:0:b0:52e:2401:e630 with SMTP id
 g29-20020aa79f1d000000b0052e2401e630mr23825312pfr.18.1660714576965; 
 Tue, 16 Aug 2022 22:36:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:6580:98c0:1200:8471:2642:55c0:76cb])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a17090332cf00b0016da9128169sm412602plr.130.2022.08.16.22.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 22:36:16 -0700 (PDT)
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Bill Paul <noisetube@gmail.com>
Subject: [PATCH 2/2] scsi: Reject commands if the CDB length exceeds buf_len
Date: Wed, 17 Aug 2022 14:35:00 +0900
Message-Id: <20220817053458.698416-2-john@john-millikin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817053458.698416-1-john@john-millikin.com>
References: <20220817053458.698416-1-john@john-millikin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=john@john-millikin.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In scsi_req_parse_cdb(), if the CDB length implied by the command type
exceeds the initialized portion of the command buffer, reject the request.

Rejected requests are recorded by the `scsi_req_parse_bad` trace event.

On example of a bug detected by this check is SunOS's use of interleaved
DMA and non-DMA commands. This guest behavior currently causes QEMU to
parse uninitialized memory as a SCSI command, with unpredictable
outcomes.

With the new check in place:

  * QEMU consistently creates a trace event and rejects the request.

  * SunOS retries the request(s) and is able to successfully boot from
    disk.

Signed-off-by: John Millikin <john@john-millikin.com>
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1127
---
 hw/scsi/scsi-bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 288ea12969..1beb1b0cfc 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -712,6 +712,8 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
     SCSICommand cmd = { .len = 0 };
     int ret;
 
+    assert(buf_len > 0);
+
     if ((d->unit_attention.key == UNIT_ATTENTION ||
          bus->unit_attention.key == UNIT_ATTENTION) &&
         (buf[0] != INQUIRY &&
@@ -1316,7 +1318,7 @@ int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
 
     cmd->lba = -1;
     len = scsi_cdb_length(buf);
-    if (len < 0) {
+    if (len < 0 || len > buf_len) {
         return -1;
     }
 
-- 
2.25.1


