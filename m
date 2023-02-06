Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D968C7B0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 21:33:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP89X-000432-M0; Mon, 06 Feb 2023 15:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pP89B-00040B-Ot
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pP88z-0007Ql-6r
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675715475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFdIpgmAwpfcXEOydBlK52bmHB7J2KfhGxQCUIvxggo=;
 b=EHAeuD42QEtNitO6gq9mSfvxXzwGegKuwZofxowW+RU9cgd61N2dy0grD6Bl8u9jdbJTxj
 izY4WHOyusoumqA4gmLf33Ay0KzIKv53GW8fNB63Tg6EppI5RstyY4nsC5GU1ynqPdBcas
 zdKtjNMsJpGPGxBXtRuOoc+GErBnFQM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-TRZS4sovOd6sllyXQveuww-1; Mon, 06 Feb 2023 15:31:13 -0500
X-MC-Unique: TRZS4sovOd6sllyXQveuww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB242A59577;
 Mon,  6 Feb 2023 20:31:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C28E62026D37;
 Mon,  6 Feb 2023 20:31:12 +0000 (UTC)
Date: Mon, 6 Feb 2023 15:31:11 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Michal =?iso-8859-1?B?UHLtdm96bu1r?= <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC 0/3] virtio-blk: add iothread-vq-mapping parameter
Message-ID: <Y+Fjj8xKILkqNhrz@fedora>
References: <20230118194732.1258208-1-stefanha@redhat.com>
 <8291c176-b868-c0e9-af59-0827c6c46807@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z+eUWc+C+W/oEGVr"
Content-Disposition: inline
In-Reply-To: <8291c176-b868-c0e9-af59-0827c6c46807@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--Z+eUWc+C+W/oEGVr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 03:11:21PM +0100, Michal Pr=EDvozn=EDk wrote:
> On 1/18/23 20:47, Stefan Hajnoczi wrote:
> > This is a preview of the iothread-vq-mapping parameter that assigns vir=
tqueues
> > to IOThreads. The syntax is implemented but multiple IOThreads are not =
actually
> > supported yet. The purpose of this RFC is to reach agreement on the syn=
tax and
> > to prepare for libvirt support.
> >=20
> > virtio-blk and virtio-scsi devices will need a way to specify the
> > mapping between IOThreads and virtqueues. At the moment all virtqueues
> > are assigned to a single IOThread or the main loop. This single thread
> > can be a CPU bottleneck, so it is necessary to allow finer-grained
> > assignment to spread the load.
> >=20
> > This series introduces command-line syntax for the new iothread-vq-mapp=
ing
> > property is as follows:
> >=20
> >   --device '{"driver":"virtio-blk-pci","iothread-vq-mapping":[{"iothrea=
d":"iothread0","vqs":[0,1,2]},...]},...'
> >=20
> > IOThreads are specified by name and virtqueues are specified by 0-based
> > index.
> >=20
> > It will be common to simply assign virtqueues round-robin across a set
> > of IOThreads. A convenient syntax that does not require specifying
> > individual virtqueue indices is available:
> >=20
> >   --device '{"driver":"virtio-blk-pci","iothread-vq-mapping":[{"iothrea=
d":"iothread0"},{"iothread":"iothread1"},...]},...'
> >=20
> > There is no way to reassign virtqueues at runtime and I expect that to =
be a
> > very rare requirement.
> >=20
> > Perhaps libvirt only needs to support round-robin because specifying in=
dividual
> > virtqueues is very specific and probably only useful for low-level perf=
ormance
> > investigation. The libvirt domain XML syntax for this could be:
> >=20
> >   <driver name=3D'qemu' type=3D'qcow2'>
> >     <iothreads>
> >       <iothread id=3D"1"/>
> >       <iothread id=3D"2"/>
> >       <iothread id=3D"3"/>
> >     </iothreads>
> >     ...
> >   </driver>
>=20
> Just for completeness, this how disk XML looks now:
>=20
>   <disk type=3D'file' device=3D'disk'>
>     <driver name=3D'qemu' type=3D'qcow2' queues=3D'4' iothread=3D'1'/>
>     <source file=3D'/tmp/data.qcow'/>
>     <target dev=3D'vda' bus=3D'virtio'/>
>     <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03' fu=
nction=3D'0x0'/>
>   </disk>
>=20
> It corresponds to the following cmd line:
>=20
>   -blockdev '{"driver":"file","filename":"/tmp/data.qcow","node-name":"li=
bvirt-3-storage","auto-read-only":true,"discard":"unmap"}' \
>   -blockdev '{"node-name":"libvirt-3-format","read-only":false,"driver":"=
qcow2","file":"libvirt-3-storage"}' \
>   -device '{"driver":"virtio-blk-pci","iothread":"iothread1","num-queues"=
:4,"bus":"pci.0","addr":"0x3","drive":"libvirt-3-format","id":"virtio-disk0=
","bootindex":1}' \
>=20
> We already have @iothread attribute, so inventing an <iothread/>
> subelement is a bit misleading, because if users query which disk uses
> iothreads, they need to change their XPATH. Currently they can get away
> with:
>=20
>   //disk[driver/@iothread]/source/@file
>=20
> but I guess for backwards compatibility, we can put the first iothread
> ID into the attribute, e.g.:
>=20
>   <driver iothread=3D"2">
>     <iothread>
>      <iothread id=3D"2"/>
>      <iothread id=3D"4"/>
>     </iothread>
>   </driver>
>=20
>=20
> We've done something similar, when introducing multiple listen addresses
> for VNC.
>=20
> Now, an iothread is actually a thread pool. I guess we will never ever
> need to assign individual threads from the pool to queues, right?

QEMU will have the ability to assign an individual virtqueue to a
specific IOThread.

At the moment I believe no one will need that much control. Users
probably just want to round-robin threads for virtio-blk and virtio-scsi
devices.

I think it's fine for libvirt domain XML to only support round-robin for
virtio-blk and virtio-scsi.

Stefan

--Z+eUWc+C+W/oEGVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPhY48ACgkQnKSrs4Gr
c8j0vQf/UQvTwx5KNqAvWILylaNykCaga5D7vqmD3ZCsFl5Xo/qOIcQr/RmUmGq5
kI+QBacwh7DrYk1eBl42PJz77hqPKl6Okp1XfePyp4pXUEaBgCCxWneKUwd/lVqy
ijGkP9XGVbTtaP9xMM/lkYp39QfYQryYY37i7if+i7W4+HzNZOmE7IeiFz6E5nbc
AQIdgQhQ/UufJmLWegzkx5DoynjkyTbpd1mKL9vhqbcSbwnjayzXHQzG7prvmiw5
/jph9HGIRMdjld5Kf7ccdtfdoOMMUqNq55J33guRBxQfb2pFUf8HbYbdPUq2bX+g
b/So+rgkYELoRpZAssOT7ucl42UwXA==
=ibg0
-----END PGP SIGNATURE-----

--Z+eUWc+C+W/oEGVr--


