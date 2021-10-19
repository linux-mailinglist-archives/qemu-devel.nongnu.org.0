Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF37433CBB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:51:40 +0200 (CEST)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsKx-0000ir-LN
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEt-000099-TF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:24 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEc-0000Aa-Og
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:23 -0400
Received: by mail-il1-x12a.google.com with SMTP id h10so19081058ilq.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RJ4bYCKRLbbeOm2Xoes9tKh+W8zRGO3Dbj9Y1y5Eeo=;
 b=H08R7LralMorM84z482c6GQdwivd+D2tGmWgr0++9SdPSEPgL+peRi3ZjnfQoF5t0i
 fc2Iy1YfeA4gzTslsHLQOJCMDPLCzUug1pxY8ukhNebfAM5mL4IbCGsuxT1wqcmN8paf
 zPXP+1PHbTAk//ogpKH9ghQEXsvWo+qaNgq4W9866agBi8fdP7qm2Cly7JvWgCaOlS1A
 yqpbsArVbWpg8iExCzBdFZ/PfkNJfb9Ts8QgmVY6NRDz1VbmtdY4iV9zLNFnXKTczXAl
 zZoXHeKhVe3RavwcStScaiTGF12iXCrU2+H1+MBMlZ54zrN8kYI1NtvDNwE5B6dyUVfA
 44lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RJ4bYCKRLbbeOm2Xoes9tKh+W8zRGO3Dbj9Y1y5Eeo=;
 b=PNHyG13ulSWI+9qdJT1OSZ2Wc36wyaL6xjpsKtTl59NO+CRzRmryA6xByS9sX/zuMY
 gKIA3M39vunOijYdiIFL7DKBnkrhK4fAu4defv/pv7wNolZP+we5NgSaL2EZEiSyU+by
 qg6xyg1305CuultdrshRC2PvZuY3jbJO48FHnzFkBsdYqJqshQhB82UIbslNSORLIXV9
 2gJ9L5SfYDzaiSEsSta556FFOw0WGZ8oxCxLpXmhIarU17T30nJqojwcihGOr/eVBXqK
 Qpo2d+LvlahYhMl4POON/f9nL29jj/S9rWq+WoX+Q6t90ZGDeoIo1XWh16H3baf+FHy4
 zpYQ==
X-Gm-Message-State: AOAM533+oUQJlYPoD50sGx/+5Y8szCGfikAYPZHEmmjjrQJJR4+8ZpE+
 Y8QT+eRxCi2mceNPUDVdwcWYRnhQShb4UQ==
X-Google-Smtp-Source: ABdhPJzVsZkl+FHfsBGSjTYIE0oi7p2PTYgnxsF0jIAHKxtRtqEakeRNSkbL30uDk6tDXsFzQcFQ/g==
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr19148589ilv.129.1634661905376; 
 Tue, 19 Oct 2021 09:45:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/24] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Tue, 19 Oct 2021 10:44:24 -0600
Message-Id: <20211019164447.16359-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As part of upstreaming, the include guards have been made more
consistent. Update this file to use the new guards.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_sysarch.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_sysarch.h b/bsd-user/arm/target_arch_sysarch.h
index 632a5cd453..8cc6bff207 100644
--- a/bsd-user/arm/target_arch_sysarch.h
+++ b/bsd-user/arm/target_arch_sysarch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
+#ifndef _TARGET_ARCH_SYSARCH_H_
+#define _TARGET_ARCH_SYSARCH_H_
 
 #include "target_syscall.h"
 #include "target_arch.h"
@@ -75,4 +75,4 @@ static inline void do_freebsd_arch_print_sysarch(
     }
 }
 
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
+#endif /*!_TARGET_ARCH_SYSARCH_H_ */
-- 
2.32.0


