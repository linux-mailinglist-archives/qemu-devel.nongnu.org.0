Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE453A6DA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:56:23 +0200 (CEST)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOph-0005zg-B9
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nwOn8-0005Hl-Ry
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:53:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nwOn5-0004wJ-Uz
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654091618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xufGZKrJO5lHuFG9zFX1MVIZLTEMjX9N1PfF3c0L1h0=;
 b=ihf8LFYt+31KZAZ/r/geNglAQSsed75AqXUDkugZV2S335icpoZ4CBWAVAtyFYdhuZKEc+
 O5BnU0W/UEP0CYccL0lcvC69awwh87c7xniAInK0lObiT3Hq3iSPehSyKr3dF2S9R1Vgik
 JR8KYbLZrjdJF3bMZ6MGopUz3tWbYUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-ff2MilhCNnevOHrXEInm8g-1; Wed, 01 Jun 2022 09:53:36 -0400
X-MC-Unique: ff2MilhCNnevOHrXEInm8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06B03185A7BA
 for <qemu-devel@nongnu.org>; Wed,  1 Jun 2022 13:53:36 +0000 (UTC)
Received: from localhost (unknown [10.40.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9517610725;
 Wed,  1 Jun 2022 13:53:35 +0000 (UTC)
Date: Wed, 1 Jun 2022 15:53:34 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220601135334.sp23ow5qo22uja2a@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <87r150dugw.fsf@pond.sub.org>
 <20220518085548.gri7ojvp5ezrstsj@tapioca>
 <87mtffm3ak.fsf@pond.sub.org>
 <CABJz62Oi4Yq3n8Mf4uikycD_BZrDhCj8zG1pFVNhv+N2-Q8naw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vhf6svftzd2krdfv"
Content-Disposition: inline
In-Reply-To: <CABJz62Oi4Yq3n8Mf4uikycD_BZrDhCj8zG1pFVNhv+N2-Q8naw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--vhf6svftzd2krdfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 25, 2022 at 08:49:19AM -0500, Andrea Bolognani wrote:
> On Wed, May 18, 2022 at 02:30:11PM +0200, Markus Armbruster wrote:
> > Victor Toso <victortoso@redhat.com> writes:
> > > IMHO, at this moment, qapi-go is targeting communicating with
> > > QEMU and handling multiple QEMU versions seems reasonable to me.
> >
> > It's targeting communicating in *QMP*.  QMP is designed to support
> > communicating with a range of QEMU versions.  Full compatibility is
> > promised for a narrow range.  Outside that range, graceful degradation.
> >
> > *If* you want to widen the full compatibility range, do it in *QMP*.  Or
> > do it on top of QEMU, e.g. in libvirt.
> >
> > > Perhaps libvirt can use qapi-go in the future or other generated
> > > interface. That would be cool.
> >
> > "Would be cool" and a dollar buys you a cup of bad coffee.
> >
> > Is it a good use of our limited resources?
> >
> > How much will it delay delivery of Go bindings compared to less
> > ambitious version?
>=20
> Yeah, this thread has basically branched to cover three topics:
>=20
>   1. what an MVP Go interface for QMP should look like;
>   2. how to make sure said interface uses pretty names;
>   3. how to make it work across multiple QEMU versions.
>=20
> All of these are important in the long run, but as far as I'm
> concerned only 1. is an actual blocker to making progress.

I agree although (1) and (3) are holding hands a bit.

> If we get to the point where we can generate a reasonably
> complete and well-typed Go interface that can be used to
> communicate with a single version of QEMU, we should just
> plaster EXPERIMENTAL all over it and get it merged.
>=20
> Basically get the MVP done and then iterate over it in-tree
> rather than trying to get everything perfect from the start.
>
> Sounds reasonable?

Yep. The whole discussion has been great as to clarify
limitations and possible goals but not aiming to get it perfect
all at once seems reasonable.

Cheers,
Victor

--vhf6svftzd2krdfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmKXb10ACgkQl9kSPeN6
SE+7EQ//S1OZ0X6xefZZijs+why1d1f8UtIZp37Lm0972hA+w/+h8bW2EJj+3/lk
v8a0bWREcAkIpZGD5wP5T4XPgTmGf7Rt9nBPFFtwJODE6DzqHVWJRyR6i9GoYikv
Olm5DCCsOPJSUS2eb+fznoVimFdDBwD7dve3uSyPN7S7HuSkWzLBWdFj8qUHO7yZ
jBOCbHT68BicWtvjvVssyirgisMCNgvsY5uARIvF/xSx4ugsM2BCKKW+KJbQrOd/
9eNdYQTycYwNPIJBbNjjnpl8pVm/vD13OYUsdLmAo76pjYIPJspmThuvSzmio3NF
pxxz/bnjoFICHx/OtWygILI3TAvMImkEKMuvZYsiLOi5wWLK5Jg4EhBH2pPwKGvM
WC3hud2JYPBmNoXRQ2a6pl2gkEm6bsEfTD4vmM4bRyDt9UYBu/iHJVB/er5lC4OV
tYTvLZ2bPYgR/QYADGCco70hAdl4qVqL2Z+g+Vv+axv5aSZMrGYqG+CpXMgXxFi3
qAPQvu9larglh27OpQsI8Bmy3eeQSkQC8pE1p39M5Ge+QSlPJNGC3sRlu9xSBsMp
aWcU33+ZeNLCntwAUJjcet/2t+3dV7EUOW135nd4fn15qcyRcjrwoOUFLTKFi5DF
e2654JVkhqQc1ouNYHI1wby262JSyvj8SjnncCeXOdXy6XAd01M=
=ISjq
-----END PGP SIGNATURE-----

--vhf6svftzd2krdfv--


