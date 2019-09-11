Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BCAF643
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:20 +0200 (CEST)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7wcw-0001Dg-Uf
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i7wRj-00067t-OT
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i7wRi-0004QL-MI
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:43 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:52691)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i7wRi-0004Pg-C3
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:42 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MmUYD-1iYVoo1gbB-00iWzi; Wed, 11 Sep 2019 08:49:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 08:49:16 +0200
Message-Id: <20190911064920.1718-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911064920.1718-1-laurent@vivier.eu>
References: <20190911064920.1718-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q0XKCvUSDgDm/LctnBRhQZeq/VpM7ByItFT/6TnzPuaB1V28WGn
 rsf9MbPl7I9FHSeOVIWp3/8wcFD6l7w0jgNi+SYI0WPnMMH74CNd3nExf3UycwONCaWFgBP
 d07KB6Ire9iMy13qYZs4WWDjQeQHE+sJvWQ4cOcfBpDJwiWVpPj0iVxxHl+wdXj3iUxvk1f
 Hq1aup40dGWl9QG7WO11A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCnjN746qsA=:aVgGPonZMMmktz8h6Q4QvH
 jc3gUcADAgj6eP1luiT2/p7IaPLLugAQkQdZbAk1XW6IQYko8OTh4fd9bnm2sBk3Y0LqBceiG
 syt6auURbwTPL4AwBEa3Sc3LcAxzwzc6eigcsc3AnIJ8+5IR1kirmZULfge8hnCAH/AHoZ3y/
 HOKOvbl46xQuYSqf2fpEoRFhStSXKW/I1ElMZpzlZ2qK8c9MYvOPzAOfLPBeOrPz/ziWCKUaP
 TYYcbjmb6TRMVKCos6vEy2kHbUTJXZp4I/DFp+BKlAbmLJqB6MH4YgFFY7DUusmAHVbFSR2uf
 wFVxRDrTgLU2M68eZELkq4orXuMpYwD0dNRpt++lFLFPhwO/4O7Vjd1VDD1lnpCeFtHmTWuZ/
 IeAtymVYL1kpMVFoy5iCZ65oTfkj+xObw9TUlKfO55FX9U92lUwVjFjZmsdDRRLlJuGRym/O9
 pj31ecoInnRfd6ml5xoSQS9bsU9Spvb7WL+w5kFISAYuj3AHLJrzKYXwxE4FFZ0g5uMEWTizd
 O1kK0WWdUWxvsNWpzaUBS14sf3nOCaMSmzaPW6pN2wtIfJiguJbuOGGT5VkKYSax/UrQBvXW0
 RfAfzI2TmLrgLLFqojT6hDcgebqwcHkwFxze1oI5zdpjJOe02k7k+zJweYGG4M8F/RN09W0HC
 doALd3HzcZBnjGGvrlhHf5fSJBPi2wWx+tU2x2JfctGUarMmTTb65IkR+oggDtTjMhGUxNhxv
 6Hu+Q79/4Yr7mn4OU+fXDTrDElMY85wMR4KW+/vj2ePWtAXWI1JQj5mvW8twv4rcKw4HK9gJW
 yyaLLd2IZjlNomuue9Dr4wsAsdvF3YAQ7VgxCQrVjbf/QIfrlQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-devel] [PULL v2 11/15] linux-user: Add support for
 RNDRESEEDCRNG ioctl
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

RNDRESEEDCRNG is a newer ioctl (added in kernel 4.17), and an
"ifdef" guard is used for that reason in this patch.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1567601968-26946-3-git-send-email-aleksandar.markovic@rt-rk.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h       | 3 +++
 linux-user/syscall_defs.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 3281c97ca263..cd9b6f9a8d45 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -246,6 +246,9 @@
   IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
   IOCTL(RNDZAPENTCNT, 0, TYPE_NULL)
   IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)
+#ifdef RNDRESEEDCRNG
+  IOCTL(RNDRESEEDCRNG, 0, TYPE_NULL)
+#endif
 
   IOCTL(CDROMPAUSE, 0, TYPE_NULL)
   IOCTL(CDROMSTART, 0, TYPE_NULL)
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 06622703008a..19a1d39cbc82 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -850,6 +850,7 @@ struct target_pollfd {
 #define TARGET_RNDADDTOENTCNT  TARGET_IOW('R', 0x01, int)
 #define TARGET_RNDZAPENTCNT    TARGET_IO('R', 0x04)
 #define TARGET_RNDCLEARPOOL    TARGET_IO('R', 0x06)
+#define TARGET_RNDRESEEDCRNG   TARGET_IO('R', 0x07)
 
 /* From <linux/fs.h> */
 
-- 
2.21.0


