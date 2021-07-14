Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D187F3C822F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:56:19 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bco-0001Zw-RX
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQE-0005EC-4F
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQC-0000Bh-Oe
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id n4so1178239wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rG24NOR91Qg2+XeFSWWcaoLy60AMCL04c6OnSuNktSk=;
 b=F3fsts63ns2bvAUIeKT07lr6jPPF3Y26M8kPqcfT7lVV5UeRJKjfH5X8jxa48QDEdH
 RBnCuXXrjR3cM3tU1l3fE9h39ri9Egmi7f5mVxDga/qE/sfhxg7af33PcsZM2MZGYKeI
 XPhB1Ihg7G5d80yV3ptQCR2dR9PI+00IhtHqK1VHtmGiEFvrCk0RbrmioMYorfspp8dW
 17CdPS7iU28/I6BlvGd/umwVHO2CAko5IaETLE3+jyplgzSpBvHf1WcVSYFOXkUedI8v
 yXOa5Nmlj+OHEYvbsLsWi4cq2VLy8DJGYlFgNgBGSHijhiyOj/nAhR0ImlBmQBO+J66N
 tXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rG24NOR91Qg2+XeFSWWcaoLy60AMCL04c6OnSuNktSk=;
 b=NNSIJd+0Sm6EDYcwv+nTohZc6tktjaPRyuYwg/BlysCYud3wbqOiUM1rBES08peB3F
 IBzUfNEjgrlCgW/6AQHtR5DN52tAecVgAF3AvmrMwSrDC75UDx6k1fg3gu/vXKkVQKOQ
 n41c96844V7++1yBuBbnMCeV9TOY3xsGrC7U3TdQDGNZw1JMKmy/u/LTGyoKreZhG13T
 YCMioz5/ZiozGBw5FVrxprxXPHm/2XAt81KxDqX6DGRdZPwYTpb+MVySMlPukTtXaG+i
 l9sSPmsRQmsOhFX2JSg/1pa9JAnO/EKZhbXHEPkjnn3stgjeS2vW0sxw3kci0/A1L7zi
 pd7g==
X-Gm-Message-State: AOAM533fazChAwUExkOcBcxOAfu9meG68qnxMuoNdiLCuxsT0WW4/uUB
 D/u059UnV0CLHqkr0Ho2ix2czw==
X-Google-Smtp-Source: ABdhPJyKqCRKh4H0iamg0j4T4iwfOg4sSzOG3Ic/zKolfMBX120cqhnRj/EVmoOYWLxw3pDsvTxNMQ==
X-Received: by 2002:a05:600c:3507:: with SMTP id
 h7mr3035047wmq.9.1626255795484; 
 Wed, 14 Jul 2021 02:43:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a207sm5552904wme.27.2021.07.14.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D51341FFAC;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/21] contrib/gitdm: un-ironically add a mapping for LWN
Date: Wed, 14 Jul 2021 10:37:11 +0100
Message-Id: <20210714093719.21429-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
 Jonathan Corbet <corbet@lwn.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this mainly comes from kernel-doc stuff imported into the QEMU
tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

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


