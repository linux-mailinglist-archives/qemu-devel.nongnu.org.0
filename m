Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80983C8AD2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:25:54 +0200 (CEST)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jZx-0003wd-Vf
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVX-00042E-8x
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVV-00029E-Ig
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id j34so2160150wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIXQieiU1n2wbBaBGsT+fvpAI3roIc8wy4KwCq0DlPE=;
 b=y125fJFBKuKzA08CMx3GFOyuwIAugrQFInwEP72pu55EUjnffQ2AofLkwI0U26hpH7
 jHag/YxmXLjIJKx/PoscmkJKfEjvEEfEBYUMtEXlqhrEKObQoGV0pZUS4JIF3fHB3Rmh
 8/ONKD7yrosDXX+dcvZU356wKoLUcaX/RpYBdX1bIFvELteweQjuNeWYQ1hq7nUteO32
 bHnvEzbLE0S6Xrp3q/Z+zJANiY5Di7UuXa35aCM09XWS+j7554x+2nPJxYf4fN0lQqeH
 ng0y6HAsLYLpaVa7bR0AKS8N6HN9ymQ3mroat8AP+GgJZRSXuafjIKbAYa5Ll9lk/eWD
 3b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIXQieiU1n2wbBaBGsT+fvpAI3roIc8wy4KwCq0DlPE=;
 b=Heo7bqdARcMtHqdrfXMGXLzIdQfuoXbPprVRHhAY++nS0NUa0So6BMcQ5sQu6eQ0v2
 bP2bnZ/1i1yBj1Ghp0K4tflX3ll/Skk11RpbNVUusb04izt/lSSHQpMpzvu0JPcYiyQQ
 mGRqlymte1DR8amN/k0N6Zr4D+6yFdKrAJG7D4w0avEtGkAWXwA6RwPLDnX5/jN8flXC
 wYxgnlK1RiQpVO6GGCkm0/+EjivE9HQevd9V/DRG2Y2mHkR7i4bcPY7tdcUqH6WTFoZf
 Qly03eigodVBMEB2aKfA8UkgXie6BhAV7tvcxHKb4hgENfX46s7YGa/9DItuCL5pVNtz
 rxmQ==
X-Gm-Message-State: AOAM5304G7/BLf9Q9/jkDD7ioDKXHHQ9qhk+Azg07ar2+bn7yqXUZyNh
 0rhK7QAoT4wWPx2YatiIIlx3pmNJHKxklg==
X-Google-Smtp-Source: ABdhPJxanCPh7UN1DzTYK6Ij+ucn40talJ1QZ3jtjZf2xVDs0PQ3ISckNeTW9zshUfjoUIUqsfhgHA==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr12462349wmc.86.1626286876177; 
 Wed, 14 Jul 2021 11:21:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm3707895wro.3.2021.07.14.11.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF1CA1FF9D;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 14/21] contrib/gitdm: add domain-map for Crudebyte
Date: Wed, 14 Jul 2021 19:20:49 +0100
Message-Id: <20210714182056.25888-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let me know if you want to be moved to individual contributor or you
want to keep with the work domain mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210714093638.21077-15-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

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


