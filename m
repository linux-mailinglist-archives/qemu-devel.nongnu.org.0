Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15389267E2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 18:16:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTTvF-0000WC-5y
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 12:16:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTn0-0002Fm-L7
	for qemu-devel@nongnu.org; Wed, 22 May 2019 12:08:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTmy-00046T-Jj
	for qemu-devel@nongnu.org; Wed, 22 May 2019 12:08:26 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:39203)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTTmr-0003ez-7X; Wed, 22 May 2019 12:08:17 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MDhth-1hJp0g2KKF-00AoFw; Wed, 22 May 2019 18:07:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 18:07:19 +0200
Message-Id: <20190522160723.31484-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
References: <20190522160723.31484-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EboM5bLhVbaTJbzNJC58lF0QE6eE+F8rNig+cpgie+zRoBFje6T
	kRY43Wv/DcETbmZhnIcNtTqvXVNX3rYGytD4sq4q2ALiu00v9SShyLrUayu0bZ9uUisKyrO
	XY4w2NaJUFjWCynoK0bnLZ6QXZQsdDltrGta7AXAr7Q1EL2S/4RFs6G2EWemQ4juL2wrvSl
	9A2VyXocbBWIovfZoAq5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1ZOO6PsmXp0=:teG4d6o+OCyQIf9HtR+ZbS
	jHkLr+bABLrv9Aqw8cVkqZjmX8a2HG5sBTVSbGZi/VKTHkbx2lkS3oOjPb/FuGDMqV3HQiQNI
	GiTy/QkAkzIVLvGTumj09+gubu/RFaAIEgNn2GN4uwX/wUMgmZtYu+Vjy61WSh9DFAXIVcWY4
	nIrEBTXJm1g5YW3PQLJOmz49yatkeQLyn6JjFPgQUjKgOjn3/Eu863H45PqdeCLYL5ugDHYR4
	x/EQzpBRDM6+cAwku82cK6N0xZ+a23ETJ3LBOiTRMHb17owX+Vv2RtMHhzYv/9NfWrZn/rA0V
	y8rQxS8AS5RPEI25Vt3DSojVOqam258NzUEcvCOVSx5wG6m5HvqORSOgAfEkKZs3zn5ZXhmKu
	iV1SGVEhevyCCZVmaE65hcFND3J36QRN1sSqb9WFc6g+zWpGjHY6R1g6EfEXtLG2JjR3ZGgbr
	zfGBbcYtEeqKyy4SWD4QDtmCO8QOJ41/wA9ZAJZoncEu7mwzozZIzYXJGhYqSFu44CrLjdGqK
	CBPUFOLphtZ1B9vumV7J1fgBnuGL4pwoFmyIq0+Cgd+Uu/MSkQZhaXqwvS8yASNzxEAXqA36I
	OEu4+t3yaNd4u1WjTiw6jPRzaq7mrDToXaSArOF0VcyBTRCSDY0oWTO1DUyigdj/c26f+7xX5
	JLDS0ov9yGp2NkUQa+i0Og6B7SiFHCyc7t3EMRjksa2sJShMBJXY/LM7bXcHOXCs1nDgRVEEb
	P8BVHe0zsJScxVphFonDDUAaCSKZL7qyuf1KUQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-devel] [PULL 5/9] configure: Fix spelling of sdl-image in
 --help
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Alex Williamson <alex.williamson@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Fixes: a442fe2f2b2f20e7be0934277e9400b844b11999
Cc: qemu-trivial@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190517183246.11933-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index d2fc3463022e..cef51b2a0b7d 100755
--- a/configure
+++ b/configure
@@ -1745,7 +1745,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   gcrypt          libgcrypt cryptography support
   auth-pam        PAM access control
   sdl             SDL UI
-  sdl_image       SDL Image support for icons
+  sdl-image       SDL Image support for icons
   gtk             gtk UI
   vte             vte support for the gtk UI
   curses          curses UI
-- 
2.20.1


