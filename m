Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCAA0839
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 19:14:34 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i31Wj-000566-HG
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 13:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i31CH-0007mJ-Qo
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i31CD-0000zu-Uj
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:23 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40852)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i31CA-0000sw-45
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:20 -0400
Received: by mail-wm1-x32b.google.com with SMTP id t9so779838wmi.5
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNq2/tF+Veu5drl4HTIh7J8EBOeTUQN0G+PECJ/ML98=;
 b=yBV4k3XwPkPv3BmsFIJI43dN9JmuPkXBbqQKjEdxbXeXAOlo2YgRnOONdcsxxToOD/
 twgyS2kDOYEQD9swGz5jZfRNObI9KNozwhf4sPo5Fz9JBz6GVKvx/qtIIt0kgzBB8rOR
 6IiYIdNIQ2GfhTzZ0CqSOwhs05MvXZf9w/uie4QteMBoSfYE0GrW9A8JIkDfHv86AtGu
 NuVTIVpCpSC17Xg7N/NQIMAJR8j/VhnKAjkRYlGzoKxxH3D5HP0Q3oHrEsC/qazxsg8j
 rAjrUpZIRrgUszdPY97MfAOpPuO9gKEK+fUOJezUsXMQA1QPdPOWLF9bLydD/z1FLsUc
 z4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNq2/tF+Veu5drl4HTIh7J8EBOeTUQN0G+PECJ/ML98=;
 b=seFL/86FvbIsMF86jyR35pfD4H0b+43YXtRdpDxiCuSG/EOn6IjxwIZXwoYGYdONtS
 T/3Il1qB2+qwRnDcA5d0YhlpnQCk7IbOawgLczDJMPlPyUixpUv1eL4WkzUtcTGa5fUv
 FFHxIe9795YlufXmCrYoznPl7a7mAcxn8WGU84axBCV96aspZVSP86eBcAZIh82fUs7G
 x4uXGaGMcZaU7jnsmYbX4hA/QBQZKdJo9SV+ABgMfqOaixnNXQLmmXXdFIVmRe6IKMH9
 avDZebmCmmC0wwP1JwLAMRoi+5hkPX080i7a2Ua4Y3WNgORZLAuIZqeDIG205desgqV8
 7dow==
X-Gm-Message-State: APjAAAVMudeBM7e6PSBDdHR3GDyLzuFkQbdWV2Jqc03MCu6bd47DHsZ3
 fm7E1J+fUfCU3g6f3kEnyTb3Jw==
X-Google-Smtp-Source: APXvYqzPZf5xo+ypMbHpDZIsDZbyp8Zu5uMLviXJ+0BEsYHcUAknjtc5debu6UxGp/XmMIGVDJZ1Kw==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr6399307wmc.151.1567011193374; 
 Wed, 28 Aug 2019 09:53:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r190sm4593984wmf.0.2019.08.28.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 09:53:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F214D1FF96;
 Wed, 28 Aug 2019 17:53:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 17:53:05 +0100
Message-Id: <20190828165307.18321-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828165307.18321-1-alex.bennee@linaro.org>
References: <20190828165307.18321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
Subject: [Qemu-devel] [PATCH v1 7/9] atomic_template: fix indentation in
 GEN_ATOMIC_HELPER
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/atomic_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 5aaf1862539..df9c8388178 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -284,7 +284,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                 ABI_TYPE val EXTRA_ARGS)                           \
+                        ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
-- 
2.20.1


