Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8740DDEB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:23:36 +0200 (CEST)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtEd-00025h-9w
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4L-0002yS-0q
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:57 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:46493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4I-0004DS-0d
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:56 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N7AEs-1mz3bN0vnw-017Sh9; Thu, 16
 Sep 2021 17:12:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] linux-user: Check lock_user result for ip_mreq_source
 sockopts
Date: Thu, 16 Sep 2021 17:12:37 +0200
Message-Id: <20210916151237.1188301-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cbWaAOzvIP0khKP0Qym0iWiHl0L0gbiu89FWT/A59hlC8Bz8/vy
 xJ64lq+DD2E5db1C30bsxPMqt7WCRT7VehBJiIELCHxCjNxldPVS1NspqU0b6+sVbJVgOWU
 U7Db0AYvsyQaGLSbKePYUH8mgArpwPTBJh4Jhu9fF8lB5O7u7ryhTPeZdr8bumDOy0qZpak
 na1r6367ymYgI8YlKFcTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c34K3mVjxkY=:k+/IfPS/IwWnwOXTVxlcy8
 rIGr3zr2lVg7Mo44tuLRqJxbTDM5+0Qs2SdWGmCdNCWOF0V1Rt46Zssr/bLX1D/Gd6Xlj5kTP
 jNNsGmpo6kVQ1IZB/fkMA8U3oPRzpjLdMrr13M0cgO778d7ptVVkyOeKD1OzGoZhjXEW3SfEu
 LfuPqpeJJs4H6NxFxN8gl9KVdDwsfcXOm2ePohTB/DMja8iFbApU9InZ8+mo+uEyqmBsK+m2U
 NJtCcOA8KfuUQq7F3z8L3g8r8ZIlMB0qNYMj3A8kdgUooXqXVsotoh1rCkX8eD6VjToqbodKU
 MV60ErsfDYBnlJxJrkZszc2gQUIGz3BHVLq9i5XNz5dIXLy/hJ6wHF1lOkndeEqaisBMZeANk
 wJOaf+TRnPoeObaZ47uSFgE9yoAOBOKUwukkw6vwrijit2M1SbZV503UWO/o7s6XBNMscHvlo
 ggb6ksRxlmYyijTuf5IBnklrzzRdvZuo06QWwY+u1BS830vDf40aMfzUuEazCkfu6vbbFn+tr
 guKJ3OdwIWmMShBdGYEfkb34gBDJI8xrQ9+4oDmVSZ9xxx0ps2Zq0AAjCIPyCIv34z7hRv/Tp
 qAaIIANy4AKEemCFkEtaOM9Ta5/Gk/xx6klaJWKad7Ln9D/1tYWngRkYn7jjFce38k/3LYUlI
 ZHKoGm02apNcTS/3PNwCvSaA2UXpSbOVs25jlQmRnzdzCu2uoywzoKhUXFU24R9g6Fxu1X5cM
 yWdWmjD206rA9awhfBLwNl6TiOX8j5WtQ3m4Kw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In do_setsockopt(), the code path for the options which take a struct
ip_mreq_source (IP_BLOCK_SOURCE, IP_UNBLOCK_SOURCE,
IP_ADD_SOURCE_MEMBERSHIP and IP_DROP_SOURCE_MEMBERSHIP) fails to
check the return value from lock_user().  Handle this in the usual
way by returning -TARGET_EFAULT.

(In practice this was probably harmless because we'd pass a NULL
pointer to setsockopt() and the kernel would then return EFAULT.)

Fixes: Coverity CID 1459987
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210809155424.30968-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e4ffdec0d83c..544f5b662ffe 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2127,6 +2127,9 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
                 return -TARGET_EINVAL;
 
             ip_mreq_source = lock_user(VERIFY_READ, optval_addr, optlen, 1);
+            if (!ip_mreq_source) {
+                return -TARGET_EFAULT;
+            }
             ret = get_errno(setsockopt(sockfd, level, optname, ip_mreq_source, optlen));
             unlock_user (ip_mreq_source, optval_addr, 0);
             break;
-- 
2.31.1


