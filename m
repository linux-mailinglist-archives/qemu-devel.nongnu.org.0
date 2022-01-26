Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C806C49CED8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:47:08 +0100 (CET)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkVn-00077R-V2
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:47:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCkSu-0005Sk-Cm
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCkSq-0004fe-Lx
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643211843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtsUtRXRY1Mguuvbysl8P+huoQAa2yL74QvhwBgfp9Y=;
 b=bvULJzvwOCqTr92g2JLAMx9tE+Ne2kUiTtaBC65qbo49Zk8NSuI+8uwxmaxxkwBhA+wA6U
 DLRwBe2zLMNq4y+cwE48TbzkZ4iDWv1B9GXmXi+Z2+7fqtC2tyfyxE4Je0Do+X26hEVVxH
 ySiH7BQOvRREjjZqKKYqBc1nbkXg2z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-3as7lXNANBuzFTvaOq__Xw-1; Wed, 26 Jan 2022 10:44:00 -0500
X-MC-Unique: 3as7lXNANBuzFTvaOq__Xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6574C108088A;
 Wed, 26 Jan 2022 15:43:58 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A98C970D35;
 Wed, 26 Jan 2022 15:43:26 +0000 (UTC)
Date: Wed, 26 Jan 2022 15:43:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Message-ID: <YfFsHf6ITJdvimZD@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <fa3282607f7fed7736bfdf3c1ae9f7fce466ed44.1642626515.git.jag.raman@oracle.com>
 <Ye/Rz1bHJN2m9vCo@stefanha-x1.localdomain>
 <A037BABE-9424-4EBF-A1E2-F712DC8A89CC@oracle.com>
 <YfEV0kh8uyy3MU8V@stefanha-x1.localdomain>
 <5447E2D7-5AAB-466B-9108-A903AEB51529@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t7RtoQztHHfqyjG0"
Content-Disposition: inline
In-Reply-To: <5447E2D7-5AAB-466B-9108-A903AEB51529@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--t7RtoQztHHfqyjG0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 03:20:35PM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 26, 2022, at 4:35 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Tue, Jan 25, 2022 at 06:12:48PM +0000, Jag Raman wrote:
> >>=20
> >>=20
> >>> On Jan 25, 2022, at 5:32 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>>=20
> >>> On Wed, Jan 19, 2022 at 04:41:55PM -0500, Jagannathan Raman wrote:
> >>>> Allow hotplugging of PCI(e) devices to remote machine
> >>>>=20
> >>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >>>> ---
> >>>> hw/remote/machine.c | 29 +++++++++++++++++++++++++++++
> >>>> 1 file changed, 29 insertions(+)
> >>>=20
> >>> Why is this code necessary? I expected the default hotplug behavior to
> >>=20
> >> I just discovered that TYPE_REMOTE_MACHINE wasn't setting up a hotplug
> >> handler for the root PCI bus.
> >>=20
> >> Looks like, some of the machines don=E2=80=99t support hotplugging PCI=
 devices. I see
> >> that the =E2=80=98pc=E2=80=99 machine does support hotplug, whereas =
=E2=80=98q35=E2=80=99 does not.
> >=20
> > Hotplug is definitely possible with q35. I'm not familiar with the
> > hotplug code though so I don't know how exactly that works for q35.
>=20
> I was referring to the root PCI bus, other buses in Q35 probably support
> hotplug. Please see error message below:
>=20
> QEMU 6.2.50 monitor - type 'help' for more information
> (qemu) device_add lsi53c895a,id=3Dlsi2
> Error: Bus 'pcie.0' does not support hotplugging

Yes, I think that's because it's PCIe and not PCI.

Stefan

--t7RtoQztHHfqyjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxbB0ACgkQnKSrs4Gr
c8jPxAf/W6hVS/E58n9+0EjKaouPy5M2kTP1L/FGu+e0OgAmz7OJFDuL0BWoOrVm
bJGfNacJHy0kHu7s0jrK30lAFFIpK1XlREdExtOjrUKMek233k6scJ/z19eOPmdC
Xlqq+XYbOx5vzYXA/LKgZzjx88EJc5t/nktOsmk+exn6HFzpT/6RM781EM9VXuDJ
aewdsa/jPzgwKf/HWN8Oul8fmYLCBDM5ZZ80mHKUTbJ5KQLrN5qi/yDxn25QqIcN
Zc/TmETVst2AHMD1Z/I8MnzOL8RL8cKINX81ZhZBSHTiGTMSc6KiEW4mdUIU/5KZ
pY0lAwQh4IkXu6FVP/2qJbUYHTBlIw==
=5rk+
-----END PGP SIGNATURE-----

--t7RtoQztHHfqyjG0--


