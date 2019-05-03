Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCB12C56
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 13:27:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMWLG-0006kO-M0
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 07:27:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWE4-0008EK-67
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWE3-0001Jg-2l
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:19:36 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49809)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWE2-0001Io-QV; Fri, 03 May 2019 07:19:35 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mo6WJ-1gzGoe21BT-00peqc; Fri, 03 May 2019 13:19:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 13:18:25 +0200
Message-Id: <20190503111832.30316-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503111832.30316-1-laurent@vivier.eu>
References: <20190503111832.30316-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iGmdPUQUTj8h+34X1/avXpDnQRJt+Kp/Kcvqoqjl7pymBOJ2KBw
	5E03V0Op9rjfnlXg/BQ2pbnhwsrcyTf6HvDyWhoL7nGhTcpBVYnE5hktPEJOfa/X6XLCMmP
	v0Uw8HiZ7cXrsxWtq7e0//eI6RrqXyEk95SD0H+xQTM/NIHUqjt5jqL4VPdQtCq7Kqjf8a7
	DnJ9QQxh6rWB40VaLtjmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zB4Bfg6m6ZM=:G6RQtJFn911Gq0JKSi+ZjK
	r3GcKMlQEa+nBdCyGryBsA0DmGQOF7kOK+AD4ywP/MB8CdBTYwm0Vf7lFL8jjv36FaJavCYks
	IgpIGZxPmDvCPcMHEhO/VZC2s+ckC5vWH8Gd0Da79ufDmst5L5YzeZaEdWrHy53RD20RGCe4J
	ej52s/UK/dMceQhUJvJ/RKZ0/ZRCSekClAZhUFeXcYoZmZIx79B+WRSma8UNyMmBdJlWEXLVz
	a79b7OG1qit1X//kxyNR/F15IvwzU8mSxf5PU08ENlHw2foqFBHDbgUm76pSmfCUfW8gmN5wK
	Owz+td7ZYbg5lrHAUeJvMaxh5VlFfugnJcUfliryVsvqtq41cIm3Qa3amVQyYonsjyaRkFTyR
	hTlRgTNXsk7ykKS17Bgf4lNprJamTlYeZqaI6H/ULijcJEJHNChIAUTB5PYg0WiJIuf+tEoby
	o1/5S8nkZDE+GjLEdsNOBZeNYig5X16ByQN8Xabokoz19MpiBHe1Q2zK1/Ej6TO1iEzdTL+R4
	a7tDdA2F53G7WoEzT2X/oEI2W+uzBM032tJFQl+Yns5cCoxYpFBHJS8U0505f0rdgN2LLDkjt
	+LRaT+Iy+DMMnHaGYwg1w+PmSlDKXku/4YokMT+gmGu1R7tsDumCkHWiD31WeQY+tWFmb97Kg
	vO3LIYYoRZPdxmvdQLogmwm7eoWsJsCZH1P8LS3m5M5mycnHck4DsotWyB/Q0SptSS7MnkR6R
	0UbBDDTpQFjlqSZesHdZySCfqsPOWCz4rOy+tGkVOFpjSa3xZ2dA4WEpUI4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-devel] [PULL v2 05/12] qom: use object_new_with_type in
 object_new_with_propv
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Fabien Chouteau <chouteau@adacore.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

Function object_new_with_propv already get the Type of the object, so we
could leverage object_new_with_type here.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190311083234.20841-1-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qom/object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index e3206d6799ee..d3412e7fdca6 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -679,7 +679,7 @@ Object *object_new_with_propv(const char *typename,
         error_setg(errp, "object type '%s' is abstract", typename);
         return NULL;
     }
-    obj = object_new(typename);
+    obj = object_new_with_type(klass->type);
 
     if (object_set_propv(obj, &local_err, vargs) < 0) {
         goto error;
-- 
2.20.1


