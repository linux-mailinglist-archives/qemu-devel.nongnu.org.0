Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111F55FBB9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:21:45 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TtI-0007s4-22
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThF-0000kF-IR; Wed, 29 Jun 2022 05:09:21 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThA-0003Zl-Sx; Wed, 29 Jun 2022 05:09:16 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M4aA4-1o5vC71J38-001i9J; Wed, 29
 Jun 2022 11:09:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Lev Kujawski <lkujaw@member.fsf.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/11] hw/ide/atapi.c: Correct typos (CD-CDROM -> CD-ROM)
Date: Wed, 29 Jun 2022 11:08:47 +0200
Message-Id: <20220629090849.1350227-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SCtBzSiIZmrPviMiR6mXkRJR80aYLUL4bsQC0WA9VSa9RLV0bEv
 D0OcbQUle/8PTMAg7P7PyhNB1eosbcK6Sqjd8x35a7LVm6EXv4iA/VkVjkbDYoD/XAcxieQ
 k1znXgEulpNBIujmKNGZ4xM7vT+HPTIZxqXMTjNCFGdZ6PVEoHeH6PAeXL4boDbTitkKwvq
 07UFe6JoEzlV680CGkOjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g2Git6X65bg=:qVdp0lcKp0kmoXK/8dctP6
 DPedxTjXMY2bdH3vVl6ctK4R+DNEtHa1qr2F7wEXPOgG4rKBisLvzqpcwcfsXP2OhQoP4hOQF
 qLuuA19gtVY6dIuJrxoL3aDZSbMGODbF8DnlFFTcAtgN+SQ0V0Pw7Cq/iubqjpUmO4jCutkmi
 p6u4mhc6KiT7FtqH0cQibxkrP30ypcineqRpbfh5PD1cwChCiflbLgaUl0ZzlCU4p07WtirJr
 lCtOsI9crJUHUEEbaLRTXVxuMXW0BssLfCmno6eOgmhQjiOClr+pFYWeWyImgHx+tHDb+nl1d
 dG+XjgOfIdI1miXRD/KWf1Qdk+yuRZdU9bespSRhE7tAS/QvVGIJr2QZ+sE11bjoUt9LURdRq
 OKCm4+n8D923GfVR4NVxQ/oms1WI+r4WMcDhtZozOMXd/mwma/PiB1xxysgZFhN+kAfgGQiyQ
 mh/h3znOR0IoHcjE8oY5qFbbY7Z8uqeI2epgl8sYVWWWmUhi5eJMIYpJOAFFl92VwoN56eZ4G
 0+Z8jW13wwsZ0K9ZAxQ4/LJU4sTsJYFrX4ySp+79V2HarxSVCT/rn5RWz0lYt0G2llzKU0blx
 J5kMRt/67dcDN2RQ9ebuZxGqqL/xFKfLkwt1+QXFRnAwZ9eY6Gkm9pUWzC4w4V/1ByzwQ/2g7
 Hkn4DclMsJEPekIKddkCvbfIu+YpEz215GPZoGfGmVwBuNRbLaPfqPrvz8uB4FNqEwZFaa7OP
 7P/sUAjxykO7HMAl6XNTajVSN33qnzg+1xguVQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Lev Kujawski <lkujaw@member.fsf.org>

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220528204702.167912-1-lkujaw@member.fsf.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ide/atapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index b626199e3def..88b2890fafe4 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -318,7 +318,7 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
     }
 }
 
-/* start a CD-CDROM read command */
+/* start a CD-ROM read command */
 static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
                                    int sector_size)
 {
@@ -417,7 +417,7 @@ eot:
     ide_set_inactive(s, false);
 }
 
-/* start a CD-CDROM read command with DMA */
+/* start a CD-ROM read command with DMA */
 /* XXX: test if DMA is available */
 static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
                                    int sector_size)
-- 
2.36.1


