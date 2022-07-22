Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFBC57E518
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:10:02 +0200 (CEST)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEwA5-00041o-W4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5P-0002Nb-O9
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5J-0000qm-HO
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrhJSXJvP21ZKY3MLFzDpxyPH0MrTn07yHLUULeWY6o=;
 b=OpELdgICa0ZXBD8D+wsLCpuMuK7pcycegUhFapiQytLKmcLU178Tq5UyLL4qFNMWcwDQPe
 G43KeJPM+OnSn1j3znAIOt/tgD5MZRjFDw2qnE7vVsmCdmFQUzB4V0qaRXSKcsDco23ink
 GhjpVEiEanbPHqQRMfvbcYDmTVM+/cI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-brZc078KPyuGkxRL90MOAA-1; Fri, 22 Jul 2022 13:05:03 -0400
X-MC-Unique: brZc078KPyuGkxRL90MOAA-1
Received: by mail-ed1-f71.google.com with SMTP id
 q16-20020a056402519000b0043bd73ad1baso648332edd.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VrhJSXJvP21ZKY3MLFzDpxyPH0MrTn07yHLUULeWY6o=;
 b=DV6pBuxuRO1rO9BV2uLGOO9ndaowO3+w2OloEgzFACMYM6XkKVdw5a/rZwyUUDglGJ
 ud1yI0vytx8L+Ax+hyvMOo7gwTbuDP2VkR/C+77HCyIwf4MG9igKRclBu7s40yuGqZjS
 x77AU9wgksapTUQhjzBALww+KozpAloEgGfIfvXJS2wueEtwZaA9vvCW4ahkGlfAH1Cd
 8mgSwWUKw6YrOoFuEfnGji9Z2Z5oRcOzTcSwA594aIQ7yDcFXv1M/qMnEUXSLyU0X62b
 xCqxiTPkZufyDlCcuPxXoBQXDHoc4/erHbpMqm8cReKQbwxddvBQ97OQCavPBrMtUFwF
 45HQ==
X-Gm-Message-State: AJIora8CwV11o+N/yXG/oSIzUuZeaCIpuDuwR6+34oHkWNOQckMAfeCZ
 eJDn1JQ7IQU85cyG1PpjdAvJKYVAXqMhW8n5CIMFRRI6IugfNcDYnJBKyx4s9Kz+UfiaLSwDH6U
 fWorXbJvyIpRYQs0LCFDI1eCzLLjgF6GAGnj36wgsOOg/p1JWnJhhrE4r+YFafd8QA78=
X-Received: by 2002:a05:6402:5412:b0:435:5997:ccb5 with SMTP id
 ev18-20020a056402541200b004355997ccb5mr780976edb.167.1658509501888; 
 Fri, 22 Jul 2022 10:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sM+/GSVhA0wsY1rbfunQuFU5Ddc2Wq/ncfSg+5wEWX9UJ3kbPiED1BRAr31ZjFZAotQbMM8w==
X-Received: by 2002:a05:6402:5412:b0:435:5997:ccb5 with SMTP id
 ev18-20020a056402541200b004355997ccb5mr780946edb.167.1658509501580; 
 Fri, 22 Jul 2022 10:05:01 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b0072b2ef2757csm2188186ejh.180.2022.07.22.10.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:05:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
Subject: [PULL 5/8] hw/nios2: virt: pass random seed to fdt
Date: Fri, 22 Jul 2022 19:04:46 +0200
Message-Id: <20220722170449.853222-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722170449.853222-1-pbonzini@redhat.com>
References: <20220722170449.853222-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This FDT node is part of the DT specification.

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220719120113.118034-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/nios2/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 07b8d87633..21cbffff47 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -34,6 +34,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
@@ -83,6 +84,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     int fdt_size;
     void *fdt = NULL;
     int r;
+    uint8_t rng_seed[32];
 
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
@@ -91,6 +93,9 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
         return 0;
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (kernel_cmdline) {
         r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                     kernel_cmdline);
-- 
2.36.1



