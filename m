Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC7A12BF8F
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 00:16:30 +0100 (CET)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilLJs-0000tx-Ue
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 18:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFN-0004N9-9K
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFM-0004EA-8T
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:49 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ilLFM-00049o-1J
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:48 -0500
Received: by mail-pg1-x543.google.com with SMTP id k197so16259182pga.10
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 15:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PF+g5iRIalVK0WWT4QVZhxCNUDOljNoF8r3HMmqZ1Wo=;
 b=QoXKUpyI2UZ+LBfWCwgdMO+RBQji8wDor0rMyCFRBkaZG4uo9kDJsYxIUjZD4S3qLg
 /vreV2Xwpks++FX8DjzjJZcodlP9R4kvbJKU39NkOrl1xnY4lpaDPcWQOD4vouaWoShf
 IhoW4xTBaeHpQfMNfU6l5wf7sqzI/26l2BKZlv0OeZAg8WelUEfPyHV+yTE27Cfx6niF
 AhC5SDjlLaqThsGOjF95b6gvac3/G7Q2eVbprWAyNAcMyGpnWQim+hE2slRKd9mtqtEa
 YE/MJ0vdxP2LLEvs4YBpPnyWDEv5gtOFUPcHtPCjFv6EiF90CQ9WEC463JDpc02jiFPS
 ELjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PF+g5iRIalVK0WWT4QVZhxCNUDOljNoF8r3HMmqZ1Wo=;
 b=T88SWfRaHpX6uwzLhBdKBkih18atXyrzgWgYvFuFgVPsy0tL/qHnCbHAk6BU7iPJBf
 5h6RKa7jxCNUm6O+VbWer/wT1Vzml9y8/Ce3cR3ba8gyODgKRbEgJAXq0cpTxgGUGg4r
 9P5P+LEJKB/ksRm/MB2KlEEw5rWuHOVT9DYXtfWsY/n8x5H4hCz48ffgQFotdkskUQV9
 iG0A1zQFZY75WC+P7/N+cnPbh/6VzbYoOH2Eqh+QteTnrnZmarCQXguzg3LztPzopPTn
 en8mDnzr38ZIlJIiSyQHKX2CcLc1JN/Bf+4TisNmjbHfvDwHFml3zI3subNXInDdkgYm
 v5IA==
X-Gm-Message-State: APjAAAX09Lt3xHzh1C9WmNnV0f3CIvMswSAq/HpxWRN5O5Yv3aHSW1+w
 /pmTm1AfyqUmzucMG5X5HtkQxVaAEwk=
X-Google-Smtp-Source: APXvYqxM1XlDxe9+3P9To9d/BBMyndFNhHlLeIddgEzfNOE8Sy2sTVKND7E6xI+4vYQuWJ4U25TnjA==
X-Received: by 2002:aa7:95a3:: with SMTP id a3mr64418153pfk.193.1577574706959; 
 Sat, 28 Dec 2019 15:11:46 -0800 (PST)
Received: from localhost.localdomain (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id c18sm21077186pfr.40.2019.12.28.15.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 15:11:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/29] target/s390x: Include tcg.h in mem_helper.c
Date: Sun, 29 Dec 2019 10:10:59 +1100
Message-Id: <20191228231124.18307-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191228231124.18307-1-richard.henderson@linaro.org>
References: <20191228231124.18307-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code movement in an upcoming patch will show that this file
was implicitly depending on tcg.h being included indirectly.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/mem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 2921419c27..20a84b3912 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -27,6 +27,7 @@
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
+#include "tcg.h"
 
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/storage-keys.h"
-- 
2.20.1


