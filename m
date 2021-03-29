Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5F34CE7C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:08:17 +0200 (CEST)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpkn-00048X-3I
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfv-0000FJ-75
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpft-0004j4-HA
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id x7so12385909wrw.10
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fyfWdwzjylGxvKnzivZ43UVg+YqR6Th9DTQ7YDVM4A=;
 b=HR00xf2U+c2OunXJGgOQYED5dsT12DFQWHFxfScwwCIfio9VVhrubb4YXdlPxFmgXG
 qb35PQqz+lN8v6GdlJOf4pBnWOM9aOTFfFgFS/yKr11YiEZg+vnZckBUKHW1ZAdw3Y1N
 YjgspKoq/mihuVChnSoy5UHADUtif4CBRzx32gkcD+DmWpBQFANm7aRZOQQs3DJ+XOxF
 EImm0/kmpWoi5FAWHYqfNgpNzKNoYAMePvBIj2RDJHrpnFq6mfzdehzZOnTpzOKge/p5
 j2qyq3ksThbqx2ffcfUubrAzg31Jxp+DLv5OqkDsgBNWfvDve4kqSf57mfene2W9soc1
 22Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fyfWdwzjylGxvKnzivZ43UVg+YqR6Th9DTQ7YDVM4A=;
 b=pHX9okPyYm7M7OEw8glLTitxDbjBVGuty3ID4mtighxL1j/DiT8pAkuwfxDLNq1okG
 OMx9v0RnlLuJajUYBQInXOWM/4JIgCDAdQTufupNLkaCxzxXQFZeWWTtBtnyYKHwyXXB
 LCgjZ5ZUvTCYPkaCqASTgpNhuAabRdj/o4acOBUgrH9WABhTCvAtKoTEHSFpil/ym942
 sXsYMMVfGZpXgLhkjeRJWfjhrkI6v+lGhGnzuytkiqjNxyrhnW17Ldrgk9kfrBGqbtLH
 4SUa33R8SpVedbdcyxWXtacAG7F0rerhZG872ESgWO43JkjxnY7mhxlNKOplugFx7+wj
 06iA==
X-Gm-Message-State: AOAM530Bfh8eGv3UKSkUIlIJM3KapyWxn8EGZvmRI22xaDz+UQNKLdUM
 50TXRA0z0qpKzQeI5R26faIcWw==
X-Google-Smtp-Source: ABdhPJxYQa7/bE8F1Tv94F8EETJHlF2h0Ptkt0JICjc8sZwMvhveaQQcuyWAj5uFAUKKgoJJkNFuaA==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr28020622wrt.203.1617015792188; 
 Mon, 29 Mar 2021 04:03:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q4sm23995496wma.20.2021.03.29.04.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:03:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF6EC1FF91;
 Mon, 29 Mar 2021 12:03:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/6] tests/tcg/i386: expand .data sections for system tests
Date: Mon, 29 Mar 2021 12:03:02 +0100
Message-Id: <20210329110303.15235-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329110303.15235-1-alex.bennee@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newer compilers might end up putting some data in .data.rel.local
which was getting skipped resulting in hilarious confusion on some
tests. Fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/i386/system/kernel.ld | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/system/kernel.ld b/tests/tcg/i386/system/kernel.ld
index 92de525e93..27ea5bbe04 100644
--- a/tests/tcg/i386/system/kernel.ld
+++ b/tests/tcg/i386/system/kernel.ld
@@ -12,7 +12,7 @@ SECTIONS {
 	}
 
 	.data : {
-		*(.data)
+		*(.data*)
 		__load_en = .;
 	}
 
-- 
2.20.1


