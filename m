Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54412267CD9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 01:03:13 +0200 (CEST)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHEY4-00034P-DU
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 19:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEIH-00057z-SS; Sat, 12 Sep 2020 18:46:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEIG-0004aF-3l; Sat, 12 Sep 2020 18:46:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id o16so3488521pjr.2;
 Sat, 12 Sep 2020 15:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xja2GOan26JGtbnJysiTAdF/PP8SFiEz9x6o8ysBpug=;
 b=YBL0UeQ2J5GeltLrATBdk4OIYSsJFeZwaZ46eAznrZibWr+QEbklXOLaM6HM8ynaBw
 Qmi9X89Pe0o6KUYbvWjJj/o83HFWmZU/a48+OVCWBgH8mChY9USsMvRgakhKpd1fCbqo
 t7/ygBHX32oZ6fjA5u7eUDy4fr4drEDMk7wIJCL+J38AWOhsC8ALzUME7av4AoidApC2
 DA0i7Wpq0+nH/BbSB37C4+vzuShH27Y/rC/F9PJAYWTIlEoUqCu92uApoAnaw/L4EEPP
 /UFEKzCsXMzp3XZGnCOHZsqeWNMAPR4MCBQ531yAFs2z2H0tMnQu6tE6HWPr3GCHEryI
 qHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xja2GOan26JGtbnJysiTAdF/PP8SFiEz9x6o8ysBpug=;
 b=WDb1jdThbI4NOqegKYDv2g7HUOv0W8sC1Vpw8Z/SIjKUx3xpJRSw/ZwCXR2sqwnk3q
 CrZMO5vk3J0Vglnj8s4w9s4Do8iVg1pX6pY+oIne+PwXFbnRJAxvRxwjdqywqRtYavA1
 UWFPhU9lJ7eOeQS1AjKRqKwCY0xd6FYfBmEw3ZSmPCVOaPSLwPKLUw44vWIpncbuwAr3
 8tMHHNpaJwO62fKXe3s411WZqbDDcYI70F5VeGvuuGqPpFdDWdOtS63MXOd0PPvUuOFE
 ADqSLpdCzX5fcItreSJ5VORqhwJpMtJr1DEYKxRQXyRVlOjaW4oMsOEg848xdaz+ZmYS
 a6vQ==
X-Gm-Message-State: AOAM532dDz9Kov9B5EA5D4ICQiOVPCxHwxt8xZjnTYQ98pcz5sLpLjXw
 kSgdUCc0CCn1sKJijwYqXfSyw7zfYyTBKPMLBws=
X-Google-Smtp-Source: ABdhPJyaSAVs8HBXiUomIy060JGqTzzAGhYvWSrLrFvZgqYKCgjFEDlVNRfg+CTEuWYrn7ac3QWsrQ==
X-Received: by 2002:a17:902:7594:: with SMTP id
 j20mr4528185pll.43.1599950806025; 
 Sat, 12 Sep 2020 15:46:46 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t10sm4639266pgp.15.2020.09.12.15.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 15:46:45 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 27/27] Revert "configure: add --ninja option"
Date: Sun, 13 Sep 2020 06:44:31 +0800
Message-Id: <20200912224431.1428-28-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
References: <20200912224431.1428-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 48328880fddf0145bdccc499160fb24dfabfbd41.

The --ninja option doesn't need anymore because of upgrade meson to 0.55.2
At that version we can use ninjatool

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 configure | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/configure b/configure
index af86ba1db3..dc7cc0f411 100755
--- a/configure
+++ b/configure
@@ -535,7 +535,6 @@ rng_none="no"
 secret_keyring=""
 libdaxctl=""
 meson=""
-ninja=""
 skip_meson=no
 gettext=""
 
@@ -1003,8 +1002,6 @@ for opt do
   ;;
   --meson=*) meson="$optarg"
   ;;
-  --ninja=*) ninja="$optarg"
-  ;;
   --smbd=*) smbd="$optarg"
   ;;
   --extra-cflags=*)
@@ -1777,7 +1774,6 @@ Advanced options (experts only):
   --python=PYTHON          use specified python [$python]
   --sphinx-build=SPHINX    use specified sphinx-build [$sphinx_build]
   --meson=MESON            use specified meson [$meson]
-  --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
   --with-git=GIT           use specified git [$git]
   --static                 enable static build [$static]
@@ -2014,16 +2010,6 @@ case "$meson" in
     *) meson=$(command -v meson) ;;
 esac
 
-# Probe for ninja (used for compdb)
-
-if test -z "$ninja"; then
-    for c in ninja ninja-build samu; do
-        if has $c; then
-            ninja=$(command -v "$c")
-            break
-        fi
-    done
-fi
 
 # Check that the C compiler works. Doing this here before testing
 # the host CPU ensures that we had a valid CC to autodetect the
@@ -7952,7 +7938,7 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-NINJA=${ninja:-$PWD/ninjatool} $meson setup \
+NINJA=$PWD/ninjatool $meson setup \
         --prefix "${pre_prefix}$prefix" \
         --libdir "${pre_prefix}$libdir" \
         --libexecdir "${pre_prefix}$libexecdir" \
-- 
2.28.0.windows.1


