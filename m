Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB745214703
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 17:45:12 +0200 (CEST)
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrkLn-0000mM-KQ
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 11:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGn-0001hw-OX
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:40:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30832
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGl-0007cf-1i
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxT4B45O1zWyFYki8IWzx+7CIdrw2K/5FRLdU4/GP/s=;
 b=F12w1NHEhCKcNq01BYxSqTFFzD0eiWH5rBfz2BNwhguao5P2eK1LLzd10O+5pK0W6N1vn0
 Q9nSfEEazmNVEYyjLyhSEHf8nHRaYvygNEobUUScbZJ6r2ifuSX/rcZwNG/cpLH9TcoSIj
 9pXRRXFI89YbCafI3CB4F/WWVMJdgx4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-hS_-xKtbNRu7q-brJ-FATg-1; Sat, 04 Jul 2020 11:39:56 -0400
X-MC-Unique: hS_-xKtbNRu7q-brJ-FATg-1
Received: by mail-wr1-f72.google.com with SMTP id j5so35936671wro.6
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 08:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxT4B45O1zWyFYki8IWzx+7CIdrw2K/5FRLdU4/GP/s=;
 b=Y62Lg8choU0S4V7elxeIRMq9KTcwURu4mlEbpn2jRnw51s/nDdc8HzmaJqlzS8Laf7
 GyM2jG65SEE1e+CwBotDRiNtGfrw1knrjpG1fmVALJe3VKabLim5ZjD25F3YTYKSk+U0
 n5KA15HGUv25wZV+NIH3SnSD2zieFM8nfRtiWPv7I/KeYE6pEqyh+K+Ccfw9eiTLLCut
 B4N448BXl+LPNOLKVm+T/Hm5fKJHMejDPCtE9+3md6gxZIg2Q80bxWDXQ14NgM9Ld8nX
 q3ur/VIGsD6sNCEd+pBWGzuxK7wUhhTeNz3VzhTYgS+iYFavoPimDDwAuCabIZa+mmKG
 DkUA==
X-Gm-Message-State: AOAM531a/rhnC0oMo3TBSOV9n9qGiisUXe0lUCtTy3oB+o/V79AZD+BF
 Wgq/ZvJoLREBIGTI4JUaJvyDs5wovFa3PSW52l5NdgjEM3WMwSzWJfe/x3fKAN4dAWL1dcKMfef
 IEI4usstNLaIXgFU=
X-Received: by 2002:a1c:4183:: with SMTP id o125mr7797913wma.101.1593877195463; 
 Sat, 04 Jul 2020 08:39:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIAITT8YdfoxUixKkAcI/rOe9ViuwZFMlBYHaxm/865cM4aKRKthdLS4AFyq5Xse239U+HlA==
X-Received: by 2002:a1c:4183:: with SMTP id o125mr7797902wma.101.1593877195332; 
 Sat, 04 Jul 2020 08:39:55 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f16sm16575604wmf.17.2020.07.04.08.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/23] hw/display/ramfb: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:53 +0200
Message-Id: <20200704153908.12118-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/ramfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 79b9754a58..a4a427e5c7 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -18,6 +18,7 @@
 #include "hw/display/bochs-vbe.h" /* for limits */
 #include "ui/console.h"
 #include "sysemu/reset.h"
+#include "hw/qdev-deprecated.h"
 
 struct QEMU_PACKED RAMFBCfg {
     uint64_t addr;
@@ -120,6 +121,8 @@ RAMFBState *ramfb_setup(Error **errp)
     FWCfgState *fw_cfg = fw_cfg_find();
     RAMFBState *s;
 
+    qdev_warn_deprecated_function_used();
+
     if (!fw_cfg || !fw_cfg->dma_enabled) {
         error_setg(errp, "ramfb device requires fw_cfg with DMA");
         return NULL;
-- 
2.21.3


