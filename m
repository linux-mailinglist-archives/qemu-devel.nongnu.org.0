Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D66A016B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:16:29 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2wsF-0006Zi-Ui
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wkf-0001Qk-74
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wke-00040B-7C
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39189)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wke-0003zu-1b
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id t16so2253865wra.6
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nivVSlDU65EgSfsWdJ1G12DLQkbSJ3s+gEF3tX+aC1s=;
 b=py9YMoJELZ2+efaljXnmSBX3QzS9VlqlnQ/OHB6EZYhfsEVqBVaUKLBPUKNYZLOqa1
 /Szt/HTJKIDPm6Ey2MG339y5LklhvXmLHNc/PyFrZR1FfElhj8HE1/ytIYGbpzgUBKWl
 wz6HxCVBZS436VtVhyAFgtZs3CMfsw/tQhmnTLe6qgmJZd+WZKufK0Kdfq1xmAeROavW
 H9R1wrBrlO+UNINs1Dt3NqF+B6ojcad48h9FtTOX8olFkDQZvJdQ9zmG1MJDNYzAGhce
 pb8viPUGeu0p48ieBUkXjXpxCCgd18FAYPD6sIfOY7GJu3anHhAU1gisPXyMS2PJIwIU
 tbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nivVSlDU65EgSfsWdJ1G12DLQkbSJ3s+gEF3tX+aC1s=;
 b=R+xBLMpcs9Nah+yMlLrih2RWvaI3BxTk1Z1FlZz2v8Ymy0iYxk3kHqVzXywUnpSYPZ
 N3VneFyDaWtIxjPzXrsT/zMfCTTACNkanF9L7iDwIqnNlHSfu3SHva+/CGs9S9BUqTLg
 SUCgHVl2R1Ga08VrXIAK3e89XQe6ewoRo1l/0KMJddgNb6+OlD/GoLf20QXxytioaqql
 mtFsfhSWaSkK3kSHqzODMXpdKTU1Y4R3iEC3VtIRMbs0/q1/FDpLoAGTY3yhAkLP9HW5
 ZF9qv55JgZCr0RkH4Tsf8KToFQNjOMQGcL8ZXFR1LQU3fYL+WXlv09JEG1t9Z2stHWM/
 XlLg==
X-Gm-Message-State: APjAAAVuXbNPBVt+i8bG/QiKP4IHPW8ipLC21+AqgigDWr40peenKlX0
 /sCnPLmQPtwbtuZkLSCDdSXWww==
X-Google-Smtp-Source: APXvYqxyDbs+sTQfgNCz2l8Uh53CyNlapG+G2wUktWSaXX9AW2c0uj2Sc87q1R8wqoEI6QOMON+e5A==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr4320873wrv.39.1566994115062;
 Wed, 28 Aug 2019 05:08:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm3239295wrw.87.2019.08.28.05.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:08:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A52EF1FF8F;
 Wed, 28 Aug 2019 13:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:08:26 +0100
Message-Id: <20190828120832.9208-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828120832.9208-1-alex.bennee@linaro.org>
References: <20190828120832.9208-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: [Qemu-devel] [PATCH v1 2/8] contrib/gitdm: Add armbru@pond.sub.org
 to group-map-redhat
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Just to get the (few) accidental uses of my private e-mail address
attributed correctly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190822122350.29852-3-armbru@redhat.com>
---
 contrib/gitdm/group-map-redhat | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-redhat b/contrib/gitdm/group-map-redhat
index 6d05c6b54fd..d15db2d35e1 100644
--- a/contrib/gitdm/group-map-redhat
+++ b/contrib/gitdm/group-map-redhat
@@ -5,3 +5,4 @@
 david@gibson.dropbear.id.au
 laurent@vivier.eu
 pjp@fedoraproject.org
+armbru@pond.sub.org
-- 
2.20.1


