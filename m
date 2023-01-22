Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C36770F0
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdoq-00024C-Hc; Sun, 22 Jan 2023 12:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdop-00023B-0c
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:47 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdon-0005Ta-Gz
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:46 -0500
Received: by mail-ed1-x531.google.com with SMTP id b4so12137363edf.0
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQaQHWQNI3vzwZ2uav7kTtN2xFmzRbqZJRcUDlV+tKU=;
 b=V5+mgXm7FOW/YqdOf0Co/pdeI2jZ0v69bo1lBPE9Aej53Nagy7okB8jjRU3jyuLzYx
 sFNlh2CSVVBy+aSa5aqM1EHkBl6SKBEJtW4DjKIHkSjEtX6IuNaJHiDxaWvVVB2AxAee
 +2+jpgYugmCBDLKqZi5XNwDj6Q63v0VsjYpnPu5OhxRgGJTprw0YlPQnL0e5UfgTosp5
 yNAGFG8nwR5Ht9FqZicN0AxKNg+QEVAj92UH55kGeqp5mkwk3WKZ3/kUO1K8h8bhkRb8
 ZqWXosqWzhFarpBX2v9qmyrdWEVja5q15pQIlcemx8PvpCA7xmFkhAJVx/5DWtRxJ2Aw
 cldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nQaQHWQNI3vzwZ2uav7kTtN2xFmzRbqZJRcUDlV+tKU=;
 b=r/tJLzoP154XLwLB/7VlcgN5BQFTJgEQ1sgP95fB9GvxPXXRF1KiERtIEowcVqNoIn
 xY1tdsC5AVFWIvBGaEcBt4NhRR5G2c8Ux9NOPiK7Wi6gr9fPNX0bNacV7dpKbgLJIsV7
 /N3E7k5epjgFL86iokNDuuSVrfOpryWvp4YbwRO9YF/jdY6pwUKLl2DTF/SNtlYsbANU
 nW42uN8CB6uIikuclrwY/9qGM2iKnhhS91bNGXJV/aj5s2e7sAsZ3c27JbFTLxYx0gwB
 trsN2r3tEKLAvOK9XhaDekbpdGv0YL6gIX3LqkD9cPqVyIsFOmPQTCCvp687egGqdXCx
 aq9g==
X-Gm-Message-State: AFqh2krQGvKKTAKBHTOkOh6b1y9cydizGB99DQFLiDEd8SBP6xdXc72m
 cWjb8O6MADIQQQLXxOws5ZINwocRBsVF3g==
X-Google-Smtp-Source: AMrXdXv506+V6jB++L8H10OMD5QGDrKck2+JgLRQRqqXLrlLPkSrE5ZttwnGAyPDcCk8+LnIqM2rTg==
X-Received: by 2002:a05:6402:189:b0:499:376e:6b27 with SMTP id
 r9-20020a056402018900b00499376e6b27mr22608397edv.5.1674407263487; 
 Sun, 22 Jan 2023 09:07:43 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/7] hw/acpi/ich9: Remove unneeded assignments
Date: Sun, 22 Jan 2023 18:07:19 +0100
Message-Id: <20230122170724.21868-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The first thing ich9_pm_iospace_update() does is to set pm->pm_io_base to
the pm_io_base parameter. The pm_io_base parameter's value is the old
one of pm->pm_io_base.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/ich9.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 2050af67b9..0313e71e74 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -136,9 +136,7 @@ void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_base)
 static int ich9_pm_post_load(void *opaque, int version_id)
 {
     ICH9LPCPMRegs *pm = opaque;
-    uint32_t pm_io_base = pm->pm_io_base;
-    pm->pm_io_base = 0;
-    ich9_pm_iospace_update(pm, pm_io_base);
+    ich9_pm_iospace_update(pm, pm->pm_io_base);
     return 0;
 }
 
-- 
2.39.1


