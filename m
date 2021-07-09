Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E073C2689
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:02:54 +0200 (CEST)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1s1l-0007iI-KF
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdU-0004wp-P5
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdM-0000FS-5x
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id n33so6478010wms.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iU8L0Ap5ctGyeW1KGsFu33xRFiU8S734P5wZon43zrg=;
 b=USATmDvK/uTxONOdbabTC26Fmj5/GBiam8CmoKs4KP7VaNotEa/Z10JvRiY49szbCB
 njLAte/DLHJ2toV1Mt9SRBRFsmZZVgCd9kAXtUFviX7KpD7P9t/E5Xj83LZeqkK/gl8T
 Gn/OgArsL1CuKM3viLynnBiCcs1+96ixfhqIVObaBd22jlSdJycqCDZfLp2sbVtGeMBX
 8E+t9f2a8UV7ZFFzw5KNXzl4zx1qHJAMouJDG+TZDDxuoqz1ZuieyQH9AsflO/rGvA+o
 mpmT9K7eseDYbHaaUvI28W55M6WB2rt/JkAlQB1E5tqwl4DhOqZPmUxliJ0Gtez8tKYi
 cVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iU8L0Ap5ctGyeW1KGsFu33xRFiU8S734P5wZon43zrg=;
 b=s8UK6hIX9Jr5Mvzyk4vcSt48ZvMCEQP/Lxm2opegSxBbAlVKTvjHF+C3L3/QqObVw9
 akWY+L7zuhFqB0oumrqeOcOLzPKxG/BCSu3a6np1FmIeGz281FDXBxyV9OWXnQ+VHzI5
 BQHYdT0s7Sh8vKvd2DfC77zjYClS3N+GWhw/Ck55o6LoOyc4+K6upbNBVAvuJdh1rADI
 J0ojaLexxiiU+8YYFxYFNC41z1ou6WFWA5fhLDy1hTmqP/rQybTByXwG1FI2KVrTlF8V
 MFXWEvur60F4J/Y49GVk7KdWuojxj0e7jMKeHGvn926sdPmXYqW4cYsCKCuAP6o8t/28
 61xw==
X-Gm-Message-State: AOAM530vl8v7zvovg4LU719zQO4m9zmmPuyRl95QqDGBn8GcE+0DxGmv
 Kut6tjOyi46rxD8BOTm8OGQ/jQ==
X-Google-Smtp-Source: ABdhPJzGMmPclr84EYLLKeOU0krj3aS6BS381TCBoi1fH42apoORpRkyXosJDGy+A6eW7fHdFys38w==
X-Received: by 2002:a7b:cf03:: with SMTP id l3mr16307679wmg.110.1625841458455; 
 Fri, 09 Jul 2021 07:37:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm11329561wms.0.2021.07.09.07.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2DE91FF90;
 Fri,  9 Jul 2021 15:30:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/40] configure: don't allow plugins to be enabled for a
 non-TCG build
Date: Fri,  9 Jul 2021 15:29:54 +0100
Message-Id: <20210709143005.1554-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - error out after all options have been processed
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index 650d9c0735..7f906be68d 100755
--- a/configure
+++ b/configure
@@ -1098,6 +1098,7 @@ for opt do
   --enable-cap-ng) cap_ng="enabled"
   ;;
   --disable-tcg) tcg="disabled"
+                 plugins="no"
   ;;
   --enable-tcg) tcg="enabled"
   ;;
@@ -1563,6 +1564,11 @@ for opt do
   esac
 done
 
+# test for any invalid configuration combinations
+if test "$plugins" = "yes" -a "$tcg" = "disabled"; then
+    error_exit "Can't enable plugins on non-TCG builds"
+fi
+
 case $git_submodules_action in
     update|validate)
         if test ! -e "$source_path/.git"; then
-- 
2.20.1


