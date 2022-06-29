Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56455FB72
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:12:58 +0200 (CEST)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Tkk-0003jW-7r
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th8-0000gn-Ti; Wed, 29 Jun 2022 05:09:11 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th0-0003Xp-7v; Wed, 29 Jun 2022 05:09:03 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1xdf-1neP8y0i0v-012IeE; Wed, 29
 Jun 2022 11:08:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/11] MAINTAINERS: Add softmmu/runstate.c to "Main loop"
Date: Wed, 29 Jun 2022 11:08:44 +0200
Message-Id: <20220629090849.1350227-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:abL5tc+B3yNhbcfKumKVvoYg4XJlvk/tfJ69LZyJTeQKSE0+5JO
 ynYVuLqA60X70n6rkTBHdqJZs4ySrvv6BbBS4u/eV3IDdGgRtLfNg3lajLeQ0W94M3CmuMU
 eP3rsDgHE2dqcZJkgo/rOJb1iO9iMF/FJugKnIKyqgLQYPTJJ3mcBG/56CHfmLUFQedOrJg
 xb5JkqhFT6vpl8c671GlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SKWzV9gaJFc=:gdbRDEABByMalj7T4R9Yy9
 RYdSRXhJlQLmuKVJukNfgegqNvL3JBCaPH83scI8z90bmcvcTsNJTasMw3sg3n0SA6tre4HLR
 85UnnYZnQDc33OtTa+2QmL7yNFFXjyoHYKOzKMHzgqzaYbSUBPpAwxMhJwaY62k++8MPw6h41
 eB1cl7yodxMUzNC6jgRn1vuvoKbZus9PNzsoIUCX+uS5gesufwlhJJz+CUBHdDud7SzYedgWd
 sQJwmYA1nQlAvGyPsZ/Db0nQ4jbu49FM4WQ4HnuLCrwKPPLjpqXkV42fzFS99mqwdltI+ygXj
 d64BdapKEyeoXXME63dBj+zFnJI5A7Bl1knn2fJnnjxU0LjLk3um48GVjH2ns7sWGjednMlaq
 lL8kf3WM1z3ZtX6sU12HW276th7T8Zz8plzOLOMU3XSz7YuPhO8T4T4IRrD9G7h2v9eLu+evb
 wV/Pm5EROwyWYd7DBV031Shojzb+61QLgRF29ZMyLOau6S4t520urzRYy+MusJ99PolG0/Rwi
 LI46xc/H9MQNGwSGT4xcxGDgqcogt7tdNZ1BAbI9kiwIdhddQGgS2UCqj0ag9E5k73QvY5D/u
 XxGOA7xGGEI52nz/YVqYff2SDOejLvTbImrYrGa+Sbtvz2m+FGMn2MQsGKRNjdoyc6qUlUlho
 cfgzz44J9fHRjDNWHSW8Ro+OmlAO+mXc/PsAykSYdHz/4PM6cUeIoqPKW61caxCes+z4q483t
 4jOkY9wJBZRAd95UE3b7f3493bUjkCLhi82MZw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220615122338.340426-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cbd6b72fa64..b8637c6f5254 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2746,6 +2746,7 @@ F: softmmu/cpu-throttle.c
 F: softmmu/cpu-timers.c
 F: softmmu/icount.c
 F: softmmu/runstate-action.c
+F: softmmu/runstate.c
 F: qapi/run-state.json
 
 Read, Copy, Update (RCU)
-- 
2.36.1


