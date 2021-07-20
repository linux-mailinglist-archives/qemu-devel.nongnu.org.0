Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD793CFE2E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:50:59 +0200 (CEST)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s1K-0007LD-QP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtQ-0000ip-Fg
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtO-0005MQ-Sl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+EpP9cqqfCS+Ot9ShPaMqErBIc8w+8RJbLCEIxxcLRw=;
 b=Vi9XWC71OM0yKxKZOj62x8bPnuTU2Q37zCXiugPwoZ+A9g4QJ+2jWgkBPfmesQpQXMi7ze
 OUmi4Lml4zD8FxZFB5a7dKoCiIgLg9M7NEue7o8a+oJwgjAXCq+1JNHG+Zy4y8wZCS9z5n
 7Yq8I7bVNM7zUzAZoRxp4NuYzrI60kY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-gLP6VkbvPim6dZ4ytodkwQ-1; Tue, 20 Jul 2021 11:42:45 -0400
X-MC-Unique: gLP6VkbvPim6dZ4ytodkwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2286392wmj.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+EpP9cqqfCS+Ot9ShPaMqErBIc8w+8RJbLCEIxxcLRw=;
 b=Dqjw3gg154zHlVzPgV5GWV1tpX75+jS0305Lc1IMbORSu9/3vgajBO8bpWg/dwFszZ
 epPri2+dGx5NjWMexfbL8a/3NXJF8cbQ3gWUKipioJ04TiY3UjjvmM6Xd9u1upLznML3
 0EnN+2SQqt7VVoTu+Mgj3x5dBXYkr5pIsErNTIg+cV31HSgObpE4svVIXhCQHcxR04ct
 zVO42nu7NDZmUz9GwCf/0mK7nljvsr/DjaNrwmsWGrj8nW/R5DvjoGeWr98GbczuTZE7
 J7kkf5V2iOuw3AUXak2AgLclflwiPGc0FJ8sB90NOqg5ilsUBwgze9l/zeVuhUzGFArS
 dvqQ==
X-Gm-Message-State: AOAM531MXpCVg/utKRvnnTlUI3nTe0JRApxcbJrAOqSM+FH7sEiHiRqz
 3h487OoHCFsNoHea4wpnulpAsECwKqDPLO6gglGO86a4wAzsFG4uhqTHoW5ZejQJWwmYanvihyT
 lSZBoufO7lxAjx5pd11nZY+U/AJJJ6p5mEk+R2af3gdKUgjmTgXYqkYjPL4mZesr8
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr38024425wmj.101.1626795763898; 
 Tue, 20 Jul 2021 08:42:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEJRPMetME02nR7dUiuZkkK5YBr36WoalP1VIyjg/H5AIYJuHnc/RpddsX4veDYtGiyc66Ow==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr38024410wmj.101.1626795763692; 
 Tue, 20 Jul 2021 08:42:43 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 o7sm28065464wrv.72.2021.07.20.08.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] hw/isa/vt82c686: Add missing Kconfig dependencies (build
 error)
Date: Tue, 20 Jul 2021 17:41:38 +0200
Message-Id: <20210720154141.3919817-15-philmd@redhat.com>
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The VT82C686 device model misses various dependencies:

  /usr/bin/ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_realize':
  hw/isa/vt82c686.c:622: undefined reference to `i8259_init'
  /usr/bin/ld: hw/isa/vt82c686.c:624: undefined reference to `i8257_dma_init'
  /usr/bin/ld: hw/isa/vt82c686.c:627: undefined reference to `mc146818_rtc_init'

Add them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210515173716.358295-11-philmd@redhat.com>
---
 hw/isa/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 96db170eff3..f99df0e20b1 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -50,6 +50,9 @@ config VT82C686
     select FDC_ISA
     select USB_UHCI
     select APM
+    select I8257
+    select I8259
+    select MC146818RTC
 
 config SMC37C669
     bool
-- 
2.31.1


