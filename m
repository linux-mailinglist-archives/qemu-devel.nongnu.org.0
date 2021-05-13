Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975EA37FBE3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:58:30 +0200 (CEST)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEfN-0005DT-LD
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMu-0002Mu-7y
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMl-0000kJ-1P
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8h55nhD/ysCnYrCCWZsGnnR6GqqPc9b4n86eMj2C40=;
 b=SpOF1dwBqbrBOfue/VffN3phkJPRIRmKKNmheNSzYZkrBCiEl84diY4wx3Uz6BT5dYVYtH
 RJ6eFh9ZgkSMVoJ4GA4BK0kXgvxTiJY2FBFj73lzCAd6OWu5iKLFzH9EeP9J/63SBvFMdh
 kORqyeY0zduFTAw01kW7nZULQoWZm8M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-K-BANdI1NCukM5dvVQphfQ-1; Thu, 13 May 2021 12:39:11 -0400
X-MC-Unique: K-BANdI1NCukM5dvVQphfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y17-20020a0564023591b02903886c26ada4so14943576edc.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8h55nhD/ysCnYrCCWZsGnnR6GqqPc9b4n86eMj2C40=;
 b=C/+mnddZD0Jt5VVwdfQpw9V4xXvUj1U/BsNzceRSystrPClZnBCnLC12Z3XXdd6WQw
 V5oTO3B90+HGAGe3cjFcM+x57LRQenE0Xp2Jc+ZAhh+gwFgaMqqQytotNnDyi7hnGxF3
 wZMEtoWMiVZH15TWfRC4JUdB6BcILqLjAhhg9e4uCCn35MeSQo12rfMY3C35vlDGG3/r
 vmucUas0l5schvH+SsZvvwp89iJ8EJJ4YshZNtpKyJ8qOg1jqSSrByk5dWq1Y6BFKxK2
 652st7mWfGbQN3S5oUL+WxnpufY1pi0wCZ8b4G4RyOrWrkypxm2ij7DogsQMf6Nlx/uz
 fgzA==
X-Gm-Message-State: AOAM530omYf0rzBpLt1LfrVftJeHEcaa120Rlt6Xp/0Yt7KhnrY2W58r
 FmwwPa+C3w6u4L440JJjvvd1ougCZJKJCHqsitEFGHC1xKHOZ6x8ERmRPlFWv4W/IRByC+mVyfR
 beTslBui1x8T3a1Hxrr4fMGA5htUffWQKDou4uyrVUEVFCYVtuaypIHKtBVf8Y7wK
X-Received: by 2002:a17:906:fcdc:: with SMTP id
 qx28mr12659188ejb.375.1620923949810; 
 Thu, 13 May 2021 09:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3rRwCF9pZ71vFd93cXhzmvhSqn1g1AzCJRzfmiTLGOhSM/2mbCl5wEmp1SgZQMcoMTUp6Wg==
X-Received: by 2002:a17:906:fcdc:: with SMTP id
 qx28mr12659173ejb.375.1620923949646; 
 Thu, 13 May 2021 09:39:09 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id di7sm2695781edb.34.2021.05.13.09.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] hw/ide/Kconfig: Add missing dependency PCI -> QDEV
Date: Thu, 13 May 2021 18:38:50 +0200
Message-Id: <20210513163858.3928976-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
2.26.3


