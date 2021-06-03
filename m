Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E06399CC7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:41:12 +0200 (CEST)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiud-0000bP-4Z
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid9-0006kg-Ar; Thu, 03 Jun 2021 04:23:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44211 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid7-0000A1-2L; Thu, 03 Jun 2021 04:23:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5n2vfpz9t0k; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708557;
 bh=iY3fhUNzEBXBbQPoeCEyR9Ec2rbI6inTAeHcoKCPmgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DFp0W92P6uDq1vy1MoekNU23nM2x0gkm3/nf5JWYlqW4Ll7/EB9vo/jaFAYQX128A
 xYR2ZgGeXbG8cut/MtDfrpoXA64IQX+aGPKYbGgaEIhR0MV6gwxW+9q4s7hWmvGsfg
 Ihf/cLsHFaVd6XqewwR+debPQmyWQhZMmlKt6wq0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 21/42] HMP: added info cpustats to removed_features.rst
Date: Thu,  3 Jun 2021 18:22:10 +1000
Message-Id: <20210603082231.601214-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Lucas Mateus <lucas.araujo@eldorado.org.br>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Documented the removal of the HMP command info cpustats

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210531145629.21300-3-bruno.larsen@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Lucas Mateus <lucas.araujo@eldorado.org.br>
Reviewed-by: Greg Kurz <groug@kaod.org>
[dwg: Fix a Sphinx formatting error]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/system/removed-features.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 5a462ac568..1d22195b1d 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -249,6 +249,11 @@ Use ``migrate-set-parameters`` and ``info migrate-parameters`` instead.
 
 Use ``migrate-set-parameters`` instead.
 
+``info cpustats`` (removed in 6.1)
+''''''''''''''''''''''''''''''''''
+
+This command didn't produce any output already. Removed with no replacement.
+
 Guest Emulator ISAs
 -------------------
 
-- 
2.31.1


