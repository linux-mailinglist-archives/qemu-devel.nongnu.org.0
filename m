Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A462513160
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:37:14 +0200 (CEST)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1WJ-0004Rt-Dy
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk0qj-0003Az-Uh
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk0qh-0000wf-DA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7iOsTmrQzAZtkAHffbv7E1Rw0JJHCLU+cXjJIoc5X4=;
 b=FJ3aSGMpONheXnwiQ0uEE9Z1vPWy1YsBTriYOjgC82gl8/4XufUj5Bi/Z2fZQu66KWs57W
 iO6Nb8XpvYEsZJzd0WRadrJIpPA6DmaJVobK27PpM5vL5vSMafM86Xfofme6XpYU/XM76v
 AQHZ8cFwevX9vyVQHTZzhvDT+Bo0OKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-wWjvwMRXN6Wx1YEnCfCG_g-1; Thu, 28 Apr 2022 05:54:07 -0400
X-MC-Unique: wWjvwMRXN6Wx1YEnCfCG_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 386B5811E76;
 Thu, 28 Apr 2022 09:54:06 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE0644644F8;
 Thu, 28 Apr 2022 09:54:05 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:54:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v8 15/17] vfio-user: handle device interrupts
Message-ID: <YmpkPIlq/V4rXSWj@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <847e6d373eb3d8ff4cdeb7a3ad9b935785bfbf8e.1650379269.git.jag.raman@oracle.com>
 <YmZ3nAtyjt+gjqvL@stefanha-x1.localdomain>
 <0C1A24F0-A2F5-4B08-A015-92CBAA003497@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="et4GvKLovRMPuC0E"
Content-Disposition: inline
In-Reply-To: <0C1A24F0-A2F5-4B08-A015-92CBAA003497@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--et4GvKLovRMPuC0E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 05:40:01PM +0000, Jag Raman wrote:
> > On Apr 25, 2022, at 6:27 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Tue, Apr 19, 2022 at 04:44:20PM -0400, Jagannathan Raman wrote:
> >> +static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
> >> +                                             unsigned int vector)
> >> +{
> >> +    MSIMessage msg;
> >> +
> >> +    msg.address =3D 0;
> >> +    msg.data =3D vector;
> >> +
> >> +    return msg;
> >> +}
> >> +
> >> +static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
> >> +{
> >> +    vfu_ctx_t *vfu_ctx =3D pci_dev->irq_opaque;
> >> +
> >> +    vfu_irq_trigger(vfu_ctx, msg.data);
> >> +}
> >=20
> > Why did you switch to vfu_object_msi_prepare_msg() +
> > vfu_object_msi_trigger() in this revision?
>=20
> We previously did not do this switch because the server didn=E2=80=99t ge=
t updates
> to the MSIx table & PBA.
>=20
> The latest client version (which is not part of this series) forwards acc=
esses
> to the MSIx table & PBA over to the server. It also reads the PBA set by =
the
> server. These change make it possible for the server to make this switch.

Interesting. That's different from kernel VFIO. Before vfio-user commits
to a new approach it would be worth checking with Alex that he agrees
with the design.

I remember sending an email asking about why VFIO MSI-X PBA does not
offer the full semantics described in the PCIe spec but didn't get a
response from Alex (Message-Id:
YkMWp0lUJAHhivJA@stefanha-x1.localdomain).

Stefan

--et4GvKLovRMPuC0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqZDwACgkQnKSrs4Gr
c8ibfAgAijeNKln9UkDD/Eq+PSuEFcjeLiVFYjcHJIN30VCJiAlqvSyeojgLwQCm
rUELJEA7H5CIq8vAscQThDGU8RPGYUGi1y2nkNxl7ZCxxxVG6zlXsRFffYs5aBW8
XL2SOtMfCxi6W1YvNNHR+GHv7L/30nDfWanJxGu8ZzE1OlTTftnNiPl7AaPiDhBd
zdB2z3yI0sZ3QuACV9pSyGBTG79mkV1JcmslAH7JKuO3uf2oG0TeMJhQ0CW77uhK
5fyARD2F1mOu/zxOWB5oCFAiiG50LywmFeCloeuGmxsWrnJT90uE8AeFoVCHtUAU
0ZLBHQliOAiNQtWN7gyX5mjq5nqaXw==
=G+gJ
-----END PGP SIGNATURE-----

--et4GvKLovRMPuC0E--


