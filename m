Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B722C12C88
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 13:38:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMWWL-0000CA-Ru
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 07:38:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLr-0007w7-B1
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLq-0003YR-BO
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:27:39 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43839)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWLq-0003Xd-2g; Fri, 03 May 2019 07:27:38 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mtxxk-1gSdOt1Hps-00uGzk; Fri, 03 May 2019 13:27:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 13:26:52 +0200
Message-Id: <20190503112654.4393-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503112654.4393-1-laurent@vivier.eu>
References: <20190503112654.4393-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qP3adIP8oXcIdsE+hQ0KIyGDDIVh4OUeNCt5i1VwQjrqCox6CcY
	3gsM6PwyJza9PLzSMPGSpBDXxmO56aj/o61VkOE/lqJiKmMBxmtr2hucOE8MIZuwdfTKHKC
	ic6ic/KICzhDxtb4AHxR73Chpbqy8tQUGr9NkYBoA0Hdy0SRXVuQZ6NOWo1Ev2J2m8A6tQE
	610C/XiyL+ayDbH733YAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:njiNo2w2ei4=:/yYLlsDIBnnpFbCiD5f051
	sgsumgGjoB0Nc2oGtXH+BZJ9pzSf3YGBxT4C/LPJAIa0Sjh8AAnvomf6InLWghSrrCc2GG2n+
	10K7gWeWjHik7cxwKLVsf/k0Pmk6omn8M/m1HlNX1cT7eNGFCG4RP0EXyCebXY7FA9+1rImG9
	lL/dckIAfN23Mu8qJCOHMCLPY0lE9fXZ56cAW8tPZroB6dOy6HWMjDnuOswYaAoAvJ+LJOgKM
	X0L3czCB2hjHKgF1b4w7oFhm4gTkrw5csqMcSzJLyXKxkPIjMNFsm3CIJpRZM+MiGwCmQpTv5
	+ug6rTS2d9Vst3hE46ZYoxKemyeMWjkLhLREfpO8+rzB6bxiyS3ck6sBgznAzKw1x2W8cSJEP
	6llsSGB6YuILslXoCDH3fKRFUN7Hq2u3nI651G5MkOw626JuJzPd/8SforuTYimW4QYjRCJD7
	qp+W9Bv1bYivolfI8h+vYvRGMKnkjX73rbdZvMRctvstFLaycc1U72qQgAObwUsGxettb4llQ
	5GkQ8Qwn222LATD2GKR0UNxqw2lXHNTf9LnluSh1sQzMJIm0mMSnIU26iedpZGIzx+WbgP5h8
	SzwhPazQK128M903GrpTefKyeuu/wB9dF8iWghhoaUkb7vwIK58RNV4TV1Q1rJrrri7mEkEkU
	Eq4pLYrRfJAdhWhDZuPF76yCnq9oWUa07qErAxFwsLPHEkks5P93YaFaNgcphg+oZPAoObOA/
	5YQUgR9Ecy5KU/wmSo3lP0mt0oVVQ1a4qoYtHrufNkYLBtZR22sCLK7BHsY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-devel] [PULL v2 10/12] Makefile: Let the 'clean' rule remove
 qemu-ga.exe on Windows hosts
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
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit 48ff7a625b36 added the QEMU Guest Agent tool with the
optional ".exe" suffix for Windows hosts, but forgot to use
this suffix in the 'clean' rule. Calling this rule let a dangling
executable in the build directory.
Correct this by using the proper optional suffix.

Fixes: 48ff7a625b36
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20190427161322.24642-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 43a7a047b452..e223bfe2a3a1 100644
--- a/Makefile
+++ b/Makefile
@@ -639,7 +639,7 @@ clean:
 		! -path ./roms/edk2/BaseTools/Source/Python/UPT/Dll/sqlite3.dll \
 		-exec rm {} +
 	rm -f $(edk2-decompressed)
-	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
+	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga$(EXESUF) TAGS cscope.* *.pod *~ */*~
 	rm -f fsdev/*.pod scsi/*.pod
 	rm -f qemu-img-cmds.h
 	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
-- 
2.20.1


