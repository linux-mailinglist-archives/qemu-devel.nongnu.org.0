Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08305B8975
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:48:52 +0200 (CEST)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSl1-0003YI-Pf
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oYRiQ-0000ho-Tn; Wed, 14 Sep 2022 08:42:09 -0400
Received: from [200.168.210.66] (port=2858 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oYRiO-0001ac-QH; Wed, 14 Sep 2022 08:42:06 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 14 Sep 2022 09:41:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 65FB38003B3;
 Wed, 14 Sep 2022 09:41:55 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PATCH v2 1/4] scripts/ci/setup: ninja missing from build-environment
Date: Wed, 14 Sep 2022 09:41:50 -0300
Message-Id: <20220914124153.61017-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914124153.61017-1-lucas.araujo@eldorado.org.br>
References: <20220914124153.61017-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Sep 2022 12:41:55.0697 (UTC)
 FILETIME=[5F6A0610:01D8C837]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

ninja-build is missing from the RHEL environment, so a system prepared
with that script would still fail to compile QEMU.
Tested on a Fedora 36

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 scripts/ci/setup/build-environment.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 232525b91d..6df3e61d94 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -150,6 +150,7 @@
           - libepoxy-devel
           - libgcrypt-devel
           - lzo-devel
+          - ninja-build
           - make
           - mesa-libEGL-devel
           - nettle-devel
-- 
2.31.1


