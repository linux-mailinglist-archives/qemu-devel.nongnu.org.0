Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D066C4AC7BA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:37:02 +0100 (CET)
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7wj-0000ay-V3
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:37:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH7Ze-00027x-0X
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH7Za-00040U-TV
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644253986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RBCQQf23KU2dvKI2Pk7xEr7SXTZO5/m1zLV3r5tajo0=;
 b=X93HS/6C8nX//6hPdJQDeyNp8nnVUlEFf1WZN/b9fwUHpL/SkHD+W3LT8MDhxBzyP93sNl
 3A4pPjbF2vQ4d1yg+NxfOab/G6ztCrZ+kYdzaXDdrzJWQuDF6io9NrpdUu3z0B43poAcHp
 HKYm3LjTgpEIIjpSPI7tt5JNDMcOC7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-2AuB08YLPCO5Krr2OgWFmg-1; Mon, 07 Feb 2022 12:13:05 -0500
X-MC-Unique: 2AuB08YLPCO5Krr2OgWFmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7F5D46861;
 Mon,  7 Feb 2022 17:13:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C56E838C0;
 Mon,  7 Feb 2022 17:12:59 +0000 (UTC)
Date: Mon, 7 Feb 2022 15:20:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <YgE4qsdlEkFto73I@stefanha-x1.localdomain>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
 <aca18563999f3bf4b8c6bfee5f073f54beaacda4.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FHlWa74g92L21WQ9"
Content-Disposition: inline
In-Reply-To: <aca18563999f3bf4b8c6bfee5f073f54beaacda4.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mtosatti@redhat.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FHlWa74g92L21WQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 01:00:46PM +0100, Nicolas Saenz Julienne wrote:
> Hi Stefan, thanks for the review. I took note of your comments.
>=20
> On Thu, 2022-02-03 at 10:53 +0000, Stefan Hajnoczi wrote:
> > > Some background on my workload: I'm using IDE emulation, the guest is=
 an
> > > old RTOS that doesn't support virtio, using 'aio=3Dnative' isn't poss=
ible
> > > either (unaligned IO accesses).
> >=20
> > I thought QEMU's block layer creates bounce buffers for unaligned
> > accesses, handling both memory buffer alignment and LBA alignment
> > necessary for aio=3Dnative,cache=3Dnone?
>=20
> See block/file-posix.c:raw_co_prw() {
>=20
>     /*
>      * When using O_DIRECT, the request must be aligned to be able to use
>      * either libaio or io_uring interface. If not fail back to regular t=
hread
>      * pool read/write code which emulates this for us if we set
>      * QEMU_AIO_MISALIGNED.
>      */
>     if (s->needs_alignment && !bdrv_qiov_is_aligned(bs, qiov))
> 	type |=3D QEMU_AIO_MISALIGNED;
>     else if (s->use_linux_io_uring)
>         return luring_co_submit(...);
>     else if (s->use_linux_aio)
>         return laio_co_submit(...);
>=20
>     return raw_thread_pool_submit(..., handle_aiocb_rw, ...);
> }
>=20
> bdrv_qiov_is_aligned() returns 'false' on my use-case.
>=20
> I believe what you're referring to happens in handle_aiocb_rw(), but it's=
 too
> late then.

I was thinking of block/io.c:bdrv_co_preadv_part() but it only aligns
the LBA, not memory buffers.

Stefan

--FHlWa74g92L21WQ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIBOKoACgkQnKSrs4Gr
c8hvcQf/YQ7taZySmaJjhtenK1v6XWRkIQMKQ9o6BMNf1Cn5Hzszj3XPSAvk+0KQ
BadbEFeBFVWpMoA2HwtjvYJpofNxFq5J2Y9QGlm4nD0/MBIZwCumpEsmsux454Sc
YPD1hY/uG4f3gUd1B5jCo11Mq4I2dAM/ULsyLMr5jpVU7enOsbKqLnMRPhOFQhuB
EeNsoWSgV3wLvzPQZoYGF1cHjV/lcy1dRYHEQEf7Jah+Toxb0GxUSUNIe5z1GPl+
isIypFTC1dp4zGxa5sO70MkkoCgTbKR6GkYEeMa1lOIMwW2iinJhgsJ1g2FdPBqB
ev5oZKi8hja5cBeq9CzL+0t75vynSQ==
=6i42
-----END PGP SIGNATURE-----

--FHlWa74g92L21WQ9--


