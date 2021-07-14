Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F5A3C8730
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:15:06 +0200 (CEST)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gbJ-0006Kt-Lm
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUf-00062I-MI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUc-0003oz-5h
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n4so1813744wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQsPUcmmvCXpidPMt9LFIQWrpqM/fEvzdVYo5rHypHA=;
 b=vC/qjBCR71QUe1zkw2uPvqccmvuGHAFUOjP/5VC2Kpxu28+5Of46dOooRaCzxZKP6Q
 H165S3BLQ3nds2DCMs4+Cl6VB08x/RQ4KgNgvQJYzrAkfSttOFf+FApBQt9oGQYp9boP
 +e1oQ+xOF/f0Nfi4CPRyOQoriXnWPvp7zc2LXcr+l+kUe0yzuFmBB1f3+6GlpJ22qnoE
 JEBpO5JIsSEyZSeM5qt8S28qPArHuBOG29wQXq1yQltpr4G8Yspl+xPQfmPT8wYZ9bCQ
 p6+NfLJj7JgIv7IKpRjz3T8Nm5fLpJ6YWs6f811LuAi4msvnUibmlbfKpesmDiR0egix
 0Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQsPUcmmvCXpidPMt9LFIQWrpqM/fEvzdVYo5rHypHA=;
 b=M4Of7Kkthj7cmcC+NoOk4YwOxdCSYJC1/Jwo5obW4uwor6GgYnW/kLJEMqb17DV+Uw
 c7kP1MrtZq2Z1mu+a2Gf0pdVtLiRmQZuEZHa0cS6pb9QRaUEqYzMn1Yj8Ob1mPWRtp1t
 CEyC9P5PmekyoFDmGxxvF6JF1928h8MFBKlqGXAjzgCG8Q2XMfqCwVQIdlKCUNMSXSb4
 rDWi5QYQMkeihr+9VwjzjXvqxNXDRCdGELpRi5ue/uRQ1MxFml+HhwhUOagFBLC5O+7Q
 QfPPeKcvOzr68J3ZkD7lRwGHdUfGsxcOY9uiSkLVr1SMTiueL6osjZlYxS5Ro9PBD42v
 hfFQ==
X-Gm-Message-State: AOAM532twVQa0wL1I5H94EIUxAHeImpT32TM9t+XbUBi6wZXcUSOAyr7
 ryXVzjisMqzCr8/K6VOi4M23aA==
X-Google-Smtp-Source: ABdhPJyk19se9+GfmC5ujFQlWFVCWqtehqiHSFVQxZlAI26Fsp7tqPxKJMqM50dZU3aHnhEq4paohQ==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr4670350wmh.69.1626275288795;
 Wed, 14 Jul 2021 08:08:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s24sm3375608wra.33.2021.07.14.08.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 99D981FFB3;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 26/44] tests/vm: update NetBSD to 9.2
Date: Wed, 14 Jul 2021 16:00:18 +0100
Message-Id: <20210714150036.21060-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update NetBSD to 9.2

Signed-off-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
Message-Id: <20210709143005.1554-25-alex.bennee@linaro.org>

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index b9efc269d2..4cc58df130 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
-    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
+    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1


