Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13807529327
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:49:51 +0200 (CEST)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqib8-00076M-6G
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjd-0001Vh-1c
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjV-0006kk-Gy
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTl414t0bLnqbbbHPkJ++SqYY30ITC7Eof+Drpd+b/U=;
 b=erlz2nTqT9Tz47834/zBvMrhd2QxTlo5SxpG64K9gsv/UWRaCtMJn+0cN2kcOo+J4EwN0a
 5//tjQAd18lLrXpDMEqtEy5GVCfFdUfSrRcyxmG/OyZwjE15AoHbojFvcUMh0nuhzHVVAk
 YxGNQyoTLnRVZ7NMirrHNRIlpjRIVUo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-fDpLrJpVPV-DeUxITSzJYQ-1; Mon, 16 May 2022 16:54:16 -0400
X-MC-Unique: fDpLrJpVPV-DeUxITSzJYQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y1-20020a056402170100b0042aa8f679fdso3611681edu.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dTl414t0bLnqbbbHPkJ++SqYY30ITC7Eof+Drpd+b/U=;
 b=GPBQ2FCNnuj0Z6xt4RnwQHBMV3/6hFGOrAfczEvKqEq1+WMX9mijhTwzuwgw4etaon
 dTW63RcpMToPRq+D8WyuRZiYsPIVQKQEDiavAikeXyzP2XZBbKgdiBr/KELQ4YmcRHP+
 TaO0yK3wcGiOWlGgWw0+hVhIEi6thuJBZe5tUN+HRDh6NIZkTNOV7Gt4zkdA3fvLE7pf
 Y+zAZbsG13F3mRDuh6nWzRHM4ZTwErTRbuUZFmmfKoJRy3WhUmRclOp2p3aqxNCm/su7
 GiAochWaZKuz1u6Er7KKRI/jIntoBKiXsFv5DOPQzLQJYQO2qElFIigHee1qps0Vkd1Q
 H8RA==
X-Gm-Message-State: AOAM533DOlV1rhOKa2fdYHlIFBjmhKKjGfRZnRg7qU72NLOuIK4a++md
 P8aq1Wk7ysEI6v7eU/Fl/Wr2kqjtEJhrR/uQCohvyZsGniVSK8XJE71MZnb96sOiqvEkBrIjR30
 NPqNxwypsuU17yNHmjEdGwNWz3cFEeeclEJx1x82eCfjGe6V8aVEzjSvAyWPV
X-Received: by 2002:a17:907:c27:b0:6fe:5636:6020 with SMTP id
 ga39-20020a1709070c2700b006fe56366020mr2304318ejc.730.1652734453897; 
 Mon, 16 May 2022 13:54:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcxlzhimru/F0mwmI1D9rDxMG8fvR0J14GsPce7s2RsdX88+mOn5EQYcsTeeTf0zkLNXzh3Q==
X-Received: by 2002:a17:907:c27:b0:6fe:5636:6020 with SMTP id
 ga39-20020a1709070c2700b006fe56366020mr2304296ejc.730.1652734453479; 
 Mon, 16 May 2022 13:54:13 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 hg23-20020a1709072cd700b006f3ef214decsm171219ejc.82.2022.05.16.13.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:13 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, virtio-fs@redhat.com
Subject: [PULL v2 58/86] hw/virtio: move virtio-pci.h into shared include space
Message-ID: <20220516204913.542894-59-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

This allows other device classes that will be exposed via PCI to be
able to do so in the appropriate hw/ directory. I resisted the
temptation to re-order headers to be more aesthetically pleasing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200925125147.26943-4-alex.bennee@linaro.org>

Message-Id: <20220321153037.3622127-2-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 {hw => include/hw}/virtio/virtio-pci.h | 0
 hw/virtio/vhost-scsi-pci.c             | 2 +-
 hw/virtio/vhost-user-blk-pci.c         | 2 +-
 hw/virtio/vhost-user-fs-pci.c          | 2 +-
 hw/virtio/vhost-user-i2c-pci.c         | 2 +-
 hw/virtio/vhost-user-input-pci.c       | 2 +-
 hw/virtio/vhost-user-rng-pci.c         | 2 +-
 hw/virtio/vhost-user-scsi-pci.c        | 2 +-
 hw/virtio/vhost-user-vsock-pci.c       | 2 +-
 hw/virtio/vhost-vsock-pci.c            | 2 +-
 hw/virtio/virtio-9p-pci.c              | 2 +-
 hw/virtio/virtio-balloon-pci.c         | 2 +-
 hw/virtio/virtio-blk-pci.c             | 2 +-
 hw/virtio/virtio-input-host-pci.c      | 2 +-
 hw/virtio/virtio-input-pci.c           | 2 +-
 hw/virtio/virtio-iommu-pci.c           | 2 +-
 hw/virtio/virtio-net-pci.c             | 2 +-
 hw/virtio/virtio-pci.c                 | 2 +-
 hw/virtio/virtio-rng-pci.c             | 2 +-
 hw/virtio/virtio-scsi-pci.c            | 2 +-
 hw/virtio/virtio-serial-pci.c          | 2 +-
 21 files changed, 20 insertions(+), 20 deletions(-)
 rename {hw => include/hw}/virtio/virtio-pci.h (100%)

diff --git a/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
similarity index 100%
rename from hw/virtio/virtio-pci.h
rename to include/hw/virtio/virtio-pci.h
diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
index cb71a294fa..08980bc23b 100644
--- a/hw/virtio/vhost-scsi-pci.c
+++ b/hw/virtio/vhost-scsi-pci.c
@@ -21,7 +21,7 @@
 #include "hw/virtio/vhost-scsi.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostSCSIPCI VHostSCSIPCI;
diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
index 33b404d8a2..eef8641a98 100644
--- a/hw/virtio/vhost-user-blk-pci.c
+++ b/hw/virtio/vhost-user-blk-pci.c
@@ -26,7 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostUserBlkPCI VHostUserBlkPCI;
diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index 2ed8492b3f..6829b8b743 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -14,7 +14,7 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-fs.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 struct VHostUserFSPCI {
diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
index 70b7b65fd9..00ac10941f 100644
--- a/hw/virtio/vhost-user-i2c-pci.c
+++ b/hw/virtio/vhost-user-i2c-pci.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-i2c.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 
 struct VHostUserI2CPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-input-pci.c b/hw/virtio/vhost-user-input-pci.c
index c9d3e9113a..b858898a36 100644
--- a/hw/virtio/vhost-user-input-pci.c
+++ b/hw/virtio/vhost-user-input-pci.c
@@ -9,7 +9,7 @@
 #include "hw/virtio/virtio-input.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostUserInputPCI VHostUserInputPCI;
diff --git a/hw/virtio/vhost-user-rng-pci.c b/hw/virtio/vhost-user-rng-pci.c
index c83dc86813..f64935453b 100644
--- a/hw/virtio/vhost-user-rng-pci.c
+++ b/hw/virtio/vhost-user-rng-pci.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-rng.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 
 struct VHostUserRNGPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-scsi-pci.c b/hw/virtio/vhost-user-scsi-pci.c
index d5343412a1..75882e3cf9 100644
--- a/hw/virtio/vhost-user-scsi-pci.c
+++ b/hw/virtio/vhost-user-scsi-pci.c
@@ -30,7 +30,7 @@
 #include "hw/pci/msix.h"
 #include "hw/loader.h"
 #include "sysemu/kvm.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostUserSCSIPCI VHostUserSCSIPCI;
diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
index 72a96199cd..e5a86e8013 100644
--- a/hw/virtio/vhost-user-vsock-pci.c
+++ b/hw/virtio/vhost-user-vsock-pci.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-vsock.h"
 #include "qom/object.h"
diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index 205da8d1f5..9f34414d38 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-9p-pci.c b/hw/virtio/virtio-9p-pci.c
index e07adcd9ea..94c14f0b98 100644
--- a/hw/virtio/virtio-9p-pci.c
+++ b/hw/virtio/virtio-9p-pci.c
@@ -15,7 +15,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/9pfs/virtio-9p.h"
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
index 79a3ba979a..ce2645ba71 100644
--- a/hw/virtio/virtio-balloon-pci.c
+++ b/hw/virtio/virtio-balloon-pci.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-balloon.h"
 #include "qapi/error.h"
diff --git a/hw/virtio/virtio-blk-pci.c b/hw/virtio/virtio-blk-pci.c
index 9d5795810c..9743bee965 100644
--- a/hw/virtio/virtio-blk-pci.c
+++ b/hw/virtio/virtio-blk-pci.c
@@ -19,7 +19,7 @@
 
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-blk.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/hw/virtio/virtio-input-host-pci.c b/hw/virtio/virtio-input-host-pci.c
index 0ac360de4f..cf8a9cf9e8 100644
--- a/hw/virtio/virtio-input-host-pci.c
+++ b/hw/virtio/virtio-input-host-pci.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-input.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 48e9ff38e2..a9d0992389 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 6a1df7fe50..844d647704 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -11,7 +11,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index aa0b3caecb..e03543a70a 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -19,7 +19,7 @@
 
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-net.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7cf1231c1c..602be7f83d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -33,7 +33,7 @@
 #include "hw/pci/msix.h"
 #include "hw/loader.h"
 #include "sysemu/kvm.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qemu/range.h"
 #include "hw/virtio/virtio-bus.h"
 #include "qapi/visitor.h"
diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index c1f916268b..151ece6f94 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -11,7 +11,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-rng.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-scsi-pci.c b/hw/virtio/virtio-scsi-pci.c
index 97fab74236..e8e3442f38 100644
--- a/hw/virtio/virtio-scsi-pci.c
+++ b/hw/virtio/virtio-scsi-pci.c
@@ -18,7 +18,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VirtIOSCSIPCI VirtIOSCSIPCI;
diff --git a/hw/virtio/virtio-serial-pci.c b/hw/virtio/virtio-serial-pci.c
index 35bcd961c9..cea31adcc4 100644
--- a/hw/virtio/virtio-serial-pci.c
+++ b/hw/virtio/virtio-serial-pci.c
@@ -20,7 +20,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-serial.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VirtIOSerialPCI VirtIOSerialPCI;
-- 
MST


