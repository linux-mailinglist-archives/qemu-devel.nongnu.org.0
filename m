Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41D39632B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 17:06:13 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnjUa-0004Hk-KC
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 11:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjMP-0007TJ-7E; Mon, 31 May 2021 10:57:45 -0400
Received: from [201.28.113.2] (port=60167 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjML-0001Ug-Sj; Mon, 31 May 2021 10:57:44 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 11:57:32 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id C88E4801482;
 Mon, 31 May 2021 11:57:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] HMP: added info cpustats to removed_features.rst
Date: Mon, 31 May 2021 11:56:27 -0300
Message-Id: <20210531145629.21300-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 31 May 2021 14:57:32.0992 (UTC)
 FILETIME=[490E7400:01D7562D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_20=-0.001, RDNS_NONE=0.793,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documented the removal of the HMP command info cpustats

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 docs/system/removed-features.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 5a462ac568..2feae41089 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -249,6 +249,11 @@ Use ``migrate-set-parameters`` and ``info migrate-parameters`` instead.
 
 Use ``migrate-set-parameters`` instead.
 
+``info cpustats`` (removed in 6.1)
+'''''''''''''''''''''''''''''
+
+This command didn't produce any output already. Removed with no replacement.
+
 Guest Emulator ISAs
 -------------------
 
-- 
2.17.1


