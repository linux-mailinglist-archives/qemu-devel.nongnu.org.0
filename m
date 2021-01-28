Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501EB3071C3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:40:59 +0100 (CET)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52rK-0005nJ-Ck
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b8-0006NV-W8
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:15 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b7-0005o3-04
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:14 -0500
Received: by mail-pf1-x432.google.com with SMTP id y205so3519951pfc.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ow13H3XpC3DSu++G/PbUgIwFegJxZwC/PStYl8iWnNw=;
 b=LpTgH3qQe0nyFDzF3yAZucABJ4pgeopaOjA74kvo3VNjPFqjnS+rCnvOTyAAHYJcnE
 fWvK+TjK4avvHKjdlmQQNJmgUWPYpim1+D1wyO8ECPs/lgP3xuJWHcEQbRLKjPet8rvQ
 5+0hJcM9FeW4Z6NGicjAXnjqZR7O4GR9NGrjvIrrO6g4b78khQjzKgyeX5mYVVw+dxqy
 DVP0tbYEO0/kcYz1ngWZj0Li2xynY6sfn8vK9A2o8Ix5P5jBnqaaNk4d3o78fA8EJYz0
 7jCnx4PgTWmSTMn7Jb0LMvAGFiOAFQLzDjSc8Lm9rzCTppUwPHpCA7tYKdexBabs1Wk+
 gzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ow13H3XpC3DSu++G/PbUgIwFegJxZwC/PStYl8iWnNw=;
 b=ahAHGbR9AgyqVqUKUKrq91biapj4PNWaOyuVLQDSK7T2tyoFxyLN7uFr43RgLf1bd+
 E1gJYQyhCvTOXYm3RUippI3uIQTdcU/8CMhH3eSwzdzrDbTw7/tQ/E5nrbIc2wPMx7Pc
 sN4G824OU8v7Nu4dyej0BQumNO/jtbjCFpKIwI3JU+hoSsswqHdRypMUQrW+XfPj3fwd
 ugikqqkKyk0u1+KWXKxTkr2yB6T6ZvO1Lsw8bjIhkaRroakWQez+rBTwceJEYuox+0UR
 Cz4xtXTAHcRZblPT1le2fDv1VenKMEtAgcboTMZqjxYnM8/2/vfb1MHJer8QwlpJnt3F
 oVGQ==
X-Gm-Message-State: AOAM531BmOJKLpE2krRIs+ww13o+7Wh54xCBqe5gfTeQL8aMo9jZ0w9J
 wiNBDaUUOmWH1WIfJUu7uKELb0qjCKZPVQCl
X-Google-Smtp-Source: ABdhPJz+NtLbarN9EU12eoItYjWtlJz7aeW6Fk8lyQO6UlW+hUtzz9jv0c36M37lFjBgVaVC4/GdJA==
X-Received: by 2002:a62:ea17:0:b029:1ad:4788:7815 with SMTP id
 t23-20020a62ea170000b02901ad47887815mr14989108pfh.1.1611822251296; 
 Thu, 28 Jan 2021 00:24:11 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/23] tcg/tci: Remove TODO as unused
Date: Wed, 27 Jan 2021 22:23:31 -1000
Message-Id: <20210128082331.196801-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0065c854a4..efc0ca20a6 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -33,14 +33,6 @@
 #include "tcg/tcg-op.h"
 #include "qemu/compiler.h"
 
-/* Marker for missing code. */
-#define TODO() \
-    do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
-                __FILE__, __LINE__, __func__); \
-        tcg_abort(); \
-    } while (0)
-
 #if MAX_OPC_PARAM_IARGS != 6
 # error Fix needed, number of supported input arguments changed!
 #endif
-- 
2.25.1


