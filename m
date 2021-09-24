Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DF41701E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:12:51 +0200 (CEST)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiCH-0003Ui-IM
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mThvz-00008D-3D; Fri, 24 Sep 2021 05:55:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mThvx-0003U1-BI; Fri, 24 Sep 2021 05:55:58 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HG6pz1rDJz4xbW; Fri, 24 Sep 2021 19:55:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632477339;
 bh=Ga36AU9fbb2YCpp8PELyUwnwEw3jMIQwhFLpzI4OhfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bgqCUObGxxBG8N0G9+q2Dv6R4XuH3Vds9fG/HhUEM1RKfq8kXK9GweL6IGEit8sLK
 x0oceDo2I79ZNH3f0jnUl2Obtcalk1Q3cV2kgqC44nXmMKKvlj4Y2IjVAYM3do8lop
 rYrDkGiZdviIzkz5QLWV7j8rEk6plxoAqesxz5aQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 5/5] MAINTAINERS: Demote sPAPR from "Supported" to
 "Maintained"
Date: Fri, 24 Sep 2021 19:55:36 +1000
Message-Id: <20210924095536.441849-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924095536.441849-1-david@gibson.dropbear.id.au>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

qemu/KVM on Power is no longer my primary job responsibility, nor Greg
Kurz'.  I still have some time for upstream maintenance, but it's no longer
accurate to say that I'm paid to do so.  Therefore, reduce sPAPR (the
"pseries" machine type) from Supported to Maintained.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 937c191c8d..bfae4a55e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1316,7 +1316,7 @@ sPAPR
 M: David Gibson <david@gibson.dropbear.id.au>
 M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Supported
+S: Maintained
 F: hw/*/spapr*
 F: include/hw/*/spapr*
 F: hw/*/xics*
-- 
2.31.1


