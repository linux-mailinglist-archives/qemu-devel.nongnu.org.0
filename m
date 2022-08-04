Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB1589B49
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:58:25 +0200 (CEST)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZUe-0005xP-Fw
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oJZSR-0000Jv-Hy
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:56:07 -0400
Received: from rev.ng ([5.9.113.41]:47443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oJZSN-0004ZT-LP
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mN4cs0sAwWZFqkP3SXFRXTW8shqq0byt0clXr+HnbN4=; b=Jz754SorZa7I0KDm74Y1XMjiMT
 i9jpyJpHVtgxSkp4eFvNQR+ml/sd4zkbFVkFZGsBtxFYCCgSabA1QcLdRJ6OwXD2tozTyS7ITp8gz
 mnYDqu//Imo6dszqsFb7eGsSAqkPo92pMLKp8qrUyZKN7qvRnSBD2nXsPpWWYObDTq60=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, anjo@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v11 01/15] target/hexagon: update MAINTAINERS for idef-parser
Date: Thu,  4 Aug 2022 13:55:34 +0200
Message-Id: <20220804115548.13024-2-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-1-anjo@rev.ng>
References: <20220804115548.13024-1-anjo@rev.ng>
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
index 5ce4227ff6..6435d54e33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -197,6 +197,8 @@ Hexagon TCG CPUs
 M: Taylor Simpson <tsimpson@quicinc.com>
 S: Supported
 F: target/hexagon/
+X: target/hexagon/idef-parser/
+X: target/hexagon/gen_idef_parser_funcs.py
 F: linux-user/hexagon/
 F: tests/tcg/hexagon/
 F: disas/hexagon.c
@@ -204,6 +206,13 @@ F: configs/targets/hexagon-linux-user/default.mak
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
2.37.0


