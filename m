Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D71F7D65
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 21:11:28 +0200 (CEST)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjp5L-0006YW-5f
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 15:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjoxJ-0000tQ-GK
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:03:10 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44163)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjoxB-0006tX-Up
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:03:06 -0400
Received: by mail-wr1-x443.google.com with SMTP id y17so10787999wrn.11
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1DzA5iDyLs/5vA/dSSrknurXA9OGsEodwES5eqKbfo=;
 b=AvJlJwP0BMGgDZT8NzZAJAkZ+u4AnNlhfuBbkvi5n4UzHfcc7nVScb1wYiz8V/nCE5
 hQI421AbkaflY8zXSrPP2CoC5N9KlWjY/Sv9sMC0UL9qeU4ITx3aEc+3flVgZTZB9fwI
 bWgDcWJvz6u24QNkGV/sXx9FEIMV+0usJl202sT5doGVzpqtN8+Ksw8ZWmN9GqCTCS8O
 4tT8RPT73cay7LpJ/bglefM6nGDTTBakPUz7dXGDCc4IXZFcO6jzGvz5AxksoF2O3SZl
 YBXaaWUP2W2bSEr/fSjpsoPW3uI5McOCy9tqoRxeBzNteuIr+yvY4/bve7ELXRSdoUCf
 GyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1DzA5iDyLs/5vA/dSSrknurXA9OGsEodwES5eqKbfo=;
 b=oMFXRPniU94SK6TfB/dkDfP3+ySelh8aDf4FX6TiyaDETvHEuMND2CfzxPsAiHOgmX
 46qR9b9fGwIss6ANgTY6gTm7RE3Cja7LF9kdxZMDpw8n3xNWmd149/yBjwVW73rU7Jf/
 M3DXzGSDxWC62wdrKRZ+MR41XKPifybbWJV0wSEK9Nls+ef7nMt/JBlixjnO7OtxHIKC
 5hlcOC3RRR3ij+2sFuoWB6xaAUaCXCvqllof6CitP1iGe0+aWj/OlGzQFVa6yVUzV/du
 nzjNl5EvhIRH+PPcNdkOYrczHhI3e4boyKqNzbfoUB7w15x41WI/zhWUtKx8lbrRBwrb
 FTWA==
X-Gm-Message-State: AOAM530utdCxtsk0RNVF1Zn2c2g4lM2YFvQusv/+hozqvj77O/Lajsd7
 U5pnGlzg0tcz6nDUn3/eibfE5Q==
X-Google-Smtp-Source: ABdhPJyY+0m2mV472ZKLTV5IR1zJvY9D73iMG4FNbaC7hL33D+ybtXFH7FfmOuo0DXIiwsCvxXBgCQ==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr15528607wrt.381.1591988573274; 
 Fri, 12 Jun 2020 12:02:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm11458909wra.86.2020.06.12.12.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:02:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58AF21FF96;
 Fri, 12 Jun 2020 20:02:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 08/18] qht: call qemu_spin_destroy for head buckets
Date: Fri, 12 Jun 2020 20:02:27 +0100
Message-Id: <20200612190237.30436-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612190237.30436-1-alex.bennee@linaro.org>
References: <20200612190237.30436-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com, Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200609200738.445-6-robert.foley@linaro.org>
---
 util/qht.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/qht.c b/util/qht.c
index aa51be3c52f..67e5d5b9163 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -348,6 +348,7 @@ static inline void qht_chain_destroy(const struct qht_bucket *head)
     struct qht_bucket *curr = head->next;
     struct qht_bucket *prev;
 
+    qemu_spin_destroy(&head->lock);
     while (curr) {
         prev = curr;
         curr = curr->next;
-- 
2.20.1


