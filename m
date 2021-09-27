Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5085B418E82
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:57:03 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUihK-0000Tx-2F
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYx-0000KY-96; Mon, 27 Sep 2021 00:48:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYv-0000Gp-KF; Mon, 27 Sep 2021 00:48:22 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqrq1vVvz4xbg; Mon, 27 Sep 2021 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632718091;
 bh=0orLWoIADo924oWOD1wRpwmJ7wQDoUsfKtoh1f1GsHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DW34urUEzQS+DqfKw8LEINePj4m4XTtmv6C+vZLMuDNmRf+lNzLPK/VPUD9XE/Mnr
 nux0B2zzNOXTUHn2WkVkeMeB4vIY3KfTcJeNZ4SLTiHLTh21Jmq/+LeyQwiSkC1SC0
 XMTz7ryQMo+L67u1epOYV/OEx4CMXYXk5ob3YOfw=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 7/7] MAINTAINERS: Demote sPAPR from "Supported" to
 "Maintained"
Date: Mon, 27 Sep 2021 14:48:08 +1000
Message-Id: <20210927044808.73391-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927044808.73391-1-david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu/KVM on Power is no longer my primary job responsibility, nor Greg
Kurz'.  I still have some time for upstream maintenance, but it's no longer
accurate to say that I'm paid to do so.  Therefore, reduce sPAPR (the
"pseries" machine type) from Supported to Maintained.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c0fcba7f8b..8b7cb859e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1317,7 +1317,7 @@ sPAPR
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


