Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E041D37D3A0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:41:57 +0200 (CEST)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtnw-0001R4-Tn
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWS-000672-UQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:23:53 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWQ-0005r4-Td
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:23:52 -0400
Received: by mail-il1-x130.google.com with SMTP id w7so4247245ilg.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=sKhSZnjtpQN1Bkj9TABCzW4bl2ROCU2Xn7FBiFOxCvfHmKB41DZVJBGM/04FZjgu4y
 APf8HDOAZOolZ59NNO+KSwTLK9wsmclu9LOnVkbfCX2NJUrAyB01AZJKF+7UVZcG61cD
 oPRJCMBa4lV6j+VqIIKp4AaZ+bRjlVrI3Rf+CMxsicySQDO7BiLRNVD5fEYIEf3sOWMq
 CvuTSMM8LmsIcgQTYsPHuJJ7UqMWD3TaRRtP6kOKZXCPjdEO4V0aPV+bo/njF1RF3Bil
 9OTaE6mkGhvmskS8rn0IAWGZWXyguJfNMiTSnShHAhgk3WGdpvhH9tF/eMvjOpO5Dhbi
 qM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=ShhDLofxd4sX34Ayi/k9u9BM1cWc0vdDyAiW/iESfJWPrCvuJO9KMSkM6QZ8RH1mFJ
 BODmeeJBAyxCIfPYHcHkYrVtf1hHnmPWJHlhsSQXXhmMGJYY25kuLh2XjDg4/x2PiJGo
 QcCbvd88542IoLvPqQr/nTHBNkrJnk27uMknIoXW5SSGjytH25nyeO2yQvEL4+8rsKK7
 r8LV3ixt9XM49T+qcB/dXo+IatkNbonQZ5HzHR9yGr2ar5SB0EA35q8yPMhFpbb+0/1h
 udf/PKMTa6gONB+sTprkjK6vNYJD4BFxArd0StYFmMKVKhwpxuYhbpYJy9Ve0SwQbb3T
 eBJQ==
X-Gm-Message-State: AOAM5308292b4XsHZP1KvLc9ov6Cc0ez7bHk5SVboXyp+1DLegme09pD
 rYQ+aeIgYuzya8y86R8wHmCGZ7gNI+2Gk0WvFpfquGIINCVT0xrd1uElmZzogSzK16xLW8H11Yj
 GQEirbcQ4Q5Y+uTxvkCfLt1EMzoNCGFMs77qI4n6ZGdZuvRjFGgkfxuAfH93jpzGDyd7Uv3Nzpw
 ==
X-Google-Smtp-Source: ABdhPJw2zSbk+xUb0ahOJouGM86Q/zVWCAenO2znq1iaRm87YI/boytzyWIhg7taDsChee3/e7m1HQ==
X-Received: by 2002:a05:6e02:118b:: with SMTP id
 y11mr31944521ili.163.1620843829298; 
 Wed, 12 May 2021 11:23:49 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d16sm247484ilo.12.2021.05.12.11.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 11:23:48 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed, 12 May 2021 12:23:37 -0600
Message-Id: <20210512182337.18563-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512182337.18563-1-rebecca@nuviainc.com>
References: <20210512182337.18563-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2


