Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280A308716
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:37:40 +0100 (CET)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PHf-00017t-Bx
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PD3-000529-4N; Fri, 29 Jan 2021 03:32:53 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:34577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PD1-0002Sz-0m; Fri, 29 Jan 2021 03:32:52 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mf3yk-1lbj9c3WHK-00gZKN; Fri, 29 Jan 2021 09:32:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] net/slirp.c: Fix spelling error in error message
Date: Fri, 29 Jan 2021 09:32:35 +0100
Message-Id: <20210129083236.584238-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129083236.584238-1-laurent@vivier.eu>
References: <20210129083236.584238-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PsrHh8FtWYObSHkcd8w+gUGuZHc8OibAGF6YNLrX0/x5LY8CAi7
 TpEJwjoXnVmK0YCG/WRUERwwnWFTqUgZ8YtOWE4pxXmepTYqA4ThCjpcGwY9lQ8bDGegznE
 jL0e43f80Ho/uiWGeSbX4hsxuYWmumbN7J3jndKbItAHBp6qUkkmCJxCoJGvBuSYPW/In10
 AYerTtrUrrd1WPEes2L+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hmKZVSv3PS0=:QoBSNK+e9YbdDKjqMa+nMV
 Bx0277auU8VrYVIf0FyFZNY0a6qFI+eiY8CvDXUHGor4COaxh4QCsFm2NKbuWrEaxTOm91jLN
 VFY+H73s60o79Vz9feR00uCSoNTLdklMXMPdJa9/I61PFOOQJ4naZuiPXUdG9ME3Czc1yU8Wl
 j98pjOWCUnYPaFUNaDfJzuFGAA4AjX6Na9WUmZZMqXonz8w1mZ5klZywE4H8+qEtbuklB0FVF
 t+NPgN52y+EX8MKbohO8T102uQHOtx0sRORfje8ZgzzkGmmOos3rELU/QEkQJjUdBtbPO5B4+
 RW6UYoeueHV5XgFs5o63BH+S/HPglV9G7+e7BV0Slj7wstWv4Oew9v/Xh/5POz09x+ju8i5LL
 KuraWc7cmexlrX2z+cMh5ooM/qHb03cpatBmMZdD0TTUdW1M1WyAgcoSD9jIOL4iVb5e+gLS6
 ZdYbcikE7A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Doug Evans <dje@google.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Doug Evans <dje@google.com>

DNS should be DHCP

Signed-off-by: Doug Evans <dje@google.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-Id: <20210122004251.843837-1-dje@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 net/slirp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 8350c6d45f70..be914c0be058 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -473,7 +473,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         return -1;
     }
     if (dhcp.s_addr == host.s_addr || dhcp.s_addr == dns.s_addr) {
-        error_setg(errp, "DNS must be different from host and DNS");
+        error_setg(errp, "DHCP must be different from host and DNS");
         return -1;
     }
 
-- 
2.29.2


