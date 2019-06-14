Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBD46629
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 19:51:20 +0200 (CEST)
Received: from localhost ([::1]:53882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqMB-0004c3-FA
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 13:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58561)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqg-0005ag-K3
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqe-00076D-0S
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51645)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbpqd-0006kG-Jl
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id 207so3138076wma.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kv2IwrRCWvjl90KLYznRzS05j6rVbW2oPC3nXpHDO7s=;
 b=j8yZ/nsx5XFzLvuXh2zG1smzMo3gJeJSZbv7JmjY51Zq7WrkrQGxn1AL71ZVyCJiil
 mqh+2D2O481jVu73cSpNy/y42OOovK3qH19/BIJLRTSgrLnp38Lb9A59wxZbxov0KY1R
 HNeH5t79GtaBsGQ7kDrYXELa2ztoWMVp6YXa4R1/EURcRrYDCQXq798ATK6fk49uRDJr
 46SPXdEXZAGbbTH7r6P2Yu/xKHbdKbEeihIE01qwwOzPbnfdkfyCGC17plMQkaYgzpAU
 fVzJaZ0oRXKnh60yLKDUkKDTz3uPQsxTKnghE+ncQZxjz6G0l/6duGYXCDsXGa3Z0gWk
 Djhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kv2IwrRCWvjl90KLYznRzS05j6rVbW2oPC3nXpHDO7s=;
 b=gDs5qcPKVJxX5hcBGa19mwhBj2Ro0xED2SLcll3qI4JzSWdjhOyPI6NEH9kXg43/Ij
 wr2riqqBEpduo3nX+IB7ZM3V61U5LtLcRDlbsWfEaWkd5tzJl2xgdFXT/7t7t3gsQPFP
 ianoBYXX3So6AyEThwJecE/rjdO9HQVeGDLkVDe4rZXCH6/esnKs75Fzh+r2lyfg3yDT
 ZYwR/a9QO9OLqVxUCoqw+Vz5lz2dlW1Qe1mj7uDnXFTqWnTBklLIHXa72oQPGPtjmGmg
 D++euw1VbrZrWpvTZRx83ILshLWtIcqJt3z4nJmRRJmOzctnN5cEM3SMSNMVER2oEq9a
 xTeQ==
X-Gm-Message-State: APjAAAW0azt7JQgxkYueWMWBiV2gjPGhsmr3q2W6pmlcaXBjUTisKNDv
 8ZFCsP0FSvRgsgDTAuTAJYFRiQ==
X-Google-Smtp-Source: APXvYqzRN4YWYVOtX3VJd2uI+WTTSvkI9gj6pRxBQrqvRe8MAln2Q6CQdq2pcOA9LLXkR9T4bEau5g==
X-Received: by 2002:a1c:b189:: with SMTP id a131mr9145569wmf.7.1560532713548; 
 Fri, 14 Jun 2019 10:18:33 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id w67sm6030603wma.24.2019.06.14.10.18.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:18:29 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F4EF1FFA5;
 Fri, 14 Jun 2019 18:12:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:28 +0100
Message-Id: <20190614171200.21078-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: [Qemu-devel] [PATCH v3 18/50] cpu_ldst_useronly_template: remove
 redundant #ifndef CODE_ACCESS
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

This function is already under #ifndef CODE_ACCESS.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 include/exec/cpu_ldst_useronly_template.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu_ldst_useronly_template.h b/include/exec/cpu_ldst_useronly_template.h
index bc45e2b8d4..42a95237f1 100644
--- a/include/exec/cpu_ldst_useronly_template.h
+++ b/include/exec/cpu_ldst_useronly_template.h
@@ -114,11 +114,9 @@ static inline void
 glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr,
                                       RES_TYPE v)
 {
-#if !defined(CODE_ACCESS)
     trace_guest_mem_before_exec(
         env_cpu(env), ptr,
         trace_mem_build_info(SHIFT, false, MO_TE, true));
-#endif
     glue(glue(st, SUFFIX), _p)(g2h(ptr), v);
 }
 
-- 
2.20.1


