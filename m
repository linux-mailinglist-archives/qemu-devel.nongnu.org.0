Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB1551C918
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:31:44 +0200 (CEST)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhCR-0003jN-82
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYZ-0002rn-Pu; Thu, 05 May 2022 14:50:31 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:42520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYU-0004S5-C8; Thu, 05 May 2022 14:50:31 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 c22-20020a4ad216000000b0035f13ae7646so867905oos.9; 
 Thu, 05 May 2022 11:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7eT0Lfa1qnnuLGivv3EdVnPTTC18fviHD0RR8SDR1Y=;
 b=R1lFV9h2AvG2M5Pf7uSejpTSAXLBtD6y0RiZjrq1Ym8J+o0HS2P/fCl9WrWLUSBNjE
 d31LeVpnxP4EI1pEim+yIqc/YG8AXIohLK623zsQGyCMDNLak1LcWvopIqx2//ont6zc
 zArO9YAIcAz3Hq8F0s/Y8svr/WMaQwq4AiqFOdU6fauMdE8Dq7zzufmp6spR/DOPpOvg
 oQr68eidk6uDJ9DVMIsu2POfN5gNQRJ5lHYG+fJwFirfsLB5GtU2zoxstN8XW64rE4oG
 WV4odjKOAzBcBpCFhClMdC1oiLI7R+YDVS9273YfDDEU72FMe9xKKy6vsCRTcOACbFra
 cyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7eT0Lfa1qnnuLGivv3EdVnPTTC18fviHD0RR8SDR1Y=;
 b=cMEAFI66/jA90j49em4ExL359JR6FFL7HziUi+SDrk5ITnSQ0RSzSAzJ7ePXb5BsLu
 Hm0zmsLIKivROznpp80gUDo/JkjBOgx2hHIN7eOYbCqxC++2Lhnn2HUU4MHo4w2JhLaG
 r4RvFKcFJvlH5H7OHYRdO4SzTy7gMTfDSNsE7rrIrAQ9LD1l+9n83Ger7UVygPTm2b9F
 KKKxA8nKq+F1gyOaaDpxzGK2HeIjuahY5YRxLTIrMpRahqhpGxj5KIDBvXYq3Wq2k4f4
 7nJPpkgROqzc4adcqwhiP6j1pad1qvPhJC67sfdkdRH3l+2j7ELX2+ZEs6j3Tro1IyMi
 FkNg==
X-Gm-Message-State: AOAM533/Pl04Z8IkzU6xKDcp910g6YiZb9Dewj11JlMXXFmr9Wv+sNBr
 2Z4sRYSoXkR1UiDmTCqBhNZdudZi7iY=
X-Google-Smtp-Source: ABdhPJwms68YiCbE7m2rhZXoQPM4lqnSLqw1UGO48AjJGAJ7FqzsLL7Ut0roANkQFlmcL7rfKCy6kA==
X-Received: by 2002:a4a:ea16:0:b0:35e:9a71:4826 with SMTP id
 x22-20020a4aea16000000b0035e9a714826mr9795255ood.76.1651776624761; 
 Thu, 05 May 2022 11:50:24 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 06/30] vhost-user: Use correct macro name TARGET_PPC64
Date: Thu,  5 May 2022 15:49:14 -0300
Message-Id: <20220505184938.351866-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

The correct name of the macro is TARGET_PPC64.

Fixes: 27598393a232 ("Lift max memory slots limit imposed by vhost-user")
Reported-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Peter Turschmid <peter.turschm@nutanix.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220503180108.34506-1-muriloo@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2d434ff0bc..afd51f79b3 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -51,7 +51,7 @@
 #include "hw/acpi/acpi.h"
 #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
 
-#elif defined(TARGET_PPC) || defined(TARGET_PPC_64)
+#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
 #include "hw/ppc/spapr.h"
 #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
 
-- 
2.32.0


