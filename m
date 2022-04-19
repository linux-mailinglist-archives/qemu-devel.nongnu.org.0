Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4345065ED
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:32:46 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiLt-0007bv-O7
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmQ-0001In-La
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmN-0004b3-NI
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id i20so20892496wrb.13
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yzbv298xv/IZxkbFAG2dfaYpZApM3UnonMq2TBmO8U=;
 b=Z0WEPWeSuizELJIGyZIG8HKzMnIwEmPRXt03iy8+8YGZMkrbRgDsHxYq+uOeuizrcH
 2qOBoen7rahiEKkiTOCaK7lZqK6LJ/LpRUvtTzdSfThM0uZJt+y+N0SdC31YdBcDGKSj
 b47xca0b93p+DE4aWXb80NMCLvuzsUG/zqXx+BiXoJeC2K2qh3sMfpc1b2/6wlDWEnJV
 /VRATerRlCIHQ5fHlo90SPktdJsxQqeuPUkO4CrNl/Z7b0A0hH+XY2jjkiBL5LzrhlHY
 IWr1Sb1LiWE5qvKm1WTTi3sKZDmICRMIA3IoEpMwyY5kkK8VcehiU72oMIMT4cArUerl
 aWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/yzbv298xv/IZxkbFAG2dfaYpZApM3UnonMq2TBmO8U=;
 b=hZ1ya0/P0E8iTOzJ8wJXv7b9e7kI5ojjQyAaC4dMkQi/UtSP487WJ9mYjklrSSzGsI
 sgiJP37SEq9laYGsqNP4hHr+2BB8+J7nUgj6ETpCJZmPUwhyuQl+zrsx275UAik1I4zg
 7X3hvmIY71odauhdku4WEQae8zG4dydV4QXOp5kwR7dRBlq3k5SdOVeFdQZnABRqI4Mi
 MQG+uHJSmcWpSqr3gHbzfhgdus5nvLMdtnZHGg7U0q9QH715gR1xKunCoTHm0T/l+X7w
 2nom69UP99Q8DLRs9238QkeeOvoEf482/pAxBSPl7ND98hD/gmoHKQajphu5C8RYjzj8
 eDiA==
X-Gm-Message-State: AOAM530Jlypxy6Hb3kVEKV2SDT5NXrRueawa2KvyQgEKHzXJq0uZ//YI
 0c1eHAEfGvcdwIdDqNz8iel2ApKsuDQuPw==
X-Google-Smtp-Source: ABdhPJzkrZLtuapGFz+NNwewR0MuMuVSs8cMt6osaZpMotFoOkvtwr9roIhAEjdHYr80QLO4w01IiA==
X-Received: by 2002:a5d:66d0:0:b0:207:a53f:5c2d with SMTP id
 k16-20020a5d66d0000000b00207a53f5c2dmr10348552wrw.440.1650347518309; 
 Mon, 18 Apr 2022 22:51:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 51/53] virtio-ccw: do not include headers for all virtio devices
Date: Tue, 19 Apr 2022 07:51:07 +0200
Message-Id: <20220419055109.142788-52-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/ipl.c             |  3 +++
 hw/s390x/s390-virtio-ccw.c |  1 +
 hw/s390x/virtio-ccw.c      |  2 ++
 hw/s390x/virtio-ccw.h      | 16 ----------------
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 2dcc24175d..4b5eb77afd 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -27,11 +27,14 @@
 #include "hw/s390x/css.h"
 #include "hw/s390x/ebcdic.h"
 #include "hw/s390x/pv.h"
+#include "hw/scsi/scsi.h"
+#include "hw/virtio/virtio-net.h"
 #include "ipl.h"
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
 #include "qemu/cutils.h"
 #include "qemu/option.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "exec/exec-all.h"
 
 #define KERN_IMAGE_START                0x010000UL
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 90480e7cf9..2d32647d08 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -25,6 +25,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/qemu-print.h"
+#include "qemu/units.h"
 #include "hw/s390x/s390-pci-bus.h"
 #include "sysemu/reset.h"
 #include "hw/s390x/storage-keys.h"
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index c845a92c3a..15b458527e 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "net/net.h"
 #include "hw/virtio/virtio.h"
@@ -19,6 +20,7 @@
 #include "hw/virtio/virtio-net.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/virtio/virtio-access.h"
 #include "hw/virtio/virtio-bus.h"
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index fc131194bf..fac186c8f6 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -13,24 +13,8 @@
 #ifndef HW_S390X_VIRTIO_CCW_H
 #define HW_S390X_VIRTIO_CCW_H
 
-#include "hw/virtio/virtio-blk.h"
-#include "hw/virtio/virtio-net.h"
-#include "hw/virtio/virtio-serial.h"
-#include "hw/virtio/virtio-scsi.h"
 #include "qom/object.h"
-#ifdef CONFIG_VHOST_SCSI
-#include "hw/virtio/vhost-scsi.h"
-#endif
-#include "hw/virtio/virtio-balloon.h"
-#include "hw/virtio/virtio-rng.h"
-#include "hw/virtio/virtio-crypto.h"
 #include "hw/virtio/virtio-bus.h"
-#ifdef CONFIG_VHOST_VSOCK
-#include "hw/virtio/vhost-vsock.h"
-#endif /* CONFIG_VHOST_VSOCK */
-#include "hw/virtio/virtio-gpu.h"
-#include "hw/virtio/virtio-input.h"
-
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/css.h"
 #include "ccw-device.h"
-- 
2.35.1



