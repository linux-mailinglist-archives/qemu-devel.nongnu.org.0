Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21EF29E27
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 20:35:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUF2Z-0007Ky-TR
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 14:35:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hUExx-0004Y1-U9
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:30:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hUEi8-00041s-KS
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:14:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hUEi8-0003GG-FN
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:14:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B42B0308620F
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 18:14:15 +0000 (UTC)
Received: from localhost (ovpn-112-23.ams2.redhat.com [10.36.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B0915F7C5;
	Fri, 24 May 2019 18:14:12 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 20:14:11 +0200
Message-Id: <20190524181411.8599-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 24 May 2019 18:14:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] configure: remove tpm_passthrough &
 tpm_emulator
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
Cc: pbonzini@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a left-over from commit 7aaa6a16373 "tpm: express dependencies
with Kconfig".

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 configure | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/configure b/configure
index 528b9ff705..4da99ee750 100755
--- a/configure
+++ b/configure
@@ -6434,8 +6434,6 @@ echo "gcov              $gcov_tool"
 echo "gcov enabled      $gcov"
 echo "TPM support       $tpm"
 echo "libssh2 support   $libssh2"
-echo "TPM passthrough   $tpm_passthrough"
-echo "TPM emulator      $tpm_emulator"
 echo "QOM debugging     $qom_cast_debug"
 echo "Live block migration $live_block_migration"
 echo "lzo support       $lzo"
@@ -7133,14 +7131,6 @@ fi
=20
 if test "$tpm" =3D "yes"; then
   echo 'CONFIG_TPM=3D$(CONFIG_SOFTMMU)' >> $config_host_mak
-  # TPM passthrough support?
-  if test "$tpm_passthrough" =3D "yes"; then
-    echo "CONFIG_TPM_PASSTHROUGH=3Dy" >> $config_host_mak
-  fi
-  # TPM emulator support?
-  if test "$tpm_emulator" =3D "yes"; then
-    echo "CONFIG_TPM_EMULATOR=3Dy" >> $config_host_mak
-  fi
 fi
=20
 echo "TRACE_BACKENDS=3D$trace_backends" >> $config_host_mak
--=20
2.22.0.rc1.1.g079e7d2849.dirty


