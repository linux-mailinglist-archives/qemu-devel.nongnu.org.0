Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EDC167E11
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:11:31 +0100 (CET)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j585Y-0003Uu-Pa
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5824-0006YT-AN
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5823-0002VS-4N
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:52 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5822-0002V6-Uz
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id c9so1984449wrw.8
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W8sFFOUvnvr4vVzeaXqbU35p4T4/zerZ5D4EmGJn+5w=;
 b=BWdAlDLz/X3g1j02cl3oHU43f5cg1Ao+DLWqsM4s2yntPvCjANJLBO+rAllK++gyR8
 684NKjwa0CcyXb/rMdREnjHuaEUR6nSDOAsZco7OVSxpq/ZRf5YweNJVYxu78Dus0CsD
 gpe2kVNVgYZMsf1H1ZuaRy8CNcM915APQSXfANWxSr5ZgbihG8WEGB3YBAcojMgTit1U
 z3lGT7bLqYpj7zIXfjUxTgviV4qLH8w6BYoLoiprT1MPZVN/izCWAMyyEmyCs9Zj3k8S
 oZ3wRSTxCCGttVOzyeND5pYiC6PPBXCme5NQLR95qveLUSrP+2Nt92LTTSxfruz/peok
 /KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8sFFOUvnvr4vVzeaXqbU35p4T4/zerZ5D4EmGJn+5w=;
 b=XNr1ITJR+g9UrPofs4lMJCsOBTS4JMrOBN3QFA15fQjf/SrRooZSmxMRpCLLpWZ4+U
 ivAm0IJKmSdYXdM7O8tqeShtZGvY2Gi7TRjchhAxQRpw5osl6sVPnj0N2N+iIEfby2dn
 WgIduF5SYnZPevVPy8P+NHwDQSr9Rb++bWRv87Sz9VQzjBTkQTMDKNK3By2cZcNrlg1F
 XOl9PCHPnCzV3szdYFLzv4CFkkcQ85GpjxaoP8RzpBlDSbzLYzad8tOitxTyrNl9aXzJ
 jOhgy383byQIydKTTF/t1aFkROKXAWPVFgyg8tZo7FBPqLSTB8dfHm5hLMKpH9y5GoGx
 9X6g==
X-Gm-Message-State: APjAAAVw6+Yc+DhGP/VGBW4HSns+dxmx94aje0keLBmCn82KPjPmV0ae
 Oun84eH/7olv18A/O3Gq7Zt6VlDUQhik8g==
X-Google-Smtp-Source: APXvYqw1FZ68IH0p0wPns+bYXFnNAJ/dUqjzA9QszG+bgke39x5GKN13uTykJ8PmhnsJNJy329lJGA==
X-Received: by 2002:adf:ec08:: with SMTP id x8mr45638132wrn.138.1582290469659; 
 Fri, 21 Feb 2020 05:07:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p15sm3598892wma.40.2020.02.21.05.07.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 05:07:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/52] target/arm: Flush high bits of sve register after
 AdvSIMD EXT
Date: Fri, 21 Feb 2020 13:06:54 +0000
Message-Id: <20200221130740.7583-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221130740.7583-1-peter.maydell@linaro.org>
References: <20200221130740.7583-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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

Writes to AdvSIMD registers flush the bits above 128.

Buglink: https://bugs.launchpad.net/bugs/1863247
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200214194643.23317-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7c26c3bfebb..620a4290671 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6895,6 +6895,7 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_resl);
     write_vec_element(s, tcg_resh, rd, 1, MO_64);
     tcg_temp_free_i64(tcg_resh);
+    clear_vec_high(s, true, rd);
 }
 
 /* TBL/TBX
-- 
2.20.1


