Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B33308821
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:14:30 +0100 (CET)
Received: from localhost ([::1]:48638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RjR-0006bu-Nq
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW4-0004Qn-LU
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:40 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVp-0006yJ-L8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:40 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d16so8349937wro.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dIU1+pzOEqhA9i3KvQhwnkFnGoZA70Rr7h7wCQWNREk=;
 b=DtPju1WdLMuqO7D2fp8Vw5UzXRW8UyLMvDo009PBni6LdyIe7OMNLm1fy5dxpzH3ST
 Ul9RJ+G2iJUsDOiQnI+jg8tqISGCLAor8JEInbaHMDHgfmrK+m3IVJLzlT7dqG0Hpb3g
 b/LBORD3edeBOJ64nyYAFVmqOAL3f4Kr2poaWo7J8w2/KXH2H0z1s/5nFAQRkZWBxB/i
 RRhgSYX6gdLi/EiZV4YNjmkuQ6c2GKg3FYcI34xsnEIcBoMFBjDPgmUrxiNvFiGiGjQz
 MIk20mr4S2bZY6H3YlLyMVAcmZbIJaxNWOlJEigJWIb2iAkbv1xj5l9Ew7L1Eh6oVLph
 oFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIU1+pzOEqhA9i3KvQhwnkFnGoZA70Rr7h7wCQWNREk=;
 b=tCsAc9QklPJbV1MYMs3InXcF7KnCA40WVHRcrpOu5GFX9EbfnKdRas0RsYTZU/GJpz
 60xtJmxcktQTZoba2JQdKIDUJSt5ifqq+axEWP+P2ATmYFI6is9bLIy2Jd0Q4apWTReN
 QxhoYfi10/+ZxeaN4Ga+v3XjTaQttVm5wzK5fKLMD9qHMVhDRuMGBmZQbP07bYBGQszz
 A+bQTtvtji1gYN+DNHaiXeKXKq//AiDl4JDuVwK1sxZTWbYqSkkSAaUx8SORUvCCVx11
 Mj8KpTCGXoM5X5RfNWmALKDH10b++faM5wLvNDIfXaRKh/P7sw6Z6jcxiSGPT1udXeom
 vTYQ==
X-Gm-Message-State: AOAM530/sIrJLcPAVuGgw+hbap18bv5azPMkzGItOesCf42FMNrZ1+M0
 qYEQ6sCHp68ymvs3UlUjUhZzSNBdMsY3fQ==
X-Google-Smtp-Source: ABdhPJzLvuD38YEBXpOAWKr/5u0bmuMtpdmsiXr4KZ/bXX42L1MK3jJOZruVL9B8E3gICbeY9VjDRg==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr3967409wru.268.1611918024392; 
 Fri, 29 Jan 2021 03:00:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/46] configure: cross-compiling with empty cross_prefix
Date: Fri, 29 Jan 2021 10:59:36 +0000
Message-Id: <20210129110012.8660-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

The iOS toolchain does not use the host prefix naming convention. So we
need to enable cross-compile options while allowing the PREFIX to be
blank.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-id: 20210126012457.39046-3-j@getutm.app
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 8549c7b5ebe..997d83a2ad5 100755
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
@@ -1691,7 +1693,7 @@ $(echo Deprecated targets: $deprecated_targets_list | \
   --target-list-exclude=LIST exclude a set of targets from the default target-list
 
 Advanced options (experts only):
-  --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]
+  --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank [$cross_prefix]
   --cc=CC                  use C compiler CC [$cc]
   --iasl=IASL              use ACPI compiler IASL [$iasl]
   --host-cc=CC             use C compiler CC [$host_cc] for code run at
@@ -6290,7 +6292,7 @@ if has $sdl2_config; then
 fi
 echo "strip = [$(meson_quote $strip)]" >> $cross
 echo "windres = [$(meson_quote $windres)]" >> $cross
-if test -n "$cross_prefix"; then
+if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
     if test "$mingw32" = "yes" ; then
-- 
2.20.1


