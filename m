Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90A419099
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 10:16:41 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUloV-0005Ox-NV
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 04:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mUlmr-0004hE-Sp
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:14:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mUlmo-0006hU-4U
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632730492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JjdMNRTvrPcY/yU4BQrYrmHX325Wj4bgrC1G+t0uvY4=;
 b=VlNCJG4fgNFchYiZz0KNHpgowTmJVfwYwTIxESyWUfVvuS5+zoCT76IssUlKVvarljDyky
 dzJ8VNBDek75WBxxNbpZ4dNqKb221ixaGlqH/GDIfcZVDmiDJvb30g3F7y8a0sEYGGL7O3
 eAS6TYu6HnuSjduTEOV40HtaCZWXLQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-H8c9Wq-dPjGozYtrSPx_0A-1; Mon, 27 Sep 2021 04:14:47 -0400
X-MC-Unique: H8c9Wq-dPjGozYtrSPx_0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F1EF804143;
 Mon, 27 Sep 2021 08:14:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CAAD5C1BB;
 Mon, 27 Sep 2021 08:14:37 +0000 (UTC)
Date: Mon, 27 Sep 2021 10:14:35 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Add LoongArch support to RISU?
Message-ID: <YVF9a3eVtpa+r7N5@stefanha-x1.localdomain>
References: <e5d5a725-d2f3-8866-4882-11632adb6f52@amsat.org>
 <28636647-b87d-1e5f-dc54-a56bf27b1ccf@loongson.cn>
 <CAAdtpL73NfnguXd6j+EktFieYiWc3=FqftZ2euwTKRmetm7LVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAdtpL73NfnguXd6j+EktFieYiWc3=FqftZ2euwTKRmetm7LVg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZtLSTCs0FLPWAZjH"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, maobibo <maobibo@loongson.cn>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 WANG Xuerui <git@xen0n.name>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZtLSTCs0FLPWAZjH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 04:35:37PM +0200, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Hi, I meant to include the qemu-devel@ mailing list in Cc but forgot to..=
.
> Doing that now.
>=20
> On Sun, Sep 26, 2021 at 11:25 AM Song Gao <gaosong@loongson.cn> wrote:
> >
> > Hi, Phil
> >
> > On 09/26/2021 04:25 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Hi Xuerui,
> > >
> > > Looking at the script [1] used in your series adding LoongArch TCG
> > > backend [2], I think all the bits are in place to also generate most
> > > of the files required to run RISU [3] and use it to be able to test
> > > Song Gao's LoongArch TCG frontend [4].
> > >
> > > Do you know developers / companies who might be interested in working
> > > on this?
> > >
> > We can do it. Our plan is to complete LoongArch linux-user emulation, s=
ystem emulation , TCG backend and others support.
> > We plan to submit the system emulation code in mid and late October.  X=
ue rui had finished TCG backend. So we may doing this work after system emu=
lation.
> >
> > We welcome others to do the work=EF=BC=81
>=20
> This might be a good project to present to Outreachy internship:
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03970.html
>=20
>  "QEMU will apply for the Outreachy December-March round. This
>   internship program offers paid, full-time, remote work internships for
>   contributing to open source. QEMU can act as an umbrella organization
>   for KVM kernel projects."
>=20
> Stefan, are we past the deadline for submission?

The Outreachy project idea deadline has been extended to September 29th.
QEMU contributors can submit project ideas they would like to mentor
here:
https://www.outreachy.org/communities/cfp/qemu/

Please take a look at this email for more details on designing Outreachy
projects:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03970.html

Thanks,
Stefan

--ZtLSTCs0FLPWAZjH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFRfWsACgkQnKSrs4Gr
c8iYWwf/XzDZcU07Q9I4ti7yp8Le3sxxCQFIsxYZ4a8MuEhfnBa7wpa8vlH7Y63p
lvFWbfnENOoxHtIHMMjwVcvC4nbvWAn76fpFE4KS35BaT3W9JXwCPhqxwCsWVkhK
CiMis4jcmJg1S92rf/qRT30IEqGcdEwGgRQy8xiLuF4yrjLMHKWBEHwYWMTfHacT
rmUe/k9r1oQ3Ugx7Mg0xkSn50Ha2rMy2FYAxL23b5Ml56daTayxsqtTERX1ubD7x
F8FJbXYtw/kb4JrwWCjhkFDZIxeOWNqqQOikAPj5v0+JW6QBt5Ni9wcSirCgaHyb
3pG0rcC5MexL2wGI9GN7Yl4D3kpMAQ==
=CSXq
-----END PGP SIGNATURE-----

--ZtLSTCs0FLPWAZjH--


