Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE9300D8C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:18:21 +0100 (CET)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32su-0004yf-Py
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32m9-0004o4-Dc
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:21 -0500
Received: from mail-pg1-f178.google.com ([209.85.215.178]:35470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32m7-0004ZO-QO
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:21 -0500
Received: by mail-pg1-f178.google.com with SMTP id n7so4569778pgg.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=01jOHlrAizpaDPxT12d+5+vOSGTC56CIKtFWQ2QTb8E=;
 b=sCGh2+RbouDK2koYmDYmWdwl8RLOcFkNQ6v8xdrXy1Ecak70/L/3zP7Culs1k2cBtu
 qt2r4V1ML58E31rJXHLK47ES5q+oBItrWGkaei9VYN3nzEmibR/wuvsq2G4J3E30jaW2
 71oG0VkEZjlKSojGB6VAoMUPTD54gVO0KHToUgwK1L8k60JeVx0Lc8wsnJIT9o1H6EJv
 sytH0o1BHgCstH44l8FN5P7Zz4DpGF9SPJeE0eBjnujFweLZGMYhS5MuhaVxFoU2MNeL
 Bj27E3hCSTSWwjK5tKuBgxU15/DOzGK/JkF4Wct4sCqV9bM5J6FjB2i3FgMkmgJ4xoOA
 JHuQ==
X-Gm-Message-State: AOAM531uNXokt+nKDgLcOvLqSbBncDNxA25Ho0X2xRQOGKNyajgYH4l2
 HY40dgI2s4o0dow5vsH6gV4Cw8LcKmc=
X-Google-Smtp-Source: ABdhPJz28lWzUzpz9iA0RY6T1LHup14VYA3XVUVEckKn2+3xtasGUJcKbIamcPIaUnk0FTxGokLChQ==
X-Received: by 2002:a62:7c86:0:b029:1b7:cf7b:7d79 with SMTP id
 x128-20020a627c860000b02901b7cf7b7d79mr6668419pfc.48.1611346278161; 
 Fri, 22 Jan 2021 12:11:18 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:17 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/11] configure: cross-compiling with empty cross_prefix
Date: Fri, 22 Jan 2021 12:11:04 -0800
Message-Id: <20210122201113.63788-3-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.178;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f178.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iOS toolchain does not use the host prefix naming convention. So we
need to enable cross-compile options while allowing the PREFIX to be
blank.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index acf7f7414a..32be5d225d 100755
--- a/configure
+++ b/configure
@@ -238,6 +238,7 @@ cpu=""
 iasl="iasl"
 interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
+cross_compile="no"
 cross_prefix=""
 audio_drv_list=""
 block_drv_rw_whitelist=""
@@ -469,6 +470,7 @@ for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
   --cross-prefix=*) cross_prefix="$optarg"
+                    cross_compile="yes"
   ;;
   --cc=*) CC="$optarg"
   ;;
@@ -1696,7 +1698,7 @@ $(echo Deprecated targets: $deprecated_targets_list | \
   --target-list-exclude=LIST exclude a set of targets from the default target-list
 
 Advanced options (experts only):
-  --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]
+  --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank [$cross_prefix]
   --cc=CC                  use C compiler CC [$cc]
   --iasl=IASL              use ACPI compiler IASL [$iasl]
   --host-cc=CC             use C compiler CC [$host_cc] for code run at
@@ -6403,7 +6405,7 @@ if has $sdl2_config; then
 fi
 echo "strip = [$(meson_quote $strip)]" >> $cross
 echo "windres = [$(meson_quote $windres)]" >> $cross
-if test -n "$cross_prefix"; then
+if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
     if test "$mingw32" = "yes" ; then
-- 
2.28.0


