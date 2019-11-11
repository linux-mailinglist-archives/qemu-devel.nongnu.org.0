Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB81F7832
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 16:58:36 +0100 (CET)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUC5K-0002nM-M7
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 10:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iUC2y-00016y-2Z
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:56:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iUC2x-0007oJ-2M
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:56:07 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38525)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iUC2w-0007ns-Sw
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:56:07 -0500
Received: by mail-wm1-x344.google.com with SMTP id z19so13721750wmk.3
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 07:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/5p87sHuwzs+fG7QeZNlsEwayPtwEiUycqGGJrVa+Q=;
 b=HG9XY/fBzbSF/6IX9XzJvTFNjs5/VqGu2IzuT+JXNEoOdbCld/AP0EdrroAGvYzPGO
 1C3Uqk5syFwEW+i6Pt39FZJ9Lehpl6GU2ptFN3zNDRRZh9J2coQxGe5LzNWcLv2fwEDc
 KaScTQyIXvo5uxlEaC1l8l9fFjGi6PEuYpdjgl5YfxRbGhbEBEG2Uh2hUa6/Ox99InGw
 e7kdmes1hypQyq/PnowLQ+E9H16z+Zfs3etuCf5KN8K/7V7Nys2Sb/EomM+9MjgM+mP3
 PiYY1iAwWyGWo0te1KjYC8OqkyFlb4QVDPB1ADcEcPXyYSlUERDOIwnUdxvoaXntjIvj
 NhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/5p87sHuwzs+fG7QeZNlsEwayPtwEiUycqGGJrVa+Q=;
 b=XLIKwHCmXNDAMna5zS3ksLm6BfcKqoEYDMH35ypaCecKR2l+CjUhmzfXcOeRK3Z5GG
 Y69XxpIzSbauepZ9Tm05puJn5MRA+7kS4RbwQQwcdlHk72NMASAGgqDFcYdXfLf6pgep
 qRVUc16yPCaN1zQs4QHB2KQn9wB/e7fuOZbSGCrC/uioD2pqitHiw1VMpRu0/ff69r8b
 EBWRruu+ecLL55LQRIxO//GodWyYJNbb8ymXCH2sUBwYw6hPoMR++3hVGX0YBsXyMyg/
 77KxDBhZuLbs1oqv/fFneWsKz5ed8tlI/cfRMluskDl+wbum03/GyYsF9rSpjxVlOlrp
 oZIw==
X-Gm-Message-State: APjAAAV9Wu9mLvStmp6MdoGQ2EurjUG52V/0Wke+x1yh3rNgbpM/TC6X
 kRvTOmlFraHPJr++LaT7WuW58cskSfYmBw==
X-Google-Smtp-Source: APXvYqwK0ZW9T9DZU1dGcQbExM2cXh7or7mBzxT3ULUrVGLXXsDRjNHYzMsNS5P/dwCe6DgwXIRPwQ==
X-Received: by 2002:a1c:a70e:: with SMTP id q14mr19122986wme.86.1573487765663; 
 Mon, 11 Nov 2019 07:56:05 -0800 (PST)
Received: from localhost.localdomain
 (199.red-79-149-206.dynamicip.rima-tde.net. [79.149.206.199])
 by smtp.gmail.com with ESMTPSA id f19sm30023156wrf.23.2019.11.11.07.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 07:56:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] tcg/aarch64/tcg-target.opc.h: Add copyright/license
Date: Mon, 11 Nov 2019 16:55:48 +0100
Message-Id: <20191111155551.13885-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191111155551.13885-1-richard.henderson@linaro.org>
References: <20191111155551.13885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Add the copyright/license boilerplate for target/aarch64/tcg-target.opc.h.
This file has only had two commits: 14e4c1e2355473ccb29
and 79525dfd08262d8, both by the same Linaro engineer.
The license is GPL-2-or-later, since that's what the
rest of tcg/aarch64 uses.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191025155848.17362-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.opc.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tcg/aarch64/tcg-target.opc.h b/tcg/aarch64/tcg-target.opc.h
index 59e1d3f7f7..26bfd9c460 100644
--- a/tcg/aarch64/tcg-target.opc.h
+++ b/tcg/aarch64/tcg-target.opc.h
@@ -1,5 +1,14 @@
-/* Target-specific opcodes for host vector expansion.  These will be
-   emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
-   consider these to be UNSPEC with names.  */
+/*
+ * Copyright (c) 2019 Linaro
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ *
+ * See the COPYING file in the top-level directory for details.
+ *
+ * Target-specific opcodes for host vector expansion.  These will be
+ * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
+ * consider these to be UNSPEC with names.
+ */
 
 DEF(aa64_sshl_vec, 1, 2, 0, IMPLVEC)
-- 
2.17.1


