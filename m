Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D52A24E9FE
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Aug 2020 23:22:48 +0200 (CEST)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9ayM-0007kq-Ve
	for lists+qemu-devel@lfdr.de; Sat, 22 Aug 2020 17:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k9axH-0006Yg-6b
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 17:21:39 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:55272 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k9axF-0002sC-F9
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 17:21:38 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3AD4C574FF
 for <qemu-devel@nongnu.org>; Sat, 22 Aug 2020 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1598131292; x=
 1599945693; bh=1iC9vP5PrDCESFkXMTSEysJ9BME3aI7lD78NFneJLY4=; b=f
 QO/RvvXmymQwrgIwBtjGPOgjt1rSzxD4Kvgl2onIvpOPn9p2EehTfqeSk2gq4rfE
 UgNlid5G50aBhZhr6NzrhQr9nFePCd5LfPTyxz3s1Hydf2+hCUu3+tadPt+GilHz
 +G8QPQlKk54luDP06TaTfzayAj63wnOIAhZMaMIA4I=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g51y9LGCy6fn for <qemu-devel@nongnu.org>;
 Sun, 23 Aug 2020 00:21:32 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AEE885604F
 for <qemu-devel@nongnu.org>; Sun, 23 Aug 2020 00:21:32 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 23
 Aug 2020 00:21:32 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/4] Compatibility make fixes for meson
Date: Sun, 23 Aug 2020 00:21:25 +0300
Message-ID: <20200822212129.97758-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/22 17:21:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The set of changes addresses "Diagnose "make is too old" in configure
(or in the makefile?)" from https://wiki.qemu.org/Features/Meson#Easy.
It also provides cleaner backwards compatible build invocation on macOS.

Roman Bolshakov (4):
  configure: Use discovered make for in-source build
  Makefile: Require GNU make 3.82+
  configure: Prefer gmake on darwin
  configure: Test if $make actually exists

 Makefile  |  5 +++++
 configure | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
2.28.0


