Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4823CFDEB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:44:36 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rv9-0003HP-QO
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsr-0007mL-Sb
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsq-0004vY-Bt
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVsmVb/ANphJ5S6TeR3I6otvtOxp3iNritQAJ9GWeeA=;
 b=i7LK7Rcpn2PV4GALn3fgfYdLynK92q5w/Ykd+18vQRB19uB+95LvooMNzsbhnmbDw6xsFY
 J7Jvcn5iFW7gFQ6PSQvgmP8gbNXuw8VeWeuAN2GH50Je5tzZKi3yit6s8C0N6Ce5Gje1OJ
 iQyGOPDfH6GPBQgdkm0qJPURG940AKI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-Ca-SjPkcPBKi_aXdEluAFw-1; Tue, 20 Jul 2021 11:42:10 -0400
X-MC-Unique: Ca-SjPkcPBKi_aXdEluAFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020a0560001884b02901401e436a18so10505670wri.21
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gVsmVb/ANphJ5S6TeR3I6otvtOxp3iNritQAJ9GWeeA=;
 b=bcEvc6lQ5w7jyh0qEkVY0APngK4FORPvn6opVyH3YgGa9y5QBJAU62YrK6dF05p4jU
 lG1g0vJzhay1pLBMQhXDFXJwd05MuMHLWVr4HbY+nJkU12jiasPMpvpHUxHK3Lb8aiZ+
 I3y8f3pL+KFdPCra87SR2MTOPAuViDuRYMa7nKA2wpGDldzwIYtbuVA3sNKK8kAYWWfu
 B30MxofxBe0ptkN25Mhf8GY2514kbz5BTWdmNIy2AnsuwLsFRy1XcTLO8uzcwe5xemPo
 hHTC20LJ34MnRbZsViK+nbhkKKioO955YNf11Lxn/SX6OiCntAsytYfo8ojbR5asVLZh
 iC4w==
X-Gm-Message-State: AOAM530CvEYH5mtx5jjTjYtKFlaTgcowH+MvCEgoQ6mIYFroRSMXpauE
 H2ySYBUcsELl3FHmSRACLQjIg3/nAyiCzC2mytG2KDASWrvT11cF64o2Ccjh3B8VS2k77rS+wjl
 rd/3eyBbYoiCGPMfGj34T9CELAe2t4GcOci7bBvAkEIgdJfjwlz6O54FwrLNw3jAE
X-Received: by 2002:a05:600c:22d8:: with SMTP id
 24mr31861289wmg.157.1626795729101; 
 Tue, 20 Jul 2021 08:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlYzqcxpa7L8cQPJUqD0oXsOL6CLPFZmqvGCI59zo3XJr8ThRCFW9dscya4hK4HM3mq2OnUw==
X-Received: by 2002:a05:600c:22d8:: with SMTP id
 24mr31861272wmg.157.1626795728838; 
 Tue, 20 Jul 2021 08:42:08 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 u2sm2883016wmm.37.2021.07.20.08.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] hw/ide/Kconfig: Add missing dependency PCI -> IDE_QDEV
Date: Tue, 20 Jul 2021 17:41:30 +0200
Message-Id: <20210720154141.3919817-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pci_ide_create_devs() function is declared i hw/ide/qdev.c:

 $ git grep ide_create_drive
 hw/ide/pci.c:491:            ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
 hw/ide/qdev.c:127:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
 include/hw/ide/internal.h:653:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);

Fix the correct symbol dependency to avoid build failure when
deselecting some machines:

  /usr/bin/ld: libcommon.fa.p/hw_ide_pci.c.o: in function `pci_ide_create_devs':
  hw/ide/pci.c:491: undefined reference to `ide_create_drive'

Fixes: 8f01b41e109 ("ide: express dependencies with Kconfig")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210515173716.358295-3-philmd@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
---
 hw/ide/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 8e2c8934549..dd85fa3619f 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -8,7 +8,7 @@ config IDE_QDEV
 config IDE_PCI
     bool
     depends on PCI
-    select IDE_CORE
+    select IDE_QDEV
 
 config IDE_ISA
     bool
-- 
2.31.1


