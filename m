Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086804E2CCF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:48:29 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKGi-0006KZ-4o
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:48:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzr-0005Hp-A2
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:03 -0400
Received: from [2a00:1450:4864:20::536] (port=42735
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzo-0004xT-Pa
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id a17so17254306edm.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vjmkUfxosvS/+ENW+rV5uag0F+VS01H11+SAfFqIl4=;
 b=lk+b1QCMVBT0dFBEk/Fe5rr/YAI+fBoRZGe4sBoRhaJSJnDl+5RHHIlFO6FQMwCZIW
 xCmF77z6ubHwF8z24VLBG/LJaaQFe5MQzXozMU0VoHYPRzKqJeInNNdtdhiLNhlipxpy
 FagFsAl5dHN4svNfD78d0CTmZ/cAMKyIBxiqLvN1fv0j9By801CJ8MeT6N9vM9qYgo/l
 fFsZuNUm3CE4rLZedym2pk84id5udTc+MFnMs4A2dhx8e+ad4whk2Uz5ShjvG8ERTH30
 bzh6DRkaFPuUJ5nye9wx1TK9a8E7aN7ceJtFiZewLJ11t7juycM8uM2rGBuOA3772v+3
 7jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vjmkUfxosvS/+ENW+rV5uag0F+VS01H11+SAfFqIl4=;
 b=5pCFel3FNVWQZizM3EgewBEQpSrDxEu9agoTMpAx5GzfmwC+uunbK9GoxikB510LSp
 MfIhXVAlaHRak5GuMyvKviWjUKLcV4rS6UlBfTV2k0Lzxzyi3kUEEGYq2ISV6vCuLon1
 9bBzBNGB1L4fkxI0ak91YSwTXFq7gJzdunCmAdghlDE8z9EzrHD/dkVCPVvwG19XxdWq
 FetxNcXPYnoaFCRNSDpbKL3DdQF1cr8LE+evRM/eiUidBntv67FlrnQPcwbg6Nxv8W3y
 Zp6SVoVuUmHYjk3G/Q452OV9uDG9kmtgBds3G07jGR6I7sDunJCoue2fGfDiQVulK7Vf
 e27g==
X-Gm-Message-State: AOAM533/qWnUtMBT6eJN8SKxL9EryJAtxvdpdOvApjC5cFa8vEtWsEsL
 DDQ0Eb4YFtqGW1p+t090k1HNjw==
X-Google-Smtp-Source: ABdhPJzxU4ztreQwIV8FRCVf1FbBlgYGya07H6Oh6OSS/DOo/g0OmFaWgvGaTVaS4Iov5ZfMpBpLtg==
X-Received: by 2002:aa7:d5d7:0:b0:418:f7b0:88cc with SMTP id
 d23-20020aa7d5d7000000b00418f7b088ccmr22654066eds.227.1647876658470; 
 Mon, 21 Mar 2022 08:30:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a50d94a000000b004131aa2525esm8164736edj.49.2022.03.21.08.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A12D51FFC3;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/13] contrib/vhost-user-blk: fix 32 bit build and enable
Date: Mon, 21 Mar 2022 15:30:35 +0000
Message-Id: <20220321153037.3622127-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 stefanha@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were not building the vhost-user-blk server due to 32 bit
compilation problems. The problem was due to format string types so
fix that and then enable the build. Tweak the rule to follow the same
rules as other vhost-user daemons.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                             | 2 +-
 contrib/vhost-user-blk/vhost-user-blk.c | 6 +++---
 contrib/vhost-user-blk/meson.build      | 3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..0435419307 100644
--- a/meson.build
+++ b/meson.build
@@ -1326,7 +1326,7 @@ have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
            error_message: 'vhost_user_blk_server requires linux') \
   .require('CONFIG_VHOST_USER' in config_host,
            error_message: 'vhost_user_blk_server requires vhost-user support') \
-  .disable_auto_if(not have_system) \
+  .disable_auto_if(not have_tools and not have_system) \
   .allowed()
 
 if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index d14b2896bf..0bee79360f 100644
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
-- 
2.30.2


