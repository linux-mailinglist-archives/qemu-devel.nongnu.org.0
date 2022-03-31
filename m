Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E74EE3EE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:21:00 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na3A3-000890-4Z
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:20:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38M-0005hb-N6; Thu, 31 Mar 2022 18:19:15 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38L-00019J-8Z; Thu, 31 Mar 2022 18:19:14 -0400
Received: from quad ([82.142.13.234]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M9WqY-1ndN2n2rLw-005WGQ; Fri, 01
 Apr 2022 00:19:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] vhost-vdpa: fix typo in a comment
Date: Fri,  1 Apr 2022 00:18:56 +0200
Message-Id: <20220331221857.433867-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331221857.433867-1-laurent@vivier.eu>
References: <20220331221857.433867-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GazMYegsQxuda6DoJ2ADOD5A3QtMFxPrKj7lXHcJklviIf4xTHk
 J3/9ALOz2IS0bJSq38vZiAFdKzHOz6zp9P3RhHRveg2nea68xMJlVcerNQIlmAYqHJ3Hu/s
 pm9l4EsttIFfOqQjofCcttoJUPDBcM6swE3qZJh0VH0gYiChO/yJQQzw0T6Cbr4F7sxlkw2
 /yy6qLJGNZU/v2PcqwfLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gUJDZR8uY+M=:4SyTGHS2M6JeuUQd5GSjiu
 h+dpp+M46AD/egDHUbw3z96N+r/FTxF9qLTnqnIXH/hq7OPoAGx77gO1IsLJlO3qQ7rBijT5n
 QmZ+cbHCgaKlWicitewVql6aYCFXkEBX1g4Qw3Z9gq24vwMBZLytHZN+GsDUNR7ymKScVe3po
 zLaYaXg3GAedOyQ3aG0R8CXoJ7Nf2oUxOXcKvM/EoNSm0yspjiO9GvEb2zQj+xDfzWJl+NRZz
 t+CUS8RAdupNnGDNlWI4NauuWObQ4NwGNpCzFeg7PQewZ5wMKLzn6pjqojVos6novuGETU3Zo
 bt/SDJSjetmNGqLNdWCVukolDo0bx1XzvDFanldzER57zKdGHwkyGqCmvDqHw3x859jFdfq71
 ZkY/WFtNDsIpiGMXlo85nw5KyL7w/WZZdZbvlnX2zoJSUhvKhSy/oxuiSqXmJzwTca2v9Lfjp
 ExmBFN3kK9PSWqZazx8yAom4yHTo0UmMnbGP6snaoKPhJz7+310pRXnpLDoBXh/hTUWLRaaK3
 xhYWljNnAK/GBFx3OxjkJTWQ/ZSjOhjjZ3K2OdKBBXKEw0TvxQYXHLyXtAkPnDmGrxywU4a5k
 cIICXYaQe/pc4wdEU9y7NmdhXZScRo4BqjtvbQsbbK17kqhD1DGxh1bI5kAk3gVuhERlKocoP
 39r5MedJIsxm6t0m1AVp7iNeMKRMK1OytH0xdl+cQklmDuP9Rqfy1DAvvCdQ2fAAUtn0=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Replace vpda with vdpa.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220328152022.73245-1-sgarzare@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a377939..8adf7c0b92d9 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -299,7 +299,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     memory_region_unref(section->mr);
 }
 /*
- * IOTLB API is used by vhost-vpda which requires incremental updating
+ * IOTLB API is used by vhost-vdpa which requires incremental updating
  * of the mapping. So we can not use generic vhost memory listener which
  * depends on the addnop().
  */
-- 
2.35.1


