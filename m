Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C708371FC6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:37:30 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddRg-0007V1-U4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ9-0005jC-6i
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:54 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ3-0008Eo-Ka
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:52 -0400
Received: by mail-pg1-x52f.google.com with SMTP id p12so4279076pgj.10
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3VNyYvz+OCo9AvrZ7B6/sX/KbxOpD2Lebaf6p47Cp2o=;
 b=DfHeiaTbOJlSI4Dv0+mOuenpER40mM8AGxLTJl7gqRhuokr1+xn8SXT+LnGSE4ywg8
 akkYwIBxz/MZ5dniz+5DeUaEihm7FO1OVBJaaCpiuL9pKSTieCH+L9oW5ZQ3NnGdSZmF
 joevtmYNrCr/YijcY3oNvz3kNc2fu8HSgVc5vetEZK5jPysEtbn1/8ECEe4wR42Mg3ej
 C0W6lcTKhwakaldUkkMV/C2w7YAdyPfJ4MMklcRDBWoRJ8QU3znxkmRSp1nZS2OyX7vv
 ltpmPmfKLhcKRopIiQxoRAR/SIO6jH5mmxSDrEq/tXz4ZKbtwJXx0pSagdZt8jPFzXOf
 eInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3VNyYvz+OCo9AvrZ7B6/sX/KbxOpD2Lebaf6p47Cp2o=;
 b=hEMpXOfBDhRmbMtDaSz9HbXVuiMmdtNJ5zLGh/ucBw2B8YSfeTS/rdkcu0LbV5GyVj
 FonUHfJhpnfEZnxrbthhleKwYu8xNnCZkVKnqwskZKtMM7tl+Sk+4KWLb4cb8igzZElN
 pJ0voXflXqUfPf3G6Xi03iHxbFNvDI5ZUkAO9oMZUjltP+Ml2Cf16kXSwiO9m/32c0nI
 x2CUPryHiQmDDc05fE4HFX5SMlVThNqWkzYs3X8cIsn1//Har4Opt7pqK1pta1Zggfd+
 eBjdjQQ5oyuPAq7pCNBrsyVkJup8ly/S1rk4IwIw43NWVwg2MKyU5MxPKsH1kez59/c7
 nz/g==
X-Gm-Message-State: AOAM5317psQs1tybVYsYT2IHLH7Jg9cs6Zu3IbkbQm2zbrNoZw9qv6UC
 oVw93ED0xEyeLbrJJZ6GAV5jNtuPp46HtA==
X-Google-Smtp-Source: ABdhPJySbpiGoxAW65te7RAcm6kzy/AiDP9eYC2mXwH2Fh56jy05gPtBrH15dXM+61D6oEqSwhKgvQ==
X-Received: by 2002:a17:90a:f2cf:: with SMTP id
 gt15mr21303pjb.64.1620066943225; 
 Mon, 03 May 2021 11:35:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/16] tcg/s390x: Rename from tcg/s390
Date: Mon,  3 May 2021 11:35:26 -0700
Message-Id: <20210503183541.2014496-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This emphasizes that we don't support s390, only 64-bit s390x hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                              | 2 --
 tcg/{s390 => s390x}/tcg-target-con-set.h | 0
 tcg/{s390 => s390x}/tcg-target-con-str.h | 0
 tcg/{s390 => s390x}/tcg-target.h         | 0
 tcg/{s390 => s390x}/tcg-target.c.inc     | 0
 5 files changed, 2 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (100%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)

diff --git a/meson.build b/meson.build
index d8bb1ec5aa..7ce0bf5dfd 100644
--- a/meson.build
+++ b/meson.build
@@ -248,8 +248,6 @@ if not get_option('tcg').disabled()
     tcg_arch = 'tci'
   elif config_host['ARCH'] == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] == 's390x'
-    tcg_arch = 's390'
   elif config_host['ARCH'] in ['x86_64', 'x32']
     tcg_arch = 'i386'
   elif config_host['ARCH'] == 'ppc64'
diff --git a/tcg/s390/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
similarity index 100%
rename from tcg/s390/tcg-target-con-set.h
rename to tcg/s390x/tcg-target-con-set.h
diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
similarity index 100%
rename from tcg/s390/tcg-target-con-str.h
rename to tcg/s390x/tcg-target-con-str.h
diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
similarity index 100%
rename from tcg/s390/tcg-target.h
rename to tcg/s390x/tcg-target.h
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
similarity index 100%
rename from tcg/s390/tcg-target.c.inc
rename to tcg/s390x/tcg-target.c.inc
-- 
2.25.1


