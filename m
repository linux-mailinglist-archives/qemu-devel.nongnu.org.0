Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D183140CD1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 15:41:32 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isSoV-00049m-9x
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 09:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56655)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isSc2-0006W8-TF
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 09:28:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isSc1-0007BH-Ds
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 09:28:38 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isSc1-0007As-7o
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 09:28:37 -0500
Received: by mail-wm1-x341.google.com with SMTP id p17so7857899wmb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S+ce5ZtJzWsToZNqIcSATxYWHrkYyE4C96IptwK3Xvs=;
 b=BDgBStkcYeSHmDnY7wg6g50he4JtG6yG1rIsl0274HAtNnXRwftFXA/eU4L0zfL4hV
 dXmTAizpPZwAgX6RzOLtjxdEzJiei/YYACP2qSSv3Bxfosr5adBvQph1V5dH0nqkHqIe
 brAe+opWE5Rn+dORLrqShex2TQL+wGnu+x537RB94lzxLUwtyVEET0n5X3K/SikZbg9O
 9vgu+n9hezDCAnAGTxUrxI7QIJKEEeEVrujfrtMYfU1TVPCEttxWNjryiSFh9VBziwKY
 LICbU4qauTSEA3gBVh+Cm+i2HtTWihnHZkKY5lysmlmn4ag/YQQ+R35LCRrVt3RWhxhC
 8o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+ce5ZtJzWsToZNqIcSATxYWHrkYyE4C96IptwK3Xvs=;
 b=huado8W8H8cQy3p/1GJlmZdAXfTXoLctqxpLKcNjYFvN94M3cbbc+a8jLaVDbq2i1E
 JE5yrTAOWiXLU2hhpUej/Sh4TI1uv1swi98iCwWZQ3wHDJiXzemZhqVMkwO7Jy0Tu8Wq
 MXHCbSRRVJTC0yiuaWcHiBT3sez0wFMMaS/oUq+bkuLFc20jXb/gQviyu7xG0I4L6oGe
 my95Ble4Y05JrpdTCTwI83wJG7w4ibem6d+0yF31WwkP9svGTxhoaUZPk0QjlfUFw63E
 FFyx38xbrsfNYnEt2UuYNfMeZfQYk7i9UpfazE7FB19ggehZAJHU9XULjoAEaG5Tq0Yr
 ri0w==
X-Gm-Message-State: APjAAAVH0QfrZEddlz63Z/DhDFQrCmRA/4jfsAHkVm3OBOiArndh9ZPP
 eeyDeg8/MnzM/rDK89RksvUJ/X8nKocFlQ==
X-Google-Smtp-Source: APXvYqxspgqiWmLK6x6PofVhKForXpBrgvjtkGkq3QA4VN3D44+ypah+jSCr/M2i8lexExZG8q5jOQ==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr5032691wmi.51.1579271316139;
 Fri, 17 Jan 2020 06:28:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e18sm33811146wrw.70.2020.01.17.06.28.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 06:28:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] target/arm: Set ISSIs16Bit in make_issinfo
Date: Fri, 17 Jan 2020 14:28:16 +0000
Message-Id: <20200117142816.15110-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117142816.15110-1-peter.maydell@linaro.org>
References: <20200117142816.15110-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

During the conversion to decodetree, the setting of
ISSIs16Bit got lost.  This causes the guest os to
incorrectly adjust trapping memory operations.

Cc: qemu-stable@nongnu.org
Fixes: 46beb58efbb8a2a32 ("target/arm: Convert T16, load (literal)")
Reported-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200117004618.2742-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0c8624fb42e..2f4aea927f1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8556,6 +8556,9 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
+        if (s->base.pc_next - s->pc_curr == 2) {
+            ret |= ISSIs16Bit;
+        }
     } else {
         ret = ISSInvalid;
     }
-- 
2.20.1


