Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA644D59D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:12:17 +0100 (CET)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml808-00050D-Gd
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:12:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tW-0002b0-4T
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:26 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tS-0001Nv-CA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:24 -0500
Received: from quad ([82.142.28.210]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6KpF-1meXGQ3BvN-016jz7; Thu, 11
 Nov 2021 12:05:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] linux-user: Fix member types of target_dirent64
Date: Thu, 11 Nov 2021 12:05:03 +0100
Message-Id: <20211111110504.1574242-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111110504.1574242-1-laurent@vivier.eu>
References: <20211111110504.1574242-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MHeItdKQchzjaWl/nHXVTZ1lDL5JLxmJWrN0/boKiHLiRF3IlMW
 1RrQkNr36SxM80tWAd9eb7COh55v8Cxq5jvgyMrpraTTV7eScFE38jVZrc+zgTl6LXqstN0
 nhkzpu6gWLTnZZGat9XQcUYYR5E2OWwsEB5nI+F6ZSphrizr19AaD9L0eXLj9HmYdIwcX3D
 umukmdLdzKLfDtltmmtqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6mvheDXUhiA=:LnCvNZlzL/Wbjzs9M8VzNa
 oVbttN6uZKs0rz90bMBCJg0Et9+lEInNw2ub1xN1/pz2OASxDcS5DD7cpNqxF5GJWUK/IaCH6
 mH16yhNSFA2viaou+x/u1RaDfkzqzi/lsRtx0heCSu6/8lF4ib0mVZfjAs/ZRMeTRr+cMZ1pQ
 K/azjHFxT0g67k0VDQx1YDj/Nj4+W8P4KoQ52RACpPrrh20bAKrHFTRCZ66z5WXJv0IYJpWql
 RqnF4m5L4XQLIiopOnii+/ALzEYD6KkPU9N19mufoiWs7XdFW76W/abZEd0wSj24EgV2MtVbu
 JPy0a83vKD3tcwuA/IbbsHv0Dg0T62AWYqlDSz3wwawf87Odhny08dNsz06KFl/m8JdSJYEck
 rB0NGaaEyyKeBJx2aJ3n5PAWPG8ngwYPVExQ3xmli5i/xDct3NdrXScr5r12iyQnYleMLNwrZ
 PAvJ2OnKtVf/W9qgZjNO7KWwVQm4xNQhdQkBENdXdYPx9WFO+IZLVTg7opoTH5XgGXEYHYprl
 46YEtlTyvzAgm2J69+v+JORE5izZj90ZNWHcVr5MQRL5KlqONgQztxoTqyQCAp8kT+eDcThSW
 Ek3+Stnj4stUIIDq4OJ8/C4CMOoL3B/vEkLYZq+ehhIKnGoGUh9aCzT/nHof6AP0+meIrTY53
 NUa0LWrHv4q5GMHAlbLEIgHmRQHuJmzgKc+48RYedrEc39DMqic0Yl8UQ2UTO885OO+Q=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The host uint64_t (etc) does not have the correct
alignment constraint as the guest: use abi_* types.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed by: Warner Losh <imp@bsdimp.com>
Message-Id: <20211107124845.1174791-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 98b09ee6d656..41aaafbac12c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -437,9 +437,9 @@ struct target_dirent {
 };
 
 struct target_dirent64 {
-	uint64_t	d_ino;
-	int64_t		d_off;
-	unsigned short	d_reclen;
+	abi_ullong      d_ino;
+	abi_llong       d_off;
+	abi_ushort      d_reclen;
 	unsigned char	d_type;
 	char		d_name[];
 };
-- 
2.31.1


