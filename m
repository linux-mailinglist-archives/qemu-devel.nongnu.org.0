Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EC6FCDE4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:37:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSBM-0000Jp-65; Tue, 09 May 2023 14:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwSBI-0000Is-Os
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwSBH-0007Eh-AR
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683657322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hK66GgZK4oBJTlqAp6Gt40la0pcXeIc5sZ5w97pfWSM=;
 b=RRrImq8ktygF1ownIkfpGlx5Ub1v/H/Hxi6UXbWCtEo7YLUSJyCRtkvaEqO3cRlIcFkVT8
 gKAFY+gvCAiHAlsarfqJjEa+O1O4XMWyfohTrXgoN2XSjkfVktYqaYzpvTVClXGSQkLboj
 Sw1vBJSf+Sf8OOgKnpV+DMpi0M92pDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-DaIJTyJ1OoywXMxBU_OwCg-1; Tue, 09 May 2023 14:35:19 -0400
X-MC-Unique: DaIJTyJ1OoywXMxBU_OwCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CB1E38184E0;
 Tue,  9 May 2023 18:35:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0084140C2063;
 Tue,  9 May 2023 18:35:13 +0000 (UTC)
Date: Tue, 9 May 2023 20:35:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Juan Quintela <quintela@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 00/21] block: remove aio_disable_external() API
Message-ID: <ZFqSYJaOeKwU1DIo@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <ZFQnSjGiEWuSFWTh@redhat.com> <20230509175138.GC1018047@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+wtMkZiYhpfvLEAI"
Content-Disposition: inline
In-Reply-To: <20230509175138.GC1018047@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--+wtMkZiYhpfvLEAI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 09.05.2023 um 19:51 hat Stefan Hajnoczi geschrieben:
> On Thu, May 04, 2023 at 11:44:42PM +0200, Kevin Wolf wrote:
> > Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> > > v5:
> > > - Use atomic accesses for in_flight counter in vhost-user-server.c [K=
evin]
> > > - Stash SCSIDevice id/lun values for VIRTIO_SCSI_T_TRANSPORT_RESET ev=
ent
> > >   before unrealizing the SCSIDevice [Kevin]
> > > - Keep vhost-user-blk export .detach() callback so ctx is set to NULL=
 [Kevin]
> > > - Narrow BdrvChildClass and BlockDriver drained_{begin/end/poll} call=
backs from
> > >   IO_OR_GS_CODE() to GLOBAL_STATE_CODE() [Kevin]
> > > - Include Kevin's "block: Fix use after free in blockdev_mark_auto_de=
l()" to
> > >   fix a latent bug that was exposed by this series
> >=20
> > I only just finished reviewing v4 when you had already sent v5, but it
> > hadn't arrived yet. I had a few more comments on what are now patches
> > 17, 18, 19 and 21 in v5. I think they all still apply.
>=20
> I'm not sure which comments from v4 still apply. In my email client all
> your replies were already read when I sent v5.

Yes, but I added some more replies after you had sent v5 (and before I
fetched mail again to actually see v5).

> Maybe you can share the Message-Id of something I still need to address?

I thought the patch numbers identified them and were easier, but sure:

Message-ID: <ZFQc89cFJuoGF+qI@redhat.com>
Message-ID: <ZFQgBvWShB4NCymj@redhat.com>
Message-ID: <ZFQivbkVPcX3nECA@redhat.com>
Message-ID: <ZFQk2TdhZ6DiwM4t@redhat.com>

Kevin

--+wtMkZiYhpfvLEAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRakmAACgkQfwmycsiP
L9aOzw//eu0aqw74PsvIWZfWFl7KSwRHbJx2OOazG9pWzqezZB/pFVvTwtGHL4+Q
ltXsY1aWDqysXFihI1AGxyqK16v0o8oSdxIk+dDAdU8FGgqJu70yk1nH7fYJUnW4
CYITZ0TE4w8OESRt4E219tfd/JsZmKzHnmY5cULkogXGhwSRZlekD3BTB5rXAhGh
gOOR97HNmyWa5/syO1Z5XNd6G79z6AWUg1es9IxEaYziuViRPjTPMVfpbm0BiF8I
O46S+Iz9S2yFAT18pOdnp5Vq51qerrNQzuhJZ++SktVRgUIjLoHtwxnGTf2eB7Jk
Rf9K9rBu0H2Yoj0Lgt7uOvNSGqnH+9gcYiZltqseArCwsozeJhZDwMnYpEe/USYP
PROvYwT7il2VsqYgKIvVuUcw3ev3tH9aoreHe1e6uYjfBFpVDKL0yCc3SLZ/Kezw
hd8Vpa0Hff0zf8cbhb3IEkP0wr0W4I6ccMSzvTvJoG8hC+YVHu0vSqZ9eQYLFhnf
P8R9xnNDt5RaLyzNcCAuD2D4NAOK/D2tnJ7BpDhaxqqT1AoQPHvBj3vIW8b56/rk
PWJ1h6qNz524X617jMUKC8cMoyUuVFt5mghZyT3krbT49IIteY2H2vS0AnRrLSSs
+qsNnB6Ol7zV2j/aFK+IqKsc6rFIRnFm6LiI/JBhIdbduWMpv3c=
=67t7
-----END PGP SIGNATURE-----

--+wtMkZiYhpfvLEAI--


