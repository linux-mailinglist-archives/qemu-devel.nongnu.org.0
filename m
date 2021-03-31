Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609963507C4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 22:05:42 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRh5w-0005IL-TS
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 16:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRh12-0003Qe-Pm
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:00:37 -0400
Received: from mout.web.de ([217.72.192.78]:32857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRh0v-0007tB-8M
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617220823;
 bh=8BVemdGq9jCwSWKIJCQq2JsYCk3yLoxtWWpl66zPH4s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=Gz/sEf7ByNxOnIeddHAes8/ieF4ZQ2pfgCRV5POydlmy0ObgIKShGZ1EBtjz+7VCY
 pZp4fRxRo/npQ+Ci7u9BZ/M0wc9RpSdMfWaE5lOQs1XGFflHrpvAzWVhX07IVjnzl1
 GbU1dAud+afQ77yNrqhWb0QQPQbUGIg2nOqclS0Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.31]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Le4Tw-1lxTSt2HQy-00psiA; Wed, 31
 Mar 2021 22:00:23 +0200
Date: Wed, 31 Mar 2021 22:00:06 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Bug: object-add qmp command that used to work fails now
Message-ID: <20210331215844.43914a75@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cr4BvHpVdlYifN/JC7d5uVW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:LhUIeSCCNORmpnUXhBDA5j8ru9CVAVAozRm76MUGvKuPj/ZaLo1
 fnrW32B/LOeiUaV9kd6YLDIcXt2Y5C6T2PvC/Namo745EQd5hWoWCF1ZXdE6K4J7cEfMg1m
 wLpgQzp6aEjk6LQNQ7RHgoto33e1YsMPy/Xk6XjUugulpvjMxu9GDKnnuj3VJjVBqsqGzKd
 vaW0Ku8dznqPwpYsMtR6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A153AGc/gR4=:SHHyDnX+pvxpVRF8I3C5iU
 owD1gvdbs3TFVRAGK9ovLGVXjayGRUKZ9CIpmrpmyIHqf1cIGP/auuGRXuuubIz+pZneP2Sd+
 1g1V84AtfpEBTesLfqSwcF8tCCv9HOBfY6hizKYd7aFbqoaAQ4ET9z0xIxNpYcBGEtUBxBazn
 AbRZj9WsdfHQLQ3l6UXfZ5LEcHnKcCjuTMx1BvDPuLZAeibAGWLUfakiFGrjHzDaMS8lx8wOd
 Dc7z8UQd3pvGe3Tzue4v+m4FVJABmQCdeYAKEPSnZyWp9J8PMzlz2SZ1DmG4Tpj+aTNUfalTM
 xpiqR6haXW8AZnfMD4OHgZnP5zWzi7m9X8zkIxUbKZg1dbTspCPD7D+iDUNyqNe2AgKzCeX6X
 uQBdzsrvgWBOIzqWcABvY4DJ4uGu7VyAS4tpmp5HeA+SQkCsFUdW10spcdpzL5ZuRS85OU06C
 jp0EAvMJgnSa32XSpYkrvJ9Z3JfYhEkPFRJJoJIHBv/k1Qvo5NhFMAYdWBwdlqPP2VxwIy1Un
 /gkOP6eg4f/BZGP1bn+dB2Z6l4GXLDnNfOHzF/7iM4qDK6pLjijlNx+HmoJDYa2oyDCuJpSHU
 jBgFzubKB69J7WkVzAzP8+UvS+f3eBn0Zgi04MMM77d88HV9jFz+K+qUGmtyxvjwFrNBiPdxB
 hGig7x9h84DPlGN3E/n9UvKFyeuy7tlnNka15X+m1FN42dfJGMe1dFve9dSD9RomuknXAa5ZU
 0v/5XA4c63M0j3+uGN0yD5lDRyYwhSs/n5b90YbBVuk7hK8noXUYEuH4iwW1IKHxuL1VVFhcz
 JwfFUMAbtp2bgkZ4G1cF1uVKKl0HZHCeQ9L75mL6LG/CnGXPhxtcln7s9GYTmHPj/r45rb9d/
 Q7K+6QHRnwZIgx+sJHaJqn8/UYGDdbZSGxHws6xoGFbxpH1cHSGxgeGMIasG4LkmC6YhR5nNX
 fD9TWdikHA4CfWGg5JW+v5xllzApAQRYWO1gOYoB/bT7B093vbY/zUpc1uFclq3zCGowP1msR
 9pWraW4PNZ8joho9Dh71pMr5llSjpsrrxpMTlWamrb3CAE1QFJKdB/a5UkbTff9Kb4g3e5LSg
 Sl467eCij3yme3WwjUYyvzQK+R9t4Grtob5O+sXJpwrbyIHqHQe6YUzQCc6q21SYlIk1M9a00
 Ko1q2TpSlZ7TMIrXOHRyAlMkHx/WVTa7FK+pQNOPUpGqrj67hxpyintNG3fyNl09/g0AE=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Cr4BvHpVdlYifN/JC7d5uVW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,
This qmp command that used to work:
{"execute": "object-add", "arguments": {"qom-type": "filter-mirror", "id": =
"m0", "props": {"netdev": "hn0", "queue": "tx", "outdev": "mirror0", "vnet_=
hdr_support": false}}}
now fails with the following error:
{"error": {"class": "GenericError", "desc": "Parameter 'netdev' is missing"=
}}

I haven't looked closely into it, but I think
9151e59a8b6e854eb733553c6772351049ca6ab6 "qapi/qom: QAPIfy object-add"
is the culprint.

Regards,
Lukas Straub

--=20


--Sig_/Cr4BvHpVdlYifN/JC7d5uVW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBk1MYACgkQNasLKJxd
slg1OQ/+If9raaRDNCfuljPqhVTb99Wh6rAZTLUmOQhK50QPu8sydWjmayGDS03T
nkfzWmFlUQwvwuyCmVC13uzJ0GsncgJw1YUm2XwYDgqoKW1kncpGhtiR/mbi0AUq
WWPW37LYZGXEexIRo8SfNhjwcM/4CzvkATKX6nmvuCFuFBEeHlgXSqAlitBrSZTZ
rywyWR/wqZKqgUbAo5P2vCEyAHYQysbIjN3pSI5+v7w1XaJnXmNJJ2bdpl7gjJlR
ppUx3FXGGnahQx1P9WUpQD/t//Ue0K40mwc4kTcKriWcFaAJlp1dqdv8U5Q0IiqQ
lI7yT+7A2fzCKOvmk/gabWKZ9GNpGreaSCMKsX7jGrA5NUWVoG7c1pC/pTGxmzrH
Lk+5ld1wwQFBDWTvHZW8CzbCSQFIqoAgYL6hX7A4AVkgeWj0dA32uLP38Ppftd9W
gj0RbY/IR22K8UnHsvLYQPTyI+l/8epevuvmbq/EtIRabzw1j32pf0mW3eO77iN5
KRxg8coOH1KkwRnmIoahV+aGHqrowYJ6G6nGrtj4zNYFWJdeX0fpn0LODhvpWquV
YJkaokcZciM0+EdVuL6OxdrZM5ZAUWLlo0b7BQoSm9suEIerCUCF+M1XZ4xOoEEF
JxFkp5ZQTzgoA+61+9hIFzfKbAZdhx71/A2pShVMQdYibsa4hH8=
=fKdt
-----END PGP SIGNATURE-----

--Sig_/Cr4BvHpVdlYifN/JC7d5uVW--

