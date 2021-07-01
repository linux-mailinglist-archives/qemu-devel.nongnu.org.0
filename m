Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D23B983B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:34:56 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4Kl-00072o-71
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hubert.jasudowicz@gmail.com>)
 id 1lz3ya-0000TV-Ht; Thu, 01 Jul 2021 17:12:00 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hubert.jasudowicz@gmail.com>)
 id 1lz3yU-00039X-OZ; Thu, 01 Jul 2021 17:12:00 -0400
Received: by mail-lj1-x229.google.com with SMTP id p24so10428944ljj.1;
 Thu, 01 Jul 2021 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A84c4hgUdxFtBSsh1SRChmmQpU42+UpUG3Lp/hwIx5E=;
 b=k3ZCQUYOgpJ5uH/BFTWwjS7d9lvAClhJ1uyX7l+I1QnoM7UTMbkTAJQaV7ibVKt5h/
 YXlWJ3UejJKkHUF2UXEvK/p3ncr98/68R23tKkrz0ooVd1dAt7epqGj+BeFvUKrhYWbx
 iP5yAU/yO6VyCcApluJT449/+wmyrWqWphpU8GKi8Sh+Gj5sGo6mYXLZo1aY7xfbIZn1
 UhPQb1MDfchJxSOx5dn3sl2+l1VZ61Gvs5t6lDxegIte1KjT7lPR+26hrGhWPc6YuTH/
 GG/ZLV+UBPX9Jkk9A89vq0gqkWm9sg79dm4A+DMqbXHcZQ8dr4v89zHDENXYSf1Rz+HR
 FJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A84c4hgUdxFtBSsh1SRChmmQpU42+UpUG3Lp/hwIx5E=;
 b=BriC7pLpyqRsKEbWq3oYZxDt5ig0PWTJZYpYluBCQCyqyb9yAWlm7U28PpW1Z2GPdJ
 7GPkGTodEcy55tOA+6yIUl1DOymCyjd2XlM72SrnAESUlEWgt/QWqT+mnnDzA0GPsE70
 /LL6Nx/bI3KnKEzkkk7eaytlmPZB2SBCA3pj/q7AjV7N2gbugTKaSg2OdziEY/y+tDFv
 SrR20fReD6mvtJrV7chbJotudMAiibZGQF0pgaamlNxM0EXZbCBO96UVztTe3F6zpj+l
 2IYE6nWG/jUBbeIKoTD04RkYGsQy6TXUDVvsTIqOzoTCIciuorZJ+THTcWrXYv4nRk4C
 e55g==
X-Gm-Message-State: AOAM5329klvtBr650oanyLuq2XVuQEPYwRw9TC3XKz7U+WqFssNKwWlP
 Ld8/cbCYPfgzX7rS9MLtVJvrrafXVXWFmUgR
X-Google-Smtp-Source: ABdhPJy1gIhVJ9h4cQFkRS+MgwPVlsCX+TeNXquQMPcgC4aRLBKSDEmhS4rlve9siyLaGqxbOzi7uA==
X-Received: by 2002:a2e:9c94:: with SMTP id x20mr1097247lji.435.1625173910365; 
 Thu, 01 Jul 2021 14:11:50 -0700 (PDT)
Received: from localhost ([2a02:a310:53e:fc00:4aa4:72ff:fea0:3796])
 by smtp.gmail.com with ESMTPSA id b7sm74444lfe.151.2021.07.01.14.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 14:11:49 -0700 (PDT)
From: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
X-Google-Original-From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd: Add missing newline in error message
Date: Thu,  1 Jul 2021 23:11:48 +0200
Message-Id: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=hubert.jasudowicz@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Jul 2021 17:33:20 -0400
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
Cc: virtio-fs@redhat.com, Hubert Jasudowicz <hubert.jasudowicz@gmail.com>,
 qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>

Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
---
 tools/virtiofsd/fuse_virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index fa4aff9b0e..fc2564a603 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -917,7 +917,7 @@ static bool fv_socket_lock(struct fuse_session *se)
     dir = qemu_get_local_state_pathname("run/virtiofsd");
 
     if (g_mkdir_with_parents(dir, S_IRWXU) < 0) {
-        fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s",
+        fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s\n",
                  __func__, dir, strerror(errno));
         return false;
     }
-- 
2.32.0


