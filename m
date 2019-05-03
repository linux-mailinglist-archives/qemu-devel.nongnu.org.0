Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D112CB4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 13:47:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMWeZ-0008Ki-BX
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 07:46:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLk-0007or-4y
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLj-0003Se-5G
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:27:32 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:45683)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWLi-0003Rp-SO; Fri, 03 May 2019 07:27:31 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MYtoe-1hIAms0Zai-00UpC4; Fri, 03 May 2019 13:27:10 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 13:26:51 +0200
Message-Id: <20190503112654.4393-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503112654.4393-1-laurent@vivier.eu>
References: <20190503112654.4393-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eT9HzwyNXoucdZC+9VuanHN27GG8yYzj5tbE4MzFM1Sv6nyLmeW
	NaUWW3SLen2u1LX28oLxarUTJTW84U5ZObiZlQ6HRr2pQYjZq1UW8InDVDfuW18vDPpI77W
	/rUiaaQaVro1nJFx4MgHTTET3q2WvmFhSbBc5rH6LXWi4CDY3LJZfsOncubs20/EHnVTALD
	fx4m4kniL8XsdBHryUScQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aXEYOKnYNf8=:mfY8Yx0AAFMQDEZNUmXc1C
	D/VyT5IUHNJWJir8s+Enw4syIlWSwVOEAdj4d5KilzQf3wMCC5Cfba5jRaLtrafmNs9lfrfTO
	RVpmc2RI+5KQWSY6Ynxg/ERft9cL3wKabjB2eMQygReNuMZitgrewJH8W5hKhTPvOGn8kEyYn
	ss+1irPm2jLPJI//LfOozJUBLWgOugWtxuvsdfTUXLDcqErpG1761+tSHFJb4fBZ9EsatsSxq
	4csig/0X9s+uBBYE1PDyeHkimilfh5WDIbSwzdcUJQ/0H0urgZaWrCbG20edeN5pEXIwnHOSk
	5nlIH7yVaT5I9jULOC6PXEaWFRpg006ckDQyDTJ43VwuDIK7I5dtDM5QLxXczQVLCRIRvALzP
	LZ5MoNEHaliz59UWfUpzwPuK0Lt8XyX1l+iQY6at6NywvNOQ6AGD/J4bNQG6o7jbZ3e7YdMis
	2jIpfUKsRBs9n+0HbkzXRrhfo8XiIShIvgbXtwxm0Y+j1Ao9SR+kTAL8E6uJq133tmtuqZ5rk
	5cXezTdOAlR5NGeOXBiwZOI6o80BWC30sGMiWJd2tr+/ZXY//oBI0oo78TJTs3UNcBURZtS2Z
	7wJ7hiTQg3flsyAd044+3r3LrgQWvF5bsyp1nYKViUrNdzoIK7N1LVFs7ok8IaYFXtvsDTEPF
	G4zzcNMCHfBozRS+pWdaIHHLx4oiv1vtSh3W73gMDBMalZ0W9HN4GtLrWiQueK5qqHHgZb1Lx
	Cz3M1mCA9tybBGCQaEyJzExV0naFsAP+CwhfDL8BOdOYn9WkHItfhflIFY8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-devel] [PULL v2 09/12] net: Print output of "-net nic,
 model=help" to stdout instead of stderr
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Fabien Chouteau <chouteau@adacore.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We are printing all other help output to stdout already (e.g. "-help",
"-cpu help" and "-machine help" output). So the "-net nic,model=help"
output should go to stdout instead of stderr, too. And while we're at
it, also print the NICs line by line, like we do it e.g. with the
"-cpu help" or "-M help" output, too.

Buglink: https://bugs.launchpad.net/qemu/+bug/1574327
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190423160608.7519-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 net/net.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/net.c b/net/net.c
index f3a3c5444cc3..2cf5e7646997 100644
--- a/net/net.c
+++ b/net/net.c
@@ -837,9 +837,10 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
         return 0;
     }
 
-    fprintf(stderr, "qemu: Supported NIC models: ");
-    for (i = 0 ; models[i]; i++)
-        fprintf(stderr, "%s%c", models[i], models[i+1] ? ',' : '\n');
+    printf("Supported NIC models:\n");
+    for (i = 0 ; models[i]; i++) {
+        printf("%s\n", models[i]);
+    }
     return 1;
 }
 
-- 
2.20.1


