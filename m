Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835E2E4203
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:17:18 +0100 (CET)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktuGr-0002pe-6W
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu92-0004SG-NE; Mon, 28 Dec 2020 10:09:13 -0500
Received: from mout.web.de ([212.227.15.4]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8z-0001GY-ON; Mon, 28 Dec 2020 10:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609168144;
 bh=sM9e6f4aBQacCCeUALlQzHypc2fHkhjPOITtzrSkwps=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MGwcyyQmHMGGvjLX7PBow42txnH/T/C8EaUlJKicM6KWVrxdhTug8ZgZgS3Eq/11b
 evuYR7ZQ82bjFGhOiVafZKF24VotekSenfwVNdyuyOuktJt/RugwZOTnec3fFb7aF2
 HaTaB3cD4LCN30sSrRKlAi2MLMMXSIaqbdu/zzcM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MwR05-1k3ipZ056z-00s2xT; Mon, 28
 Dec 2020 16:09:04 +0100
Date: Mon, 28 Dec 2020 16:09:02 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v14 7/7] tests/test-char.c: Wait for the chardev to connect
 in char_socket_client_dupid_test
Message-ID: <1445e97a5800e3f2ba024ad52b500a0315701632.1609167865.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609167865.git.lukasstraub2@web.de>
References: <cover.1609167865.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Ht_S1PnncfnCrv6lSbhUQO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ovkMm11V2IIr4tPHyoYaaLX/GE4cONa3o0AZV1lW1Lmz/a8/rX0
 ez5iHfMAcCeBlDxAGtb5UNOjOoJeC9CIifiSLZVPvXVn2xobRdhm7l47I+mDArrzQEneMsP
 WQOq7agsyzWikic6AcauZkIDDrFyWAtcSpW7Ijayj2ibxZO201pJvLBLsfYsMgfmZva+Csv
 NgO2I0ybftLfTyBIvju9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NwtyFFo8UaE=:YUeXoioSr8sbY73QyQyvLh
 LS6NzbuLPwpqr8VnRGTSoUPRXYMrMX8jboygxnoIaZTHxldyEVMWWDg0PTXper6raA/RM6R5l
 nL+K/Tsvr59Mij2uz/A4MyNYWwaEE28rE4QJZ7kYK8RvmJmzpGeM75CJzpG1x3LHsO4p4wt0Z
 XIMpSGk1g/k8od9p80BeXDU5NBXzHxuHjBlRt8UPOtp08dJ/awUKf80quF1Q8r4Yd1xQAW7o8
 mURj9bZrYXAK/I9jdcaaKU1AtzMqejxRB1jBud+CrZw3eEsXV7Te+iLDttR5ADnrJrDuORELr
 WiBSNMUH8iOw3e9P8Zjcelsqrrno3MhfjPtpjXtJjQoZOZshTVCKMnpVj35VGLf3ZNfWD8Ojz
 RUJ1OThgQgKNLF21HrZoxFABQPbhF1VwPNK01hwCOIoXkeVJwrd5OfF/tx8WC8w89cJIu7Jgi
 UHSloCaBB8ehdMIlu1BHLSa90ScxGSKkj3vjyBaogzfWnri/hYZ/IOPrNXoVbMbmtZXVCS2pt
 KrLXbUuAaw6GnDNgPrFfy8DR/Q1XP/riAHVBAR+O7bUR6hXRtKH+fN8XY6keLZ6pkRCxExqF3
 MwouQ7F5x3t9qP8aZEKy0gv85JEj+OMLPOqe5l1012vME9rz+/eWyc+fDIAgLzs/9CcVavMCr
 4weB9ZhKLn5dlhiKXsxpuMEODXJdyP+5jK9Gk9AmALpl4wU50IdADgt+2JM5ZTKeur+qb7KIz
 FEXBc74n8JF54VGbZi+ZToIYxA95C0k/m31OAcFF6MY0D0Xkd2+Kw1v6Vd7xhu31Cq+7d+9fK
 Nyy0rRVdadsQ7mJvpGVY3r/dMgXPUifY56vsSyDSzg8P0WRAB2GTyU6sm+DGcRSCsycprJT3P
 TBg1dO70JjNjGXOrgf9deQYEmfI1oLqZ/8nMu+3mo=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=
 =?UTF-8?B?XA==?=" <berrange@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. 
 David Alan  Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/+Ht_S1PnncfnCrv6lSbhUQO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A connecting chardev object has an additional reference by the connecting
thread, so if the chardev is still connecting by the end of the test,
then the chardev object won't be freed. This in turn means that the yank
instance won't be unregistered and when running the next test-case
yank_register_instance will abort, because the yank instance is
already/still registered.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/test-char.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-char.c b/tests/test-char.c
index 953e0d1c1f..41a76410d8 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -937,6 +937,7 @@ static void char_socket_client_dupid_test(gconstpointer=
 opaque)
     g_assert_nonnull(opts);
     chr1 =3D qemu_chr_new_from_opts(opts, NULL, &error_abort);
     g_assert_nonnull(chr1);
+    qemu_chr_wait_connected(chr1, &error_abort);

     chr2 =3D qemu_chr_new_from_opts(opts, NULL, &local_err);
     g_assert_null(chr2);
--
2.29.2

--Sig_/+Ht_S1PnncfnCrv6lSbhUQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p9Q4ACgkQNasLKJxd
sljndw//cgsX6o5fJKyUj58ECvTp32SHdeQz3o95IBApa3MtsAnfNridHbuUu+qJ
wWpcs/5SY+qmYyVxrcNEDsqh0RfqM9atTMeAxMx47kGNCLkIi14SjQVUDhS2zI4k
BEmUDbGD4ogdg4CeNIwaqJWuLcT9sP000yuyVnqAFpNRcGQ0rrarI5BWOJWPjjIl
lOk2b6zgkIP4mpd+IIfUNrdl4J6wDf44MoIK33WYsLukGiurVq0EnWw486dwzt9R
O2hUxVQi7poPcgilafuHx7SmqkkSAuDKIEXPdR31LgzylmyMBiASCJzm9v6BVmHV
GwbVeslIl4053czH+eEYuXMlKkd8sdUcs01mEaTgtx7mewvr7ZrW5xIMfx0aZPgu
+clIXWYkTqFd3n69yzw91MaicGDSfG/6qziwEk1JOrK7HB9djy4HbVsn9ujhDNRW
zLuGEyYMxyaqnu0K1robkuerI8Wu40su2sfwoEfot1zI8kAo3B6ZDECQVylZ5Ykt
stO1W7balFjUqN3n7uSxUE9Pz2PEnnrm7pPKvrscbFi8l/6JabppcLRvRXciQfbt
l5QYLB2/qSPDWlP0Rp0mVgG/uXXsE9qkkG93zT3wBhxDh4Q1SwUwPFszz8tTk112
keRpTUzRdbRuqFp/yVumEiHoZKYLjswYrc4HeIMHTXNvINTXcjQ=
=qVME
-----END PGP SIGNATURE-----

--Sig_/+Ht_S1PnncfnCrv6lSbhUQO--

