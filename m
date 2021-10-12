Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C868B42A80B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:17:16 +0200 (CEST)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJWl-0003m4-B3
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maJUX-0002e7-RZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:14:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maJUW-0004bS-8r
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:14:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id m22so68092880wrb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Kf32EqSUpabWGcKiAFJ+fYbBIhv/QXgQeZBr/wOjIw=;
 b=BHPBn6CM2aDEmdMmXyFJlxkCFWc99A8XhjQWNXULRucCnOcbtZwq3NR8wNwblpzX1p
 V+RfzXBhdzSxsk1PIqWqU1cyxYum0kfDeNck6hVyGJZfwQ0LQL9B5fxBFM/3twqWWq5v
 P0yTQLud3/h5LWWP4TSUEXWuWQsZW3zxfVUz+sVqEGYSdH8bhTbw5wbzxj2QkwVIGi+w
 DI3Ff+l1OMUKS5CATgG4i2hgX6lx56NOZM8/aqQnnvk0kUyU9hmdm0GrbrDY6yrU5Ios
 gnzdIdJblDGMEFULhuL+EvslC8eB85GDNeGeKLisHpZ4SoNWyiwD4FyVxcY0EalrpA8n
 8nyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Kf32EqSUpabWGcKiAFJ+fYbBIhv/QXgQeZBr/wOjIw=;
 b=0wtfdMBCu7+YpK5gINyitBNxNFY57xyGc9sXFFgS91tG9beKoIh6Ors6G3Cw1XSB9k
 GC94aVJx0ktMc3QGnWh7UQ1Vj2Xh1QTyqSDspywL81znlgUamXZAwr6HISCU1B9b5FMV
 4tRECZkO9qKLTRuhHlhErRU5+r/HdOaaukcinfuB+pDquxovNUG1nxpZ1LjBKwTooine
 kazlaT5XjRTfx/EvTk0J/UcMVHrnAK7sLI5wwo9E08qRpPk1m2VxiTTCuEN25XL4MI8P
 bx71LdgVjKoMRe6Fi4bW9q9VEUCjUreEm6PK8BsQuMDnTvSp+VEpg9uBbbcVV9sw7vOd
 lRnw==
X-Gm-Message-State: AOAM532oroe1bmJJ+HprkUmheTUIeMTi+JzEtOsDFztGCfL49mhcx2UJ
 enjWWwsy1/336paAykJDtuAzZg==
X-Google-Smtp-Source: ABdhPJwUsIn6kplmuUB84QaHgh/0Hh5NyVCFqu+9VFfJKLOgQy1Phodr/ulHBlInHwH8V8nnf+rr1Q==
X-Received: by 2002:adf:c992:: with SMTP id f18mr32844106wrh.138.1634051693061; 
 Tue, 12 Oct 2021 08:14:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d9sm8757048wrm.96.2021.10.12.08.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 08:14:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1CFD1FF96;
 Tue, 12 Oct 2021 16:14:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: update location of microvm docs
Date: Tue, 12 Oct 2021 16:14:47 +0100
Message-Id: <20211012151447.4147923-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: e8eee8d3d9 ("docs: Move microvm.rst into the system manual")

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f..aa8188f87a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1609,7 +1609,7 @@ microvm
 M: Sergio Lopez <slp@redhat.com>
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-F: docs/microvm.rst
+F: docs/system/i386/microvm.rst
 F: hw/i386/microvm.c
 F: include/hw/i386/microvm.h
 F: pc-bios/bios-microvm.bin
-- 
2.30.2


