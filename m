Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8A12475B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:56:20 +0100 (CET)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYsF-0002gr-3E
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3p-0007Fu-2E
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3n-0003C6-Jo
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:12 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53453)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3n-00038q-Aq
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:11 -0500
Received: by mail-wm1-x336.google.com with SMTP id m24so1554742wmc.3
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hQn5BCLt9ly+0ISKdp5mviL+DCI+GuaIKgSx0WHQgTU=;
 b=rc1uwZpRhdqIDpd+HUK9tFWpL2f4o2J0ob2s0kE8re2YXkm3T2Lm3dJYzq4g7ySjwu
 yNRKpjSOlX9LyojW/9sPASj9rcaYvGG7A0D8qgRWOYgAw8fg1XbLggtvm85IJLjuwis8
 h+4Y4lodne7cp8CT7jChkezTKyVMoFmZE/enBy0+ffsmCVTqY5PAHesPHBHa6YuUBuxJ
 3c9Gayf6bI7HT5cTs/cPno/3YW33sV1Fjo3R1T4VsZS6SwxnNN939wZKeJjI9WtQz6UX
 vIHHd8uNUa4iI0d9Ifp9FEVEKQIrjhv2WZwMmP5qQA3Bp07mu2GgLJr3eevqEAiMxnzC
 BxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=hQn5BCLt9ly+0ISKdp5mviL+DCI+GuaIKgSx0WHQgTU=;
 b=t6gm+b9FPrh4TLXDOhsVpN3UtT/bcS/LAoxQTPQmkOXsJSdzV9AB75zUUSS4tC9Mee
 6kymccL95gQYogdKUyzLj98vhvEi6CasjyVLwSfcSgHw0zX4oDm+Mm0mJQ8vZ4NhE4s5
 QjmFtIwNugdnlJpJ7NQw2qZYO9Bd+RdWSztIEOJbbeQTEoeBZGil/HrO808kkqYYtMOH
 XuiENI5ox4cwx9yj2ayzj/qrjHWcdHVNLhi8wvR+Ye79OpxB3h/6l97+Kku24hLAMGv8
 4/vdQ5mxbzkBSn5kFdLOf76DQlf27vqLBTF4c3OIPjvKRX+4xBQge3HuZ5oWarESxw4u
 q45A==
X-Gm-Message-State: APjAAAVNBmPbHMRsQ8Hr+0FofxYK0dPp9W5lQ79ZGnJTP9YYpl1rhzW7
 GuM0vBS9zdUid9ZSGNZrder+2py3
X-Google-Smtp-Source: APXvYqzrDX6Q4Pky8qKO2JuqpH0k26VkKKncfhkIk6YhwyjSCqr3KzdNV7+JyYsyjAvdPC2SPQLqew==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr2798903wml.83.1576670650020; 
 Wed, 18 Dec 2019 04:04:10 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.04.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:04:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 67/87] Makefile: disable Sphinx nitpicking
Date: Wed, 18 Dec 2019 13:02:33 +0100
Message-Id: <1576670573-48048-68-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Turn off Sphinx nitpicking as a temporary (?) measure so
sphinx builds complete even with warnings about missing
references.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20190521122519.12573-11-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 531e955..6b5ad11 100644
--- a/Makefile
+++ b/Makefile
@@ -1001,7 +1001,7 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html $(MANUAL_BUILDDIR)/interop/index
 # Note the use of different doctree for each (manual, builder) tuple;
 # this works around Sphinx not handling parallel invocation on
 # a single doctree: https://github.com/sphinx-doc/sphinx/issues/2946
-build-manual = $(call quiet-command,CONFDIR="$(qemu_confdir)" sphinx-build $(if $(V),,-q) -W -n -b $2 -D version=$(VERSION) -D release="$(FULL_VERSION)" -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$1")
+build-manual = $(call quiet-command,CONFDIR="$(qemu_confdir)" sphinx-build $(if $(V),,-q) -W -b $2 -D version=$(VERSION) -D release="$(FULL_VERSION)" -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$1")
 # We assume all RST files in the manual's directory are used in it
 manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst) $(SRC_PATH)/docs/$1/conf.py $(SRC_PATH)/docs/conf.py
 
-- 
1.8.3.1



