Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05664151902
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 11:52:47 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyvoz-0002QE-L7
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 05:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iyvoC-00021e-KM
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 05:51:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iyvoB-0007E7-BU
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 05:51:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iyvoB-0006wM-4a
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 05:51:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id z3so22422891wru.3
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0zOso8QNtrjIAACrp0+f6y8lZZfwOuLi1rMgKpR3tE=;
 b=JBxkesIDEIxLDtatxpYUemsCDfeZ1APdnq/qzXKHcBFmb5LeoAZEWLiWrCozUxcpDm
 XEuaXh8k5yojidYaSRTivm2nGo20mQxLuWSUB9O5EQdQDIPOf3QbAjGhaNq5YTyHfqvM
 sSnYymIEa5Ang20kK+kKJeay0d+6YIQ0VJv4o3xYwI5odmRPHACQ2AFLrs5OTAYkTnKo
 rKYsIDXKSmWkH3FQrKGAOKK9eMDLLhIHm57qF9gb1YmSQnWjZdDJnYXQRvBWZyQmlhuX
 sg4aApCaCpVWb2ZpR+xObhqiyzRT6oAD5YGVDZRPkIMGFUb6tlwpRPiXU4OIwJNXZiLF
 aPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0zOso8QNtrjIAACrp0+f6y8lZZfwOuLi1rMgKpR3tE=;
 b=saZrRFtMrd1JZlCVWxD4kdBx2iSgzCKk568sivEuBx3bch0WXX+AsPuRnOuQDGBmt5
 3HvLFgOmfBgXCnEvnPLhCtC+erGfYpcuLshAa6shT92DbduIRKG8yOsgVHPGrOgHO48m
 1oMEuWu8u1AA8Am/RSRy3sCdAMXA5+Er0aii1DNuED3pc0icC8JNfv8MLZL9JQgYrMau
 Y2ycjPktvt09mmTBUC3TafYaObuMCo96p89PSd25fKMv1FDP0xZmvOU79+BMGGsfLn+I
 w4XCMGsgjE/xRVDPcV4ZlF7Uq8Dz651aV/pBXJJUDQFbBczplwWBM5lJHLqbLm3pAyID
 3m4A==
X-Gm-Message-State: APjAAAUpnHihVVETkJdxf30tPpQFkFCuuWT4rcEAqnP8ysVIHM0OOy4U
 vN4YSEU5tJgW0TK2604xyX4k2g==
X-Google-Smtp-Source: APXvYqzi4NIjxs9jTdWfjSeuKB1PhLKOTE6G3djrU7DCtjLeEnA++5g5ZcbaZ5x59bcpBr4tj7nO1Q==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr21392652wrm.293.1580813513509; 
 Tue, 04 Feb 2020 02:51:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p11sm17205242wrn.40.2020.02.04.02.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 02:51:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9D811FF87;
 Tue,  4 Feb 2020 10:51:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] .travis.yml: ensure python3-sphinx installed for docs
Date: Tue,  4 Feb 2020 10:51:42 +0000
Message-Id: <20200204105142.21845-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index c1c6df475a8..8bdebd36c1f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -194,7 +194,7 @@ matrix:
       addons:
         apt:
           packages:
-            - python-sphinx
+            - python3-sphinx
             - texinfo
             - perl
 
-- 
2.20.1


