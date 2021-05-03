Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF83712D0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:02:09 +0200 (CEST)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUSu-0003eI-1x
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4m-0003X7-Sf; Mon, 03 May 2021 04:37:13 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4P-0000pR-WA; Mon, 03 May 2021 04:37:10 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MadGG-1l1PE63ApW-00c6SJ; Mon, 03
 May 2021 10:36:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] scripts: fix generation update-binfmts templates
Date: Mon,  3 May 2021 10:36:21 +0200
Message-Id: <20210503083623.139700-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C9S02Azy/MpCQTQE12Fm3UlpmXSGJy22c0KOovYK3HFRrPJbKv1
 wNROMVcRKmIEIW/QH5nXsWZD5Ma1Lt4lNlhWDpiFfwM7dY5Glvt9RMT5OYZzqm2d3PdvnL9
 POgLZIjpz21ELN6k5AXlVmNlka1k8YkDmpkoaAAar1ZOkFMJ6DMZCLnPUTgE/f6uwUmbJ7l
 Vw3UDVX0SIJrw6o7Mn0dQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:phpKFlqu1q4=:sIE7u90Vz2ZY8MPAmZtTnK
 0iUZH58db+gKwBQZ5NuE9mxoIj6I5IVZstF3Bt76ECgfOuRasIgT6y+nxCKxS/+7sDf8j6h3s
 4NvDmuOVQxzvfJ73l9Hn1AwyQQLLqFRWJrG7NcjFoa1P1IzxElyJ+969++IwX2XS1ICE2KL6O
 07d6ZwL6tgtxybpuaOI5ZjJNhFmJTM3aHUdYjAy5D1tY0rLjwx2TAbco5cSYVjb5PposfJ/38
 wrOOlc+IBuw68W6GjT/WncUwouoQOtotQn7fZXXFNTTzLg/QRKLtj+rCAvtmHn/Lx6C//cRg7
 jVXRMXfSqONddyyac7+DIGnQMuwx4qPk3eC4udCDVCKIjy0uI7Jw7H7tQEpNSsekXUYq85YvV
 v5Hyo97PBQt+8pPn7F4Ied5PaG30k3cfKWKXcERw7z3AV/DfeXZ8sxbUdm2HoU7b30GZl9/BP
 /AdH4XzKmTPgSBSf5tB/jSW6BeX/3VC2lk0qRYyDxpaFL6hqRIjgG+q0F+hdiuJL0mBAyZvqZ
 xuE19/UUTyvfxdY4XJAILU=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>,
 Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>

This patch fixes the update-binfmts templates being used in the script
scripts/qemu-binfmt-conf.sh when the option --debian is used.

Fixed issues are:
- Typo in flag 'credentials' (previously 'credential').
- Missing flags 'preserve' and 'fix_binary'.

Reference: https://manpages.debian.org/buster/binfmt-support/update-binfmts.8.en.html#FORMAT_FILES

Signed-off-by: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210323123457.23747-1-silvano.cirujano-cuesta@siemens.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 573b5dc6acd7..7de996d536ea 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -294,7 +294,9 @@ package qemu-$cpu
 interpreter $qemu
 magic $magic
 mask $mask
-credential $CREDENTIAL
+credentials $CREDENTIAL
+preserve $PRESERVE_ARG0
+fix_binary $PERSISTENT
 EOF
 }
 
-- 
2.31.1


