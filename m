Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F415C6A3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 03:33:18 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi7fZ-0002h3-07
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 21:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46459)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tcminyard@gmail.com>) id 1hi3vE-0007mx-7Y
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tcminyard@gmail.com>) id 1hi3uy-0001cD-2m
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:33:02 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46131)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tcminyard@gmail.com>) id 1hi3ur-0001ZY-JI
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:32:52 -0400
Received: by mail-ot1-f67.google.com with SMTP id z23so14988585ote.13
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO976jdjcFbYo6B4xUhDqG/yyhIQxVSBAlIMZVWwaus=;
 b=tq/6aN5DApde1qD0uiyz4tCJKoQdHyCm2ka4GFRo7Zdhy/CtMjJ7RRmrLsNY8c57Iv
 KEnqRmJCVoV9Jkxqe8jwZEFAx0H6Kck9+l37/pd7wJ8Xd59foClWR+X99WzVEtI3cpgm
 7sbfRM4fyEt8PQzshIcR66iYrrETIYAPnN1LD+EG/ySEvW9gp9KTMegmBwuHSs+4iMKo
 jRIOMOVcNc3UUczMd7M/SytLCpEzuj6Ytq7H9SoMfIeZriS8BX9pUrXs54jm2or5ZcG0
 5xiG5UM/ryLVFEf1Z8b4OFPEFB/B5PsXRbIIDo1wG2uoaPNn+pLiQ7pgjZyXZ1LoFd9Z
 d5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NO976jdjcFbYo6B4xUhDqG/yyhIQxVSBAlIMZVWwaus=;
 b=p3kfrfNUb94JsVAyWx7O0JIqPXf3ksXhu1P0xEW/SG8mShhwyWvBJp7decaHppCRkL
 14KPETtwmT9Z6l2j+vpUH1QNe8PG0tvhqCQo8k8uxOGRNUW2TVhAP5PddSLz8wASrb7h
 4f2EECYdmeWTJ2qTze813QwyIl0yR+cRcvj1vZSMs8KpW3QO763I58lgWZifTK0XQpgW
 tl8g/ctyY5ngKqk3HVzqZ7RBNplvTHZ8XNXmcvbbxcTLZS9cXw26SGR5W+ktPbc8gsTK
 JLggk1qxEKsvHm7eDT9IktZawpD96QGk3pMlyVdbCtiXo6fcGpqoSy7sFdNGkOX115D+
 QvgA==
X-Gm-Message-State: APjAAAU2/iToaI5QHzmAOmNlBTDP4j5a9tSpO0YSR5b9pQefZ+LDzRuo
 LnBhTRP/KFtIvmLAI1kQsI4y2Ns=
X-Google-Smtp-Source: APXvYqxeYgzwvL3CtC7Kr5Gy0G8bIVrz8yCcgE1J9SJ5A7b9w/PMkHPgUJ5XjJC5FTFrSS+TKm/e8Q==
X-Received: by 2002:a05:6830:14c:: with SMTP id
 j12mr20372450otp.181.1562005870918; 
 Mon, 01 Jul 2019 11:31:10 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
 by smtp.gmail.com with ESMTPSA id r25sm4088223otp.22.2019.07.01.11.31.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 11:31:08 -0700 (PDT)
Received: from t430.minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9997:a955:13ad:73b])
 by serve.minyard.net (Postfix) with ESMTPA id 9B7BC1805A7;
 Mon,  1 Jul 2019 18:31:07 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
 id 69795302524; Mon,  1 Jul 2019 13:31:07 -0500 (CDT)
From: minyard@acm.org
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Mon,  1 Jul 2019 13:30:59 -0500
Message-Id: <20190701183100.7849-2-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701183100.7849-1-minyard@acm.org>
References: <20190701183100.7849-1-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.67
Subject: [Qemu-devel] [PATCH v2 1/2] qdev: Add a no default uuid property
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
Cc: Corey Minyard <cminyard@mvista.com>, Fam Zheng <famz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Corey Minyard <cminyard@mvista.com>

This is for IPMI, which will behave differently if the UUID is
not set.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
Cc: Fam Zheng <famz@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/qdev-properties.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 1eae5ab056..7fd887af84 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -237,6 +237,13 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
         .set_default = true,                                       \
         }
 
+#define DEFINE_PROP_UUID_NODEFAULT(_name, _state, _field) {        \
+        .name      = (_name),                                      \
+        .info      = &qdev_prop_uuid,                              \
+        .offset    = offsetof(_state, _field)                      \
+            + type_check(QemuUUID, typeof_field(_state, _field)),  \
+        }
+
 #define DEFINE_PROP_END_OF_LIST()               \
     {}
 
-- 
2.17.1


