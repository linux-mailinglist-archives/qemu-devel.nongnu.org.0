Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFE3B6A9D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:57:02 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzFV-0003Gv-K2
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lxzEM-0002RX-JE; Mon, 28 Jun 2021 17:55:50 -0400
Received: from mout.gmx.net ([212.227.15.15]:42165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lxzEJ-000712-8W; Mon, 28 Jun 2021 17:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624917338;
 bh=UieFgS9HlL/FELTkvAw6BlIG2jZujhEQo+iLCZc1jBs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=fIuOdoHD9biMKlIRJrsbIBl3fGt129exanHHuehT4KABJ+mi6WH4yFKwV/79dDtXq
 +zufUO8qScUKaalqkXJ9zhJc4gLfb2CLpu25QhODEt85HLTUZnx0ceWgOJix/owUI9
 o5YaJRrXESrGbVFfVR4WMZUBENNlluIGAbOtqyN8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([88.152.144.157]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mwfai-1l08ZP3zvm-00yDPn; Mon, 28
 Jun 2021 23:55:38 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] util/uri: do not check argument of uri_free()
Date: Mon, 28 Jun 2021 23:55:26 +0200
Message-Id: <20210628215526.50324-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iWPvcRdo577CdT03QhIG9u9i9A6Bkbyflm9+o3HAbF1hFw8IfzU
 LJFUv0FZe7OpcVMGdaTog1BMIV17S1zRiIhtd1fIIBrjxYKztkewXF8ZogNNfSA3LEqwwL6
 lOeRSCiYiLz61ognG7mcDWBSc32WLbEOsAcA9oEVEyh8kjnOht6srQs0Iuy/PUl11LqXPZ+
 ZLg7+rrnc5xxF1rBWn9hA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RizTN0+4jbU=:JBU2AGY36XANSIbIkIlrL1
 tXcyfiqy3CmFz/iBbrUuytaBGV5/PgwAguAkQtd2yqLEY4pYxjQjA98jNwzS4dbBnLBxxzWva
 CrrbGIudD3PinF2a7Q0SxApASwfLWYx3DUO77iGwYcLnr8fqOL2UpJNH0li+qgTz70hLZKc71
 VWDgbcr6d11jOQHR/2WHF9bFue66h9/V8BZVVSq7ob59lPyDSsZR32TSlQE2E8WESR9gFeCHU
 FdHgHgeBOZgCPYGEGo3PKhG1C4KLbuWucOZrNlgGhOkV8LD0e02uzrRmNJkqzudHUH1lbSoDk
 ul4zOAFLQ7ZgKqCBCnwIANeKoViXy9lqxJm2rWJNLvBJVmXXo+Np7f/tNdmjz8ihfu9YUZyyC
 0ShZWpab30cw/otmkVy1J4hRT05ke/RJVX5HUAxbjjLkRw4mDE4HGfThjZtbLOKg3e0cL5HSz
 tMJlKyvY7fqCOTP9bAYCCEcYC67NzkiWBHEcW1Rr7fmA5Ui+R3vyeCxrIVeH9skG0gxk58iul
 52nd05T3GHIzv9RE4rB0FS28tOdBmiXY62AlJb8rEtKbZKqQ6w8U6OcPkYLRf7KKuu0AUxvY4
 9q9T1dJg9aKkiw0KCKhOVFkkDpzE7dQdnKqsApqnYAL6JWtBNIdY7MFlrROswzXEOz+RBSoWL
 /sr9kGi6VVP3H+ddYX5ABgPfYAr4wsRcfjZw85DkgT54LzVj+QovV0gTDGVX3Z9gfKbwOG1/8
 JJ3SSvtABQLuUxdVmy0VAR8dxQd4cKkmCSThiuC4Kwsc6k1MiCBnhB9CTRtGG4dCQk+AbhQ4l
 qTvCJRd89vsykAwSNuA6IIjfm0QVCik4+auiw2pqZRDWoO1G8a4R17XeQtAe+yXhcIyk27ZZC
 fIbMkgmvs07+Hh/LV5bgMLBovwwQ3jBhNvl8KoyXkHyPKAEhEZPnNEcjTdKxCG2O9OeDrA2A1
 WPE+aK9BouLn8X/A0J3kO0glR+ttZdGFesLVFFH4D+Gdx5xeWFe6GR4e+oKJYJ2vFpVgYnwmX
 WUdbKQx2/tpaEdOeU0nt464i3IsTE2doUowoRyqbwZkTE2sQyHmVHdsU5QSy3Jmpjj8a+MFNt
 WU6BHmr5iNaptHwoTdTuRZgHeZFg7nWk7nd
Received-SPF: pass client-ip=212.227.15.15; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Peter Lieven <pl@kamp.de>,
 "Richard W . M . Jones" <rjones@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

uri_free() checks if its argument is NULL in uri_clean() and g_free().
There is no need to check the argument before the call.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
 block/nfs.c |  4 +---
 block/ssh.c |  4 +---
 capstone    |  2 +-
 util/uri.c  | 22 ++++++----------------
 4 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index 7dff64f489..9aeaefb364 100644
=2D-- a/block/nfs.c
+++ b/block/nfs.c
@@ -147,9 +147,7 @@ out:
     if (qp) {
         query_params_free(qp);
     }
-    if (uri) {
-        uri_free(uri);
-    }
+    uri_free(uri);
     return ret;
 }

diff --git a/block/ssh.c b/block/ssh.c
index b51a031620..9f88480ae8 100644
=2D-- a/block/ssh.c
+++ b/block/ssh.c
@@ -237,9 +237,7 @@ static int parse_uri(const char *filename, QDict *opti=
ons, Error **errp)
     return 0;

  err:
-    if (uri) {
-      uri_free(uri);
-    }
+    uri_free(uri);
     return -EINVAL;
 }

diff --git a/capstone b/capstone
index f8b1b83301..31254f17e3 160000
=2D-- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
+Subproject commit 31254f17e3c6025f3465d1c974a8c96e338ddbe0
diff --git a/util/uri.c b/util/uri.c
index 8bdef84120..ff72c6005f 100644
=2D-- a/util/uri.c
+++ b/util/uri.c
@@ -1340,7 +1340,7 @@ static void uri_clean(URI *uri)

 /**
  * uri_free:
- * @uri:  pointer to an URI
+ * @uri:  pointer to an URI, NULL is ignored
  *
  * Free up the URI struct
  */
@@ -1939,15 +1939,9 @@ step_7:
     val =3D uri_to_string(res);

 done:
-    if (ref !=3D NULL) {
-        uri_free(ref);
-    }
-    if (bas !=3D NULL) {
-        uri_free(bas);
-    }
-    if (res !=3D NULL) {
-        uri_free(res);
-    }
+    uri_free(ref);
+    uri_free(bas);
+    uri_free(res);
     return val;
 }

@@ -2190,12 +2184,8 @@ done:
     if (remove_path !=3D 0) {
         ref->path =3D NULL;
     }
-    if (ref !=3D NULL) {
-        uri_free(ref);
-    }
-    if (bas !=3D NULL) {
-        uri_free(bas);
-    }
+    uri_free(ref);
+    uri_free(bas);

     return val;
 }
=2D-
2.30.2


