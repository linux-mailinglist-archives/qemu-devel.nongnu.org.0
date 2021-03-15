Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4833CA1B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:44:11 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwsc-0001vT-B0
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwl5-0001zJ-Ur
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwl4-0006HE-8n
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFOukHrsKh3tFqHSLJgmCEHyeHEq+25TAfb5+Ihzfn0=;
 b=FYxByybCd9TY9dZkwyhid1ovdxWOz3LWW3/ZPTmnVhEn5a4VZQ8zXSWTGAS/eGfVOLWixS
 6Tc5S0eEC6u3M4rkhQWOJBJDMfNIDozo9inAr3nX8GblX87ry2M8i91OAtXHL4li8qHpEp
 5Kv6ncl0aHF/3xizhNokthz1s3SUswM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-5yhByhKWMXmb9iXnCjP6PQ-1; Mon, 15 Mar 2021 19:36:19 -0400
X-MC-Unique: 5yhByhKWMXmb9iXnCjP6PQ-1
Received: by mail-wr1-f69.google.com with SMTP id h21so15628510wrc.19
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFOukHrsKh3tFqHSLJgmCEHyeHEq+25TAfb5+Ihzfn0=;
 b=mk4zUHeK5Zc0n/W8MzMGddnV7mhN/7e86uRgeny+P1S9I654dB4yNkJO4m9EaWDFD/
 AstsGskWyYSG05m3d4BA+crKaKDMBvz155wnIXSgWeqBV6ezjXGTnagzlZzFcBIvzPbt
 5PfgGnxuTbP1tCMKxR2SwHeLSda0lZZ5Nyi0RimVgeaM9KSCgq/Hn5T5HvZAJfGHhMdm
 04Epp34Ujsx8TIgGMrnq0CuF/RdE9gXV9j1MOgp9WHimeDVBTkZeVM4uY1w+U0PiZPdD
 Wrxct+E2r37ccWxA5bOKbnDSMzZ5UFyKAV4Ue3FwwFrUMfJ1Z9p2nJOETXsjEP/ACs+r
 /ZcA==
X-Gm-Message-State: AOAM532pktprwzCSHlyh3ijTfCaAnD/ZR8BeId7Zx8c6CThbmY+bBTzg
 Y34GFdBxm+3I/GLAnkGD/bEwsKmkNbx21HLmNPmdKLq/iAVtr/S/78ABs0a5hViz13EC1BuP+27
 IRevivYTfM2xbeqc8wrpTGz60cwWUTPK7/bnjTbMescYiC+CEPWuKjNVJJmhmMUru
X-Received: by 2002:a5d:6a86:: with SMTP id s6mr1929631wru.307.1615851377691; 
 Mon, 15 Mar 2021 16:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIXUG5F9v5pjox9o2ka8Bb2lfXtYcwQ4PPnPmrkxZAWGhCLV7SOw0yFyhGv0Ex1femia1vfQ==
X-Received: by 2002:a5d:6a86:: with SMTP id s6mr1929616wru.307.1615851377516; 
 Mon, 15 Mar 2021 16:36:17 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v18sm21556747wrf.41.2021.03.15.16.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:36:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] hw/block/pflash_cfi01: Correct the type of PFlashCFI01.ro
Date: Tue, 16 Mar 2021 00:35:26 +0100
Message-Id: <20210315233527.2988483-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

PFlashCFI01.ro is a bool, declare it as such.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210216142721.1985543-3-david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/block/pflash_cfi01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index c8cecb3ac8b..07910356756 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -82,7 +82,7 @@ struct PFlashCFI01 {
     uint8_t max_device_width;  /* max device width in bytes */
     uint32_t features;
     uint8_t wcycle; /* if 0, the flash is read normally */
-    int ro;
+    bool ro;
     uint8_t cmd;
     uint8_t status;
     uint16_t ident0;
@@ -853,7 +853,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
             return;
         }
     } else {
-        pfl->ro = 0;
+        pfl->ro = false;
     }
 
     if (pfl->blk) {
-- 
2.26.2


