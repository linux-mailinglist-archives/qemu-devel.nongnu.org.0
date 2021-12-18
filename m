Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26AF479A8D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 12:22:22 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myXnB-0007hF-BV
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 06:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXkG-0004zs-NU
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXkE-0000xX-RQ
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639826357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xlpdcFiKk+QT53vi6eV0nYkKCyVWkrxaOucCuxeBwmg=;
 b=CP466IRGS6hjgKkDOefX0OrjShlKSfx9tXbA/jfaeuFre6g/scXzEFEoCb4fguZ0dCyrk0
 M+Liipfu+RfDqSqBX1zuq9sd77zurE35PemTejJ8VdnUROv93PeVqf50S3+VZpMA5YU8tM
 +IgOWRB9L9AQz8QAreLwExtxjiiLo40=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-t4ATB1DWPmmB0JGyKNgv4g-1; Sat, 18 Dec 2021 06:19:16 -0500
X-MC-Unique: t4ATB1DWPmmB0JGyKNgv4g-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adf8b4f000000b001a24c46d6ceso1396096wra.15
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 03:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xlpdcFiKk+QT53vi6eV0nYkKCyVWkrxaOucCuxeBwmg=;
 b=5iTIQ6mkctBaF8VCehEFJ36iokN7imdj4qLHie4RtjDxjVDX0jZurQpUxMbKmwIEKk
 4uv2oUhxkxIvy9efvdkkJb6y2tVIGVoi9qN+lwlazRdYhi9eYsK6zDSN9VcBJtf9kQAr
 WwdHHda+8tIRh815Lv2TEnjBnFErYiTx5jPQKQGw4CHXVgrio0VX47tPL6yzjos2RUso
 h1cr3ahj5pyHu7j5vyhRADpepsaQ/vaVahWROczjHv+i25GP4glHwlaWfzE5cD3m6Z5P
 bgQFnSXTh/t13Dgt0BQPEHBZhOGZkdIbh3u5eQFXLsooO4R4xfODSboX4PvldeKLsMyO
 PviA==
X-Gm-Message-State: AOAM530HZbhtmIDs8bkEPewugCTxdzVBW077IErFcZgRujKJbLUUO3H5
 VlrbavRO9ht3ZzqAAmjJtucxddkraHZBCpGFRjB+QkaTGwplfq1LBImHqlYsgQYNpp4o2Asqb3v
 Ubx43i+c/WJ3x034WNr3Ekjl2W0oZpfS8pLPLEhqqwWyRolmXCj6cOuv/PXgmugCL
X-Received: by 2002:a05:600c:3d90:: with SMTP id
 bi16mr4670628wmb.42.1639826355044; 
 Sat, 18 Dec 2021 03:19:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywNiLYL4XiRs6jKG961HFnh3L4l5Y+ZVNwOXIRqTU1obt1gblcMdPWQrWhrwLGY+H7ercVLw==
X-Received: by 2002:a05:600c:3d90:: with SMTP id
 bi16mr4670607wmb.42.1639826354829; 
 Sat, 18 Dec 2021 03:19:14 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u14sm10434757wrf.39.2021.12.18.03.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 03:19:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/scsi/megasas: Simplify using the ldst API
Date: Sat, 18 Dec 2021 12:19:12 +0100
Message-Id: <20211218111912.1499377-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code is easier to review using the load/store API.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Fixed offset in megasas_setup_inquiry (rth)
---
 hw/scsi/megasas.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 619b66ef0f3..9a4e9ba87e6 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -375,8 +375,7 @@ static int megasas_setup_inquiry(uint8_t *cdb, int pg, int len)
         cdb[1] = 0x1;
         cdb[2] = pg;
     }
-    cdb[3] = (len >> 8) & 0xff;
-    cdb[4] = (len & 0xff);
+    stw_be_p(&cdb[3], len);
     return len;
 }
 
@@ -392,18 +391,8 @@ static void megasas_encode_lba(uint8_t *cdb, uint64_t lba,
     } else {
         cdb[0] = READ_16;
     }
-    cdb[2] = (lba >> 56) & 0xff;
-    cdb[3] = (lba >> 48) & 0xff;
-    cdb[4] = (lba >> 40) & 0xff;
-    cdb[5] = (lba >> 32) & 0xff;
-    cdb[6] = (lba >> 24) & 0xff;
-    cdb[7] = (lba >> 16) & 0xff;
-    cdb[8] = (lba >> 8) & 0xff;
-    cdb[9] = (lba) & 0xff;
-    cdb[10] = (len >> 24) & 0xff;
-    cdb[11] = (len >> 16) & 0xff;
-    cdb[12] = (len >> 8) & 0xff;
-    cdb[13] = (len) & 0xff;
+    stq_be_p(&cdb[2], lba);
+    stl_be_p(&cdb[2 + 8], len);
 }
 
 /*
-- 
2.33.1


