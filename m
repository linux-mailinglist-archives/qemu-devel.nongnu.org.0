Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5FD198612
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 23:07:25 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ1cy-000235-6W
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 17:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zm-0006Xd-Vo
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 17:04:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zl-0002f6-MT
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 17:04:06 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJ1Zl-0002dp-Gl
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 17:04:05 -0400
Received: by mail-wm1-x342.google.com with SMTP id c81so332443wmd.4
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WqiXoh1J9BtTrhWN+j6OnxXdf1TSrsiVrhfZHgXBlRg=;
 b=WkaCBPWdeWkGfQl3m6Ac54Yce0SfMAhgkIU6+WnBNE2YJfT/UrJshpd0XXTYg8vdK+
 wReBJ++ZYJGPBw++tT2TBa1BPxeiFteVJMpbHKmClijog2Ol4sXixnoJ5OAtlc9atpcc
 FyrC2icPeCzojsiXuT2nZJr3aejx41j2efLKzSO0+54JED89HLG5A0K59UbMSBtym1jc
 2icoqOJm2YW2u2No5oNASK5swu9HkAGRNqO0SY0CGy2Vl3OnQMbzd5Hc1EJdTrttcDyL
 GcpcJMD7sanLy/socn1E6PSH1KAySmWhJnkhDa9WRN2yfZnOJVmp2zI3ll3OXo15INqb
 yj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WqiXoh1J9BtTrhWN+j6OnxXdf1TSrsiVrhfZHgXBlRg=;
 b=BdifgRYk5dipf9kwmxX7vN0A/qFZVDw3xAY9LdhhJ0J2xKmpP0NQALJlu1KgwwFQC/
 cHa3JWSXYN9gnf6BZJ0AsoZ+dONJVopCq+EON4UCfQs7DeBbtdR0ulVpAjMtJTnAP7EU
 ojnpdZVg58SAYulSlF0ep3MP6h9ENnUycYqqctbVlagMq6zP6dDEIl6jnwM5aQVuYcw8
 0avWBzo//7s5M8Skh4XWT1ubLI6BNzmhEUJWC2At4WIYC91NX/dWrizlKSCgduGaLxYQ
 +iBN1Wvp7W1G+uXXALge3N6No/DcDGJGYICF68jRkztf2dJMsnvaC3MqHDR9tNaZsSXq
 ghyQ==
X-Gm-Message-State: ANhLgQ1FQRaG3bpkthvR2LIfwkq4r0/8LH6FKj5XbXEi2/kuDWIcoJNX
 iDKqpEXhKkia2bKBZdo9nRSEi3JI5kHCzw==
X-Google-Smtp-Source: ADFU+vu6d/7J2ebVmTAL+E+4aathT5ZW0Mmxxiefvmf8BBp8yDH1QWUldt6ezEMjVjX9WJCy3OhcSA==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr1213739wmm.117.1585602244471; 
 Mon, 30 Mar 2020 14:04:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p21sm1012700wma.0.2020.03.30.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 14:04:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Use enum constant in get_phys_addr_lpae() call
Date: Mon, 30 Mar 2020 22:03:58 +0100
Message-Id: <20200330210400.11724-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200330210400.11724-1-peter.maydell@linaro.org>
References: <20200330210400.11724-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The access_type argument to get_phys_addr_lpae() is an MMUAccessType;
use the enum constant MMU_DATA_LOAD rather than a literal 0 when we
call it in S1_ptw_translate().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a0b3082aad9..25439bf6fd9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10035,8 +10035,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             pcacheattrs = &cacheattrs;
         }
 
-        ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_Stage2, &s2pa,
-                                 &txattrs, &s2prot, &s2size, fi, pcacheattrs);
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
+                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
+                                 pcacheattrs);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
-- 
2.20.1


