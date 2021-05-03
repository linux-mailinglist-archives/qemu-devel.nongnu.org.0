Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84433712D2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:04:12 +0200 (CEST)
Received: from localhost ([::1]:51680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUUt-0006x4-HX
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4q-0003Yk-Ng; Mon, 03 May 2021 04:37:18 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4T-0000sC-R3; Mon, 03 May 2021 04:37:15 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MIcqp-1lpFmN3bJV-00Ecge; Mon, 03
 May 2021 10:36:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] docs: More precisely describe memory-backend-*::id's user
Date: Mon,  3 May 2021 10:36:22 +0200
Message-Id: <20210503083623.139700-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JPrJEK3oMJYX5kP+XxbqlPvCX5uBAC8+xRCfkSSsJxKok25rW4Q
 fiIQuXvfA2tUzeUuv4WthqjkOmasDFCRMZ4w/Ip+/ZvgsvvrDkNrxRZRi9UBkH9vJEutHWl
 9HkQ3Bpr1H+TczxA05xDzXyr7YmZfyxvtswmqo+kEpaOKa3oFdtPIY/vAterQb5+jY1WWo3
 I5SugdWUnyo7CMd//+dfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GobrjTqwVms=:62+2A+lWw08cVVWY57f2Rr
 aYntDF1PMj/X08y4rB7KblRYMdWcCom7dNH6+e0WyMRQW+xo3FtN2Cj+R4f92KwrfmszFKdMY
 gwH1ccFMuKVZFzWnZVqzP7ovC/LuLIRRbrCZHCxlwSbByPRZu/l2qXkD1D8NzFpI7+T05Qj5x
 rsVFBNarU4xm9f+oXwTJweUo6p3XeAAu+9VHl6k2qgR/TyMZi06ZWtXWS/s+WBrd2ff3zkUGt
 r4v9tGhy/G0f1Ub3Q6gZOJO6PyFr6PXENOiRLyEnsugPT0gFks5iA6cpcVOND/iSWsEUJoiZW
 jovq+RkADhtB9zc0hclhVNUPqVCewhExusAxsmoskugX2/DEj8prg4tf9CpCjJltxV/76ICHg
 tSiWWa4H+HLhY0SR6r35QhDVrwloc4rKRk0HPUBusQkzN174HySF4HJpiNwYH8zLYRFWoQURo
 4jfOQFcmqBYifbzgdqBAWsiyCpMtCHl9tjWGOI8amrHu3ra6C/zb4y4loJxljOPjWW11mnKcX
 NcEq+bS/KtxH99XE4usnnk=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Hoo <robert.hu@linux.intel.com>

'id' of memory-backend-{file,ram} is not only for '-numa''s reference, but
also other parameters like '-device nvdimm'.
More clearly call out this to avoid misinterpretation.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd61d..635dc8a6243a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4508,11 +4508,11 @@ SRST
         the guest RAM with huge pages.
 
         The ``id`` parameter is a unique ID that will be used to
-        reference this memory region when configuring the ``-numa``
-        argument.
+        reference this memory region in other parameters, e.g. ``-numa``,
+        ``-device nvdimm``, etc.
 
         The ``size`` option provides the size of the memory region, and
-        accepts common suffixes, eg ``500M``.
+        accepts common suffixes, e.g. ``500M``.
 
         The ``mem-path`` provides the path to either a shared memory or
         huge page filesystem mount.
-- 
2.31.1


