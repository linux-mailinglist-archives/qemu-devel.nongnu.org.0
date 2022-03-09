Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF434D2E5A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:44:57 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRukS-0006Yo-Ar
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:44:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuPE-0004M2-8y
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:23:00 -0500
Received: from [2a00:1450:4864:20::630] (port=43582
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuPC-0007cT-Nt
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:22:59 -0500
Received: by mail-ej1-x630.google.com with SMTP id d10so4167599eje.10
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JvigvJDn1FZr5uqA/8hy8MyfMjAsTr1k5IDRNXfGuFo=;
 b=Y94WJLDvIQd9F05yQqYDPvmBgaV+ZPeXgEXrlRApGWNah6RPYlInzTfuVr7FxpHxm7
 rBpoAHgZYHX0efmOMqa2ob9a0tHlUZ0yeCZhFNJw6Ck8aKGBgaoDh978Ae7egM/i2kZP
 G76UOjWGTFDl8zIX7uDYrX4kLLGTE18+3Yd05k5MjlGYThGBXlM/UiN13cFUNIeota/K
 2a3txdeT5+NBy+UNk9yA86JDwGSTfZ08u46Az8C3SQ+UrwWZRfcBXXkMF/z9AD181rG4
 2QF0V7KsVAGAAou5k7ORg3za/YIeJQrmVUdZkgsaGRK8nSnYTbdhPrB7Qp7jxLlwqZKi
 aCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JvigvJDn1FZr5uqA/8hy8MyfMjAsTr1k5IDRNXfGuFo=;
 b=a/sFChUcq504paIoyT2UHht4SezBathwkZ+KRaCMKR5KNkFb1YE2Gv6f/NTd0+Qj1A
 uqKrBUDzDaTqxnVsLcEh5Lcdv99FrtsReCEBRtBuSNe1+OrOK/SVhX1z+awaehvdmY3J
 IkOlvmobBQSRIkeTlk5PcO2vTC6GuouSG20VbJz/LYkmKgmkyufbURsrlI8fc4t+gviF
 2GOKZ/hRbP1RFxGjjYzNKNZ+U5ahu8AKqylOQkvb8zQsa774+8LMkA7PuX2GEin4/3lR
 pmehAy/ezspCMnxUdC2TkohgdsXm0UC0olJQMuCDjB4qWOCSPYY3JOigBAhmU2B1M+cs
 PvVg==
X-Gm-Message-State: AOAM532EiKB8G7pI9l1eL1UG17pRIe6iA3PIs+vTdY8o8XVDvvvwyiqg
 LGxIfXbG374kzXd6yIMqzqRrZQ==
X-Google-Smtp-Source: ABdhPJxcp2EmqzYZ4HuyDnmCF2v1QNACLu4qERYUiDNXOoQvLPwS4y2pbqYggY0VnUX6gPu5C4rrqQ==
X-Received: by 2002:a17:907:3ea6:b0:6db:4b61:b46b with SMTP id
 hs38-20020a1709073ea600b006db4b61b46bmr6925742ejc.402.1646824977241; 
 Wed, 09 Mar 2022 03:22:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a50eb8c000000b00410f02e577esm697920edr.7.2022.03.09.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:22:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4FFF1FFB7;
 Wed,  9 Mar 2022 11:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx invocation
Date: Wed,  9 Mar 2022 11:22:48 +0000
Message-Id: <20220309112248.4083619-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With -cpu max we get a warning:

  qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.

But dropping the -cpu max and it still runs fine.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 257c568c58..7aa502a557 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=-march=z13 -mvx -O3
 sha512-mvx: sha512.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
-run-sha512-mvx: QEMU_OPTS+=-cpu max
-
 TESTS+=sha512-mvx
-- 
2.30.2


