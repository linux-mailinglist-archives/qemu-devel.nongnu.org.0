Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997374AF8A5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:44:01 +0100 (CET)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHr0a-0002NF-34
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:44:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNV-00062M-WF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:43 -0500
Received: from rev.ng ([5.9.113.41]:47909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNN-0004Ww-6X
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WJZSsUQ8bO7Wqe3qfFE/rsaqzvuNjBg3TltKoGBFQqk=; b=te3lQuLoPPK516ifLfcETYCxKX
 E2Z8eCM5ia1bgqQ7SwHefV5r+wIrgxOFS+wqXBokWQ6cgnWDsFxmWz7pggEt3fJsL4RzDLpWFE1+I
 pMYrQ2OqpUY3T1K5eUUKUGw38oTgdVu5f/RXDv9ZZmPCKyLoYKhHEc/8eF+TjTHvLGOk=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v8 01/12] target/hexagon: update MAINTAINERS for idef-parser
Date: Wed,  9 Feb 2022 18:03:01 +0100
Message-Id: <20220209170312.30662-2-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-1-anjo@rev.ng>
References: <20220209170312.30662-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9814580975..1195edf040 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -200,6 +200,8 @@ Hexagon TCG CPUs
 M: Taylor Simpson <tsimpson@quicinc.com>
 S: Supported
 F: target/hexagon/
+X: target/hexagon/idef-parser/
+X: target/hexagon/gen_idef_parser_funcs.py
 F: linux-user/hexagon/
 F: tests/tcg/hexagon/
 F: disas/hexagon.c
@@ -207,6 +209,13 @@ F: configs/targets/hexagon-linux-user/default.mak
 F: docker/dockerfiles/debian-hexagon-cross.docker
 F: docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
+Hexagon idef-parser
+M: Alessandro Di Federico <ale@rev.ng>
+M: Anton Johansson <anjo@rev.ng>
+S: Supported
+F: target/hexagon/idef-parser/
+F: target/hexagon/gen_idef_parser_funcs.py
+
 HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
-- 
2.34.1


