Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B048D2DFD12
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:54:10 +0100 (CET)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMZd-00063l-NB
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQk-0004jH-Ok
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQi-0007eS-Dw
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:58 -0500
Received: by mail-wm1-x32c.google.com with SMTP id g185so11155101wmf.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TXSA6eUd0by8kp0ro6t2CSTlJGcK5halbz63a1xMae0=;
 b=IBEifJWa3Ds9CID2Frav66i+0UoImSQ2SWSTnZGZ8JlWehCG88VnHneLQ7tjGzXA5m
 dK/R7nPDU6CH8IOGdAzE1fkdQQ6MJwT3fqRwwzbyhzr8SkkxBL1SJ1HzkklHQVf8T4I3
 0GeN2UpPps4mf09OXagP+sUE2k+qxcxvE25mvA+AThbZs5SvdAFWfjGt3zjtU52NGnCH
 IJxOKYNv66MBVuvjCN9dwTocp0csZQwdqiFPSjafxU0w/30/YFnAZ5DrSlY7JPuf4HRf
 Z1Vd0JFp2FhNMYBcie0C8rPrGS1OzqMg+deUpEDeGqQxU2cm72t1BkDYibr3pyHqx3M0
 6zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TXSA6eUd0by8kp0ro6t2CSTlJGcK5halbz63a1xMae0=;
 b=UB9AcuLYfzaJCFK4N7Ui2c+Pkuqt11ZPjhOg02LraajC+DzA8lOObmcblTA+OLBtjN
 3i5mExnpisH6HFqHPuBEqyMopskV4dyyWr51k1q965uFlRHE5KUIvtDGDz+IgpvdcTld
 ObAgIilc2Q5pGW2QJjO35FDsq6HK3B3PJC4XuYx7yqJL0C8Ji37G/YIKlvhrL5Dlqw12
 6Oh2wn2MLpphchmXAyCepK7186mJCrhoVY99ydrez0vePnLA6MXeMqwzV09SqLQ1vgcm
 0qb6jKiv7EQZxSah9ETp/DhmgLR16creL1OPzZBRGlKjpw6JWeMpEVaFMJxgunDshO1H
 B7Pw==
X-Gm-Message-State: AOAM532MRlL3XUkuIVBDQ8PSL9NH1P9CFb7TVJwXLsLF5BiSJXXNDHdu
 ItZJGa1hPTMdzFIitW1PhTxNAxu6qLw=
X-Google-Smtp-Source: ABdhPJyQ5Gmh3jy+RdVxweB4bJ7iRuM94riWWlk74RVEhGFgIRgouTjSDCaeqa2PYF22YHsHDFM8hw==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr17414612wmb.98.1608561894934; 
 Mon, 21 Dec 2020 06:44:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/55] gitlab: add --without-default-features build
Date: Mon, 21 Dec 2020 15:43:58 +0100
Message-Id: <20201221144447.26161-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201210190417.31673-8-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 495ff59340..6af8af371e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -521,6 +521,13 @@ build-without-default-devices:
     IMAGE: centos8
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
+build-without-default-features:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-amd64
+    CONFIGURE_ARGS: --without-default-features --disable-user
+    MAKE_CHECK_ARGS: check-unit
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-- 
2.29.2



