Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5AA3C5CBD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:02:16 +0200 (CEST)
Received: from localhost ([::1]:47538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vZf-00056A-Gi
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7N-0004oZ-Id
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7L-0002KW-V7
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id n4so888092wms.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ostg12cD5MaGqrOjfyo2IBJRdLr2Aw7UmUZUCJ1UFE=;
 b=jQVXrWOw4NrpQ0U4Ea35l5qqnI3T1pMAsthDfYUJNcVE9QiAsZKz3KBgvwlAaO5tML
 HPYVbKeOsS9COeGnDZByEOvT6GiL4EOIY5mPhTqaayRRs0PIk6txqi/CPtZ8vyTFIV4W
 GW0IMxHRR2+Sh9M4hJFnwwmGQAolay0NJjbN2wsW/pysmy5DuS+csHhem3UZbQvNA/VQ
 VqxK2RSrvybvuUoVRygJehEWKswwnx62tGJEekS5Wvl2P8+CWeblqcm8qAHj+CmSqsc/
 cUzsVPXg7fmY0bjSfeGtxu/MRcDvq7gZaGa5PfUMZ6F0WksqLkT+Z6cELY1W6acHInWb
 zJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ostg12cD5MaGqrOjfyo2IBJRdLr2Aw7UmUZUCJ1UFE=;
 b=CoJynn4oCaxHYfj98scLWK/Zjs+8nfvjqs80/WBcP3QfZJ+CT/RBXNC9jPx/g3Jlof
 c8rSv2gX3NZLn+3sN7pskBcqZ26V/3SRXIQwLpjWIlrf1raM7toddQ3kug6KSQeTFvrj
 eIVMMhWfmHHZPhc7kyEmKbiwiryUNa/drPEG1bxwd6WqbpruIETYmNiyO1vskY1t1IND
 TisF5QjAoKr3Fj0isltxbsPbeOobx2kOAE4oVMif73F77nE+ltpNr4zlQcBE8QUj6uU1
 Egdz8T8D2MSx9eexFLkZN7HdVFG9K6KeBAXHc+ij2ikaQV2+oqcQ7eGHZgRfFiT0FBrD
 nxww==
X-Gm-Message-State: AOAM5328AUA4szALsJDRxALvhh1gPQtxjNLQBub6+g6Ctjhj/1+VURMv
 Sl9QuG1p924/iP4Cjibz5r2JSA==
X-Google-Smtp-Source: ABdhPJwJef1UnHBC6F+AZ7a4PzUfo7iJnimlmNVjnEwH5jNvh05TJqSLHxm0WfY3MO7h5uJzvPjDcQ==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr14317188wmk.124.1626093178045; 
 Mon, 12 Jul 2021 05:32:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k20sm13143774wrd.70.2021.07.12.05.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 02DAF1FFC2;
 Mon, 12 Jul 2021 13:26:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 40/40] MAINTAINERS: Added myself as a reviewer for TCG Plugins
Date: Mon, 12 Jul 2021 13:26:53 +0100
Message-Id: <20210712122653.11354-41-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-6-ma.mandourr@gmail.com>
Message-Id: <20210709143005.1554-41-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 97ad270762..af7764e04a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3019,6 +3019,7 @@ F: include/tcg/
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Alexandre Iooss <erdnaxe@crans.org>
+R: Mahmoud Mandour <ma.mandourr@gmail.com>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-- 
2.20.1


