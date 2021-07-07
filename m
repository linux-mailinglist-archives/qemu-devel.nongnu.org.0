Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C003BEDB4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:06:40 +0200 (CEST)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BwV-0005Jk-6h
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1m1BvP-0003sK-4E
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:05:31 -0400
Received: from kerio.kamp.de ([195.62.97.192]:39398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1m1BvN-0003RS-Qo
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:05:30 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Wed, 7 Jul 2021 20:05:16 +0200
Received: (qmail 23980 invoked from network); 7 Jul 2021 18:05:19 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 7 Jul 2021 18:05:19 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 8D41013DD24; Wed,  7 Jul 2021 20:05:19 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH] MAINTAINERS: update block/rbd.c maintainer
Date: Wed,  7 Jul 2021 20:04:49 +0200
Message-Id: <20210707180449.32665-2-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707180449.32665-1-pl@kamp.de>
References: <20210707180449.32665-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

adding myself as a designated reviewer.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 516db737d1..cfda57e825 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3058,6 +3058,7 @@ F: block/vmdk.c
 
 RBD
 M: Ilya Dryomov <idryomov@gmail.com>
+R: Peter Lieven <pl@kamp.de>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/rbd.c
-- 
2.17.1



