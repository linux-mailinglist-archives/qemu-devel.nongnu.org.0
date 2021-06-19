Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD363AD924
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:47:49 +0200 (CEST)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXZt-0005hS-14
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1luXQ3-0003mL-KN
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:37:39 -0400
Received: from rev.ng ([5.9.113.41]:49405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1luXPx-0003rd-Fm
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7d7j3SsFoD1KzHU530rBTQhLwbBsidZaNBbNipYFAi0=; b=mO5tmY9N2cl+oFKQA2zlTO0Z/e
 mUolE8+uqx1V4XbdXne9HkKGft3mcFtRhF84RM84F0waIkSf3gm51z+jb3RbgFHqRtZuY6KLA/873
 ikfdncKkE6OZp1U5xwWgS25lkYN0152bIxTiwUjqUtInuMoa2qxM3VmVjIhqyQSJviBc=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v5 02/14] target/hexagon: update MAINTAINERS for idef-parser
Date: Sat, 19 Jun 2021 11:37:01 +0200
Message-Id: <20210619093713.1845446-3-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-1-ale.qemu@rev.ng>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd29042..7fd32062be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -192,6 +192,8 @@ Hexagon TCG CPUs
 M: Taylor Simpson <tsimpson@quicinc.com>
 S: Supported
 F: target/hexagon/
+X: target/hexagon/idef-parser/
+X: target/hexagon/gen_idef_parser_funcs.py
 F: linux-user/hexagon/
 F: tests/tcg/hexagon/
 F: disas/hexagon.c
@@ -199,6 +201,12 @@ F: default-configs/targets/hexagon-linux-user.mak
 F: docker/dockerfiles/debian-hexagon-cross.docker
 F: docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
+Hexagon idef-parser
+M: Alessandro Di Federico <ale@rev.ng>
+S: Supported
+F: target/hexagon/idef-parser/
+F: target/hexagon/gen_idef_parser_funcs.py
+
 HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
-- 
2.31.1


