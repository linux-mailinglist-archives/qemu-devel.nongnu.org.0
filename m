Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230B8702748
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:33:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTcK-0003j9-Mk; Mon, 15 May 2023 04:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc4-0003hW-AF
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:24 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc2-00023j-PF
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:24 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MDykM-1pqjr20cpo-009xMc; Mon, 15
 May 2023 10:31:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 6/9] linux-user: Add new flag VERIFY_NONE
Date: Mon, 15 May 2023 10:31:10 +0200
Message-Id: <20230515083113.107056-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w+dGeldcqM4BE2uD9BGBUlH9VV6JqJq6RDfc3MLowwFWljHvtzp
 eOBqAEfWVenZrfawkpdLmdN2pheXbMcorl9cPdrrlVs0wtkiSgZGTgdviiB7TH3CbwF4UO1
 1tZHhu8FVaF31z03egD94NeAU9rQTdiYHdLP1eBqnezfthS/aIJJ+QcZSbPFD/SE1huwMyT
 OxDNdoifAsKU/2hN2OgZA==
UI-OutboundReport: notjunk:1;M01:P0:saVxXJJWVHg=;Cl+5vQRukEqlv1pniWViIFT+lb3
 Extuj0/a/s+zDgZwX0mpDnIwnr8RJyHctD9kufFIhYUMk/K1xDmjyY3HUkzYuK66SVjIf80jH
 Th9W1JCu0hE4dxapOW5yx7I8z+lZiYCDGHYBA917j0S0cvSlltN9PLqdJvfKuF1InZ0uvO4kK
 STHmY5MmOY7bhs7Rd7L3i7pjpuHFcV6h5f79fHLHLbW09cfWoCJd5gPSCFLtafUpXunhtrzDF
 hAmLsuRLgtQsnG92CO123/AZ3CzzouYbdpb/N8lXdSPn/xdQMgIj3bGAZZgadIdQ/s9mh8v+/
 DyPqIrvTOypJRumQK3w7pHa7FqVPcnqNmnbYBscVHpts0B/97JvUn/MGfyJWusd5D6M2nggh1
 A3uJm+4l2UlgP6sY6eEvCKsRFk0926Jn41wMLTcQHVWTZw8ddWTbQ9yA7wliKvjt6M7SzgSod
 YKo+kc3YrZuqchveb+o/lpfGZ9HjEMJNo9Ur2DM7SV/mvz0Qu745m2Zh1EPnNs39Kb13FnUqo
 5JPDgnx4VuPWFhWZCBZsc/bJOvAuj39pteBiqq5XugB+YwCg+ToXwwE6W/JBxCco9+zakJMKz
 IKYqEHQbGyWH3dE0Idg3p0zVJAU01j28VXDEjmQiSGrbrX+Q8wY9DoynFiq4CDwG3RYFGGRlH
 Jicqsa3swvi1UXQ4qx5A6hkUCMosn0EwNFRs+bCi1A==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Weißschuh <thomas@t-8ch.de>

This can be used to validate that an address range is mapped but without
being readable or writable.

It will be used by an updated implementation of mincore().

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230422100314.1650-2-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index e2e93fbd1d5d..92f9f5af41c7 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -168,6 +168,7 @@ abi_long do_brk(abi_ulong new_brk);
 
 /* user access */
 
+#define VERIFY_NONE  0
 #define VERIFY_READ  PAGE_READ
 #define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-- 
2.40.1


