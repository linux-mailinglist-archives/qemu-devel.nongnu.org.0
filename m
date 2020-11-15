Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C52B32F2
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 09:31:22 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keDRR-00046R-MZ
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 03:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keDPq-0003DL-JW; Sun, 15 Nov 2020 03:29:42 -0500
Received: from mout.web.de ([217.72.192.78]:58613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keDPo-0001RV-QA; Sun, 15 Nov 2020 03:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605428973;
 bh=vVK3NQmLEIeXaFrcAg0mr+0pImC2ZdOh2XBLNfktYS4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=bkN+BkL8wCQnFYAE6EpriNg7bUbz1i+BfQxJfXap3hlKg0g76crnXTGQmszQaO/f8
 qtuNmXeXFGfJj7gZwYe33ySUzL79MgkI3f1sgR2LIn2vneqHfPbjK0w+w7ZWWX4XhL
 FxitAxU2YikwWQnEfyeFycU1Pzal00ZGiAvuvw6I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MRU72-1kp7Tx1Zai-00SeQO; Sun, 15
 Nov 2020 09:29:33 +0100
Date: Sun, 15 Nov 2020 09:29:32 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v10 7/8] MAINTAINERS: Add myself as maintainer for yank
 feature
Message-ID: <20201115092932.7ca62155@luklap>
In-Reply-To: <87r1pcp8rx.fsf@dusky.pond.sub.org>
References: <cover.1604075469.git.lukasstraub2@web.de>
 <20201030174138.071af6a3@luklap>
 <87r1pcp8rx.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iya+=G8eA25VbEf2BTy8RTU";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:mqUEvb8bIWsvg4pPJa+zW4adeX5ED/m+WVF/J+nN3EPJXsgXgv+
 1iNFXQy1cO0hIfiZCOh98w9+HO8/kZ+5Bb8Fj6PwmT6x+n60r+NYRF6U4yIZ73ArKlI8geM
 HCye5ckRJTxWXywnH+kd2DpkuwFcBhKwT0kR6mOgbi7xWKvTEXJ7PEf1FMvzFh/5M0BUU7u
 7sqTzEEfZ4DljZsNivLXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mhqBrQD4zLI=:q1IpPvbHkNAZyosCZil/qn
 QWsY/btgFwGunAaWh4zmRvULBZt7RnROZGygJIHz4U0eVbG0mT1+bnipNr2wSsHrfdkXzVySb
 YAI2HCgduWLJpV0Esx5YOR//oBzBCHGO7oFIk7mxdowQgJXja16vlvw3f0kLmJ38gr0cTrD/s
 86jbzJlMjldFk+NsjjBpWAB/7Wnsw37O9PjFspnUaRNetdjTJnEOtHe5i9PmtuIFBNVgXBHRZ
 EvgmEWwTlWGPgoWLNFtY7G0xMtEatZcmyy24fHBtxjEPVt+UqgG4GShgjDFbRMWt3RhPQ7brh
 9WeWEDfN6wCzUMqvfw9wj/G6EmEdCpGHK/NA5suSWklX5AfD5ptepiiB5cab45cyuDaSRxslH
 G1Ad5uezc0mXqnKKisnj5/fI7FNn1+nQKmqDUB9ovsSJxJKsDPzWfGUq9OziBM+bjgQ9Hni57
 yS1AW8aOl5T2UiT5TsGATkYuqig4azMhiKVOljs2V0Jcsoh6h+LGea+lBuO7sZhhOGmF6C8AV
 lVckmiZAMfjEXJve+ugOx5qtTp0fawtt1bz3Cdbd8Dub98/zHa9uOIAZwML/mzzn0m2e907MI
 2TNBvoDv85+eIt0t3bgDbXe6T7618knPDR83tBs5Exs5f5PtVoSEYbDxlTMfYVe24G0SQHwzC
 LCUDcXtm5BmIDX1pIbrEuKEEuCibopK2wqQ2EK9VRODgDmAJS2eW8ksNGxVqylVRoQh6p9aIE
 L3oLBCGA98XVeNyVfrB05ZIRrKlrPNYMBJJg95b9atbKfFOmMt4WTgzDFZ8/U1jL88zQDGrEA
 bvGV/ivKnnbdtcrez2Ia6Znqqu9Dz/umwCZHf4YnDo1lbVN5VgqvvmaJpR/N0OBVoyYjLc/Uc
 Zr77RGiWEvyiOorv9VtQ==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 03:29:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/iya+=G8eA25VbEf2BTy8RTU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 02 Nov 2020 07:33:54 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Lukas Straub <lukasstraub2@web.de> writes:
>=20
> > I'll maintain this for now as the colo usecase is the first user
> > of this functionality.
> >
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8c744a9bdf..81288fd219 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2676,6 +2676,13 @@ F: util/uuid.c
> >  F: include/qemu/uuid.h
> >  F: tests/test-uuid.c
> >
> > +Yank feature
> > +M: Lukas Straub <lukasstraub2@web.de>
> > +S: Odd fixes
> > +F: util/yank.c
> > +F: include/qemu/yank.h
> > +F: qapi/yank.json
> > +
> >  COLO Framework
> >  M: zhanghailiang <zhang.zhanghailiang@huawei.com>
> >  S: Maintained =20
>=20
> I'd squash this into PATCH 1 to mollify checkpatch.pl.
>=20
> Regardless,
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>=20

Changed for the next version.

--=20


--Sig_/iya+=G8eA25VbEf2BTy8RTU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+w5uwACgkQNasLKJxd
slj2nRAAixcGyemU4uNHGCc7RA6I/encVI/6Sy3MRgW1niGdY85xfbkP0RrpB+Xj
+F4IU+HD6MJmVxJUbBvhsc6KCX0wSwy9qORIm+MmfLYuWtOy4dA4C7wyJkxwZ/ma
CKvgy+Fp3juT/iSST2fCrv0LSvKYMYw3XSMsMuNedQGz5CtiNzY1VnIpiudpgowg
q/N/ytbURlLMlpiheQnvNCAkU2tyUHPPpiBgl0rYIB0uOK0GnnMupdoh1UPGh3BT
6/dekNmYf/btYNJ5K9804y6guBUJhFGeAXAWvOgB7O+DEKdjHLzqvb0q5Yy7KXbZ
HpQYOQNHYD5Zabg7YGIWyIi4GVQS8FJBBTPeAXogFL/op3aDOm0b1WhIt0hD5ebj
mrKR5Bs/ZxCZr/XXWb6m806jKgdAoOiDb80yhSeMz6nc04cXGYuo3gMMBTWJ9iuv
hil8FWDWLCHPTP5PTAs97WV0Z5xRT53ztpF9op488Wc9X/oxhtR86HLA78rWRQpN
z2elkUd2OmzUphyFyVaFVwoWs+/qCM6t5o50SqPvQnFIcWlVpcdol/2TM56Co8SY
cBbq8l7zAWtlvYWoChdbjUYYJP4hIwxXBhrU2FRhP7zSyUFyZht16tVbiNH8qiVr
ayj8/09C3pwb23b+tYfUfxqYReZrG9v1lF2KfH2SyvmJsgn/dTg=
=or0A
-----END PGP SIGNATURE-----

--Sig_/iya+=G8eA25VbEf2BTy8RTU--

