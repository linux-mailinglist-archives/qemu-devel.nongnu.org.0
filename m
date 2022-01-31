Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BFB4A4C37
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:34:26 +0100 (CET)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZdJ-0003AW-5W
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:34:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEZF1-0002jP-V9
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:09:24 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEZEz-0005zr-Ld
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:09:19 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-N529x0KHOfu1bYuJOpTiLg-1; Mon, 31 Jan 2022 11:09:12 -0500
X-MC-Unique: N529x0KHOfu1bYuJOpTiLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A232E1083F65;
 Mon, 31 Jan 2022 16:09:11 +0000 (UTC)
Received: from bahia (unknown [10.39.196.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E7D178C14;
 Mon, 31 Jan 2022 16:09:10 +0000 (UTC)
Date: Mon, 31 Jan 2022 17:09:07 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Message-ID: <20220131170907.3a85de94@bahia>
In-Reply-To: <2777753.eeY9lOXx2E@silver>
References: <20220126171136.672657-1-groug@kaod.org>
 <8838481.laWMekmXc4@silver> <20220131154408.4b9fab8e@bahia>
 <2777753.eeY9lOXx2E@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 16:12:45 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 31. Januar 2022 15:44:46 CET Greg Kurz wrote:
> > On Mon, 31 Jan 2022 13:37:23 +0100
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Montag, 31. Januar 2022 08:35:24 CET Greg Kurz wrote:
> > > > > > > diff --git a/tests/qtest/libqos/virtio-9p.c
> > > > > > > b/tests/qtest/libqos/virtio-9p.c index ef96ef006adc..0a0d0d16=
709b
> > > > > > > 100644
> > > > > > > --- a/tests/qtest/libqos/virtio-9p.c
> > > > > > > +++ b/tests/qtest/libqos/virtio-9p.c
> > > > > > > @@ -40,14 +40,13 @@ static char *concat_path(const char* a, c=
onst
> > > > > > > char* b)
> > > > > > >=20
> > > > > > >  void virtio_9p_create_local_test_dir(void)
> > > > > > >  {
> > > > > > > =20
> > > > > > >      struct stat st;
> > > > > > >=20
> > > > > > > -    char *pwd =3D g_get_current_dir();
> > > > > > > -    char *template =3D concat_path(pwd, "qtest-9p-local-XXXX=
XX");
> > > > > > > +    g_autofree char *pwd =3D g_get_current_dir();
> > > > > > > +    g_autofree char *template =3D concat_path(pwd,
> > > > > > > "qtest-9p-local-XXXXXX");
> > > > > > >=20
> > > > > > >      local_test_path =3D mkdtemp(template);
> > > > >=20
> > > > > ... mkdtemp() does not allocate a new buffer, it just modifies th=
e
> > > > > character array passed, i.e. the address returned by mkdtemp() eq=
uals
> > > > > the
> > > > > address of variable 'template', and when
> > > > > virtio_9p_create_local_test_dir() scope is left, the global varia=
ble
> > > > > 'local_test_path' would then point to freed memory.
> > > >=20
> > > > I hate global variables ;-) and the 'Returned result must be freed'
> > > > comment
> > > > in 'concat_path()' is slightly misleading in this respect.
> > >=20
> > > About the global variable: sure, I am not happy about it either. What=
 I
> > > disliked even more is that virtio_9p_create_local_test_dir() is calle=
d
> > > from a constructor, but as I described in [1] I did not find a realia=
ble
> > > alternative. If somebody comes up with a working and reliable, clean
> > > alternative, very much appreciated!
> >=20
> > An alternative might be to create/remove the test directory when
> > a virtio-9p device is started/destroyed, and keeping the string
> > under the QVirtio9p structure.=20
>=20
> Yeah, I tried that already. Keep in mind it not only has to work sometime=
s, it=20
> has to work reliably, always, for everybody and commit history shows that=
 this=20
> can be more hairy than one might think and observe.
>=20

Yeah it is more hairy... the temp directory must be created before the devi=
ce.
We could maybe get rid of the constructor by creating the temp direcotry in
assign_9p_local_driver() since this is the first user. Then we still need
the destructor to do final cleanup.

> > The most notable effect would be
> > to have a new directory for each individual test instead of
> > all the lifetime of qos-test, but it doesn't hurt. I'll have a look.
>=20
> I'd like to avoid just converting one compromise into another one.
>=20
> If I had to choose between fixing a purely theoretical issue of getting r=
id of=20
> a global variable, or introducing a real-life issue in form of numerous n=
ew=20
> test dirs popping up on toplevel, I rather stick to the former. We alread=
y=20
> have enough test dirs popping up on toplevel IMO.
>=20
> A truly clean solution for this would be the introduction of setup/teardo=
wn=20
> callback pairs in libqos, like it is standard in other test suites. No pl=
ans=20
> on my side for spending coding time on that in near future though. My rev=
iew=20
> time for patches on that being assured though.
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


