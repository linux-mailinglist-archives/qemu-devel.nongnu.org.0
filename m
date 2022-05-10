Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F9D5210F2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:32:16 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noME3-0001li-MS
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noLpS-0005rQ-9C
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noLpP-0005Pu-PJ
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652173602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fsloEr5eap7o0hedqNpXN0YwxAA54l8SUF5UbjJw+mA=;
 b=JhTeKklNHmyb6s6ALv5kPVOMac6Fpa6kODG3fqd/dyvlaOzFWJvKttoF99UfYf8Ssm6smi
 k3rO8PZpuJ+4eHI2+CbpYXWiPQHmrNk9ImeT2wvQTOHHXRnh0pjmfUyWL6H0w0hTFZIKJK
 vZaO1NGRVEB1+Uc1jYSUmXyuuRSmjz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-ZLBwXGpnONShhWJjaw9qVQ-1; Tue, 10 May 2022 05:06:41 -0400
X-MC-Unique: ZLBwXGpnONShhWJjaw9qVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39312811E78
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 09:06:41 +0000 (UTC)
Received: from localhost (unknown [10.40.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73C7440E80E3;
 Tue, 10 May 2022 09:06:40 +0000 (UTC)
Date: Tue, 10 May 2022 11:06:39 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220510090604.ovqqybzyo6cebev7@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v4hpmgc55rfpg4qb"
Content-Disposition: inline
In-Reply-To: <Ynon8Y8uwfL1bDyN@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--v4hpmgc55rfpg4qb
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lqea5sd4mp7o2myl"
Content-Disposition: inline


--lqea5sd4mp7o2myl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 09:53:05AM +0100, Daniel P. Berrang=E9 wrote:
> > > * License
> > >
> > > While the generator (golang.py in this series) is GPL v2, the
> >=20
> > I'd make it v2+, just to express my displeasure with the decision to
> > make the initial QAPI generator v2 only for no good reason at all.
>=20
> Our policy is that all new code should be v2+ anyway, unless it
> was clearly derived from some pre-existing v2-only code. Upto
> Victor to say whether the golang.py is considered clean, or was
> copy+paste in any parts from existin v2-only code

Should be fine to consider it v2+, the generator.

> > > generated code needs to be compatible with other Golang projects,
> > > such as the ones mentioned above. My intention is to keep a Go
> > > module with a MIT license.
> >
> > Meh.  Can't be helped, I guess.
>=20
> This does make me wonder though whether the license of the QAPI
> input files has a bearing on the Go (or other $LANGUAGE) ouput
> files. eg is the Go code to be considered a derived work of the
> QAPI JSON files.

GPL does not enforce that the generated code to be GPL [0] unless
the generator copies GPL code to the output. My only concern has
been the fact that I am copying the documentation of QAPI
specification to the Go package in order to have data structures,
commands, etc. with the information provided by the
specification.

[0] https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#GPLOutput

> I'm not finding a clearly articulated POV on this question so
> far.

I don't find it trivial either but I've accepted that the Go data
structures are fine based on [0] and the documentation can be
split from the Go module (sadly!) if someone finds it to be a
legal issue.

Cheers,
Victor

--lqea5sd4mp7o2myl--

--v4hpmgc55rfpg4qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ6Kx8ACgkQl9kSPeN6
SE9gPA/7BgaNsIuM5Z93PYQYpBMWTpg9o7tMF64X0d/BRmL2Y39YsoRsc7AZWiia
+HRWVKy2eZMrkq5uFtX9NalgmM/GlXIkj+Iuk9gAgpRwfWe5LjcrNhYBJCHOTYh8
+6QtNB/gB5kkllNxBO7eYcRzPdVI6xKd4lwvxqP7bSJg1+W3Fjup9ftwuuZzDxI5
PF8vH36BIsBd5xa02F6et0gDDmvH/dNCHvqbIBGr9rN4VvqZBjFTvtgsWsWfY8uh
j5Ge/bxfztjWRePzl7Fz97tkUP5qAJmtkl+aBSGBVhZk2NSGQ5LmzFGp6VDDn05n
D1Qy1luH51cyJUZ//YeAfD4iccUt+Bt25weD90776ZUuMrYy0KcmzhcvAR90l10B
Qa2eNsN6M40+PIrchd7dLDh9v+QDhXhCpEiVA79YF5i/K8giGoPQS7nvujePMgOV
tB1eZbxL7MlNiuItrbs3iIARJbe3jPPZoKal0x8Rc+4IPtUf/E+PzD5OCGKPQXEw
DMHEq9BY9uhJUvKH+gvjKLewEoAE+YYpdggefA8UM+0kOWnfUxYJGaP0aGrfaHR4
JH68ut/9cbO7+mKk7+MT5NkuRs3xGH6lsin0+8RAmKHQ+Sf+VlnUMSquXOPDGlXD
Q06SrSuDrWnW36hIQCLRxRHz9wtWjTQAioARGJdEq4UDk6i4tTI=
=Fb43
-----END PGP SIGNATURE-----

--v4hpmgc55rfpg4qb--


