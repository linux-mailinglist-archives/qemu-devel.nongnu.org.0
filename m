Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB62D331E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:23:43 +0100 (CET)
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjWP-0004wj-0U
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminL-0007UW-3h
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmin3-0005jo-Ld
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbqEn1PQqGTyBypVQN7GtxbjLn0NlsZ+rRoNGrDe06E=;
 b=ciLNZRN6iTgVpUMIadChbckusG82yMC8Jqfh3bhljki/UBRZaDvo6+ybGWoELuCNSz+vmV
 O2LdmPZ+2XdQ4WuvSjuYX1h3D1GOmN7giL+24ObpqzKpZQgw40K1C/m22IMKvubXruEEFi
 fJn64tcV0SrrvLNN/OEUt1wa4LqE9Tc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-dg0PZHDQOdi5dXx1Xx7K9w-1; Tue, 08 Dec 2020 14:36:47 -0500
X-MC-Unique: dg0PZHDQOdi5dXx1Xx7K9w-1
Received: by mail-wr1-f70.google.com with SMTP id v5so6605115wrr.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QbqEn1PQqGTyBypVQN7GtxbjLn0NlsZ+rRoNGrDe06E=;
 b=UyYrjTTySHrr7/GbF1/a0aS/RMSWPU9y9pufdjivtUo97qVMUJd74u8D6afCS68y0M
 dCcHGwAwwMPX25f0nSrUow5SsPICdoWSXuqAcOeZovStdJ/Usum56aoM0JRJ4Wx0Tuhc
 wFKj/uLcaFvc4nmlffEcflaeswWoy7YE1f4F0PX9l8Xm02lRK1JvYyUts82oARGYZIzn
 3FABbxHzt48zq2Kbq4JF2w7gURK45MjlULorKzcUcRhCckEIM6wxDM+VVweP99j6PKxy
 wHwK9pGYSkE8AuGSNjo0bTod2nEE0Q2U2NadhTrlO8iNtzg38NCZUZ+ZDcwXJCnBhaib
 VBSQ==
X-Gm-Message-State: AOAM531VvHXeaaeHULunsTSNdsZEMfL1OMNUulRlOaJzVtpvLWt3I8RB
 IzCx8v8y+xkqLLfYuBz+BSSo9SC5dNIdYqBAUsGqQmXafQyXc9sX/yhuL6fxkRgVQoSmpp4Wgwf
 ohDMwvdEKT22lRBQ2jr2gqnCzhaTyMpdakaY+oMFX6Qtk2IOTs5n2Vuq3KZNp
X-Received: by 2002:adf:f881:: with SMTP id u1mr26216575wrp.103.1607456205546; 
 Tue, 08 Dec 2020 11:36:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgviH4J/14mhT0rN7lYLuZEmGjapRv3q/M6hUMazfj3LS+3f56kkF6J/B7FGtOZoWs1XyTsg==
X-Received: by 2002:adf:f881:: with SMTP id u1mr26216558wrp.103.1607456205335; 
 Tue, 08 Dec 2020 11:36:45 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b4sm21471042wrr.30.2020.12.08.11.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:44 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/66] libvhost-user: check memfd API
Message-ID: <20201208193307.646726-50-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Do not compile potentially panicking code, instead check memfd API is
present during configure time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-7-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c |  6 ------
 subprojects/libvhost-user/meson.build     | 12 ++++++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fab7ca17ee..09741a7b49 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1616,7 +1616,6 @@ vu_inflight_queue_size(uint16_t queue_size)
            sizeof(uint16_t), INFLIGHT_ALIGNMENT);
 }
 
-#ifdef MFD_ALLOW_SEALING
 static void *
 memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
 {
@@ -1648,7 +1647,6 @@ memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
 
     return ptr;
 }
-#endif
 
 static bool
 vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
@@ -1672,13 +1670,9 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
 
     mmap_size = vu_inflight_queue_size(queue_size) * num_queues;
 
-#ifdef MFD_ALLOW_SEALING
     addr = memfd_alloc("vhost-inflight", mmap_size,
                        F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
                        &fd);
-#else
-    vu_panic(dev, "Not implemented: memfd support is missing");
-#endif
 
     if (!addr) {
         vu_panic(dev, "Failed to alloc vhost inflight area");
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index f9ecc534cf..ac228b5ba6 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -2,7 +2,19 @@ project('libvhost-user', 'c',
         license: 'GPL-2.0-or-later',
         default_options: ['c_std=gnu99'])
 
+cc = meson.get_compiler('c')
+
 glib = dependency('glib-2.0')
+foreach h, syms: {
+  'sys/mman.h': ['memfd_create', 'MFD_ALLOW_SEALING'],
+  'sys/fcntl.h': ['F_SEAL_GROW', 'F_SEAL_SHRINK', 'F_SEAL_SEAL'] }
+  foreach sym: syms
+    cc.has_header_symbol(h, sym,
+                         args: ['-D_GNU_SOURCE'],
+                         required: true)
+  endforeach
+endforeach
+
 inc = include_directories('../../include', '../../linux-headers')
 
 vhost_user = static_library('vhost-user',
-- 
MST


