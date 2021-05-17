Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8454382DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:46:47 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lida2-0000Kf-UZ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lidYB-0007fN-QO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:44:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lidY8-0003Hi-Nb
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621259087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+rY4jUh07JqLStuEzjkBGNp9KDX5a9lVKnKzvac7y4=;
 b=JGumMcgV4tL5wYwwqjxcASaICbS0Q/wDLlpNCBokgPeOyyDUPJbk8seDwJMJiNz0qatLEF
 w22DECbC4NYggVySoKzWoYybzHmTiY5Zbbg+4kq8gea1IJv+QSDmOPhi2h8C5RZQTuBxtJ
 ZfUOC+wzi4eaHwyfgBD9yMl8Id809i4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-BN6j-rONO2OVtZQS1OW3GQ-1; Mon, 17 May 2021 09:44:42 -0400
X-MC-Unique: BN6j-rONO2OVtZQS1OW3GQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E888195D596;
 Mon, 17 May 2021 13:44:20 +0000 (UTC)
Received: from localhost (ovpn-114-183.ams2.redhat.com [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2004E5C541;
 Mon, 17 May 2021 13:44:01 +0000 (UTC)
Date: Mon, 17 May 2021 14:44:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 5/7] docs: mark intention to deprecate TCG tracing
 functionality
Message-ID: <YKJzICDS4n5UMohG@stefanha-x1.localdomain>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
 <20210505092259.8202-6-alex.bennee@linaro.org>
 <YJJmYOWDl0UzziW7@redhat.com> <87lf8to49d.fsf@linaro.org>
 <87im3xo3zv.fsf@linaro.org> <YJJ41bUEY+Gfkw/Z@redhat.com>
 <87eee5eiua.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87eee5eiua.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sf5GUTCFIC/MYxsY"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--sf5GUTCFIC/MYxsY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 11:47:11AM +0100, Alex Benn=E9e wrote:
>=20
> Daniel P. Berrang=E9 <berrange@redhat.com> writes:
>=20
> > On Wed, May 05, 2021 at 11:41:46AM +0100, Alex Benn=E9e wrote:
> >>=20
> >> Alex Benn=E9e <alex.bennee@linaro.org> writes:
> >>=20
> >> > Daniel P. Berrang=E9 <berrange@redhat.com> writes:
> >> >
> >> >> On Wed, May 05, 2021 at 10:22:57AM +0100, Alex Benn=E9e wrote:
> >> <snip>
> >> >>> +TCG introspection features
> >> >>> +--------------------------
> >> >>> +
> >> >>> +TCG trace-events (since 6.1)
> >> >>> +''''''''''''''''''''''''''''
> >> >>> +
> >> >>> +The ability to add new TCG trace points has bit rotted and as the
> >> >>
> >> >> When you say this "has bit rotted", just how bad is the situation ?
> >> >>
> >> >> Is the TCG tracing still usable at all, or is is fully broken
> >> >> already ?
> >> >
> >> > Well patches 6/7 got it working for generic TCG things. I haven't be=
en
> >> > able to get the architecture one working but I suspect that is some =
sort
> >> > of interaction between the per-arch trace header generation that I
> >> > haven't quite figured out yet.
> >>=20
> >> Ahh it's since 7609ffb919 (trace: fix tcg tracing build breakage) whic=
h
> >> limited tcg/vcpu events to the root trace-events file.
> >
> > That commit is from release 2.10.0.
> >
> > The other commit mentioned in patch 6 (73ff061032) is from 2.12.0.
> >
> > So no one has been able to use this feature for 3+ years already.
> >
> > Is it actually worth fixing and then deprecating for 2 releases before
> > deleting, as opposed to just deleting the broken code today on basis
> > that it can't have any current users ?
>=20
> Well I can get it up and running with the aforementioned patches and it
> seems reasonable to give some notice. I'm happy to defer to Stefan here
> though as it's his sub-system.

Llu=EDs Vilanova was the author and probably main user. He mentioned he's
been away from QEMU for a while.

If you want to drop the feature, I think that's fine since it has
already been broken for over 3 years. If someone wants it back then it
can be added via TCG plugins in the future.

Stefan

--sf5GUTCFIC/MYxsY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCicyAACgkQnKSrs4Gr
c8h1RggAtr4tOB3Lv7duWbsdVnNHEF9uQJ1gu/eLbI0ys8f4hxVpSbFLWljGBcEp
eUm3RzZ67jyS030unMOOyVQvkEU7QNOg0b4qRUC1cZryIqm4ywMSL6xXteZRWYtG
TpEncrwnthPE2DGcHLgs56QxyjJD29Bg+3OtFF2FJ3ngRbYxWWn+ITH2j5ujcCaR
nM4oB2hZxQPXE+W2TqnKONqATs6dv9eyIt7K4GDz/+WtAjanrq5Gfe7R+i7SOw0l
XogXR9Eq/1kr7gw4O5/RVmAF/i/bUPI1noB7GR6I1H0IIo90D+6hu+eWILjxEOFO
OeJo+jsrXIz9k71uJAx8bg+TYn6dvg==
=J1Nn
-----END PGP SIGNATURE-----

--sf5GUTCFIC/MYxsY--


