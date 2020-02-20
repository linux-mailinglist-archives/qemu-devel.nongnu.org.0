Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E05165A12
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 10:23:19 +0100 (CET)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4i3C-0006Pt-Sk
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 04:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51829)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4i1Y-0004Al-Mj
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 04:21:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4i1X-00089t-JK
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 04:21:36 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:52351)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j4i1X-000898-AZ
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 04:21:35 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MowbA-1jnQkG1JQk-00qSYm; Thu, 20 Feb 2020 10:20:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] configure: linux-user doesn't need neither fdt nor slirp
Date: Thu, 20 Feb 2020 10:20:43 +0100
Message-Id: <20200220092053.1510215-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220092053.1510215-1-laurent@vivier.eu>
References: <20200220092053.1510215-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g7jr1Oo7TNJ4RBbjS0H77mSIjtitZ5qtY+rdDJQQz/1VooACeUV
 Hb7CNL73FXPMYgxA3QQgpSljXFG78xCZvUnsC6nV+OvQTEeeCq+/Kh+bTcQ5k9FtV/anZ6J
 kfB0nOgd7y5pPX/mQJwyb9jIQ/g4D1KOZKi++XMq5LCotfxSmN3XGkIYEED8wsYE76HNWyI
 jE3T/QjdKn2QXMABa6ZaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:95K06Bnstkc=:AX8wqXNtMP1PuZKv1YWtgP
 hIAOgZM8TMyJXSlfY3h44g4AFS0ss4MglauqoKrxOEwDU/iYcaKnMiWuwUlaQpS7Kr43GJ1MU
 S5C0CSUMz5NLjJ+DilyAEnCFb3T5a+D8/lY3KPeaIns68R8vbQWx+0YbWgtyvRNu6lOfdG1zo
 rd2dMKhiKWLNsRm88rNzT4cdbEIC7lz4EL2kebx97SCScLnuOBLpVPaWIPDtKxkexTZeM0he9
 tf/DfNPxAISr+969pD+8QudK2M3LP5iZ0dN8cb9g5RgezTjnz8WbH2X+rXieIZIT7Hl86j8U4
 251oGTOigM00OD9KmbteSe0tAYHtIjcqa7aP38x2tdNyDPgRpstcKD8XsQNO155+WSdFdHyCS
 4C5eMDAZWWYjPEssiY0x9S9smL3ewV6Ov1UaApAihFRqvuOtkBvmEHiTpfFK6aoU0ciJt1HiL
 a1nGXRfB4o4KEeh6ldPuOeniJH6RYgjQfZvUftGwBw24OFn/mM07SsF8T2W4umD5b5RUwu7Yj
 5yi1mWxXXDnl4k2qYl/GCSYUvYjsIyZrd66xqGJh/Y2Uvrwz51gZ0mlx+hsoy3dPcPbQcfW+p
 kFejWVKbT0CXTn6EsnsXTxq9pmstBYJWvqe2cO9/sKdI6fGyDeFH3OtIYMLK/UQf/xrvrg5Sm
 pEmHcBopqdYe6Cr6AuPCht+yeDwcAvWfOUDrFFYXl4qE7JidV8pvy7/r4NIr1hRKvovMnoHQD
 E4nKOeVAw/xerAE/G/iTWEAP79hjh0FSKzfKzSJh/7NbcnIbDtODTsNkDn9l7l2f1khpUTzsl
 NpE1MKNXa4ZfhZKbGIeyDsVkuNOtP0XtMfpR3mkttHzNLBqgTcrJDBYenAoCoHl+MO7EqKK
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: Laurent Vivier <lvivier@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

if softmmu is not enabled, we disable by default fdt and
slirp as they are only used by -softmmu targets.

A side effect is the git submodules are not cloned
if they are not needed.

Clone and build can be forced with --enable-fdt and
--enable-slirp.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190621130544.18860-1-lvivier@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configure b/configure
index 6f5d85094965..5f5f4befb9f6 100755
--- a/configure
+++ b/configure
@@ -4135,6 +4135,11 @@ elif test "$fdt" != "yes" ; then
   fdt=no
 fi
 
+# fdt is only required when building softmmu targets
+if test -z "$fdt" -a "$softmmu" != "yes" ; then
+    fdt="no"
+fi
+
 if test "$fdt" != "no" ; then
   fdt_libs="-lfdt"
   # explicitly check for libfdt_env.h as it is missing in some stable installs
@@ -6078,6 +6083,11 @@ fi
 ##########################################
 # check for slirp
 
+# slirp is only required when building softmmu targets
+if test -z "$slirp" -a "$softmmu" != "yes" ; then
+    slirp="no"
+fi
+
 case "$slirp" in
   "" | yes)
     if $pkg_config slirp; then
-- 
2.24.1


