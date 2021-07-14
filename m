Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E805D3C8222
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:54:13 +0200 (CEST)
Received: from localhost ([::1]:46022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bam-0005gw-Mt
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKd-00036e-Nr
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKb-0004iE-Hr
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d12so2338119wre.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHeHl3pMrRvL9Wr2ptGPC5oRo8vbMCPQj9p2Od1ROSQ=;
 b=CJZ8Br08vnWUrdzEACl2EwA/1sTi1/q/ckXP+ZHskot1pUvJp5Wvfq+a7hORDc7EvY
 govLq5gd3pppNKC5rDFg6jId9BBteVKyFYh7kPVORfMdOq4W94hmwi+LBpRqLZwOgac0
 XyT8dNbkBKM5968sj4Gfk8xnFddryBDG6iPscuhNmZCkY+5fhJGcL1uvWZGMxhvaFcJy
 DGZuhEBSTuL2yz2twL9bRkN0W/6AnEA+NBZFFWmF8MUjUbRK1Mzi4kT+pHl/T1cu8J0u
 mEBO2IqdrlTys/QYbsOGFk0/WzYkkhjYRL/ZLgvScMNDfygQcdwiCQK2JPY1u9/8gLqo
 jOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHeHl3pMrRvL9Wr2ptGPC5oRo8vbMCPQj9p2Od1ROSQ=;
 b=UxhA/2WlokvbUKWCNHFIz2DOOCMDHzoqj7Iy2pDcTmYcs9gMm6Jx+QBND8WUiu/xkN
 0zaR5XLE2CMsV5po86Iq1FPCRxFkC/ZgXNQXLOtYeq+LoF2zlUrZcMRb6ftt1n6emTBO
 zmKIfNsuWnG0sTD7fXpFOXifTvCsv7RLn4LHOY5hVz3pKDVtWybv2/8mf8hczj51ZL18
 sPPizYfUJIB0oXv4Q8ddgK84UCDl/+iJ/ymoJwMgQtT70xdEoMCotAtiH2esKK83roya
 aaajVU3vlddDi+93GT4h0IlbR7p0VWC8JN1ejJG1/uFHu8kHk0OR96DfWYpIXqnjEcFx
 UwhQ==
X-Gm-Message-State: AOAM532vAp9PAFKIF5wgWFofctqaM39q+uH0lXFn/ZI9B4fciuZPjdKT
 D5gSAYeJfpp299AEVm8MBy/C3A==
X-Google-Smtp-Source: ABdhPJzImftZJpEPwpLjd66o0sR4LDHodDeqKrpuuGJ+sD+2TCcqpunAI7hniCCPaD0wkWaRh720EA==
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr12004067wry.145.1626255447966; 
 Wed, 14 Jul 2021 02:37:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm1523454wme.2.2021.07.14.02.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 322541FF9B;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/21] .mailmap: fix up some broken commit authors
Date: Wed, 14 Jul 2021 10:37:04 +0100
Message-Id: <20210714093719.21429-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Nick Hudson <hnick@vmware.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Dolata <mkdolata@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 49a6f3bffb ("target/arm: Correct the encoding of MDCCSR_EL0 and DBGDSCRint")
Fixes: 5a07192a04 ("target/i386: Fix handling of k_gs_base register in 32-bit mode in gdbstub")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Nick Hudson <hnick@vmware.com>
Cc: Marek Dolata <mkdolata@us.ibm.com>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index a1bd659817..082ff893ab 100644
--- a/.mailmap
+++ b/.mailmap
@@ -27,6 +27,10 @@ Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-714662
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
+# Corrupted Author fields
+Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
+Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-- 
2.20.1


