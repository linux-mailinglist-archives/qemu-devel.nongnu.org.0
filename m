Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270C492777
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:50:24 +0100 (CET)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9osQ-0008UF-Ug
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:50:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbh-0004eV-QF; Tue, 18 Jan 2022 07:29:01 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:60835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbg-0001vo-1d; Tue, 18 Jan 2022 07:29:01 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mm9NA-1mRd6F2hjU-00iESf; Tue, 18
 Jan 2022 13:28:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] linux-user: Remove MAX_SIGQUEUE_SIZE
Date: Tue, 18 Jan 2022 13:28:47 +0100
Message-Id: <20220118122847.636461-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xVDWO0rOo6tfbtHhb3fszSbSPP5GxI+CQBOPheU3fF5nIT1OfL9
 OfHbQymYf7T1ZIhh95s+bYWhhXe04CYmawJve25pGZFwqmLwXdoAJvG/7JchS4dGPWRNUOg
 4FjzBqmkKJbyTNPgP30DsiOSHf4LbNeviGinKnCVk55CHxit4FUBqoxee/NX73fLyP8zgoJ
 lvkCH1226Rxb8K4FoAZgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5GdSVSHQYOc=:vrZE+AfRjeDTZI9hBBpx1b
 4xjbmCFVNpE+twVMIcqjXYxX1HbWtkvtI/bdrSQAasGVQp9Iq08OMDwtTYnDA192IkY2wpljb
 PRWiNk96oJe2jjlNoqMbf1Ue1evES4EHghde2gtqCc4CElAEOYJTgyliwReEkNg6HoBRfhuLo
 VcrXmf9hEzIcZDZW0K9kKWwkKYxUuqiAuI2JxLaS0xVOohZIHDs1ZTK3xMpZOfLq2VVxmUTYB
 2IiA3VhXsVDobnSTZH6G6U+NX7Ndi2i0mfTQl5cIpGh4G5mla1/ijVbemHsv8CLjCAmfKM2wn
 Wc5kHpsD5EmTFvKy+0MG7xTHLzfEelVfN0vp5RWlm3Rdu23I1Fyd8weF4NmXXl/sQt3iX8bxe
 coNgVF0Xlk7mr2eZarpbF8nMEkITCmyA4EZlvypjIitd/U31YpVP68mDBH4gKexA3Dg1Km4yh
 EKamPGx9FCsCNh0IdHIjb8UwizKUDEGCqRNdogZvEf9Yb/iiWZ2DZOxyIdgM4HwCmHMynpUZK
 I1ALHxvyOEj3iNHjqmL6C0vk3xuYeH6VuWhhQT/NyROq1O/Dt7t02MgD1d6pFBeOLXzeTQO/Q
 3dWb8tPGbFHgT7PcXRzhOokqAAebsxIhFsIUMsKZ7iE1ZasMTS/woaQcTrnh4SYvJsiFbLKxP
 FbiaSX8tGSBd1ArzKpmBdJIze/LDxcsVv6b0F2wMR8gE8zZQa2+b65E8b2t5nXBsAQU8=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

It's been unused for 7 years since 907f5fddaa67 when linux-user stopped
queueing any signals.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220116204423.16133-2-imp@bsdimp.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5c713fa8ab26..7910ce59cc8c 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -89,8 +89,6 @@ struct vm86_saved_state {
 #include "nwfpe/fpa11.h"
 #endif
 
-#define MAX_SIGQUEUE_SIZE 1024
-
 struct emulated_sigtable {
     int pending; /* true if signal is pending */
     target_siginfo_t info;
-- 
2.34.1


