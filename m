Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9C550BF52
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:07:36 +0200 (CEST)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxgt-0005wp-IE
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHP-0007uX-OD
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:15 -0400
Received: from rev.ng ([5.9.113.41]:48469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHO-000610-12
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Su74dLHdWGGAh4lPFDCcuGDhqXkG048BYwmGLskvWY=; b=Bb0emtPGitmmIB0jKGkhMOalJO
 /zpk6MTQaaH05erzU0OBhAV3GADNTkeRLbNtaZBGmR7uelWFygVfuUSVRpO9FiF0NDLnhMWKK/6MQ
 XvQk/4mIO+BJBHYxzX0j7HlgKyk/HMxobML17LouqQsJwUyxH21DR1FPNELAJmXFeuPw=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 01/12] target/hexagon: update MAINTAINERS for idef-parser
Date: Fri, 22 Apr 2022 19:40:48 +0200
Message-Id: <20220422174059.4304-2-anjo@rev.ng>
In-Reply-To: <20220422174059.4304-1-anjo@rev.ng>
References: <20220422174059.4304-1-anjo@rev.ng>
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
index 294c88ace9..d6b62ff319 100644
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
2.35.1


