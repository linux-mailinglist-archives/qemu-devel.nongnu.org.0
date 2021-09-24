Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9BA416FFE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:07:49 +0200 (CEST)
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi7Q-0001tt-Ag
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mThvv-0008JS-1A; Fri, 24 Sep 2021 05:55:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mThvs-0003H9-0t; Fri, 24 Sep 2021 05:55:54 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HG6pz1jplz4xbV; Fri, 24 Sep 2021 19:55:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632477339;
 bh=QrtqFXuoGm02BVmn7+hf+bh6Sx8eMrzKqlRQ71LDqd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E1iiYr92QUt0xFn1mSrVLr5SqRZeaT10gaFcWovapntdxEa2WFh7kaucs7mtK/QcZ
 ORqLJjEmqIypioi1UeLG1kfJgwnSGh77ouzbrIPtztLEgg7QC5xHeNucCMzNGRjdB1
 p2c5TogaSZBBXOaMN+xUJYWrD51Z1+y/06kYjkr0=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 3/5] MAINTAINERS: Remove David & Greg as
 reviewers/co-maintainers of powernv
Date: Fri, 24 Sep 2021 19:55:34 +1000
Message-Id: <20210924095536.441849-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924095536.441849-1-david@gibson.dropbear.id.au>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, groug@kaod.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With our interests moving to other areas, Greg and myself no longer have
capacity to be regular reviewers of code for the powernv machine type, let
alone co-maintainers.  Additionally, not being IBM employees, we don't have
easy access to the hardware information we'd need for good review.

Therefore, remove our names as reviewers and/or co-maintainers of the
powernv machine type, and the related XIVE interrupt controller.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 MAINTAINERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20436be86f..c82a634a70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1329,8 +1329,6 @@ F: tests/qtest/libqos/rtas*
 
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/pnv*
@@ -2222,8 +2220,6 @@ T: git https://github.com/philmd/qemu.git fw_cfg-next
 
 XIVE
 M: Cédric Le Goater <clg@kaod.org>
-R: David Gibson <david@gibson.dropbear.id.au>
-R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Supported
 F: hw/*/*xive*
-- 
2.31.1


