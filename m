Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1B3B1AAC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:03:41 +0200 (CEST)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2Xc-0003gV-Sd
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Pv-0003IU-EW
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Ps-0007uo-UQ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 p10-20020a05600c430ab02901df57d735f7so3922726wme.3
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+9pofhwI0LgP2y9BjnXm+IgQdjXYvijhpo7MOjpvKc=;
 b=pX8u9WmVxKMPkaUm0CRQsTP1a07TZSTa2KK4XVW+jNBNQG9xSC5BnF7+50P4gs2tpW
 GG7J0+lcSdAkPuu3vMnhWeI+n4I3ADPU3YYWgiyH5uBlc4WPn0oOwtDxpljNmPAJgX4r
 q05oTaaFGSPaA/QLvfoYOwFin89ONGWZhjXoGAN8GoqFDaA/VqbqHlmiEUvx/Zg6CFJX
 3pd2PYldI/hvY1v0NnYuB52jT2ilmaZ5BRA7rP2aQXR335ybRPPFao2KzfzQoOL8fyKO
 I5oMuiWqa6mnIetlToboc4zlenqg31o4ztwj9zekKMzA/YJf3X2LI5MYNMKYapcuLJqQ
 6k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+9pofhwI0LgP2y9BjnXm+IgQdjXYvijhpo7MOjpvKc=;
 b=s8iWvSP0T0qTk4rknlqZjmp/CYSHSCdcBoH+Rht27MxSA6Ywv+yXcS7qT9z8WkjBeV
 USF52XHzUh/uGBzDQSIjUKcdvBksChK2VCJDl3GKZBwflWcvQyLtVACPhThWO+xqsbuu
 YI8u98UkqNA0yA7AAe5UA6RwujOy3OERseKWCokqdwMm1X7w0DIGlmPtFYzS5bArykr9
 n3lMX4XwyUDrIkoGvkV42vyVYkXUGIBFtIUxw9VhDT6rMXxi/Psay3VQaBhl93Z4tvDf
 XNghXkOt4JuMIBCqKB6e4r2PS/MDZcJC5g8b7TEN4KnzPmKsaByUlDbUXtfzw7DR5Qyd
 BAYg==
X-Gm-Message-State: AOAM530NJKlY+zcD0PIUO5tAxM6P848/DocWflqn+Bz4qYMCvJiNqeuT
 7UJ590iH7EHFiGK6A7det3mDUUUyYnnd1Q==
X-Google-Smtp-Source: ABdhPJzOPyt0U33CHNKSimxI0ZpfLlXLS1XxsBk+Wk6WTREHFE3rh8AUtUNM1Nloa/7lzPzfmlfbjw==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr10909829wmq.14.1624452939495; 
 Wed, 23 Jun 2021 05:55:39 -0700 (PDT)
Received: from localhost.localdomain ([102.41.161.240])
 by smtp.gmail.com with ESMTPSA id c12sm3108461wrr.90.2021.06.23.05.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:55:39 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] MAINTAINTERS: Added myself as a reviewer for TCG
 Plugins
Date: Wed, 23 Jun 2021 14:54:57 +0200
Message-Id: <20210623125458.450462-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623125458.450462-1-ma.mandourr@gmail.com>
References: <20210623125458.450462-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f55404f2f..1c4970c88b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2966,6 +2966,7 @@ F: include/tcg/
 
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
+R: Mahmoud Mandour <ma.mandourr@gmail.com>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-- 
2.25.1


