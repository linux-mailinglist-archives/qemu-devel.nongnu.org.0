Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4186F9D17
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 02:53:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvp7M-00070q-Cm; Sun, 07 May 2023 20:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7K-00070h-LN
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:42 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7C-0004Si-CG
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683507147; i=lukasstraub2@web.de;
 bh=AllUWf/hKiAKFGoQyrOy+wa7KNpVnA6iunv1/I/XMZM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=U9KnRURKCSZ/fXwL4Gf0uurbnuXTbWvLFHZulb76fyKVtSH6I/NBvRJOstZDJung0
 8KOopjVIx4bl8C7+WpIhiymMtMlNFvRKlTh2q+VE4aUDCRjNiPyVSRXnQGbGMPDsdx
 fMLLM7i1E/ClG2qbg05bPbBwk2zQ7PKOzp5JRLsC1/2WRRH0T+12MsALxqVhzkOUj3
 OcnNjRDYcGwDojVSx0kidK0lSUYXqIP3SfIgZrHSdhSCdmFhiuuMk7BvdTv1K6qKNi
 j7MgQs+3fTy6+DP2U40Vpmb82IJGOSAiza0y1Q+P8dQELGTtWzR62W2mBIU4Y3Azux
 HSs8wXzTVt8Jw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.115]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkEhR-1qc4gt4AZd-00kLCg; Mon, 08
 May 2023 02:52:27 +0200
Date: Mon, 8 May 2023 02:51:43 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 0/5] multifd: Add colo support
Message-ID: <cover.1683506133.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VF3Lwr4jU=PUdhUU2XnWOaE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:VNAH9UcDiBQ6yZZYhWCesWLZsbw3YwFimlj8n+tWJOcRx/zimro
 aWH5c6kds3D61owL2qhfAHhyCuN3dQCEB92IquyyY+yB07FIck9XsKlUev9vfVSm6p/sVAL
 O3T9znehUR9obTj2A5ouIqVHMdm718j7MgkHkb5c3GlukUhP+WEusHEvVlU/K8nGHMYQ+YQ
 x2sRfXMx4OZpAxviq6vsg==
UI-OutboundReport: notjunk:1;M01:P0:OWWAdacc9eA=;wp6m7f1V/94pYBJ/vHRdFi3MN7S
 ev7xd8UVRvYv8MI3Dhco+BeXlUoq5mraSNcTX4cwNT4ii0lICAep8yPY/ow0xnFSO5i1FGDso
 YaOIeOiCEWNQDE4TeG69vxJPZOFs0woDBhJeeQEtFUpg8/TnXTN9UTOlxqP+qvzQIkvIRgUmo
 ed/hCCt4SDR0cbXPbjCes0aGS3kgvetuV4K1qFIOpN5p8azQaf0+s3oaQRFItzGzkA9UQNUBF
 od9p2m1Ezkikc+039xL62qByGN0mUhC+6zSbFnOeG5ZA5o3U9NM/Hgz5TG04anqRJuE+lx5u4
 /lxBDilHAdnZ1FHNKcC3OFgNvuRJbzx42F4nMHcMhAZFdPFhaIU6hG8uhW+jmtODwgTo1+dGz
 VlAiPGGmTGenNs4ehOCQyVfKEb3cfk5JS6Z1CvV3MwoEm7rc5zDPz1a1hLRkjI7AJ3e+Ve/l4
 7Il9LL5+gVC2/OOpk7kEYI0u908WSwm3FOsq4Z5zJns7AkvDaqsxjDatbGYC8z6Fn7BIcDsOK
 ZIhVE0k8ROmUnZAWQNq8khYxxGYpF5mNL6803L0mnLdqoSXYT3ZkUJ76jqPrjb1N4tkkqonNZ
 r1QmcYspPsws7A7JCgx1ZT5gOLWIMp76BmtSwSWBxNWh0pAD2LZf2JdkYC49tA3L0OG79ore6
 BGzOKKzh94LTL6ZuxqLZiQk4bt/bFhNPNeSiKg3kWodbPTnuwt6Oqt2Q7Fnc8syXHR9kjIh8m
 q/qW8Wlyq0Ikw7czEEBD73UmIHqIk8u/f5VMijSb6lYOY62J+d7CxWqdIVECsaVN+ggjIt5v7
 MDOv5ATshCDJFnjIm1+ns9C7kNf+4lIq353qwzr6td2vFFyM+b47WqLW5UOrqLCb2I8LrsDoR
 aneDB4OtTileeZH4dGgYiLWbmnKYOSWNmEG/wWHBRi1zwdl9wsBlO41tgDfjB+2O47coB89pM
 5KH0nKNfJa9rD6oYfFrDP/gPu/4=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/VF3Lwr4jU=PUdhUU2XnWOaE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches add support for colo to multifd.

Lukas Straub (5):
  ram: Add public helper to set colo bitmap
  ram: Let colo_flush_ram_cache take the bitmap_mutex
  multifd: Introduce multifd-internal.h
  multifd: Introduce a overridable revc_pages method
  multifd: Add colo support

 migration/meson.build        |  1 +
 migration/multifd-colo.c     | 67 ++++++++++++++++++++++++++++++++
 migration/multifd-internal.h | 39 +++++++++++++++++++
 migration/multifd.c          | 74 +++++++++++++++++++++++-------------
 migration/multifd.h          |  2 +
 migration/ram.c              | 19 +++++++--
 migration/ram.h              |  1 +
 7 files changed, 173 insertions(+), 30 deletions(-)
 create mode 100644 migration/multifd-colo.c
 create mode 100644 migration/multifd-internal.h

--=20
2.39.2

--Sig_/VF3Lwr4jU=PUdhUU2XnWOaE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYR58ACgkQNasLKJxd
sliTOhAAulwvvJaUySJSBUvdXl31pEFxE5G1DNL/FxTz/EWXE3hvL5yxWr3v605c
DZZL5UHFeVVtq061d7NczFw+hzE0AUhgArXJ7Dl8v0aYjNVN3TaankEuvMkGpnO9
ZOqSVvdtFo7uJlJBRAqPY4mXmvTQQNQZ3vhTbYt7xOXTYh7AIarFN2wsaLSssoEc
VQ00kvnFcZU/c+EmaH7SBqFjKW4bVZuvjOGmtc8okwUGs3z2NacAHp3M2+3xRrm1
g+oSVDb41uafwqryIq0o8z0RH6bPCKq5n5PUPrt/sValvPpEKzjDLSuTxuRmrQ8D
KraY7lBtSRYiNc3nscasgVCG9YIz0LngmxUn4CZVoTsVKLwJuW3EsvP7b6QPZWzV
mGsT5DDmpURij48Ed7a2ZnrVqs22MbHayXTh9Yqly1cMN/wBi+m9H2SNBRrUj5VJ
iU87EzQrviq+vaUvlaC8N18P+CSHSCrGDewBxfahEphszF+7olEfh481lmXQ1dDa
q69k9nvQE/+MFZTj1sdPOnyTD4MRNiiERTU4zTTkscSAmw+sifRBoDOXrY+myn86
GvK7FYkWTYnCgIvUAo4NxfVBjnNRKTXhe7U86XcmVpTchDuLgWFVGF4T4L8V383e
jEvk5jwP8nlRJY9C2byGcPqwqBfZuvUpZlLhWxKIZgJr8MKAEYg=
=DelY
-----END PGP SIGNATURE-----

--Sig_/VF3Lwr4jU=PUdhUU2XnWOaE--

