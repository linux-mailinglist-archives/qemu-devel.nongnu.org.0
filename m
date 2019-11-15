Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53686FE425
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 18:39:09 +0100 (CET)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVfYp-0005uF-Mi
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 12:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iVfQD-0007HN-Av
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 12:30:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iVfQB-0002uV-TG
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 12:30:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34396)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iVfQB-0002t6-8L
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 12:30:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id e6so11872647wrw.1
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 09:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfmaSXFX++HxYtO8EVIuNn6/A2yXcCkH+lwca/Fidq8=;
 b=dRDXDlhw5etW6ZnJr+sAhAFt4Mxr3cBo0JkdmHz6H5DYxwURH1xxRrAq3vIEX7dNtX
 459rADhcJPOeLQLqmENx0yCM94Nr91hb4+hKVL/gxJifOYpDjKmWNczuOHIKxGnIWClG
 OuQmFDCj345XvhBnC54HVSlVlo/X5E/GmFzRTsTAuB2UJXQ6K8c49EAWNts1EamZUaeo
 h4jYhwZ1GQKT9p/plIvTLpGGZMIoIt+cw2WF/SlPDEQfoYkpRSKBxZ+1NNsDeYoQ1+LQ
 R3aCTKramSXWeNNMa+27Rtov4k0krX7S0IKYRQFDa+cZzdI/OVQx8ia+G4F8xvgj+yIj
 GWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KfmaSXFX++HxYtO8EVIuNn6/A2yXcCkH+lwca/Fidq8=;
 b=edXKxd/Zui1c4DzuiDvTclrTRYVzUtMVxtGYvAynwoc3HuvJQxhCRNJ2ijMxCGRMw6
 0oz9H/P2xv+atgTvc3gBWxqp9sYbj1Kszl3bgEHXwktOQJksxn/6pXLHS358+0y4k8I7
 kYKRejCU5aiOYgegAHABnROhWM/jmn6goBsjvzS261IvctfcK15NplgZfKJEnJvZoXOF
 akQOXkFU+qckD4RANoD7fr8W/cH0sgeAGYqQnUO0Xfs16AyPKJlnD4e3Ps+4p9jc6dEP
 oWSDhRSNYvL0rMa+NYXWrTPVggS/Vw1RcDFSxZfEMjs/gafTlKZjzJJhwX4qLNYKltnK
 p/sg==
X-Gm-Message-State: APjAAAW7wBr5cLxAvoR2WutK73nB9P3wQ7Ie/MJk2oM96dHtS1M7prq3
 Nf5F158TiWwP6O+W50aJUCKZkhF7f0A=
X-Google-Smtp-Source: APXvYqwqDVg68YEjHlQ0mzGGL0eJMoxzWBS8XSaUBWXaiHTaLtTur4UZmu11nShSFCVu3ttYQS6cXA==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr16001867wrn.124.1573839010037; 
 Fri, 15 Nov 2019 09:30:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d13sm11467244wrq.51.2019.11.15.09.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 09:30:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E9961FF92;
 Fri, 15 Nov 2019 17:30:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  05/11] gdbstub: add helper for 128 bit registers
Date: Fri, 15 Nov 2019 17:29:54 +0000
Message-Id: <20191115173000.21891-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115173000.21891-1-alex.bennee@linaro.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Cc: damien.hedde@greensocs.com, luis.machado@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 08363969c14..a898a2af990 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -102,6 +102,14 @@ static inline int gdb_get_reg64(uint8_t *mem_buf, uint64_t val)
     return 8;
 }
 
+static inline int gdb_get_reg128(uint8_t *mem_buf, uint64_t val_hi,
+                                 uint64_t val_lo)
+{
+    stq_p(mem_buf, val_hi);
+    stq_p(mem_buf + 8, val_lo);
+    return 16;
+}
+
 #if TARGET_LONG_BITS == 64
 #define gdb_get_regl(buf, val) gdb_get_reg64(buf, val)
 #define ldtul_p(addr) ldq_p(addr)
-- 
2.20.1


