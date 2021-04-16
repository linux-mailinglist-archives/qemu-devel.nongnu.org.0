Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC0361DE8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 12:27:52 +0200 (CEST)
Received: from localhost ([::1]:36478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXLhX-0008Vm-Ch
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 06:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXLg1-0007xC-Qi
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 06:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXLfx-0004L6-FI
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 06:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618568767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bz7dvEtXv7kRZHszJJrWUdDNdKLJ6tHkj89SwVHHMfE=;
 b=DX5VAerfLwKMhHdH5AFFMwBl5jsYKlnY31h3wkn0mxM9KpO6DTm8ZqqHLCJ0p/LhnT/2JP
 jMtfAFCB1dk3RhXj//tb6iCv/2HJNbJ5SotTlRFMcP9Ym/nz0pWpr4i2vldBiXKn73Oisl
 KFVuxiCxpH2ZLf96RFWsKE9mr+ds8S0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-xjZBZQRWOe-eYW7anj7__Q-1; Fri, 16 Apr 2021 06:26:03 -0400
X-MC-Unique: xjZBZQRWOe-eYW7anj7__Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso4236836wrs.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 03:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bz7dvEtXv7kRZHszJJrWUdDNdKLJ6tHkj89SwVHHMfE=;
 b=I5zi/7cTq7+X+B0+Ho8UmdRKw6FFCfu0TtETtS+6KfXbjZAz7XximnqAl6UzRNbXcp
 vrFYnv4uJvublIhG0fr0ZPwTTbLCqRdXewFXAaKdUXbBNJ4JEhozmKuOZws4VjpNTZlN
 V7t1zYrs3+sMtBJ2aTBiQGu4qf2tmhKf+eQC3h49OzLsnSyuKIwoWuOxsIeGCF2Jr3fO
 hB+ui9L7jErI834fT4YVJGYWRM/CCI79lNPLXhGcdO7td3+hvpYBA5giAfH+Hyg5myow
 FW/RNTclm37coQpkXLbn0jYQ+IbVg21Bh3EymaJosubCS9uiT5STVVpkRdGpKNk4gOyq
 Gpzg==
X-Gm-Message-State: AOAM533R5YuLOw7lKt2TZ8PEdcXCZUK2WKzI6FQg8wtwW13XnGJfJVuQ
 DfdA4/C7bKOiPlEBevuAqyMQO+huhcd0wWrIIQmE3zenDdmr6KgB0EEO6/BtG0Je8znt7ijUyvF
 lM0kmVXVSXvSUtuAKv8qxM5tRXiAoyrCwkaja+wblrFmOPRaP746d2RAi+L4TKbmI
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr8338097wrw.23.1618568762278;
 Fri, 16 Apr 2021 03:26:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM2wVtDrN4Z5vp9WwZvr1sUlibkfbtBK2Z9nvI9lzKeLxcSAT0VbpsixCtaelPoPs31T9YIw==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr8338068wrw.23.1618568762068;
 Fri, 16 Apr 2021 03:26:02 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f1sm5179855wru.60.2021.04.16.03.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 03:26:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0?] configure: Improve error message with specified
 meson path is not found
Date: Fri, 16 Apr 2021 12:25:59 +0200
Message-Id: <20210416102559.213649-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building on a system where meson isn't available,
but installed manually as user pip package, we get:

  $ ../configure --meson=~/.local/bin/meson
  qemu/configure: line 6387: --version: command not found
  You are attempting to run "setup" which requires administrative
  privileges, but more information is needed in order to do so.
  Authenticating as "root"
  Password:

Improve the error message to something less scary:

  $ ../configure --meson=~/.local/bin/meson
  ERROR: Meson not found.  Use --meson=/path/to/meson (absolute path)

Actually in this case the fix is to use $HOME, not unexpanded ~:

  $ ../configure --meson=$HOME/.local/bin/meson
  The Meson build system
  Version: 0.56.99
  ...

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 4f374b48890..088a82e3d86 100755
--- a/configure
+++ b/configure
@@ -1987,7 +1987,12 @@ case "$meson" in
     git | internal)
         meson="$python ${source_path}/meson/meson.py"
         ;;
-    *) meson=$(command -v "$meson") ;;
+    *)
+        meson=$(command -v "$meson")
+        if test -z "$meson"; then
+            error_exit "Meson not found.  Use --meson=/path/to/meson (absolute path)"
+        fi
+        ;;
 esac
 
 # Probe for ninja
-- 
2.26.3


