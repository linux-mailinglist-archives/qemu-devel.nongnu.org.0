Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31C2EA348
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:23:35 +0100 (CET)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc0U-0002Pe-1C
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyA-0000mz-O2
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:10 -0500
Received: from mail-pf1-f172.google.com ([209.85.210.172]:41064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwby6-0001y0-TM
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:10 -0500
Received: by mail-pf1-f172.google.com with SMTP id t8so17522593pfg.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zdV2COLrOWhddqnsrvlyO9Xf6BG1jQJesmU0Mtodfo=;
 b=OuQLlx5J3Qaej3sBK1iIB+t/VlvusMWQJzBgzzidpKa+EMJMO7zgjdzWqg9g/cyo4H
 vXfgaKT2TjlgiQbs0WXVAPyUIqxePbq6NubNqJDAEwwHEN0pCasasPitKR8BJNthzHOh
 fyVWJ1SOw/qYdi3I5RDaiy6K2Mwayz4Z/PUs4dR8rsRRoCA3jH9oxtKyIg0NemNxI4qr
 uoK9m6S+R6q6I/DkTeUGJI1XmoWGC0Peae4bDAbe0ZC9yIqDVvrvBlfFDwQw8TeJo+SY
 Ib8RW6NuUVvUzNAywQ9nAOwqqDepjBGzyFtMETl6MTB16mCzU/+80Z89A4Xn6GT9PAMh
 liyQ==
X-Gm-Message-State: AOAM531KP+/EvwpYbTdcSQ6eVDa3ByH2BapbFUue4FfTDgp2J3wslYZp
 /7pIRWGQowDwbVf2VAKGQJquaz11rLE=
X-Google-Smtp-Source: ABdhPJyo1RLbtk+LmwvKR4HEaeKC4VwNHwB5a+63dCs6HP24WgyhEZVLw3U/9b6+C1vLvYW6gXPOOQ==
X-Received: by 2002:a63:d18:: with SMTP id c24mr72613295pgl.442.1609813260372; 
 Mon, 04 Jan 2021 18:21:00 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.20.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:21:00 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/7] configure: cross-compiling with empty cross_prefix
Date: Mon,  4 Jan 2021 18:20:50 -0800
Message-Id: <20210105022055.12113-3-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
References: <20210105022055.12113-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.172;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
index 7cd2ee0b9c..744d1990be 100755
--- a/configure
+++ b/configure
@@ -234,6 +234,7 @@ cpu=""
 iasl="iasl"
 interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
+cross_compile="no"
 cross_prefix=""
 audio_drv_list=""
 block_drv_rw_whitelist=""
@@ -461,6 +462,7 @@ for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
   --cross-prefix=*) cross_prefix="$optarg"
+                    cross_compile="yes"
   ;;
   --cc=*) CC="$optarg"
   ;;
@@ -1674,7 +1676,7 @@ $(echo Deprecated targets: $deprecated_targets_list | \
   --target-list-exclude=LIST exclude a set of targets from the default target-list
 
 Advanced options (experts only):
-  --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]
+  --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank [$cross_prefix]
   --cc=CC                  use C compiler CC [$cc]
   --iasl=IASL              use ACPI compiler IASL [$iasl]
   --host-cc=CC             use C compiler CC [$host_cc] for code run at
@@ -6963,7 +6965,7 @@ if has $sdl2_config; then
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


