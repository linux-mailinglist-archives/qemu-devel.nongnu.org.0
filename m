Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034626A673
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 15:45:18 +0200 (CEST)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIBGn-0002KX-9F
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 09:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kIBF0-0000d2-Rz
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 09:43:26 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kIBEy-00047b-K1
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 09:43:26 -0400
Received: by mail-wr1-x441.google.com with SMTP id s12so3340816wrw.11
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3HPCC0MZZSyuai8gEIkBJXGnA2ePMPxYUuI7TF7uVFc=;
 b=azVLxDLs1LP0fY62EVzbjT9i0X0iQwRHIz+uMGP1aaY3Cyy+BKyN71ud+Sn6CFamXB
 gOuOVtCGgKvp/+mTGqT3gamedoDY0KOf59Iavzqo2oxDbTlhyvZ9idIZpMXOw1kAX0E1
 ZHOv5NzHZhLs/9s4SPlUDttIJR0uhDN2vO4505GTFJL49PtXoY+zhP//ceuFtV5XZzfG
 FnfJUjZ9ZWRuHZoc3nhIm2UfNQI/JP+p/hqecflUQgb/rSvcl1NIy7PC0pHTjF00FWqE
 1qrg1AwEeMo9rDO6udn5fpHbSGX34KB35bzr6jM8RxDMVdAKtOXsADmvvYQpftJE3dqK
 OqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3HPCC0MZZSyuai8gEIkBJXGnA2ePMPxYUuI7TF7uVFc=;
 b=t1zaFdyYjNtEFBl+RaLBWrEN+k7wVzmdJxtPUIvIXV02Ih6MWX4mxzS+Fs3mAndf3E
 hBPR6bN0sfJRMoO93zEv1CC8Fv4DskLvBNQZi2L0sWCrHrSUKv4q12lP869yhcahhPSH
 ZyBoR1gfXYiLsyIZs6FVXYKzsOnqelfJ6BpWgM7qa1hIYNBO12+Xp+kEeKFEfDOzQdSd
 gn4FgUWwBk1UnOCKRfNpVmvbtk+ptXUILHxHhdHdkVqkygL8iZf/vRE1qrj6Wy5EdrlL
 g0EayVSwBS6I0RvAZErg8tMnuXDheCt33Zf5wwimdCnAVT5UfW+unLqxpz93mIWJFOsv
 ku4g==
X-Gm-Message-State: AOAM532WT1e4Ti4k7Go8hNFXPrcwc4ta4DKjVhnaN4b5tblEWrAN9hxK
 FuCw9RS3bup11K8t2mHTNcSSqw==
X-Google-Smtp-Source: ABdhPJxQtFSZVEcgn6su0pCmotZ4SGSfLZ1pNiNWoIa3qDw4/OX0OnD1Sh3Y4Qa2Me1G8MLMV4PMYA==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr22190159wrv.185.1600177403233; 
 Tue, 15 Sep 2020 06:43:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b188sm104584wmb.2.2020.09.15.06.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 06:43:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C5D21FF8F;
 Tue, 15 Sep 2020 14:43:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] configure: move deprecated feature processing to
 supported_target
Date: Tue, 15 Sep 2020 14:43:12 +0100
Message-Id: <20200915134317.11110-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200915134317.11110-1-alex.bennee@linaro.org>
References: <20200915134317.11110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the common point at which we validate targets so it makes
sense to add_to deprecated_features here. It will make future target
deprecation easier as we only need to tweak one list.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index ce27eafb0a9e..51d03a8d340f 100755
--- a/configure
+++ b/configure
@@ -280,6 +280,9 @@ supported_whpx_target() {
     return 1
 }
 
+deprecated_targets_list=ppc64abi32-linux-user
+deprecated_features=""
+
 supported_target() {
     case "$1" in
         *-softmmu)
@@ -301,6 +304,12 @@ supported_target() {
             return 1
             ;;
     esac
+
+    # if a deprecated target is enabled we note it here
+    if echo "$deprecated_targets_list" | grep -q "$1"; then
+        add_to deprecated_features $1
+    fi
+
     test "$tcg" = "yes" && return 0
     supported_kvm_target "$1" && return 0
     supported_xen_target "$1" && return 0
@@ -542,8 +551,6 @@ gettext=""
 bogus_os="no"
 malloc_trim=""
 
-deprecated_features=""
-
 # parse CC options first
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
@@ -1724,7 +1731,7 @@ fi
 
 if test -z "$target_list_exclude" -a -z "$target_list"; then
     # if the user doesn't specify anything lets skip deprecating stuff
-    target_list_exclude=ppc64abi32-linux-user
+    target_list_exclude=$deprecated_targets_list
 fi
 
 exclude_list=$(echo "$target_list_exclude" | sed -e 's/,/ /g')
@@ -7668,7 +7675,6 @@ case "$target_name" in
     TARGET_SYSTBL_ABI=common,nospu,32
     echo "TARGET_ABI32=y" >> $config_target_mak
     gdb_xml_files="power64-core.xml power-fpu.xml power-altivec.xml power-spe.xml power-vsx.xml"
-    deprecated_features="ppc64abi32 ${deprecated_features}"
   ;;
   riscv32)
     TARGET_BASE_ARCH=riscv
-- 
2.20.1


