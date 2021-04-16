Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA803625BA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:35:00 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRQp-0001jG-RX
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRJO-0001Ef-TE
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRJM-0000mW-Mq
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZTLKHS8GpVSpMvvPbevaU1I8uT5taP2UwFJWjJFOOw=;
 b=JsbBrgQXMsiQiMRRjKVvOG5BQWIKrR3QhNaqCPvrGrs7SX8gpaCjacEZz/xJOkOh6WjD+q
 77Brj1Q+IcR7whI86fP02oxDdixzBCj/znM+bX5QWRhAglnNJSbNMbblVjC+WW4DUvrolX
 8mFr/1qr2X5d1pO620osD+ucUGgahFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-7WaIehmUOsCugWFJTSl4FQ-1; Fri, 16 Apr 2021 12:27:11 -0400
X-MC-Unique: 7WaIehmUOsCugWFJTSl4FQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC893CC621;
 Fri, 16 Apr 2021 16:27:10 +0000 (UTC)
Received: from localhost (ovpn-116-207.rdu2.redhat.com [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7A35D9E3;
 Fri, 16 Apr 2021 16:27:10 +0000 (UTC)
Date: Fri, 16 Apr 2021 12:17:26 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/8] tests/acceptance/cpu_queries.py: use the proper
 logging channels
Message-ID: <20210416161726.GD1914548@amachine.somewhere>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-6-crosa@redhat.com>
 <28f2fd45-4ccd-2c9c-29d6-2de5f52bbc4c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <28f2fd45-4ccd-2c9c-29d6-2de5f52bbc4c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 07:15:07AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 4/15/21 11:51 PM, Cleber Rosa wrote:
> > The test contains methods for the proper log of test related
>=20
> "The Test class ..."?
>

Yes, good catch!

> > information.  Let's use that and remove the print and the unused
> > logging import.
> >=20
> > Reference: https://avocado-framework.readthedocs.io/en/87.0/api/test/av=
ocado.html#avocado.Test.log
>=20
> This test predates Avocado 87.0 :) Maybe mention this is an update
> to the recent API?
>

In fact, that API is *ages* old.  I just happened to post a link to
the latest stable release, because the build of ancient versions are
disable on readthedocs.io.

Regards,
- Cleber.

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmB5uJYACgkQZX6NM6Xy
CfM2GQ/+MdhrHaw33c4mv42TdEAJ/EJFpHon31uTBAll8fbPGj/U2lW/ta3YkXsY
/bSnNmi42z3mYIPt6MqCLcfmUc/5j8FZkQ8K289Md0IaQ6RUqSjZOR4pXP1Ds487
exrb5/lGDtRrFEkbBNMw7d7C9K+v87rtrpOOtr7yGkTyYC6sgTTJh4ZUoVNzH2OB
MU+kbnijTPwYb5bUKq08ogiJdu98ccfv2usqBFuXliCftfAF0EwlCZHdEbKbzpLg
FxprqStgPesvjNxvsCQ7zXWUwixAKZb0w5qgm9w8brJJSh1zbyg+iKhFa4VGfmj7
cNx612Ikg8aKT2cp60JBLdUqqwFyNnOUFEd/sEGWh9hzMcSe9sXc/D3wZ8WRYit8
uHPSX44d99We5dl3kcv5xmWXHbeR4vwHZVX3Or/xrr+70Hdvmbx7VGLWNJ2SF56Z
kInE9yKa8CNFaxJ+dHznmU+E8ni0vGlrH79VZt3AWPInxlT5aK+8jakdEFJgTJFe
RC1OEixmn6V/t5JgDLB2xoJR87T0isHVRM56ovxkrPl90+tQK/9AhO641te4yoZL
B+FjqlR67UJDyXMacZmp9Y8MDvUDGfqHNe3cTpX2m7KYHMIQs51+foIHOyfkADQa
J3OAw7xHs4rLEQJeNrQ3wjubIDu3Nrrpbka9p1hhL9vVWVGq0hE=
=H+zI
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--


