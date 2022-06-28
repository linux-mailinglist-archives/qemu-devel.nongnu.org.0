Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA055BE73
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:29:15 +0200 (CEST)
Received: from localhost ([::1]:36352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63mk-0008TL-4U
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o634E-0000PN-6W
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o634C-0006td-Ec
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PephaWAYB4wWrCOWcp9B8RIb1PHmOnQGuhXQJ5K1XL0=;
 b=ScNsksgfAPCvTSN4UVSyBaiIAUDfhMr9m6KdkS2+K6RF/YoyKU3BWh7sqQHuy/vorQFmSp
 FsQprPXAe8MINfo8rIKevepGfLzs3ttZ9fcJ1lmhEnVg3iptpsN8ctoY9Ch/lqD0wkj5bd
 utD0cqiFti41T3e1WivGvUHjdwIhdz4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-8BfHnBxZMECElNPyUegGFg-1; Tue, 28 Jun 2022 00:43:02 -0400
X-MC-Unique: 8BfHnBxZMECElNPyUegGFg-1
Received: by mail-wm1-f71.google.com with SMTP id
 az40-20020a05600c602800b003a048edf007so2174085wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PephaWAYB4wWrCOWcp9B8RIb1PHmOnQGuhXQJ5K1XL0=;
 b=L+Fv01Rv+MVEHOi47s5vUr6Fnpsfp+gYiApmfYF8DM4xY27ILNHydPExqPdxfBR1OT
 PGpkErFoGaD2e6HpBMcltZNErohAO3tzRFyHGJfON0N5X2vLhOT4gjkj0xL5l8jdmw2n
 WGwSwi570gYQC6onA7+8CjujBTCPi8ihrGjJH7K2deyZOUjGD9z8nntl0u/47bUCez8T
 j9jh90EmB6eZRlBXDnwxK2qNW5T9XhEpy1TBksHw/tnWkMpkcORuDX/4OEPepaAGFoFt
 sh9UQmpgHbIgCrVQFMW8wk8XAv2Tdy7wpfe3aujDNO7VWLEc2revqK+E5xzhpQYDRtLI
 OFNQ==
X-Gm-Message-State: AJIora+KEvh/Nti2cnrBWM/CHU5neiSTyze8GrrTOxQN2Ib9XuNclW48
 VEZJzwtFdnsFZzoqWBfGxr5aYu2rkf3XZLW9bhmGzsAGNqydTmgGFL04TEc+yQLbSwlip2O+jvo
 96yBKk8yAzQCGUyPew8CfLO0WKiZWgZqjUpPPdM6jC0je+z3YvbLbJjDQADdB
X-Received: by 2002:a05:6000:1f87:b0:21b:970b:e88c with SMTP id
 bw7-20020a0560001f8700b0021b970be88cmr15772685wrb.320.1656391380595; 
 Mon, 27 Jun 2022 21:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzOJdQ43H7Q5hAEdMAHuROCe4UJS36sYSBGnJ6MtcxP0Ha/glT3yethjbrQDi57um2vtlqTQ==
X-Received: by 2002:a05:6000:1f87:b0:21b:970b:e88c with SMTP id
 bw7-20020a0560001f8700b0021b970be88cmr15772664wrb.320.1656391380283; 
 Mon, 27 Jun 2022 21:43:00 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b0039c4ba160absm2364281wmq.2.2022.06.27.21.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:59 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [PULL 10/12] contrib/vhost-user-blk: fix 32 bit build and enable
Message-ID: <20220628044201.217173-11-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Alex Bennée <alex.bennee@linaro.org>

We were not building the vhost-user-blk server due to 32 bit
compilation problems. The problem was due to format string types so
fix that and then enable the build. Tweak the rule to follow the same
rules as other vhost-user daemons.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220321153037.3622127-12-alex.bennee@linaro.org>
Message-Id: <20220524154056.2896913-2-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 6 +++---
 contrib/vhost-user-blk/meson.build      | 3 +--
 meson.build                             | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index cd4a5d7335..9cb78ca1d0 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -146,7 +146,7 @@ vub_readv(VubReq *req, struct iovec *iov, uint32_t iovcnt)
     req->size = vub_iov_size(iov, iovcnt);
     rc = preadv(vdev_blk->blk_fd, iov, iovcnt, req->sector_num * 512);
     if (rc < 0) {
-        fprintf(stderr, "%s, Sector %"PRIu64", Size %lu failed with %s\n",
+        fprintf(stderr, "%s, Sector %"PRIu64", Size %zu failed with %s\n",
                 vdev_blk->blk_name, req->sector_num, req->size,
                 strerror(errno));
         return -1;
@@ -169,7 +169,7 @@ vub_writev(VubReq *req, struct iovec *iov, uint32_t iovcnt)
     req->size = vub_iov_size(iov, iovcnt);
     rc = pwritev(vdev_blk->blk_fd, iov, iovcnt, req->sector_num * 512);
     if (rc < 0) {
-        fprintf(stderr, "%s, Sector %"PRIu64", Size %lu failed with %s\n",
+        fprintf(stderr, "%s, Sector %"PRIu64", Size %zu failed with %s\n",
                 vdev_blk->blk_name, req->sector_num, req->size,
                 strerror(errno));
         return -1;
@@ -188,7 +188,7 @@ vub_discard_write_zeroes(VubReq *req, struct iovec *iov, uint32_t iovcnt,
 
     size = vub_iov_size(iov, iovcnt);
     if (size != sizeof(*desc)) {
-        fprintf(stderr, "Invalid size %ld, expect %ld\n", size, sizeof(*desc));
+        fprintf(stderr, "Invalid size %zd, expect %zd\n", size, sizeof(*desc));
         return -1;
     }
     buf = g_new0(char, size);
diff --git a/contrib/vhost-user-blk/meson.build b/contrib/vhost-user-blk/meson.build
index 601ea15ef5..dcb9e2ffcd 100644
--- a/contrib/vhost-user-blk/meson.build
+++ b/contrib/vhost-user-blk/meson.build
@@ -1,5 +1,4 @@
-# FIXME: broken on 32-bit architectures
 executable('vhost-user-blk', files('vhost-user-blk.c'),
            dependencies: [qemuutil, vhost_user],
-           build_by_default: false,
+           build_by_default: targetos == 'linux',
            install: false)
diff --git a/meson.build b/meson.build
index a113078f1a..65a885ea69 100644
--- a/meson.build
+++ b/meson.build
@@ -1516,7 +1516,7 @@ have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
            error_message: 'vhost_user_blk_server requires linux') \
   .require(have_vhost_user,
            error_message: 'vhost_user_blk_server requires vhost-user support') \
-  .disable_auto_if(not have_system) \
+  .disable_auto_if(not have_tools and not have_system) \
   .allowed()
 
 if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
-- 
MST


