Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1124AA58B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:08:33 +0100 (CET)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAV6-0005l4-BE
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003sk-LB
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6q-0003Jl-Ax
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WK+YLETmqJAgpCmbHz21EJfyUutFVg3g9CSFBrfdweQ=;
 b=DDazkILq9damvnAWuDJAbDZZN5Ctgy33m/JPEy6AouIQUBnoTXu/jusTrwzYZO3wTK0Q4U
 dm7G8dIirvI6FL+avsqfaPYSJPRWDN/0msiHj4xHmN3rtXruQHiLcHN3CUTFWI5xt1OHNe
 e33U3hAhSmrkpQqbvxa677xbHPKLLoQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-TxkhwJkvMNupIPGiEB_imw-1; Fri, 04 Feb 2022 20:43:15 -0500
X-MC-Unique: TxkhwJkvMNupIPGiEB_imw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so8394618wms.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WK+YLETmqJAgpCmbHz21EJfyUutFVg3g9CSFBrfdweQ=;
 b=7dW3PfbPq3Lx/XsyAD1brOrXQWju/yB3drZnG1XlLfDIZ2YbNYPRdJUE3OWPLhYtk9
 AUmO9yemmGESRYmhj6rhfMAddGzQJjnY4vx/lrPR/VqdivCaJR18LcMoEoF80Kp5nukN
 0lZx5mZOkYvbBDCjsVSK3ePMO3vr158mlSH4wC9b4+NHCYKNRk1KR77xVlFl79vFoVGH
 PCGKSlm3r5OSb/Dq2LYINo6MBi6ZxfPsY6dxdj+QrtjOyS2vn7XIMlBz83lzQHW9AKyS
 HKJ+9s1NphPkEcQbFmHLfTElpur0HNHu0WJmfbFcEwjq6g+L88xyy70N6dRdV39sCVCW
 KDgw==
X-Gm-Message-State: AOAM532iRCURcpthW/rLikUm1yz41VNOUFP2lFThNPS6N6Opz3y2bzlK
 pd+z4sxX7P4iQ7+1BtlJkrS7xQDvj/BIOfF6DbW5rtepdnHjLFK+eujl8joKxFZtMsezd/zBMU+
 pdyidVrXblPUYuZjG4iZgr7xIvksVOUUFHG5fOjopo0wDo2ADmHPViR0fliR3
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr1180969wmh.57.1644025393448; 
 Fri, 04 Feb 2022 17:43:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl7AWyVcRT4XYlLtG5ApbboGAg1n6Qso/pAXgpM19cCB+9t/4lvH/PBTmHR2wGvWZqqYjQ5w==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr1180954wmh.57.1644025393208; 
 Fri, 04 Feb 2022 17:43:13 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id s9sm3434999wrr.84.2022.02.04.17.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:12 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/32] libvhost-user: handle removal of identical regions
Message-ID: <20220205014149.1189026-14-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

Today if QEMU (or any other VMM) has sent multiple copies of the same
region to a libvhost-user based backend and then attempts to remove the
region, only one instance of the region will be removed, leaving stale
copies of the region in dev->regions[].

This change resolves this by having vu_rem_mem_reg() iterate through all
regions in dev->regions[] and delete all matching regions.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-7-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 28 +++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 2a1fa00a44..0ee43b8e93 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -821,6 +821,7 @@ static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
     int i;
+    bool found = false;
 
     if (vmsg->fd_num != 1) {
         vmsg_close_fds(vmsg);
@@ -856,21 +857,24 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
                 munmap(m, r->size + r->mmap_offset);
             }
 
-            break;
+            /*
+             * Shift all affected entries by 1 to close the hole at index i and
+             * zero out the last entry.
+             */
+            memmove(dev->regions + i, dev->regions + i + 1,
+                    sizeof(VuDevRegion) * (dev->nregions - i - 1));
+            memset(dev->regions + dev->nregions - 1, 0, sizeof(VuDevRegion));
+            DPRINT("Successfully removed a region\n");
+            dev->nregions--;
+            i--;
+
+            found = true;
+
+            /* Continue the search for eventual duplicates. */
         }
     }
 
-    if (i < dev->nregions) {
-        /*
-         * Shift all affected entries by 1 to close the hole at index i and
-         * zero out the last entry.
-         */
-        memmove(dev->regions + i, dev->regions + i + 1,
-               sizeof(VuDevRegion) * (dev->nregions - i - 1));
-        memset(dev->regions + dev->nregions - 1, 0,
-               sizeof(VuDevRegion));
-        DPRINT("Successfully removed a region\n");
-        dev->nregions--;
+    if (found) {
         vmsg_set_reply_u64(vmsg, 0);
     } else {
         vu_panic(dev, "Specified region not found\n");
-- 
MST


