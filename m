Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467097801
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 13:37:01 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0OvE-0006Gp-4a
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 07:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OkD-0003jx-R9
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 07:25:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OkB-0001Dy-Q6
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 07:25:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52765)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0Of0-0006Ld-RK; Wed, 21 Aug 2019 07:20:15 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQMdz-1heD4r3imP-00MIAd; Wed, 21 Aug 2019 13:20:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:19:37 +0200
Message-Id: <20190821111947.26580-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q2/G2f7YdljUDamyf4Gd15QAsQ47cXygEbzKIgGClihqqKBJGCY
 LC56J8jB+qoFP7l4rSOU509MdrudAHJ5NngpLanR3BoClWWcYs3SogqO/5MVOzxg3eixITL
 yD1CNJgFtAqy8KpK1iip23a5c0XF8RMIsEWd0OtTKVy7sTDpw/wwb8C5HpHvEB0piT58/Zq
 +0UBfuNiARhEMA8UxmyYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ik8JSttQOEQ=:R8r/WfpGeJ0Db81at3tMx+
 cpu6X4XRc0CDrDpzGEl9ywVQB5RFPKQp8N9WRE6bytthL9+WRqrFiuy9Y0VVhacCjduLrmeoK
 aYAViYSj1APviaDV76L9eJDlWLe0yBJsEFO8wFdF1szUnw+HNH1wnuHfB5Ak1zVlEy/H9iodP
 4Lh0Vb0DqMFdPXNtYsJYep86uYIaxnBJPHA7kFp1+Cgp959fJlMN71L/lp1xCSKDC3M1HxicR
 CGcepaUIHs/rFq+Qc8pmOIjTwniV4xwTAjO7H84SKCux6mFRIeSZPvAdEa1fA/D+8iZHo/K/g
 WOqcLdPeda+mLeRrw280M6VgxE0DysQ15k6G2sIP1DIrMVZjPatxCRTexr7auWXnGSAIf2Zq9
 aqu9M8Q63DrIyPET6D/H69cPs0bps4iuhECkRke2EnBBjjxYY8HWTABvDI/rdq7Uk47ZN+Fc4
 N/TlbTDTx89bRem8FdAdS/xUe+6BaXhn2WDBRkp9QgOF4uMYOk6v7RmCsl/d/PQYkKQ483epX
 K6LM2CmCOab/wiSn1sIgkVRACcbvqlYqgDDzbkzL0svCfxjhSgfZkoTVJluejoUj1NDjCCu4N
 t3C/HyRMQqnv1cH6RG1MCHxLv7q0Q1Oh7rIx1SMpnpuKuH5ja+ZiqmaR7zW8nluMtL8ZGEBgo
 b0UYijrk6fIR8t5cd9ZV5eHgD6bx0S5vvdu4zf4RwAGnv1MYvYjZ39cOQIuo86E59xBKiHkcy
 P365qKF2+fpLbIfsutnHkSkVQVMuuucPwbbzF+Aa4XqO3cELfD45UMJt5RSVkr2sOURTln5Ln
 e3rMOdzkBr/veSoAFYVsTjcLyKr+A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-devel] [PULL 04/14] configure: fix sdl detection using
 sdl2-config
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Carlo Marcelo Arenas Belón <carenas@gmail.com>

If SDL2 is requested but pkg-config doesn't have a module for it
configure should fallback to use sdl*-config, but wasn't able to
because and old variable (from SDL) was being used by mistake.

Correct the variable name and complete other related changes so
there are no more references to the old SDL.

Fixes: 0015ca5cbabe ("ui: remove support for SDL1.2 in favour of SDL2")
Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190710225528.409-1-carenas@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 4e7b79c826a2..cc5ce7940582 100755
--- a/configure
+++ b/configure
@@ -3022,15 +3022,15 @@ fi
 ##########################################
 # SDL probe
 
-# Look for sdl configuration program (pkg-config or sdl-config).  Try
-# sdl-config even without cross prefix, and favour pkg-config over sdl-config.
+# Look for sdl configuration program (pkg-config or sdl2-config).  Try
+# sdl2-config even without cross prefix, and favour pkg-config over sdl2-config.
 
 sdl_probe ()
 {
   if $pkg_config sdl2 --exists; then
     sdlconfig="$pkg_config sdl2"
     sdlversion=$($sdlconfig --modversion 2>/dev/null)
-  elif has ${sdl_config}; then
+  elif has "$sdl2_config"; then
     sdlconfig="$sdl2_config"
     sdlversion=$($sdlconfig --version)
   else
@@ -3041,7 +3041,7 @@ sdl_probe ()
     # no need to do the rest
     return
   fi
-  if test -n "$cross_prefix" && test "$(basename "$sdlconfig")" = sdl-config; then
+  if test -n "$cross_prefix" && test "$(basename "$sdlconfig")" = sdl2-config; then
     echo warning: using "\"$sdlconfig\"" to detect cross-compiled sdl >&2
   fi
 
@@ -8023,7 +8023,6 @@ preserve_env PKG_CONFIG
 preserve_env PKG_CONFIG_LIBDIR
 preserve_env PKG_CONFIG_PATH
 preserve_env PYTHON
-preserve_env SDL_CONFIG
 preserve_env SDL2_CONFIG
 preserve_env SMBD
 preserve_env STRIP
-- 
2.21.0


