Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF0382C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:40:42 +0200 (CEST)
Received: from localhost ([::1]:58866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licY5-0005V9-W1
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1licR3-0006v1-Fw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:33:25 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1licQy-0007qW-Rq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:33:23 -0400
Received: by mail-pf1-x433.google.com with SMTP id k19so4838594pfu.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=orjTR1IaQUDGDgxeXqCAWTiec0V3piq35GR7bYUztsw=;
 b=CGNYyXzmRam9aROJM+Le2G6+AdrCp19rn149d3jMJHRqUS1vz+0h9n7QsO6S1KQf1t
 IeoJMf4YhBcOAw0rg6GUZDbxnhn8w9drqtIyZPGSm9yhBDmPAa+lRisqJKZhuT+3Bunn
 xANcYwLh3NH+ALZYImksl26PVKEZ2XqVFCsoJ5Iv2hMzn6wsPUnG4e2LyqYo8pUwihuC
 IkgGwmEZeDW+wBaEWK58Wb7WJG+ALUiT3ikPcgJ90GOPwXs0Enhjd9k7ZUxilYSM2izf
 uxDfl+YUBk1wGLlUZ78cnnA+UTZAwzClezdhCl85Zr/55546txuSS4SelHuk6BERhnNW
 bFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=orjTR1IaQUDGDgxeXqCAWTiec0V3piq35GR7bYUztsw=;
 b=Pvk/+gHZU/vO4R/yhbQZl7n1DSDxGqkR+kn3tDMFjm/1ETsrQQN0wjIsMdDjd21JFO
 rco85J3NMsN6ic3MURqhSS2nF/l3H9AbW+fdkjdMnaUDRJ7mQRizGgSwbxs8g+gI/cE+
 oag7x4tUglqkCV0GVgLVZg3q5RUwN3Kl1LWNBuI67IdUXM9wANQkegYtHqbXJzl1YDh8
 7IoQbTjXm4Q6VajPu+sLDf2PNSK928l4sS2EyJx2moskVjyUk2ATnJLydMEHbfh6fX4B
 DneyxbV2cUKUKHKo4NEkES1xhIomH/MkmkWN9vLmrl8Yo5aBPS76LGaYJ9ha/XsCt97V
 J49w==
X-Gm-Message-State: AOAM532UBZs5lsUo6t1ZM846iggSGBviC1W+6GjVFXqtAXUM5Hrw1FfY
 AfxRSRsEMAlI+OiCqV/iRgYu
X-Google-Smtp-Source: ABdhPJzYf6jBwqVsvz3N2uwJ4xfqd8D82ArNhaeX1Zbeh93v3qtWRs7PGRiXGA56+2cJX/qTXlAo8g==
X-Received: by 2002:a05:6a00:1c63:b029:2a8:b80a:1244 with SMTP id
 s35-20020a056a001c63b02902a8b80a1244mr52300775pfw.72.1621254798276; 
 Mon, 17 May 2021 05:33:18 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id js6sm14185068pjb.0.2021.05.17.05.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 05:33:17 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com,
	philmd@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v2] vhost-vdpa: Remove redundant declaration of
 address_space_memory
Date: Mon, 17 May 2021 20:32:46 +0800
Message-Id: <20210517123246.999-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The symbol address_space_memory are already declared in
include/exec/address-spaces.h. So let's add this header file
and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 1 +
 include/hw/virtio/vhost-vdpa.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 8f2fb9f10b2a..ee51863d280b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -18,6 +18,7 @@
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/vhost-vdpa.h"
+#include "exec/address-spaces.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "trace.h"
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 28ca65018ed7..ae9ee7adb2d0 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -21,5 +21,4 @@ typedef struct vhost_vdpa {
     struct vhost_dev *dev;
 } VhostVDPA;
 
-extern AddressSpace address_space_memory;
 #endif
-- 
2.11.0


