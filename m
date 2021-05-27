Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D739345F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:55:44 +0200 (CEST)
Received: from localhost ([::1]:44516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJIM-0008IP-I0
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmJEh-0005YS-CT; Thu, 27 May 2021 12:51:55 -0400
Received: from [201.28.113.2] (port=45624 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmJEd-0006gi-5a; Thu, 27 May 2021 12:51:52 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 27 May 2021 13:50:44 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 73B838013E1;
 Thu, 27 May 2021 13:50:44 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH] HMP: added cpustats to removed_features.rst
Date: Thu, 27 May 2021 13:50:34 -0300
Message-Id: <20210527165034.23562-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 27 May 2021 16:50:44.0638 (UTC)
 FILETIME=[6F8A63E0:01D75318]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, groug@kaod.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documented the removal of the HMP command cpustats

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 docs/system/removed-features.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 5a462ac568..a88ff7aff4 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -249,6 +249,12 @@ Use ``migrate-set-parameters`` and ``info migrate-parameters`` instead.
 
 Use ``migrate-set-parameters`` instead.
 
+``cpustats`` (removed in 6.1)
+'''''''''''''''''''''''''''''
+
+This command didn't produce any output already. Removed to avoid expectations
+of maintaining/fixing it.
+
 Guest Emulator ISAs
 -------------------
 
-- 
2.17.1


