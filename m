Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4623D3E55
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:17:01 +0200 (CEST)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ynE-00035Y-Iz
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygL-00060F-L0
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygI-0008HT-1v
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id w12so3036823wro.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Scao+Bh7w8SX+jhf96Akd4epzVkJ2ndPvPu3/f9QEno=;
 b=jUO9u0um0F8pU45JY339ggClUfecigg/q3lOqrf7zoa1Hzn5/0bXgSoNUnYRQkGjJF
 +Z2+TOR/BZ1uuxacXDPWfuj1qqJadaMQyuN7qgMUfBaCzEy+ELJyEzqvakLQ3J6HHxsS
 VbKlx/zMn+8sGNjLNChON9BQma85sQAHS3XDcuFtcc9wFM8BRpwE/bqLck0bDjDjGapf
 35T4PnwFV9HtkjHUlWwgA+Ae/McckE/hGhF1TqxTXH/WT/WH5B1GBoV/OJIy4CXlA6jL
 pe2nMZh1AIWbOe8jKULxiZkLVdzjuUDtXnkhIxekYDlIhJViOFaVLck0oV1aM0vL1Y91
 preA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Scao+Bh7w8SX+jhf96Akd4epzVkJ2ndPvPu3/f9QEno=;
 b=oh+MTy8vAZ7Ke2pRVVzfOolFvtXGC09J2rxJXlxERTc01P/RNa2MOml/S3nRXbY8au
 urvJAkwaGKOP/QVycc1mcEJs9qdOc20yAC+0VxFHJm+ULJNK+9fqCXaj44IsGHmgBuP+
 akBA9SeyFpt4Sb9U++JjD7loFGLqNH6+Ef7UeDgnjSHs5UE+hxF4GMLsgoyGwThbYkmQ
 bg8UjCDExiv6Nbr/XixPWZLzqHrOQNSSHcKVZQUxsRG0dUo/uQR0DleOiUAaoiOJVGHg
 8ZQg1dysGvYkK3IWKJdO7baFKOuU/LIf0MfGkIe86h5PPzlkUnoR5MQZ/1Qyjg6V+eRh
 +znA==
X-Gm-Message-State: AOAM532YznW9dqIGV+zxU5c6G0VepQgbRDvzOJSUu3HqIoOT8uQts8RY
 /Zho6YngT3a9v/4+MhLXVnXVvA==
X-Google-Smtp-Source: ABdhPJyINVac9SBA1sV/Ck29HD5PfHa7dmN0JkE4+LNzdzH9YbvhYuR0YmWujUfxFg0HcEH4xyfczQ==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr6654336wrx.114.1627060183978; 
 Fri, 23 Jul 2021 10:09:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm4854898wmq.17.2021.07.23.10.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EBA81FF9D;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/28] contrib/gitdm: add domain-map for Crudebyte
Date: Fri, 23 Jul 2021 18:03:40 +0100
Message-Id: <20210723170354.18975-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210720232703.10650-15-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 5ac8288716..e42861cd11 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,6 +9,7 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
+crudebyte.com   Crudebyte
 eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
-- 
2.20.1


