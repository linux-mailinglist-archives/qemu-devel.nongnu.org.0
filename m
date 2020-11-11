Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BEE2AF04A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:12:00 +0100 (CET)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcoyl-00045v-Dy
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowT-0001mD-5T
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowP-0006sJ-K3
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2YRTddG2x/SeHapVACTBBQp4nNKWuAWM30XETx0UHg=;
 b=XV/BNf96qPDB5NnCulp5t/WsOM7+7+0HW1YWV6dh5tAaO4jkxLmLOtbAK8J4oheHipDnZo
 59xHMmV4cnURfqWqNtatWPKnwLrM47JN4r488FI1dPQ8SJjq/V6dPtPIR1OlTkoht86L1u
 77y5EtQQ0MoM7UHAj4c0AxTIFWKrU2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-FYIwlvZJPJGnUSIxunoVTQ-1; Wed, 11 Nov 2020 07:09:30 -0500
X-MC-Unique: FYIwlvZJPJGnUSIxunoVTQ-1
Received: by mail-wm1-f72.google.com with SMTP id z7so810885wme.8
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2YRTddG2x/SeHapVACTBBQp4nNKWuAWM30XETx0UHg=;
 b=os4lxJmtfzInIehKxjgpywcKM89PQZZ9i447jkmEmTmxuxWmYDqDlR1kd5eqDmYV9v
 3Sw5PusMi41AjmRstWi/DTCd85sOC45RcZ3r/NWtpkaQRYiS2TBLh5r7IT20mYxpEZqm
 hcvHaQwvmmquQTX7WdvViTYk1+r1abvNUH1tEkowuZD2Dx1oxYzjDrVF/st71u1PrmMc
 R5xUpbjp8I3I+GG0xP4BzZagVou3uQIqA09iI4gN06CiaIsSAsvXUJETWj/vq21KfwDA
 behKNZ3TmhEEKe6WZHt15QCo/plCJLrk8R8/Tss1h6uGZDYuHDWpgqWDfOpy7w9NO4rK
 PjYg==
X-Gm-Message-State: AOAM531Z7BTz72PfWeNlb7etIhFJQWj0CkHO/SPD2JE2hS9lc90HAFLL
 QRUhRZT7DxbywEg58dgA9fYfa75mtcXN7E57cbhf7UCExP+vBobdqZjVFKN9avdWo0bCsNw3/Lp
 aE1ARctzBmPHX1x+d+jYPm6CqEyQ1qMZLFkMdP3CN6sVBa4H0FvnmJsuu/ODLV7v/
X-Received: by 2002:a1c:ab57:: with SMTP id u84mr2588837wme.99.1605096569423; 
 Wed, 11 Nov 2020 04:09:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq4yHUdkNqA37naOfUfNC9xIoM0eZq8iBhuh9Lb7nB4gdStBP4HlTBCncP57Vlmujf65FKHA==
X-Received: by 2002:a1c:ab57:: with SMTP id u84mr2588823wme.99.1605096569254; 
 Wed, 11 Nov 2020 04:09:29 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a15sm2300209wrn.75.2020.11.11.04.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:09:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 3/4] vhost-user-blk-server: depend on
 CONFIG_VHOST_USER
Date: Wed, 11 Nov 2020 13:09:11 +0100
Message-Id: <20201111120912.3245574-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111120912.3245574-1-philmd@redhat.com>
References: <20201111120912.3245574-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

I interpreted CONFIG_VHOST_USER as controlling only QEMU's vhost-user
device frontends. However, virtiofsd and contrib/ vhost-user device
backends are also controlled by CONFIG_VHOST_USER. Make the
vhost-user-blk server depend on CONFIG_VHOST_USER for consistency.

Now the following error is printed when the vhost-user-blk server is
enabled without CONFIG_VHOST_USER:

  $ ./configure --disable-vhost-user --enable-vhost-user-blk ...
  ../meson.build:761:8: ERROR: Problem encountered: vhost_user_blk_server requires vhost-user support

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110171121.1265142-3-stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 4fc58eb2c3d..b978e89ec70 100644
--- a/meson.build
+++ b/meson.build
@@ -755,11 +755,14 @@
     error('vhost-user does not make sense without system or tools support enabled')
 endif
 
-have_vhost_user_blk_server = (targetos == 'linux')
+have_vhost_user_blk_server = (targetos == 'linux' and
+    'CONFIG_VHOST_USER' in config_host)
 
 if get_option('vhost_user_blk_server').enabled()
     if targetos != 'linux'
         error('vhost_user_blk_server requires linux')
+    elif 'CONFIG_VHOST_USER' not in config_host
+        error('vhost_user_blk_server requires vhost-user support')
     endif
 elif get_option('vhost_user_blk_server').disabled() or not have_system
     have_vhost_user_blk_server = false
-- 
2.26.2


