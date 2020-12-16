Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B702DBE30
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:05:01 +0100 (CET)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpTg4-00044q-7o
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpTeC-0003Zp-Ib
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpTe9-0007dA-AK
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608112980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/XEDZWP8Kl/YpYk+E3vh8O7Kb8Vm87k0YmpJiFYh3YM=;
 b=CxzkZHpz2ZbNiMtgaP6x+syuT4Q2xpRSGHR1pMZIabENLOm11QeV26t8aqxJceR6M6cmTX
 gg5OuUT+EPHXcVeAG0cohA1oTHfPICg8f3ty4+6DWApJgg4IVj7eOG2fRABiUnDVObelwp
 nBppTb/0LGUvcMazoEvzfaa5BmZPv5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-TW-kUoW5Ou64fAwD0WmdEw-1; Wed, 16 Dec 2020 05:02:56 -0500
X-MC-Unique: TW-kUoW5Ou64fAwD0WmdEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 881E115720;
 Wed, 16 Dec 2020 10:02:54 +0000 (UTC)
Received: from localhost (ovpn-115-151.ams2.redhat.com [10.36.115.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6993018035;
 Wed, 16 Dec 2020 10:02:44 +0000 (UTC)
Date: Wed, 16 Dec 2020 10:02:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH v13 07/19] multi-process: add qio channel function to
 transmit data and fds
Message-ID: <20201216100243.GA696182@stefanha-x1.localdomain>
References: <cover.1607922214.git.jag.raman@oracle.com>
 <a366c7f80a862b4f32445f8334e2f36767b102a3.1607922214.git.jag.raman@oracle.com>
 <CAJ+F1CJLKJR5UirK106zKn5bM8rr1cDZyQwZ66QdMJLS-k_zBA@mail.gmail.com>
 <20201215212225.GB17643@heatpipe>
MIME-Version: 1.0
In-Reply-To: <20201215212225.GB17643@heatpipe>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 01:22:25PM -0800, Elena Ufimtseva wrote:
> On Tue, Dec 15, 2020 at 02:49:22PM +0400, Marc-Andr=E9 Lureau wrote:
> > I suggest to adapt the code so qio_channel_readv_all_eof() calls
> > qio_channel_readv_full_all().
> >=20
> > You may want to split this patch in 2 parts: the read and write parts.
> >
>=20
> And should we drop the Reviewed-by: Stefan Hajnoczi then?

Yes, please drop my R-b and I'll review again.

Stefan

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Z20MACgkQnKSrs4Gr
c8hyHgf/eKDkYoBGaaZ76SyNVig/Mt0RgEt/AhOsPTMypWao1G0lLBXqUMkFFvts
BB3OAW6sttavKdPOCxMlP46nk8JTAO99ZQA1QNgBHM9lWCZHmxhlGslVBcmf0ouQ
zLAW686ookNRxdmiZGqNINIygJfEQw2vscgP4mOlAk0KHzZ+tFx3JPoibJFxOHJ7
snkFlXUUrEi4TdoaIdQh/+Il86E33qi5fCCpB9JLK1utZJQpwiU6SB4yRf/qsCEX
Eduy5/HJYWCGBQUUVe+w51PnAT3K5iWWDpfmz+pY9xVCffEb2vS4QDzdEyw5R92V
xaZju7F7xQfz8BP3S61+TrbxLTCCDw==
=P3y8
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--


