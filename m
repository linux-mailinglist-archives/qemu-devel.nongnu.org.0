Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D331C1167
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 13:17:05 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUTfE-0007Cw-Dc
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 07:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUTdQ-0004ao-GR
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUTdP-0002XN-GS
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:12 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUTdP-0002TI-3l
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:11 -0400
Received: by mail-wr1-x442.google.com with SMTP id d17so11139873wrg.11
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xB/6g29U0lIw7XIVVknV4zmtNvmvoQ9kAzWGVa2HK7o=;
 b=URGkCxa8QmpbCmE/sZBFWxGMTTUEqJ+jWb1QyapCTQmrWtpCCeIv9IvZAlpX+vNTt7
 JOj3AWsa3s0Y/CzsZIucW9Ff1O8AJWkXfKf0AfTwQd5OVCeTPl67GaoDLLhRclvu0dXM
 ziwiARzdA8alzxpHHpbOFaCAEkSnmyY5KKmW/jcdI2Sf/kLfPa+JO5T8eHRP4llpvfjS
 Kd2cL1hurakQJuco2PhZ+pC4y4FbKSOhQaBTLjKKAzgcsTpNFcXL4fVu8ZF+vLhtzjUc
 wdyep7LdHKYFFSki3sH29bLimSBErB/eW9JP9YF4cpjUYsNaLAbLN2+o3bC+7aAyGAMx
 3OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xB/6g29U0lIw7XIVVknV4zmtNvmvoQ9kAzWGVa2HK7o=;
 b=kf63DGoho/eJiynKrb4VEpebDYKDWJmwtinRvkAiHd9OTKA2UJn36pSfy7rL+OeF5C
 4Gja+v5VwkjWUN/TBGTilHZzBqgkaGu+XeMOQ8Dxk0T63i35Himn/t/yOTddi9orHu6i
 02Jys2iKloHSxEIYb+4u4Ke1Rn4+vksuuTClb8W33OLR19dvn5ztID9W3WUQBu2DLHIi
 8CVY2CycHlmkPVeHdNah41vNeeiSHIPB54jNhsBVzCiwwEFC8wMOyYwwisGaF+yYdIb3
 36DdBcZyvqEJVHIYECdBteeQ0jGIMAhOiXfx8nq/GV6eUeYxKGP+0MZBdjDG7oKgmf4v
 1N2g==
X-Gm-Message-State: AGi0PubKknoPBp5kk/FA0EyWWz/t93TSuKQ11tyrzu2naBXe1rO1lPLC
 XG/0pzDS6NqhZ+cpy8IDFVqXxcg077c=
X-Google-Smtp-Source: APiQypL1oWViv7EVy+a1otc6dqzN6LVRG4BG37MTkly8prSpXS4auoECJTXMBIxX0lpcGQlRkEcw1A==
X-Received: by 2002:adf:df01:: with SMTP id y1mr3607024wrl.401.1588331709695; 
 Fri, 01 May 2020 04:15:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i17sm3491992wml.23.2020.05.01.04.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 04:15:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB3E41FF8F;
 Fri,  1 May 2020 12:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/4] .cirrus.yml: bump FreeBSD to the current stable release
Date: Fri,  1 May 2020 12:15:04 +0100
Message-Id: <20200501111505.4225-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200501111505.4225-1-alex.bennee@linaro.org>
References: <20200501111505.4225-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hopefully this will un-stick the test which has been broken for a long
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 90645fede6..f06f5af2b9 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -3,7 +3,7 @@ env:
 
 freebsd_12_task:
   freebsd_instance:
-    image: freebsd-12-0-release-amd64
+    image_family: freebsd-12-1
     cpu: 8
     memory: 8G
   install_script: pkg install -y
-- 
2.20.1


