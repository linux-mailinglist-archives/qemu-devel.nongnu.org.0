Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136023D3E54
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:17:01 +0200 (CEST)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ynE-00032w-13
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg3-0005NN-HJ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg0-0008AS-NC
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o3so1214598wms.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LsnpUsU2li6x9t39sHs72t+hr1BV/+kxBdwYfZa0cEk=;
 b=oAHxEGYjUHQN/2cnJdQrYyYxgfFAvUHvuC1Wjko46Ve8XtLUeY4ZGp2843+BElNSHj
 O1xoWBBMi9Ca80zWSVgYiHVmYYF6LafrIkYlV3VlYOHi66qPGDWfeInuFokH8GUpI5M+
 6hES9tVy47T4fX1jVKu0Ru0VqgL9vi3Bi8bGdZ5xLJO7kLS/GvXgi7xu+F7UQrhsY6wl
 F+y0pslzu2CFcygGzL1uoqX12O5IVhOERxKnAQ4Y1t9/T4DaX10FP5lCnWuuOQsioyKv
 CsZhQG+dwvi67nOAyM5y5jX8KTqBOg0CCWpUJ6Gqaf/8tctjdYPRVRH1MDZvmh08Ma7D
 U/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LsnpUsU2li6x9t39sHs72t+hr1BV/+kxBdwYfZa0cEk=;
 b=nrxGAqo2ZIVlavKriNl9+UfzP9widpQ0ATbdD3bgSYxNuZeh5jy/ujG6YoTFRwLAMp
 uTyihzuhabbZxaeb4a1cpL3Rt1Fr1wOnfQjNTi/2Uqo6vzY5rL7ENgqf4KEBJMqa+RIz
 iaz91GK6W8L4jmTfJjuE8zSFZWV0fG8pyzNgqixfftCHS8AJc8x1sJt6RcD7QLlWJy3n
 XUb92+eamUN0VO93CXydWC+n5xCdE/5tEy9yWuE7io1PnT2LJ795j9T/ojjcgg81XM6R
 2ntVrIvIp8gVM31GWZZtHIzroz2beDBhuJ/7dkAFmBC3IfJOTzq7NjwPbBFeXn9HmkDi
 pQZg==
X-Gm-Message-State: AOAM533x0q5k+DB9rrG877zggt6J7hJ0HZvBZKRHTsUTlnGXrBJ6+FWz
 iFOQ2CaGBxV6EXloN3pDokWdqA==
X-Google-Smtp-Source: ABdhPJwKIx5+Z5BDE6FLzWEKozPErwVUQwPfnJ8uONfh4jWQEppWDPWhjPjNumJxgxMrogng4vTXAg==
X-Received: by 2002:a1c:7701:: with SMTP id t1mr5561341wmi.139.1627060171044; 
 Fri, 23 Jul 2021 10:09:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm24059187wrj.54.2021.07.23.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 69EAA1FF9C;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/28] contrib/gitdm: un-ironically add a mapping for LWN
Date: Fri, 23 Jul 2021 18:03:39 +0100
Message-Id: <20210723170354.18975-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Jonathan Corbet <corbet@lwn.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this mainly comes from kernel-doc stuff imported into the QEMU
tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Message-Id: <20210720232703.10650-14-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 27b8fbdf8a..5ac8288716 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ ibm.com         IBM
 igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
+lwn.net         LWN
 microsoft.com   Microsoft
 mvista.com      MontaVista
 nokia.com       Nokia
-- 
2.20.1


