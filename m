Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C774E2ECDB6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:24:16 +0100 (CET)
Received: from localhost ([::1]:48896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSSl-0004DI-RQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOW-00086G-WB
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:55 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOP-00054a-Tf
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:52 -0500
Received: by mail-pf1-x433.google.com with SMTP id c12so3569198pfo.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dSi1f/7draldcvhbTcR9eZXnx6tBY5L1isM3ly1Kkz0=;
 b=sq3OhRk1G3iqYbJ0dy2FVZXox6yIFRHNY62j057jb6+/jqKNQpBJwn2y90Cn23rHEw
 /RjrjMSiAYis7nB9S/6sK9YI/5BTEtfyhHE51bmt407Ie4cn3AAd1rnQK2WsuCvQgxuc
 xwVQiIE9WExrDy8bSCa6O+owhhDByCAKojrl3En69ULwcvjM/IDJt/AoqVV10L4mIfCu
 DFNIJkloDKU24hIzZp66aaR2BDxAXhecPJ5PfiyC4edETkG14ktBv592S0pFMC/gQu6d
 379L0B3I1xnteya+SpkU7Rr46lRNa1s5WrLjqnJGi4O8BY6PjVwyuAL0T8/6z41rrrKg
 QrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dSi1f/7draldcvhbTcR9eZXnx6tBY5L1isM3ly1Kkz0=;
 b=f7UmKSZpYRbN3CV2G6nH3skCBfCoTdmBQ6kC4UPOAZKutyPrEEXYUjuQ7LNAZXvT1r
 yihJS18Es8XvjpYzX5sOPn2Qc87b3amSaWs9yrjnZ04UadjwP0mx3k3r5rtfdaE78hAE
 yUao9uAIS7b0cKmdnT7RlopJjxNXz4CS3y5epC6D7zyW13V6iCZlrzpkkSUziOvzscul
 fB2SJerTMETOjAChjFYIWk18ucPcrauJTZZIx4+DgcZowE9y+d0vxHAW9RLmsY8UznC/
 OHP+yk0F2ozSw2MRAevf5f7HC323P4ncEP1ghEr6GyCTItZd1aD3uMfSWoTlCOFPe/Gv
 rtvw==
X-Gm-Message-State: AOAM530vOUWzeEQeXWp75xuFl8Lejc8MX/QbROWkkPGGBJUG6RhQBKQV
 /SX2KoMlaD0vyBx0EgHTzR1kt45aXdNmlzjv
X-Google-Smtp-Source: ABdhPJzzsXkFZ9L93rSeN/duFxWElwV0lXqmXt1IA0tCzQ/SQqlRh0MIRs7xmnjdiwTzuFw620/3tA==
X-Received: by 2002:a63:d24d:: with SMTP id t13mr1170249pgi.37.1610014783818; 
 Thu, 07 Jan 2021 02:19:43 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id s5sm4934662pju.9.2021.01.07.02.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:19:43 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] whpx: Fixes include of whp-dispatch.h in whpx.h
Date: Thu,  7 Jan 2021 02:19:18 -0800
Message-Id: <20210107101919.80-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107101919.80-1-luoyonggang@gmail.com>
References: <20210107101919.80-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/sysemu/whpx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 9346fd92e9..4f38784d7e 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -15,7 +15,7 @@
 
 #ifdef CONFIG_WHPX
 
-#include "whp-dispatch.h"
+#include <WinHvPlatformDefs.h>
 
 struct whpx_state {
     uint64_t mem_quota;
-- 
2.29.2.windows.3


