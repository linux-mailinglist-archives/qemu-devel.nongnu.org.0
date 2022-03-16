Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3E4DB55F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:53:20 +0100 (CET)
Received: from localhost ([::1]:53560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUVxe-0005D1-Hc
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:53:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUVwB-0004R2-Me
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUVw7-0004p5-9g
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647445901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDz64sdmcRN0ZJCFjzSef037uJKP2C35Pv2PO/Vzf3c=;
 b=cSXV/XL26WnBqGsvWAofeyoIYIAqaFz64sM0aJHgBZoscO6SeltCNHVbHmFIxYe/QGEinf
 TfGWT265pV1t5jndYi+urrcug+exbxaczCdjsnoqkWnI0oHMVBYQURbAbzeJjtnnOYfYij
 W/74UEUt4XKO6nZHHk0cw9812+7tiHo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-iqAyelMZP8mm7dSWEYZbpw-1; Wed, 16 Mar 2022 11:51:39 -0400
X-MC-Unique: iqAyelMZP8mm7dSWEYZbpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6021C0D100;
 Wed, 16 Mar 2022 15:51:39 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E937F40FF40B;
 Wed, 16 Mar 2022 15:51:38 +0000 (UTC)
Date: Wed, 16 Mar 2022 15:51:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 3/6] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
Message-ID: <YjIHhP7WlXyZ9gJm@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-4-xieyongji@bytedance.com>
 <YjBg3QnSnpY2cAdL@stefanha-x1.localdomain>
 <CACycT3s7cgHBAqmpy=RZPwPZz4uptr0REzJ9fhM1qv+G_miS1Q@mail.gmail.com>
 <YjHl66pJYw45oKL9@stefanha-x1.localdomain>
 <CACycT3vpQsLG7oxeTHMs3w1qdO7fGJnjGiORfm=t1U2ehgD+bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O7EhSDJNkOM9lko+"
Content-Disposition: inline
In-Reply-To: <CACycT3vpQsLG7oxeTHMs3w1qdO7fGJnjGiORfm=t1U2ehgD+bw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--O7EhSDJNkOM9lko+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 09:49:19PM +0800, Yongji Xie wrote:
> On Wed, Mar 16, 2022 at 9:28 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Mar 15, 2022 at 07:38:12PM +0800, Yongji Xie wrote:
> > > On Tue, Mar 15, 2022 at 5:48 PM Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> > > >
> > > > On Tue, Feb 15, 2022 at 06:59:40PM +0800, Xie Yongji wrote:
> > > > > VDUSE [1] is a linux framework that makes it possible to implement
> > > > > software-emulated vDPA devices in userspace. This adds a library
> > > > > as a subproject to help implementing VDUSE backends in QEMU.
> > > > >
> > > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.ht=
ml
> > > > >
> > > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > > ---
> > > > >  meson.build                                 |   15 +
> > > > >  meson_options.txt                           |    2 +
> > > > >  scripts/meson-buildoptions.sh               |    3 +
> > > > >  subprojects/libvduse/include/atomic.h       |    1 +
> > > > >  subprojects/libvduse/libvduse.c             | 1152 +++++++++++++=
++++++
> > > > >  subprojects/libvduse/libvduse.h             |  225 ++++
> > > > >  subprojects/libvduse/linux-headers/linux    |    1 +
> > > > >  subprojects/libvduse/meson.build            |   10 +
> > > > >  subprojects/libvduse/standard-headers/linux |    1 +
> > > > >  9 files changed, 1410 insertions(+)
> > > > >  create mode 120000 subprojects/libvduse/include/atomic.h
> > > > >  create mode 100644 subprojects/libvduse/libvduse.c
> > > > >  create mode 100644 subprojects/libvduse/libvduse.h
> > > > >  create mode 120000 subprojects/libvduse/linux-headers/linux
> > > > >  create mode 100644 subprojects/libvduse/meson.build
> > > > >  create mode 120000 subprojects/libvduse/standard-headers/linux
> > > >
> > > > Please update the ./MAINTAINERS file when adding new source files.
> > >
> > > OK, sure. And would you mind being one of the maintainers since I'm
> > > not sure if I can do this job well.
> >
> > You're welcome to become the maintainer. It means that you will be CCed
> > on patches affecting this code and sometimes people might send you
> > questions about VDUSE exports.
> >
>=20
> I see. I will try my best.
>=20
> > Is the issue lack of time?
> >
>=20
> I think the time is enough. But since I have no experience, I'm not
> sure if I can do this well.

Great! Don't worry there will probably not be much you need to do.

If someone submits a patch they'll CC you and you can post your
"Reviewed-by:". Kevin or I can pick up the patches you've reviewed and
send them with our pull requests to the qemu.git maintainer.

Stefan

--O7EhSDJNkOM9lko+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIyB4QACgkQnKSrs4Gr
c8irxQgAjdC7jHgW01bu5TLqScm9OMdlwGVkTQ5YUrqgWi1bRp023VSSB9pj1Kel
gi6ms6qBHQbPRdCtCX/59U8asWTMkf6TIlUYb4Ty6HpcUlLKHSQNv3GqgStDr9Vx
isCrg28U9vo+orcIN3L5JgqltNfVIEFEG5f5EVXbZ0GA0TDoLF/9VMh3wXXAEYiO
Md+Bd7MVAhsjDMVK7Z7MHGi4jySDW1IYo0wJ4lT30AqIWIZwyKesUDfNQzPrtTgD
9aUdQx2dyBS8Qc69INWdVgvp/KCBhAVU6OfrQZz71pyPz2T1QcF8xpq27J2fmdbG
yPPB0OuPquXvgGIiOzsGE/1x0AMQkg==
=ucqH
-----END PGP SIGNATURE-----

--O7EhSDJNkOM9lko+--


