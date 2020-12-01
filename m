Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC92CA6D0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:18:34 +0100 (CET)
Received: from localhost ([::1]:48614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7QH-0002ck-It
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7Le-0006tE-Kz
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:13:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7LZ-0001Nm-Vb
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606835620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBFNmsAY0ghtrhw1W9KOeLTbVaGUVxqihitXlC5SVfI=;
 b=gMcU8uOzSiCRxy9kt9h2e90QdWCaKF4tVMTdTYMvXIjwDSolc7avJhE7/6fe3VuQuZxVmf
 xEOTlD+vYSnIFuFLQXj697etf6XcOWlJkUO+Iv2Rmnq7HhN0WOaSI+ET7JGT0t105UtoBX
 xAVjSRdUJFPdmauft3WCdwZNCSB9KPs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-OcUZyBAyO7uHTSjEk4IK9A-1; Tue, 01 Dec 2020 10:13:39 -0500
X-MC-Unique: OcUZyBAyO7uHTSjEk4IK9A-1
Received: by mail-wm1-f72.google.com with SMTP id a134so788141wmd.8
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBFNmsAY0ghtrhw1W9KOeLTbVaGUVxqihitXlC5SVfI=;
 b=PBV3DJD0BownkfaVBOdFdRr8cpqutwHrwgJTM0PTbit0PooSrV7kJiBKxt+L1LHOW7
 8rM2mmdAYN7vtAjMa0mKpCQdvA4wc30TGQ8msMTANNksXOUH4fY6WrUJn5dWrjnDLxN4
 HAiDdtkF6VlFyXCEs2YgS7aAtnbTIb1sl/EOEd/d0h/npjdQPrZ7bkXYRJEgWyN+9QMS
 HM2BRMqsY1jqyhTGkbCt0kXCt1RPMBUBWdjmhRriakedR2ClNf97BXC3e5zgNvQO7aQQ
 MC3cqzqxx5g4UQGzDmaEbnbBTtz173hSI/Tl59nySrpX8xEoEESEcnw2DBdoxuy/SEiu
 jsRw==
X-Gm-Message-State: AOAM5305Fa1yuFBZCtCctzx0ElyeuOz4iLHwWYlOTqfnM/t42XJ6/qjI
 HKl+LsxOq+i2XrJW59mjfrkr3ki2crWk8h0r1BjdHTm1JnE3Z41lNFUnpPcySx+XTzqmUAOgnbK
 DdweJPeAjya7JB6ReIdhDXh5B61XibEm+2ZwHTgenV137mGLXtnEjGPBKSUb9nGjm
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr4396203wrr.273.1606835617639; 
 Tue, 01 Dec 2020 07:13:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKq/XH9OOJePvtqpdJ8px5vdnIYIbhbgIAwy2/r8PK6lDcC6RpABDguStMYtAiJzbzUbDV3A==
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr4396170wrr.273.1606835617441; 
 Tue, 01 Dec 2020 07:13:37 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w3sm279594wma.3.2020.12.01.07.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 07:13:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] hw/scsi/megasas: Have incorrect cdb return
 MFI_STAT_ABORT_NOT_POSSIBLE
Date: Tue,  1 Dec 2020 16:13:19 +0100
Message-Id: <20201201151319.2943325-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201151319.2943325-1-philmd@redhat.com>
References: <20201201151319.2943325-1-philmd@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid out-of-bound array access with invalid CDB is provided.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because I have no clue how hardware works.
Maybe returning MFI_STAT_ARRAY_INDEX_INVALID is better?
Do we need to call megasas_write_sense()?

 hw/scsi/megasas.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 28efd094111..d89a3c8c3ce 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1676,7 +1676,12 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
     lun_id = cmd->frame->header.lun_id;
     cdb_len = cmd->frame->header.cdb_len;
 
-    assert(cdb_len > 0 && scsi_cdb_length(cdb) >= cdb_len);
+    if (!cdb_len || scsi_cdb_length(cdb) < cdb_len) {
+        trace_megasas_scsi_invalid_cdb_len(mfi_frame_desc(frame_cmd),
+                                           is_logical, target_id,
+                                           lun_id, cdb_len);
+        return MFI_STAT_ABORT_NOT_POSSIBLE;
+    }
     if (is_logical) {
         if (target_id >= MFI_MAX_LD || lun_id != 0) {
             trace_megasas_scsi_target_not_present(
-- 
2.26.2


