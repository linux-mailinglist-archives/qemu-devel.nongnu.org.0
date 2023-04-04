Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9379D6D6E88
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 23:00:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjnkB-0002lg-CN; Tue, 04 Apr 2023 16:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjnk8-0002lY-5U
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjnk6-0000Iz-Ga
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680641940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IpeHYjjM+cHO003wVJZp6AvXauDnch621sJXiCnomWI=;
 b=hI06mZk3vmLA+AjQm2e/RY2h2fhVYoDy7OrJUJcoj2tNY2fo4Kz2yqE2GjviRC2cEFdqjZ
 XO5R473r9s0CqscGW+XOIUHysa6yqjfLcSHYKnWqq/WN952V2XDeWFEAdrcdZYC5q7KBTL
 lN2fQSFnE8zhCNjCpx6aYwZnqfNdXHs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-YFDuTrO6PfOhNsjJLb5qeQ-1; Tue, 04 Apr 2023 16:58:58 -0400
X-MC-Unique: YFDuTrO6PfOhNsjJLb5qeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7AF61C07588;
 Tue,  4 Apr 2023 20:58:57 +0000 (UTC)
Received: from localhost (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C558C1121314;
 Tue,  4 Apr 2023 20:58:56 +0000 (UTC)
Date: Tue, 4 Apr 2023 16:58:55 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 dmitry.fomichev@wdc.com, kvm@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v9 0/5] Add zoned storage emulation to virtio-blk driver
Message-ID: <20230404205855.GA603232@fedora>
References: <20230327144553.4315-1-faithilikerun@gmail.com>
 <20230329005755-mutt-send-email-mst@kernel.org>
 <CAJSP0QW1FFYYMbwSdG94SvotMe_ER_4Dxe5e+2FAcQMWaJ3ucA@mail.gmail.com>
 <CAAAx-8J72fiVpOqeK71t8uNiyJLR2DowzGouk_H3oFRF_czc+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fW0CvyF0IbPpbDQ9"
Content-Disposition: inline
In-Reply-To: <CAAAx-8J72fiVpOqeK71t8uNiyJLR2DowzGouk_H3oFRF_czc+w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--fW0CvyF0IbPpbDQ9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:46:13PM +0800, Sam Li wrote:
> Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=883=E6=
=97=A5=E5=91=A8=E4=B8=80 20:18=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 29 Mar 2023 at 01:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Mar 27, 2023 at 10:45:48PM +0800, Sam Li wrote:
> > >
> > > virtio bits look ok.
> > >
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > merge through block layer tree I'm guessing?
> >
> > Sounds good. Thank you!
>=20
> Hi Stefan,
>=20
> I've sent the v8 zone append write to the list where I move the wps
> field to BlockDriverState. It will make a small change the emulation
> code, which is in hw/block/virtio-blk.c of [2/5] virtio-blk: add zoned
> storage emulation for zoned devices:
> - if (BDRV_ZT_IS_CONV(bs->bl.wps->wp[index])) {
> + if (BDRV_ZT_IS_CONV(bs->wps->wp[index])) {
>=20
> Please let me know if you prefer a new version or not.

Yes, please.

Stefan

--fW0CvyF0IbPpbDQ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQsj48ACgkQnKSrs4Gr
c8jf9wf/ZbIleajKT16bSiErnJiYuXtdB0QGGK9VqtTV8YwbrhGb8i4w99+OVq9/
x/sBOA7MF+l06Oj6D6eB2PbQ69yEIVqJThvLVPutz02pyWQkxcOBYPRyLX/CxF7C
3cki8X3r3+0tE9ZiZWoMS4M4W2x4R22gKa1NLRCUIfRiBuiCDr3ZaBLJcemvha1F
AKbQOA9uG6triqtaqc9iPAsTSr3WePY+HtZye6bSlnPz4CxM92l9in2V1hfK6WrP
iCjYAcr/Nlyd4gjrsO1NQhY1i8n+WYMrMHV9NI2Sz3FH76nP++yKNxDq+phBISeA
QM+0otZRbS1TRquem20HtqmyyQl7MA==
=FD9+
-----END PGP SIGNATURE-----

--fW0CvyF0IbPpbDQ9--


