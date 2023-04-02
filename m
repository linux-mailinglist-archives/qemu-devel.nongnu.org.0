Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C276D3994
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wF-0006kD-8o; Sun, 02 Apr 2023 13:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1w4-0006iy-Ro
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:13 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1vy-00040f-84
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458161; i=lukasstraub2@web.de;
 bh=cJFvZoHNLbXh1reNm7jTVEfpy+kko2XYCNTMSyLzzWE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=p3H9vE5Z3vBoTuulWyevmwLpmRNCFqSpxuSg5gPvMbtITlj9KUyXVI5z445CS20Lu
 TH8x0iJUhtfwuVbTIzF3tdCRmKHhEynxmQepY6WJ59+qf3LCQI3VjS5K3hRg33P6NX
 lOuEdoLad8xSBfKEzJ5VZ3IZzA3k2eJ71EfMvL+4Fa2OFOutZj348D7cbAjK0gzRRP
 iBE9sIFEcbQV69wabfsx0VBH60b4WcIkq3UUwRTPDjNihgDbDmS0/bpxjFloHJHTed
 eY0e3ninL9sJ8d1mnECohwWdEHKjFPldSWuvGyoSRMxz2YK39GYNnTnpXQ2YR5ECwV
 Wsu2KA5jU1Gpw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKMA1-1pzkXW0LOh-00LgwT; Sun, 02
 Apr 2023 19:56:01 +0200
Date: Sun, 2 Apr 2023 17:55:59 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 00/14] migration/ram.c: Refactor compress code
Message-ID: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rqmfmya_cA_YPCW0nWS1D7s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:EF8eJ6PPxSeSNCtswoRvQNj06K2EOmAvoOZZGuwPEEeh5j9WUXm
 9GwHMgxO9RMsz+prqPp+lnWnaDfMAejblAQ3d4ltMpdW59OHgt7GxXhJ6+WxNO8dqwQIEho
 84eNpNI6Ez0hlQvtcHkii5NW32g5OTIqqv1vohNYg5Y47nIKGtoC0kMNoVRIdU5m1J3WDtj
 MUTcU2EtF/OvbIm6knh4w==
UI-OutboundReport: notjunk:1;M01:P0:ha+XPRyV1H8=;zXWh2UQZiv4I5N0hha3y/Ts4wQj
 s4ViNktcODGnmLmYtjtKfFAWx6jII9x43w0IBcMUd4bycMtAJ9P3xGc42iocWi4nQTyfq4537
 vflEtM1RQLtu3rSeps+uB9jLpb4UlzioxLd3ZRcT+/FJ3GDyH2JjXLAQ9VC9iC0hijC6Rw4MQ
 GOHpPql9mWBfRgUwv5Oj9KL1yV7bcjCzLfqXhHqQxsC70D7GVz2+Pg+ascr1suJtX18foKDfh
 omiK4jrkre86e3Sxmt8trRrNFlE4dxTi0ZLpUuVPXeIfOniJ3WToc4E4HyogT7sXPhH+Fqar+
 A2fsnFt1e+scU1JIg7VUfqpdjI7BE7bBuRBktPx4qlFag+whJJYgkaG21cSO2RGrYAgGghrnd
 fWznQWTNA1LcYC5yw97LieLah6ruc4d6dQO/NLM8jQsvFrTlQL7BIbHB8BRK9xjBd2f+KVZ2r
 oTbCZK81D7O/VulmUd5o5OLVv2UzkrDeJv5O40AMeZ4mtTM6+5RVymGPBGGmehs7LJL04sEUF
 i1KBsV2DAn26sOZLz4zaiWp8ar/n/J5po/Na/yAqJOIpbiZ5ARvBH5C06I4dM/ylWX5mML40z
 fAUsmP6VHTGFmT85UCIwiu+/Y6YQ8ArKB2KeKa6ttbIVc9TO3HtKHYvT6tuu9J/EBa/3ghyMQ
 68d1DPeNKeaCmN/SQQGt8MDYbRghEn2cALieurju094/lgZLHHh93ixI25isRaQJBnyFL0eSs
 WzuTy1SkC48+8QOdabg+MhpILoQdDcZlSWmnkHLd32Tw7DdIusX00a+HgegxM51NDPxs9r+mM
 yanUIozdlX1DWPKkGTxKjWGYDWlULoqAiukrjhLamqbppO0+51FKmRNYjGElBLjM7yDTEqAvH
 IvjeIzbkEwZ1NUo6Ot02l4Qq/dw76j7q3/cRz3oJFItInLZPQADmerC98LtOqWh3XTxDjCZ3L
 7dbe6oKmJYEGByipizN3nvDdkOA=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/rqmfmya_cA_YPCW0nWS1D7s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This series refactors the ram compress code.

It first removes ram.c dependencies from the core compress code, then
moves it out to its own file. Finally, on the migration destination side
the initialisation and cleanup of compress threads is moved out of ram.c
to migration.c. This allows using COLO with compress enabled.

This series is based on the following series:
https://lore.kernel.org/qemu-devel/af76761aa6978071c5b8e9b872b697db465a5520=
.1680457631.git.lukasstraub2@web.de/T/#t

Lukas Straub (14):
  ram.c: Let the compress threads return a CompressResult enum
  ram.c: Dont change param->block in the compress thread
  ram.c: Reset result after sending queued data
  ram.c: Do not call save_page_header() from compress threads
  ram.c: Call update_compress_thread_counts from
    compress_send_queued_data
  ram.c: Remove last ram.c dependency from the core compress code
  ram.c: Introduce whitespace (squash with next patch)
  ram.c: Move core compression code into its own file
  ram.c: Remove whitespace (squash with previous patch)
  ram.c: Move core decompression code into its own file
  ram compress: Assert that the file buffer matches the result
  ram.c: Remove unused include after moving out code
  ram-compress.c: Make target independent
  migration: Initialize and cleanup decompression in migration.c

 migration/meson.build    |   5 +-
 migration/migration.c    |   9 +
 migration/qemu-file.c    |  11 +
 migration/qemu-file.h    |   1 +
 migration/ram-compress.c | 483 ++++++++++++++++++++++++++++++++++++++
 migration/ram-compress.h |  70 ++++++
 migration/ram.c          | 490 +++------------------------------------
 7 files changed, 615 insertions(+), 454 deletions(-)
 create mode 100644 migration/ram-compress.c
 create mode 100644 migration/ram-compress.h

--
2.30.2

--Sig_/rqmfmya_cA_YPCW0nWS1D7s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwa8ACgkQNasLKJxd
slggEg/+Jhhu6mJAvgOmHcLCGGjXOwvHo4bGTHM6eRQv3XaKDKFoqhqLRqHza6s8
/krmSj36TVQEZ+e2TOrv4RoH/MXRW4HG0mBP5sZhUMt58Kf7h+douHurcZJcJJ36
kIPe1skfX+YoAYmuoZKrEz1vgZ62GF4u45R0Y9xFT44vi/tF5649rAkR15ZTUJQi
zf4FEDoOcDAJ0QhZyeVAHFNF5RROCvxpWv4YdDOowjWmVYpF/PPBvtrEd8rjZPJ6
CAbG1MPXS8o4I5KjBBxQZVe8l5rwxyM9c+sA/5R/fyTFfVgvu82GxdZ+hzGMAC1f
+ZRIcCTHbbjlKUiTMcRXUzyZGInRKXk8bYNDAwgtznba5OFSbtS3aQNkLASBA773
tSNUhVlKqKjbhUknKl1WI5GDRB9fB/VyyArCESbZ/h5uVUgvJqXVaIGlkpM2INdD
wEqYv5Y1TDC+tbwWVFVQncPtZwa00I9e3eBArsuYwmufYuPnFb9HfRFoRg5xGMQn
tcFf6PO7c4heVA8IJxNa+TgZciHddNCBUvW/BdoBxOZ4WFBNqpfYqDg+fTF4EXSg
ano2XAsi5C+/xZJ+UHQ1yWyopcUJ7PGl2DLYHGRuja2+MVrXFI3rGkxLhSMNZvr1
jGLultU+2gCuoEsmhtLSa3YLOFmHKNI0b+afqZcDwmtTLbvVf/s=
=augn
-----END PGP SIGNATURE-----

--Sig_/rqmfmya_cA_YPCW0nWS1D7s--

