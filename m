Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1252D398350
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:42:22 +0200 (CEST)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLW9-0005Fy-2g
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQY-0000Bz-3P
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQT-0003pO-Hw
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljB9dEeIn4jl+KhtVL1Yj6Y2zaXUws5SpBr73qzubBA=;
 b=hv6ltvyEbDbUuNM1on+OAL9VGPnK3jC1KzK4H4YmjutI1p88zMgDXyIL55u8c+w11rPOR6
 YfGoVus7caIcCpKSOe/iBO0EFfB1iAWLAjR2kNYpsbfAmhvx9jH6gYScyqC0sxu7i1y84t
 ixl30D7xwl0hoY12k5oHwR6hUlr/AR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-cI5z8QijP_6zd9iYgTaQKg-1; Wed, 02 Jun 2021 03:36:22 -0400
X-MC-Unique: cI5z8QijP_6zd9iYgTaQKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B725B106BB2A;
 Wed,  2 Jun 2021 07:36:21 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81A215C729;
 Wed,  2 Jun 2021 07:36:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/17] block/ssh: Bump minimum libssh version to 0.8.7
Date: Wed,  2 Jun 2021 09:35:55 +0200
Message-Id: <20210602073606.338994-7-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target. So from the RHEL-7 perspective, we do not have to support
libssh v0.7 anymore now.

Let's look at the versions from other distributions and operating
systems - according to repology.org, current shipping versions are:

             RHEL-8: 0.9.4
      Debian Buster: 0.8.7
 openSUSE Leap 15.2: 0.8.7
   Ubuntu LTS 18.04: 0.8.0 *
   Ubuntu LTS 20.04: 0.9.3
            FreeBSD: 0.9.5
          Fedora 33: 0.9.5
          Fedora 34: 0.9.5
            OpenBSD: 0.9.5
     macOS HomeBrew: 0.9.5
         HaikuPorts: 0.9.5

* The version of libssh in Ubuntu 18.04 claims to be 0.8.0 from the
name of the package, but in reality it is a 0.7 patched up as a
Frankenstein monster with patches from the 0.8 development branch.
This gave us some headaches in the past already and so it never worked
with QEMU. All attempts to get it supported have failed in the past,
patches for QEMU have never been merged and a request to Ubuntu to
fix it in their 18.04 distro has been ignored:

 https://bugs.launchpad.net/ubuntu/+source/libssh/+bug/1847514

Thus we really should ignore the libssh in Ubuntu 18.04 in QEMU, too.

Fix it by bumping the minimum libssh version to something that is
greater than 0.8.0 now. Debian Buster and openSUSE Leap have the
oldest version and so 0.8.7 is the new minimum.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Richard W.M. Jones <rjones@redhat.com>
Message-Id: <20210519155859.344569-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/ssh.c | 59 -----------------------------------------------------
 configure   | 19 +----------------
 2 files changed, 1 insertion(+), 77 deletions(-)

diff --git a/block/ssh.c b/block/ssh.c
index ebe3d8b631..b51a031620 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -277,7 +277,6 @@ static void ssh_parse_filename(const char *filename, QDict *options,
 static int check_host_key_knownhosts(BDRVSSHState *s, Error **errp)
 {
     int ret;
-#ifdef HAVE_LIBSSH_0_8
     enum ssh_known_hosts_e state;
     int r;
     ssh_key pubkey;
@@ -343,46 +342,6 @@ static int check_host_key_knownhosts(BDRVSSHState *s, Error **errp)
         error_setg(errp, "error while checking for known server (%d)", state);
         goto out;
     }
-#else /* !HAVE_LIBSSH_0_8 */
-    int state;
-
-    state = ssh_is_server_known(s->session);
-    trace_ssh_server_status(state);
-
-    switch (state) {
-    case SSH_SERVER_KNOWN_OK:
-        /* OK */
-        trace_ssh_check_host_key_knownhosts();
-        break;
-    case SSH_SERVER_KNOWN_CHANGED:
-        ret = -EINVAL;
-        error_setg(errp,
-                   "host key does not match the one in known_hosts; this "
-                   "may be a possible attack");
-        goto out;
-    case SSH_SERVER_FOUND_OTHER:
-        ret = -EINVAL;
-        error_setg(errp,
-                   "host key for this server not found, another type exists");
-        goto out;
-    case SSH_SERVER_FILE_NOT_FOUND:
-        ret = -ENOENT;
-        error_setg(errp, "known_hosts file not found");
-        goto out;
-    case SSH_SERVER_NOT_KNOWN:
-        ret = -EINVAL;
-        error_setg(errp, "no host key was found in known_hosts");
-        goto out;
-    case SSH_SERVER_ERROR:
-        ret = -EINVAL;
-        error_setg(errp, "server error");
-        goto out;
-    default:
-        ret = -EINVAL;
-        error_setg(errp, "error while checking for known server (%d)", state);
-        goto out;
-    }
-#endif /* !HAVE_LIBSSH_0_8 */
 
     /* known_hosts checking successful. */
     ret = 0;
@@ -438,11 +397,7 @@ check_host_key_hash(BDRVSSHState *s, const char *hash,
     unsigned char *server_hash;
     size_t server_hash_len;
 
-#ifdef HAVE_LIBSSH_0_8
     r = ssh_get_server_publickey(s->session, &pubkey);
-#else
-    r = ssh_get_publickey(s->session, &pubkey);
-#endif
     if (r != SSH_OK) {
         session_error_setg(errp, s, "failed to read remote host key");
         return -EINVAL;
@@ -1233,8 +1188,6 @@ static void unsafe_flush_warning(BDRVSSHState *s, const char *what)
     }
 }
 
-#ifdef HAVE_LIBSSH_0_8
-
 static coroutine_fn int ssh_flush(BDRVSSHState *s, BlockDriverState *bs)
 {
     int r;
@@ -1271,18 +1224,6 @@ static coroutine_fn int ssh_co_flush(BlockDriverState *bs)
     return ret;
 }
 
-#else /* !HAVE_LIBSSH_0_8 */
-
-static coroutine_fn int ssh_co_flush(BlockDriverState *bs)
-{
-    BDRVSSHState *s = bs->opaque;
-
-    unsafe_flush_warning(s, "libssh >= 0.8.0");
-    return 0;
-}
-
-#endif /* !HAVE_LIBSSH_0_8 */
-
 static int64_t ssh_getlength(BlockDriverState *bs)
 {
     BDRVSSHState *s = bs->opaque;
diff --git a/configure b/configure
index 90c0807347..ae629a3127 100755
--- a/configure
+++ b/configure
@@ -3529,7 +3529,7 @@ fi
 ##########################################
 # libssh probe
 if test "$libssh" != "no" ; then
-  if $pkg_config --exists libssh; then
+  if $pkg_config --exists "libssh >= 0.8.7"; then
     libssh_cflags=$($pkg_config libssh --cflags)
     libssh_libs=$($pkg_config libssh --libs)
     libssh=yes
@@ -3541,23 +3541,6 @@ if test "$libssh" != "no" ; then
   fi
 fi
 
-##########################################
-# Check for libssh 0.8
-# This is done like this instead of using the LIBSSH_VERSION_* and
-# SSH_VERSION_* macros because some distributions in the past shipped
-# snapshots of the future 0.8 from Git, and those snapshots did not
-# have updated version numbers (still referring to 0.7.0).
-
-if test "$libssh" = "yes"; then
-  cat > $TMPC <<EOF
-#include <libssh/libssh.h>
-int main(void) { return ssh_get_server_publickey(NULL, NULL); }
-EOF
-  if compile_prog "$libssh_cflags" "$libssh_libs"; then
-    libssh_cflags="-DHAVE_LIBSSH_0_8 $libssh_cflags"
-  fi
-fi
-
 ##########################################
 # linux-aio probe
 
-- 
2.27.0


