Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5753C2625
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:42:35 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ri6-0007ON-T0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdJ-0004cm-5u
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdC-0000AE-Mr
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id r11so7193402wro.9
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsQYMRRF2LqfhugUabYWk+fOdkK5koC/O99HVRocaM4=;
 b=AXYceRNDEgMmf7p8r8O9MlDFNaWM+9qmgYn5tmPh0fVPJgZPw2JcCR/DpUftBiZLFG
 6oEDaCVwEZzj1Vv6W6YN1GLKDMGNBkKYPf3grerhMqUBGcARF+he+ocEggAuA8llt1rN
 UYL7rgnc11d+Z40+TcDmn4H1wXyptsS74fNyyIMehtFPg3qaDM+h8S6/kvuoQ/Cv7Dil
 34NLaL3Arl0nDjJJUc039sxAG4/0rZW2twd1lu3a/w3OEIo/RczQ6WpWpSu0THu/CrWS
 uR1okzi/slFVDGPBrrJ4wquPCMDs/58cUHkW1ABlRyp7qejklD0rB9N4irMlpdf1HdDg
 Tbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsQYMRRF2LqfhugUabYWk+fOdkK5koC/O99HVRocaM4=;
 b=jCAqoaCf2LsTzMrOStsZo2/ed/WcaC5KsyZpkJoBJIJ3ffSbjNdvPMKXyHUbHQ3JRI
 IMN7RFDBFkzHI5A2X4AHjfPhL6lDkCMm63No7eSL9MposJZZ1W9pWBYD7lhLp3PM30WA
 xebDRzOAjT5YMAiqFWn/tyZKggN9qTn7aSObA2sJRViY8ybNPcyNjW7wqXEWZyVFeHa1
 lC128/wWKW2BJ7qrlsGh1Mgc7REbY+2yyddc5qqed3MowulKUFOmKu7MbE5swPzCzLOb
 RTjUJnE1ktI/fOHNmr9Xn4el/ZPm8w6DkIhDYZoLIPx4on9o7zgyOWSVOMHWFITIFf31
 WFrQ==
X-Gm-Message-State: AOAM532lbDxHemBDQJhuehKSQfwVt3hZ2nc2D5KNlNt83Hc5KYTGYXGd
 TplnJTQ+jCHUf60Y4tRp93vG0Q==
X-Google-Smtp-Source: ABdhPJwhkUod1Qmj4Okkvjtn45Y3c0XdWodr0F38wNH6WyvIEXmSMQYgQf3oej3b5pib8BbFw1vv9g==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr40964293wrz.188.1625841448181; 
 Fri, 09 Jul 2021 07:37:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u16sm6544980wrw.36.2021.07.09.07.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 696371FFAB;
 Fri,  9 Jul 2021 15:30:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 24/40] tests/vm: update NetBSD to 9.2
Date: Fri,  9 Jul 2021 15:29:49 +0100
Message-Id: <20210709143005.1554-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


