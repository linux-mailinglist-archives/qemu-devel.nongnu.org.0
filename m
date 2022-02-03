Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F704A8DD8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:34:04 +0100 (CET)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFinr-0003uX-KX
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwd-0004LC-Gg
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:03 -0500
Received: from [2607:f8b0:4864:20::1036] (port=56153
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwb-00062M-AC
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:03 -0500
Received: by mail-pj1-x1036.google.com with SMTP id d5so3367823pjk.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XC3pRaBxZcx/aNR8idtiZvbZFaRNA49SwULDyOLq4Xg=;
 b=UTFezsrBxTGNjNk1jlZgwd/rjVrTXNGVMCno29Q9/fNmlE+6KlCVZG+IgulMUimVy2
 vAOwAS+rM2z5OkZkfYmW59iu6u6xOiIJXUfGXJqXI9tZK10PxIUGGBD8uFvWGvBb9cwf
 SBmrUVeLwoeToEzJGSC60cnMHr9Xwut132Z4NYEVuTo0bSAu8l0/ytbB27tZCoPhQCs/
 tdZwCW3IVjxQCRPZJeMlchza40kqNzTbl2fKdaPMnCgN8i5kk0ajKDr5l5AzzvoLX68f
 9tQevpYeyxVz2OnyxK55NOIOwtvj0xlzTz/AJvTH+0Zu4s3lWwK099ymhBV7xsVb8juq
 Ey2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XC3pRaBxZcx/aNR8idtiZvbZFaRNA49SwULDyOLq4Xg=;
 b=xXWbYkweZLyomyku1b3SovPmJA3dEY2rVQEhjnuZ57ErF1AiUqn77wyAbowLh6QHcW
 mgOsmXRUTV5bSoX/1gLnzDcaiMmb4KKjszUZRIjvZnx8ivawnMrV9jqFjooAOUyjsGXX
 odAjeaiVkMaYBRLA/Wu1udmpQ0+oAp93HvCd/iJ5dKcZUrJRxRxbCfPDk/GrCSgsdvJm
 X+f6Nk6DoAObeKBe+vz6xJjJ19oPwruiMT6gGn+uOajhe2SBflPjWhlZigQGqbzRFXfz
 7JzoZlMBdRkjm1EBemhypz6iJIGiKW3hsSjc9MtWpsfEsP4DjvPo4FDhq4BFhlkM8iOd
 iuvg==
X-Gm-Message-State: AOAM533gZZ/rGnvPFALFw1GNjmIIoTNRPSeOdCR3Js5cLLiFjzzKO3gf
 byMan1gpmLIyy8mktY74TvZXXCDHppk=
X-Google-Smtp-Source: ABdhPJwvaCssbZyZAKsElVis3vRSJ9X+HzixaOlrlloiGzKgaNT0+uBf1RE9ZmGc3jfgk23mT5OJCQ==
X-Received: by 2002:a17:902:70cc:: with SMTP id
 l12mr36701600plt.83.1643917136684; 
 Thu, 03 Feb 2022 11:38:56 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id e19sm7594393pfv.62.2022.02.03.11.38.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:38:56 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 06/10] exec/ramblock: Add missing includes
Date: Thu,  3 Feb 2022 20:37:59 +0100
Message-Id: <20220203193803.45671-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Add missing includes to avoid when refactoring include/

  include/exec/ramblock.h:26:21: error: field has incomplete type 'struct rcu_head'
    struct rcu_head rcu;
                    ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/ramblock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 664701b759..6cbedf9e0c 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -21,6 +21,8 @@
 
 #ifndef CONFIG_USER_ONLY
 #include "cpu-common.h"
+#include "qemu/rcu.h"
+#include "exec/ramlist.h"
 
 struct RAMBlock {
     struct rcu_head rcu;
-- 
2.34.1


