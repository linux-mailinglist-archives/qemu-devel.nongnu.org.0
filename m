Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6F6FCD07
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:52:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRVB-0003NU-Nw; Tue, 09 May 2023 13:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwRV7-0003Mc-LG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwRV5-0007e4-Hp
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683654706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YSdkeye67d1BrBNCM3zk98YAc8rNSrDW0Ne/KD+GhLE=;
 b=RuUuBnZ8/uaugvHwjatCC2QIusedYHGMZMZQfVXVNLqop2xkVvV6bYvb+mh42UhyPE754I
 JpJqCRXS2QuOqISJEnYLtGxxkAe4NxxGbe0vUq5jPWRWGVlv9Y6q39bm5Ut8hUqtKoYihk
 YQlE5MVLl2KVKSbz4Fj0aQToZ0foEw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-PpY0sT0QMaWcAjHy4w3mDQ-1; Tue, 09 May 2023 13:51:42 -0400
X-MC-Unique: PpY0sT0QMaWcAjHy4w3mDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92D92100F651;
 Tue,  9 May 2023 17:51:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2336840C6E67;
 Tue,  9 May 2023 17:51:39 +0000 (UTC)
Date: Tue, 9 May 2023 13:51:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
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
Message-ID: <20230509175138.GC1018047@fedora>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <ZFQnSjGiEWuSFWTh@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYR6uqo+9eG5ZY9J"
Content-Disposition: inline
In-Reply-To: <ZFQnSjGiEWuSFWTh@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--zYR6uqo+9eG5ZY9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 11:44:42PM +0200, Kevin Wolf wrote:
> Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> > v5:
> > - Use atomic accesses for in_flight counter in vhost-user-server.c [Kev=
in]
> > - Stash SCSIDevice id/lun values for VIRTIO_SCSI_T_TRANSPORT_RESET event
> >   before unrealizing the SCSIDevice [Kevin]
> > - Keep vhost-user-blk export .detach() callback so ctx is set to NULL [=
Kevin]
> > - Narrow BdrvChildClass and BlockDriver drained_{begin/end/poll} callba=
cks from
> >   IO_OR_GS_CODE() to GLOBAL_STATE_CODE() [Kevin]
> > - Include Kevin's "block: Fix use after free in blockdev_mark_auto_del(=
)" to
> >   fix a latent bug that was exposed by this series
>=20
> I only just finished reviewing v4 when you had already sent v5, but it
> hadn't arrived yet. I had a few more comments on what are now patches
> 17, 18, 19 and 21 in v5. I think they all still apply.

I'm not sure which comments from v4 still apply. In my email client all
your replies were already read when I sent v5.

Maybe you can share the Message-Id of something I still need to address?

Thanks,
Stefan

--zYR6uqo+9eG5ZY9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaiCoACgkQnKSrs4Gr
c8jaCggAiPAw+aTVrrMgYTa8ZedRV1wLjpV5lST53EB62gJPS57Ru3GedV9WCoBj
l/s8rZSmlc+p/iO4BTaYSoonSePjzs81JlhDXB3WRYVAFUYplCHGdlOfhkOfueND
T/OCXMkwooUDcUgSJKUCM+gjFw52J2Xppw1HlzOSOxSGmuyJsNPPUlrfjiNDwxGq
THTaMGzpNPvLEQLhw9cLzrg1eE6W6z3vNeJULIYIwYfQE9cIbeo2Hx8c1rmFhasF
mjL0+4PXOjH2CcotBw8EfyUsx3GV1BbjB/RhbEzr7SG4YCC748WCx2xatAIorzZd
Vf68V/bHVGXLlN2FDniw5dFCdMSzUA==
=Vtb2
-----END PGP SIGNATURE-----

--zYR6uqo+9eG5ZY9J--


