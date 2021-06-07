Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC30239E708
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:02:17 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKVs-0003Vj-8G
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRT-0003fy-1T; Mon, 07 Jun 2021 14:57:43 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRR-0005mp-0h; Mon, 07 Jun 2021 14:57:42 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MdvVu-1lFcJS1kJy-00b3iU; Mon, 07
 Jun 2021 20:57:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] docs: fix broken reference
Date: Mon,  7 Jun 2021 20:57:24 +0200
Message-Id: <20210607185730.346641-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ac47I72vAYias3vxwkfOxCfTUZrBwOUBhhz10yjGO4VU07XNXNe
 shTSTi4XDCP31Xmpyt56u3slGp+aRLwflKYgj8F5dlK2pnVSBbGQCETQHDE1dPx51GWrB9O
 SpCHys90UvuvqdSFbw2P3lKuLmFkgfogsM41wcHVxXnJlQEUV79/qkubQKIcnmQ4lCAKrcs
 PgJLBzTaI0DdwJ3wc8yZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1CcYzfhaukg=:g1D7Qq7qc2Qx4MCs3COb4f
 43OOh4p8Alz6c8e40mUitNqLs4eDF+q78mLJtQqeKTLzZv4cOv6NAyp+yHKIlFTfNSzG7xpLY
 mkjO+32SL/O3u60ochLRut3etylHHgQvwxgW045GzZ900uchqk3amJ/hJ7WwKBZeT23jXikJq
 i22QNRx1DfdzAv0GUgZkt/RSwskQ6zPjrW4Ovld23UjENlSpu0FOiT1gp7Q0vCTpv350LOQpT
 GG7qrsdeulz/grxtzDa1G8TmbMqs69oOMZM20RgEoeLTlZAAu6NQQeAxowIYkjlpneTwDFX5p
 I6OEbnaXwD9wKGHwQFG3w50xJWBr+9+hQE6ynN1gbksB+ooxdPTBJOJsgIDOf77OQmbmDNIWQ
 jDh/6rj0X8KavcV+zchbuOlF2GATLACmBUreenA/rqJJD5WriZcWMBFWTlS//hHb7jC7rE40v
 x1JHnVtbqkuBHblBIONcg7LoutrfdOEAZH5Pqfkl839vuobfgW1hMPRMFXjp02feKM58NRzMv
 kXz08+jOSfq2PoFgv0dJgs=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Long story short, we need a space here for the reference to work
correctly.

Longer story:

Without the space, kerneldoc generates a line like this:

one of :c:type:`MemoryListener.region_add\(\) <MemoryListener>`,:c:type:`MemoryListener.region_del\(\)

Sphinx does not process the role information correctly, so we get this
(my pseudo-notation) construct:

<text>,:c:type:</text>
<reference target="MemoryListener">MemoryListener.region_del()</reference>

which does not reference the desired entity, and leaves some extra junk
in the rendered output. See
https://qemu-project.gitlab.io/qemu/devel/memory.html#c.MemoryListener
member log_start for an example of the broken output as it looks today.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210511192950.2061326-1-jsnow@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c158fd708455..b114f5454b15 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -571,7 +571,7 @@ struct MemoryListener {
      * @log_start:
      *
      * Called during an address space update transaction, after
-     * one of #MemoryListener.region_add(),#MemoryListener.region_del() or
+     * one of #MemoryListener.region_add(), #MemoryListener.region_del() or
      * #MemoryListener.region_nop(), if dirty memory logging clients have
      * become active since the last transaction.
      *
-- 
2.31.1


