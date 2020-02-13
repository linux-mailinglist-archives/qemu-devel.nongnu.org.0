Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD2415C0EE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 16:04:12 +0100 (CET)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2G2D-0006dY-8f
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 10:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2FhJ-0004hw-An
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2Fh9-0002Dh-BR
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:26 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2Fh9-0002B1-4s
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:23 -0500
Received: by mail-wm1-x343.google.com with SMTP id g1so6530012wmh.4
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vduUG/fCzn1Y02yauNek8xmPBjHyb4V3u/HmNjv0tOw=;
 b=p/QfPsEw6idr1uYL60L7aQdbV9ngDW8SiNOsI8+0cfhYCm7fLYxOrRvYwczw7U6HHK
 +9q7iLPwj5dJdayS7p2dO2+U6vHIf8udUHusuWvP/ipS5krPnMz6dQNv8iicJbN92Tud
 x5iZrx4WG5a4+77jgiN2m8nfy90PXoFN5OQsZMwtyICe/9hbNLPTDhk5KSRL++Ow76qn
 yyIAt7354Eow0s91/NRLyYtwsgdlxJzL1sx8O+eQQcsa4WxDqzK+wckEhxqHuM7T8C/q
 Q+kRTt8JpP0MN+l2c5u0EyAvNt1oNzdH9khF17Z9dHxkVcpDFHXHfnYjEapizjbUAxHj
 JDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vduUG/fCzn1Y02yauNek8xmPBjHyb4V3u/HmNjv0tOw=;
 b=PgOcNQTSwS06lQx15Y9gdT9PBFbrv1EnmtdN42/94lGS6xwQxoD1itZLnv05bcTfQm
 Bteue5f8fxtGHWq47ULxDdCLD4iMoxJxfnzjaXGTOoppyjFMIt/WSrx4XaPPJfailWH6
 913XAY+2GIDw5lUHLmW9vOv3JlxT9GmQwA2Cefm/O18B+rZvNKPWJ+gDNNmNaIu6oG8r
 CO4HFxYe1waNtukXFwcckCGmbBiesAq+lBgbhy2BDptHPgp2iSOVNEUi1c0MLFlwyzos
 pNc4nbt1lwipdVTSAWrPonwpAUIU2hAgrTX9l8zqfpa0ThA6TmE7wBlhJXAFkYXJoKoG
 tIMw==
X-Gm-Message-State: APjAAAUlH444akygTuzNqJWSdb6XlnsfCy4f6dPTxVQ4DqYWAWNLjCKV
 BVl84d7VJvp2OiV0c5GwdWbhMWsgzAI=
X-Google-Smtp-Source: APXvYqygA10v0auNXkrpTsIYPc4tbAiUps4KPEjry566nMxt3k+0vgMANBQ+0WJHEsbJO/Ii2PuE4A==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr6468892wmg.151.1581604940988; 
 Thu, 13 Feb 2020 06:42:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e22sm3362454wme.45.2020.02.13.06.42.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 06:42:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/46] target/arm: Enable ARMv8.2-UAO in -cpu max
Date: Thu, 13 Feb 2020 14:41:28 +0000
Message-Id: <20200213144145.818-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213144145.818-1-peter.maydell@linaro.org>
References: <20200213144145.818-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200208125816.14954-21-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 57fbc5eade7..1359564c554 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -676,6 +676,10 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
         cpu->isar.id_aa64mmfr1 = t;
 
+        t = cpu->isar.id_aa64mmfr2;
+        t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
+        cpu->isar.id_aa64mmfr2 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-- 
2.20.1


