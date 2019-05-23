Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14E274A5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 04:54:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTdry-0007ze-Do
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 22:54:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTdoZ-0005Qx-32
	for qemu-devel@nongnu.org; Wed, 22 May 2019 22:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTdgf-0001rV-Rt
	for qemu-devel@nongnu.org; Wed, 22 May 2019 22:42:34 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:45837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTdgf-0001r9-OB
	for qemu-devel@nongnu.org; Wed, 22 May 2019 22:42:33 -0400
Received: by mail-yw1-xc41.google.com with SMTP id w18so1672540ywa.12
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 19:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hJlj0a8T7befv3zY0YqLNtddqSz+Zz6qoIsCXjt90zc=;
	b=KUeoFYkONNWEXXoOoL4p8rNYvG+crmpzm9fBPDSuRXJ31OPkA9RS7Ru875ij2ZtR0J
	HTVdmIgqEoTPBRKcVdSnv11wa6eytshy2ybGP6Dlz8QmhHEhCvOxpB/6oV0NDqIWVUGd
	LIqCSOOx8xYOspeVb14tsRFWmeyP1lI51w7uwXHKiioX6Qrc8CbkihMXKl0GRWQRkFTU
	MR9wQXxtBEgJBbpbhTj078QlpKWlrYt2ETDh2vwSqc11FaMrDAI1PdaEknsYLydtRUpk
	ehoejxfS2Bw8KYH050jXXO7XQYROco0MJ/nJP14P7Jwrxtzt6u1hgIbsdYVyhkebt8oM
	GydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hJlj0a8T7befv3zY0YqLNtddqSz+Zz6qoIsCXjt90zc=;
	b=RvlI+xDVPGhmtzPNrUCRbsX8hPkESQueYtGzCyyECc7pzd0smS15paHaTGzfYepRbz
	8pCp18yxfTpTn47uyHDZmikCN1u6rGAwsxwOUbIhan5BzGLLlEF7BHgUkHxcIZfu61zu
	p2qsg0M07N6bBvkPn6hvR67rrS3c/f4m/XVil8++EesKl5EN/g2S7tA9Fd2376Fczz8Q
	XKhkLFttCpiTVIco5eukfDxbuu42YHq6XD1S9ATqgBUErID7+QxtpKb0u0cBW/Y7o79t
	0VCLK7/CKCPh2YsMe7O8iJT5gWrZsIsjF1af9gzZKbj2/7w8X0WbKBo3s+veU3N05z+9
	lFcg==
X-Gm-Message-State: APjAAAW3VjhKHLTEvd7HA6myAUWr06oxybszKM85MpHNTDc6UuZUhe9l
	rrdkT3y2RTzPd4DDtm8RNktOVzDvfO4=
X-Google-Smtp-Source: APXvYqwwkrMPYF5OXZbpvbZI1pk/1VBuHTOimUBJJL7PXPN4Ktt8F5DKkK9twyASs3EdmSZCAurE9A==
X-Received: by 2002:a81:4d42:: with SMTP id a63mr27652804ywb.346.1558579352684;
	Wed, 22 May 2019 19:42:32 -0700 (PDT)
Received: from localhost.localdomain ([71.46.56.17])
	by smtp.gmail.com with ESMTPSA id
	n12sm7559320ywn.81.2019.05.22.19.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 19:42:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 22:42:27 -0400
Message-Id: <20190523024229.1158-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523024229.1158-1-richard.henderson@linaro.org>
References: <20190523024229.1158-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c41
Subject: [Qemu-devel] [PATCH 1/3] capstone: Adjust include of capstone.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v4.0, capstone.h has moved to <capstone/capstone.h>.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/capstone.h | 4 ++++
 configure                | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index e29068dd97..90631d84a9 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -3,7 +3,11 @@
 
 #ifdef CONFIG_CAPSTONE
 
+#ifdef CONFIG_CAPSTONE_CAPSTONE_H
+#include <capstone/capstone.h>
+#else
 #include <capstone.h>
+#endif
 
 #else
 
diff --git a/configure b/configure
index d2fc346302..eec7f061c3 100755
--- a/configure
+++ b/configure
@@ -5021,6 +5021,9 @@ case "$capstone" in
   system)
     QEMU_CFLAGS="$QEMU_CFLAGS $($pkg_config --cflags capstone)"
     LIBS="$($pkg_config --libs capstone) $LIBS"
+    if check_include capstone/capstone.h; then
+      capstone_capstone_h=yes
+    fi
     ;;
 
   no)
@@ -7197,6 +7200,9 @@ if test "$ivshmem" = "yes" ; then
 fi
 if test "$capstone" != "no" ; then
   echo "CONFIG_CAPSTONE=y" >> $config_host_mak
+  if test "$capstone_capstone_h" != "no" ; then
+    echo "CONFIG_CAPSTONE_CAPSTONE_H=y" >> $config_host_mak
+  fi
 fi
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
-- 
2.17.1


