Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCA4C880C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:33:44 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyt5-00038V-Gf
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:33:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyfn-0007hg-2s
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:19:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyfl-0000Sr-JC
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646126395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bxUd7EwihLEmRaKwTZiiml116y2xnB0+yCwu4V8SLgc=;
 b=TE8prRu7tRdB0pVrXZh4LEht1W0v+g3jlbgntdp68OoUA3xdCePJR/wZcV4ZtBtA0n4xaU
 g40ovR1Vl22Ku0PVOY2BD28Mkm06Bq67areDbCUIpvfUPkpICQkWW6+mE47kbEMsadyHtX
 5JzcXwC3f/CY69fS44kvRIMnnR3I7zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-Gldr1pRONMCwIMC4fjECtQ-1; Tue, 01 Mar 2022 04:19:52 -0500
X-MC-Unique: Gldr1pRONMCwIMC4fjECtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D291006AA6;
 Tue,  1 Mar 2022 09:19:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5760283187;
 Tue,  1 Mar 2022 09:19:20 +0000 (UTC)
Date: Tue, 1 Mar 2022 09:19:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
Message-ID: <Yh3lF4HZ0CMnoXsC@stefanha-x1.localdomain>
References: <87ee3q3mos.fsf@linaro.org> <87a6ee3l5e.fsf@linaro.org>
 <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain>
 <87mtiblzsc.fsf@linaro.org>
 <CAFEAcA8UzTJ7tze8mWdK_aO_vrnnXeUu6YjLDiiBJj-9v3_huw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QfY97QAp+9vhmUSk"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8UzTJ7tze8mWdK_aO_vrnnXeUu6YjLDiiBJj-9v3_huw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QfY97QAp+9vhmUSk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 04:44:47PM +0000, Peter Maydell wrote:
> On Mon, 28 Feb 2022 at 16:32, Alex Benn=E9e <alex.bennee@linaro.org> wrot=
e:
> > Stefan Hajnoczi <stefanha@redhat.com> writes:
> > > On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=E9e wrote:
> > >> (aside: this continues my QOM confusion about when things should be =
in a
> > >> class or instance init, up until this point I hadn't needed it in my
> > >> stub).
> > >
> > > Class init is a one-time per-class initializer function. It is mostly
> > > used for setting up callbacks/overridden methods from the base class.
> > >
> > > Instance init is like an object constructor in object-oriented
> > > programming.
> >
> > I phrased my statement poorly. What I meant to say is I sometimes find
> > QEMUs approach to using class over instance initialisation inconsistent.
> > I think I understand the "policy" as use class init until there is a
> > case where you can't (e.g. having individual control of each instance of
> > a device).
>=20
> Do you have examples of inconsistency? (I'm sure there are some,
> we're inconsistent about almost everything...)

Phew, at least we're inconsistent about being inconsistent. If we were
inconsistent about absolutely everything that just wouldn't do!

Stefan

--QfY97QAp+9vhmUSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmId5RcACgkQnKSrs4Gr
c8geoAf9EAWATg3KKfE8+JK9Phfp09QStlZK+BRGFYalN/YNEeMsvmNheLyL2vnS
swpr8jaTnoCnjimPEVjVFSktBEHle3O2DFtZrzc1px6n1H7VkT8Rgv5BqpKtx2+2
yJcn+hGMks7pXfEIWOEK+IPdcbelKdgTqydh0QYD/nzPnL54Cg18dxL14VVmDlM0
OhuYi1vB+es3fy9BR4YGi69DANMLKQbKPWtccRc+e60fxN1VxJ95FtUD7tp2YtoF
ZrpED5lyy1e/yC8g42cLsHgYlVHVI2+409k+FWmI5mnqfmgljAM+fP4Huuv+uVGG
9XLcJrBE7ePqk6gP2glfidXhjHtkfw==
=MA4A
-----END PGP SIGNATURE-----

--QfY97QAp+9vhmUSk--


