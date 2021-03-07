Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070EC3302CE
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 16:59:10 +0100 (CET)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIvoC-0008MW-98
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 10:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lIvmi-0007Tn-Cy
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 10:57:36 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lIvmg-00057y-Qj
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 10:57:36 -0500
Received: by mail-ot1-x341.google.com with SMTP id d9so6788132ote.12
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 07:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4z26GNk4RH+nN5Jw/9Cqpcfexl9aeBWkUx/tK8wFtk=;
 b=zDto9yggGguJ2CCZaSKnJ/PwWj1R5/cKwzhKUv/PABUpZHHJahH/LVPAfFIOsZmnDl
 l2Ka2poKWRLU2F2z1LUcXpsSOzCphh8tvw+3+rweOpmJVc8If97b8b7pypy9qhWNpaXF
 a+h3JFa6u6E98df8RKhsWXIwVneB3KMtS5cqnCK881xjCIu8jQswdD/+3kf3jNcbfNp9
 vT5eDALzKt7HNU+rJkQnZ4dT+9roOAlG4AoLRSy4MSTaCmX+rjkO/JvAZRVNqT3wEbrU
 Hu5R1wWnfyB1W7AePEgjHNjVJH98MqPjQA2JadXYWK86Wyw7iUda8E589VC+elMu4JRl
 qtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4z26GNk4RH+nN5Jw/9Cqpcfexl9aeBWkUx/tK8wFtk=;
 b=lOYj67Tn6SfW7ZRZPm7/8H/szVyRcAIDcJQfEbk+pMN1Y0AIGHVvuE790QvKp3zv/4
 PO5WZXiesMbMJ0CsA8LLKUENtu3Za1eCG3bIQLdDR8Z4psqJmBIWgdEB8ZAc3GwwrhvW
 nGvEhMOcAJul4bG4KVgMsusR+AR/R+q+Yj96LBdJnLBkUmG62SewSJ3rVLYbRnE1VKTx
 KyrAlQsmoaxS99vV7MSWiPf5u/JAB2DEPOrgoqOqgyW6T34NEe1NAm6K/WwManqI9qpO
 WhXjb+WZy9hSI5ZVKQQH5/CwoQ3+i+O+D9Rz0YIUctpShR9Pj13Hfi9sdULa1xDGkfL8
 4TuA==
X-Gm-Message-State: AOAM5325g69hBoXC73czWNow9yXOgeqBk8Rnplx/AbG5HnWuBH7GHKyA
 MAz3bJDGhd0lBbGVvn/jjSa+ZioqjCXfMYH6
X-Google-Smtp-Source: ABdhPJwdKa9OG+a9xQ2hHCLlXYVmLPYfb78EteeBKkDcO8omg90Spv2eSfyoLNDFtDeROh+rtAhMiw==
X-Received: by 2002:a9d:6081:: with SMTP id m1mr11615209otj.38.1615132653534; 
 Sun, 07 Mar 2021 07:57:33 -0800 (PST)
Received: from rebo.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id z14sm2170468otk.30.2021.03.07.07.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 07:57:33 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] FreeBSD: Upgrade to 12.2 release
Date: Sun,  7 Mar 2021 08:56:54 -0700
Message-Id: <20210307155654.993-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210307155654.993-1-imp@bsdimp.com>
References: <20210307155654.993-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::341;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x341.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
project's packages will work.  Update which timezone to pick. Work around a QEMU
bug that incorrectly raises an exception on a CRC32 instruction with the FPU
disabled.  The qemu bug is described here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html

Signed-off-by: Warner Losh <imp@bsdimp.com>

---
 tests/vm/freebsd | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 09f3ee6cb8..81389d527e 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -20,12 +20,16 @@ import socket
 import subprocess
 import basevm
 
+FREEBSD_CONFIG = {
+    'cpu'	: "max,sse4.2=off",
+}
+
 class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.1/FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz"
-    csum = "7394c3f60a1e236e7bd3a05809cf43ae39a3b8e5d42d782004cf2f26b1cfcd88"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz"
+    csum = "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
     size = "20G"
     pkgs = [
         # build tools
@@ -125,7 +129,7 @@ class FreeBSDVM(basevm.BaseVM):
         self.console_wait_send("IPv6",                  "n")
         self.console_wait_send("Resolver",              "\n")
 
-        self.console_wait_send("Time Zone Selector",    "a\n")
+        self.console_wait_send("Time Zone Selector",    "0\n")
         self.console_wait_send("Confirmation",          "y")
         self.console_wait_send("Time & Date",           "\n")
         self.console_wait_send("Time & Date",           "\n")
@@ -206,4 +210,4 @@ class FreeBSDVM(basevm.BaseVM):
         self.print_step("All done")
 
 if __name__ == "__main__":
-    sys.exit(basevm.main(FreeBSDVM))
+    sys.exit(basevm.main(FreeBSDVM, config=FREEBSD_CONFIG))
-- 
2.30.0


