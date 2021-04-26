Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CC36BA2E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 21:41:38 +0200 (CEST)
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb76v-0005vw-Po
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 15:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71M-0000N2-Ge
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71F-00006b-AN
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+XKpQxMkw2M8DAIFtIrFWfOxS/FuauQxHxUVGxBmbM=;
 b=MzR7HIy654G6I3drM2byH5eosQIumtfshm4IoGnpuu60htNsc3ElLI5MAwaQpBNDbe+Kxm
 jPfV9ecxqVVtcToDUbvY3ekPaEQ/QTXdsdjSfEv4c9BVGmlmBvZqi0L96xcnYJx4gSccMR
 cjFMEla2pMlE63cyTTmbo6pxJq4alnY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-OfOqGFbXMj-fsVtHD-R_Qg-1; Mon, 26 Apr 2021 15:35:43 -0400
X-MC-Unique: OfOqGFbXMj-fsVtHD-R_Qg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so16838057wrb.9
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+XKpQxMkw2M8DAIFtIrFWfOxS/FuauQxHxUVGxBmbM=;
 b=R6R+5wufBKVeZZAMAVNwW902kcPz/Sk74TiineF7Q6hpCZpvAdc44Cpt/QdjPyF8rb
 TTlkQYDAT7wRrvWrJVviqctGDvCQZDwIOK50FeBi9O4euQc3Dm4qZpcNB+IYtHWzG2GG
 qGUXz+RYtVV6pTwow/aw6Oj7gNyt9ld/U/5sWQUFG4fZfyTaxFG5Ts68vnxXc/6axPK/
 EhqrfcEvOnYHOCK2WJLZfpgXVS+qLc3WZM9oV2BSrCrMsXMtyAJ3WoYyy8gXFRoOcm5f
 cSD83UrNNEgzIgUp4uBBiXU/tq/Hx1xOe/uAn918dctLsQBpFFyb5oeWO9XCwsgBw8mG
 CXBA==
X-Gm-Message-State: AOAM532Uy2YgcV86qCPUZK7311kncr2g35dcImUyIOxjJYWIkG/SxC7h
 QXwFYWS2GWuzr6XYUIyTctaqvE013kBYwZ6VSBc1y0mseoUVM0vVedvjSizfV99Xkp1vTwnXrzJ
 LFZlWnBRACK9eT3pxN07nq+4cohIdn7vD0YrBmiMJzn8QxC9JD4TKyIJnHUrKC0na
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr24807484wrj.328.1619465741746; 
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5LsAsP1y6BrNfXip0IXbVkC+0/4kOVMzriBhRt6KKd4Uht/h+rhB5NVVIzRkyXBptEBv9Dw==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr24807460wrj.328.1619465741557; 
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t14sm1292776wrz.55.2021.04.26.12.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG
 Kconfig
Date: Mon, 26 Apr 2021 21:35:17 +0200
Message-Id: <20210426193520.4115528-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TYPE_VMGENID device depends on fw_cfg:

  $ git grep \ fw_cfg hw/acpi/vmgenid.c
  hw/acpi/vmgenid.c:128:    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data,
  hw/acpi/vmgenid.c:131:    fw_cfg_add_file_callback(s, VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,

Add the proper Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1932f66af8d..b9dc932d2a7 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -40,5 +40,6 @@ config ACPI_VMGENID
     bool
     default y
     depends on PC
+    select FW_CFG
 
 config ACPI_HW_REDUCED
-- 
2.26.3


