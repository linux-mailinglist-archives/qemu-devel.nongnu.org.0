Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB673125AA
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 16:58:42 +0100 (CET)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mSP-0007YV-2L
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 10:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPa-0006GO-C8
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:46 -0500
Received: from mout.web.de ([212.227.17.11]:55551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPX-0006hh-5J
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1612713338;
 bh=VZwVPIcXWmppBYI3UKMa0Q+ozgHnE3/ryr7dpnEnnFE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=m9P6d1lvouZfBcMIbs6eXLDtwZC/rfJeGVxJGmj9M4u7MYz2LWFnJRslF/LazXni+
 vGT+BC+gtOd1blKidk8+4lS9aVF/63XmBalW80fXThmWqili3Ks7wlZcHUqHweP5E5
 JI5LSvKmVecI/5kcyMOyNCrl8aMxV1FJufbFPtDU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.85]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKdHC-1lTjZW2S7w-00Kvr5; Sun, 07
 Feb 2021 16:55:38 +0100
Date: Sun, 7 Feb 2021 16:55:36 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 5/6] configure,Makefile: Install colo resource-agent
Message-ID: <39eb7839a2117286817e4f9fe7838badff08b012.1612712637.git.lukasstraub2@web.de>
In-Reply-To: <cover.1612712637.git.lukasstraub2@web.de>
References: <cover.1612712637.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T2XWj64uVw5v7+sKSMlB+Wb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:sSEQmA6y8AcZyrBIzbP81J6i/RPahu75n2q1CG4UqkM1+/VRm5q
 4BerQb4IeJJTVPf6g9BqYOdMJ2FI/ezaDZ3N1hRJN6CT6OKVaNGJFUlfzDX3wv7TJfGDcQN
 6WPoZUtzVPGiXtsfD4SZxoaPpCdABCA4jCx/pcUiE2kcIuIGtYDWvrPEAwR3Yn9FIu6g4Pl
 EYIFMs6KV2DWyYdnEYw7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eZ+y+fEHr38=:joJN9UOlp5ufhb3ojJTb9q
 T2sz7KA03Y6UoaBCTE1PH2kNrzq7Fn50Kv7O79hP1DCTtlg2TjGDrr2DITYXgatJk1gnX3+lh
 5kECfbtt5rOieI6VUoqSzOvp2pJSe/OrP5Jt7sfmCUfqjxHwvTWm0md1PoqbJWBZw3GHKpn9Y
 tSptYe+IlrbiCe8UyEDWdRZCrOixsaYuyPtr+E9m2s3LYOTdU9Ijl4qJZMFV2GEYpi/Nr5Pwl
 NUZGoBzvgsLuMy9KPr30XoSs6eT/MhybD5byWhtlvX0N7+4FefIC38IZJonDZ8Yuq9zIucPEj
 0QKDLMXNDmpO03VIipwLriGVxQrQ6D8gOkHylmhYXFj3H3AnZCV+okiCgikWh1Zk17kN/nlAC
 wkgrIPp9gJZxyinrkw/p0A19ive3ZhvokFN5p5WswkyQ05chXv8cOM4Ro+ZlMDdRdGmj1/qPE
 m3BbuRcQtWl/FI/aOu+WkewMijc8CtEqWdowvP8ii1NPYh7WsWSIPVty+mgj0ZdX6brPX5Mm2
 jr2DfAAlKynYAj3s5LGe4QThVWvHX14vwLs/mbphsr57Xgf2xOAKMeYMf4L8mIScxT1z/ykrB
 3soHovqD5rqZn3++FEIX+uklneG5ui1H4C4vS7wStiHCdFfzmfUYEdVaPCfKtuL9Fyi0NzJtE
 bZZUELL2pUq+04PEH9xfshrsT17pNs+RdqhJGkTZ/8CbvjA2Bcx+iA/7ShNHUtMxiKhoqG3Bp
 RdHsVwNpwpEJeg+plagXGUDlpj/gE9ZOsGGfe2AabShGzcGvJ5bmYkj3zL7wsaiTgqj4gBoYg
 PtWyGUk0bDN9aoTMI9/mggJdesPKyqD02TPZSmlCth5y9BD2yFnhhgZ6TPHdojZ9vNBhWrdls
 oM+W9UtcgHDdti5/veOOC1fXgTo4lRRUCK8rnrNRM=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/T2XWj64uVw5v7+sKSMlB+Wb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Optionally install the resouce-agent so it gets picked up by
pacemaker.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 configure         | 7 +++++++
 meson.build       | 5 +++++
 meson_options.txt | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/configure b/configure
index a34f91171d..54fc7e533f 100755
--- a/configure
+++ b/configure
@@ -382,6 +382,7 @@ softmmu=3D"yes"
 linux_user=3D"no"
 bsd_user=3D"no"
 blobs=3D"true"
+install_colo_ra=3D"false"
 pkgversion=3D""
 pie=3D""
 qom_cast_debug=3D"yes"
@@ -1229,6 +1230,10 @@ for opt do
   ;;
   --disable-blobs) blobs=3D"false"
   ;;
+  --disable-colo-ra) install_colo_ra=3D"false"
+  ;;
+  --enable-colo-ra) install_colo_ra=3D"true"
+  ;;
   --with-pkgversion=3D*) pkgversion=3D"$optarg"
   ;;
   --with-coroutine=3D*) coroutine=3D"$optarg"
@@ -1772,6 +1777,7 @@ Advanced options (experts only):
                            ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
   --disable-blobs          disable installing provided firmware blobs
+  --enable-colo-ra         enable installing the COLO resource agent for p=
acemaker
   --with-vss-sdk=3DSDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=3DSDK-path  path to Windows Platform SDK (to build VSS .t=
lb)
   --tls-priority           default TLS protocol/cipher priority string
@@ -6414,6 +6420,7 @@ NINJA=3D$ninja $meson setup \
         -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=3D$virtfs -Dcap_ng=3D=
$cap_ng \
         -Dattr=3D$attr -Ddefault_devices=3D$default_devices \
         -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D$b=
lobs \
+        -Dinstall_colo_ra=3D$install_colo_ra \
         -Dvhost_user_blk_server=3D$vhost_user_blk_server \
         -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek -Dguest_agent_msi=3D$gue=
st_agent_msi \
         $(if test "$default_features" =3D no; then echo "-Dauto_features=
=3Ddisabled"; fi) \
diff --git a/meson.build b/meson.build
index 2d8b433ff0..82efa75e36 100644
--- a/meson.build
+++ b/meson.build
@@ -2263,6 +2263,10 @@ elif get_option('guest_agent_msi').enabled()
   error('Guest agent MSI requested, but the guest agent is not being built=
')
 endif

+if get_option('install_colo_ra')
+  install_data('scripts/colo-resource-agent/colo', install_dir: get_option=
('libdir') / 'ocf/resource.d/qemu')
+endif
+
 # Don't build qemu-keymap if xkbcommon is not explicitly enabled
 # when we don't build tools or system
 if xkbcommon.found()
@@ -2398,6 +2402,7 @@ summary_info +=3D {'system-mode emulation': have_syst=
em}
 summary_info +=3D {'user-mode emulation': have_user}
 summary_info +=3D {'block layer':       have_block}
 summary_info +=3D {'Install blobs':     get_option('install_blobs')}
+summary_info +=3D {'Install COLO resource agent': get_option('install_colo=
_ra')}
 summary_info +=3D {'module support':    config_host.has_key('CONFIG_MODULE=
S')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info +=3D {'alternative module path': config_host.has_key('CONFI=
G_MODULE_UPGRADES')}
diff --git a/meson_options.txt b/meson_options.txt
index 95f1079829..907d5dff61 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -15,6 +15,8 @@ option('gettext', type : 'feature', value : 'auto',
        description: 'Localization of the GTK+ user interface')
 option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
+option('install_colo_ra', type : 'boolean', value : false,
+       description: 'install the COLO resource agent for pacemaker')
 option('sparse', type : 'feature', value : 'auto',
        description: 'sparse checker')
 option('guest_agent_msi', type : 'feature', value : 'auto',
--
2.30.0


--Sig_/T2XWj64uVw5v7+sKSMlB+Wb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAgDXkACgkQNasLKJxd
slgP0RAAp76QTfWN9xPF2/y1rg3JyddZknhUtbheZCeh9mhLc0aVmF1XTAnGVx6B
m8Oi5W/H3hkwKhQ8b25V1RU6BzaurqGoUIQCDW1Yk25wuYwUlj152ENQabtKY/QD
uqVUTZJUcyWuP44VB7FrzsjK0Fje2iwg3G6EjAOIA/EFZ+3jxVnjRM9QaQAeF+Sk
BhbEZNJEc4RzOE+4ZvFbfaSB199WjbcJ5c1aGQVOA6Y220fHqY2yHg3mK7hzhF5J
xlGKW29yqP+yrNYNRf4zPxRm2f4Y45+zy8k8MN3JGjILNFxUvWDPzVAIRtywbq+s
AGc0ve3mk9dl/doAngPe/QaMka4F8l76waFjcyygmvSeW93PlLsG3r+1yLVFZ42+
pJpaZ0JvT7XUIDOdq8tsxvSCp1DOS3Fe96QdjNWjtRDgoPKCxSi3l2sw9jDptRqk
LmLhyJZPKvDJzDaQ2rKRlZNvY0GGj5oyquQSzK7M+HGVLEGoCgG8+5lCpqGAflDq
SOiczKj7VPrUeB2W9OjGGa/nFuAwEUL4Cs5//QVWoghD6uznEDtEgrXjkUaujoNB
XGsiWUgEwaRAtXhLw7AQ0L+8JTi70OBIS/21mNrZut2B3+J5eJ9o/OAz732cBJm2
Nefj8xWByUzEz61FwemK0folcj78zUdbwyzWZ5PWGzra3LqZHQ4=
=uYOG
-----END PGP SIGNATURE-----

--Sig_/T2XWj64uVw5v7+sKSMlB+Wb--

