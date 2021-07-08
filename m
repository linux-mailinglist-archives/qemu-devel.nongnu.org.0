Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB873C19F9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:40:10 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZsX-0002uj-OT
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWX-0002UP-Ag
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWV-0007WR-Av
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so4718319wmq.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsQYMRRF2LqfhugUabYWk+fOdkK5koC/O99HVRocaM4=;
 b=pCz4A9NJWowAynxUSrtpUYDoeS28bf/Ieu6JbCDk4I0/0sMj/N136MH5M1l76egiRi
 aOgDD7QXGeRTqponQS/jUYzc5wSpbdD9IFO0iy77yHI6z4gcCST2Er6T/iCP4OuXB4ov
 uMQZ8Nl3yq+kAe6I1SFNoYAT19x232UaWk7MRHEcpOSEgSPfRpG0yc7n4FIkC+k2RkzS
 XBCO9RdrreY3MphR2WBf55X8BlADYsxa9veT7VoW1g/web8NDgfs+O/FOO+6W4UoLv1m
 nn1cevFKaDWPx8TtIsm4rENf2cgur29SxnGr/uCM74KSR52h6OvubSF9aQF9hPivX0Di
 hXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsQYMRRF2LqfhugUabYWk+fOdkK5koC/O99HVRocaM4=;
 b=fsfsfEMISqvgaRLVxBSbxdE18UdLoJMVxLOrPZPvTdNdqk9+V7JJNVaNIZWzEkgIbC
 l87Zg7cUSl3m88dll8TLcvF0tZhBJ7sL9kYsXXR1zCItCLYei7//NtuDaw6njhVS4cix
 hOk8xt51T/GGOyN1UuNUJ3IlP1TmXGYiljd57AtGAahGsxrN4IFYia1JFPj98Qiog42W
 j4nO3Au6NVUdTwiqak5b5PCuutzc5ZyHvtGSyuo9tUGSMpt4/gSiJm8ieZAp1eJsuryE
 iVJG+1MLtK184deWe1vLt5emS7gj/Oydb48+D6Spq6E9XfEeWROkVyDTlP9ccdmFavQT
 bIJQ==
X-Gm-Message-State: AOAM533adOeR9OYrHZkbLNMNGjEoxBD2lKdGW380Pq0IwCWl9vEOYeft
 dF6WmKqbzlBK68T9IzXyTQvOYA==
X-Google-Smtp-Source: ABdhPJyZjeZJgLzwkTofBrhwAduYxvOInI7/4pL0CRjOkcOXRvGN7eSYCKl9y1yi9HfwZ6vTEvCDLA==
X-Received: by 2002:a05:600c:3b90:: with SMTP id
 n16mr6904678wms.70.1625771842018; 
 Thu, 08 Jul 2021 12:17:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm2961276wrx.59.2021.07.08.12.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A36D71FFAC;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 24/39] tests/vm: update NetBSD to 9.2
Date: Thu,  8 Jul 2021 20:09:26 +0100
Message-Id: <20210708190941.16980-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: fam@euphon.net, aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com,
 Gerd Hoffmann <kraxel@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, minyihh@uci.edu, cota@braap.org,
 Reinoud Zandijk <reinoud@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, berrange@redhat.com,
 f4bug@amsat.org, robhenry@microsoft.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Ryo ONODERA <ryoon@netbsd.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update NetBSD to 9.2

Signed-off-by: Brad Smith <brad@comstyle.com>
Message-Id: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/netbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


