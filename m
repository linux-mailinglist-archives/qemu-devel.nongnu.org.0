Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C088A3BE59E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:30:03 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m13sY-00041A-Rw
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m13qx-0002Md-2i
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:28:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m13qv-0002w3-GW
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:28:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id a8so2253477wrp.5
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+9pofhwI0LgP2y9BjnXm+IgQdjXYvijhpo7MOjpvKc=;
 b=KY7pJW4iNXOTvoSbQY0jpAQj1i4EgsvpgfmFsFKJwGJkk/+qVNo+ABSxjGTn757W0P
 i7b/NACYxyE0wRsbPnf/MMI6sf2a7t/Mqzpnmrwv8y3F/aS5KXD4Vnud8ZEIO+LBkHiu
 clmOZN72p08Y/IVYK7poav5ityce6QT7cbD8R/m0MIX8TWJX0VlH8P7C2Xja3RGnccfi
 yibaHNYrrGSgkXYTQ0sB2DmrMIat9Yvco86KJ1f+eE83RpxaOCoYGTzK0mCLseUd+aMj
 2yWJeW6CHmJrrX59+OAbB7G3n0+8ffKiqLNEui5gqCSAgSjnkj8mp8oI6rdGwPAUjH6r
 3m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+9pofhwI0LgP2y9BjnXm+IgQdjXYvijhpo7MOjpvKc=;
 b=G5cYK/he5tjP86I7q6nR7SBnAwr+PwAUVxpOHniOEXejb9sbLAToXO0Ow8zRiF8o2k
 YzzHnMPufKCim5SJkTVj6cLWIUUwp2VaZHqjJy5qx50aehUF0CB+C2U3W0QY8kHICJ47
 qQqup1BgBJmzfDJURCZkiE0shfcbFOvI9sIZ6Q1haGLvKX6rvdC5LfVhkcrjBNw0tIqL
 oYKzdRMMVMGPJDUMK9I41487M0UrM2Spuys5N9mFjUUink42dDo93IkdwaT71wZKMZr5
 kDOb6OcQROlhwO8DSs5tnKq5hX50JBOYWJZtwxisH1UKWksnZi9NZQdaV627WNCrPpfo
 JQwA==
X-Gm-Message-State: AOAM532/ORUofO/lj4mRskWy8vgPMcBkjZ4mTqZ13dirCCZijbEfbG6U
 M0DcdFl6wd0JtQlPh0ZZHUBfdfH71ufI+A==
X-Google-Smtp-Source: ABdhPJym/QZEWxvWM5LxUdBqwiP9kWjM71HxAnqliSTRvWs7gicfRGJUXtSg9iZoYUb7q0q6Kp7Z3A==
X-Received: by 2002:adf:d1e7:: with SMTP id g7mr26941595wrd.142.1625650099336; 
 Wed, 07 Jul 2021 02:28:19 -0700 (PDT)
Received: from localhost.localdomain ([41.34.58.202])
 by smtp.gmail.com with ESMTPSA id x17sm24246390wrn.62.2021.07.07.02.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 02:28:18 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] MAINTAINERS: Added myself as a reviewer for TCG Plugins
Date: Wed,  7 Jul 2021 11:27:56 +0200
Message-Id: <20210707092756.414242-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623125458.450462-6-ma.mandourr@gmail.com>
References: <20210623125458.450462-6-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
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


