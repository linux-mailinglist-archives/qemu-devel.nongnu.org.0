Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817052E990B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:44:06 +0100 (CET)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwS1d-0004l3-6L
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwS0D-0004JE-IQ
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwS0A-0007vT-PD
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609774953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNoqpsQNzOhu0Fwjyx/O4l90Bcr56LQc/38kA0+/W6k=;
 b=VM6hgQQpAQli2Oj2KuTDLX3wh/3IL6jMVzX8l875w3OSNnTh5rPkbdXOQyPb7quB8/EomC
 yuXa6FYCtJhSzb+JnRFJEEJeva89TSRDgUN7Madz77dmNfHMulXRw/AGTUnEZSysX+Z/0f
 391fnSK8GKdl1ANj4DqbPTZKoOUK+nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-oqkfubYTOFG4MR2Cv_6k0Q-1; Mon, 04 Jan 2021 10:42:29 -0500
X-MC-Unique: oqkfubYTOFG4MR2Cv_6k0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C36D2100F340;
 Mon,  4 Jan 2021 15:42:27 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F6E360BFA;
 Mon,  4 Jan 2021 15:42:24 +0000 (UTC)
Date: Mon, 4 Jan 2021 15:42:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 2/3] hostmem-file: add readonly=on|off option
Message-ID: <20210104154223.GC344891@stefanha-x1.localdomain>
References: <20200916095150.755714-1-stefanha@redhat.com>
 <20200916095150.755714-3-stefanha@redhat.com>
 <20201214121015.592aaef0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214121015.592aaef0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, qemu-devel@nongnu.org,
 eric.g.ernst@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--da4uJneut+ArUgXk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:10:15PM +0100, Igor Mammedov wrote:
> On Wed, 16 Sep 2020 10:51:49 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > Let -object memory-backend-file work on read-only files when the
> > readonly=3Don option is given. This can be used to share the contents o=
f a
> > file between multiple guests while preventing them from consuming
> > Copy-on-Write memory if guests dirty the pages, for example.
> >=20
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> cosmetic/style nits only
>=20
> s/Object *o/Object *obj/
>=20
> for consistency with the rest of the code in file.

Will fix.

> > @@ -153,6 +154,26 @@ static void file_memory_backend_set_pmem(Object *o=
, bool value, Error **errp)
> >      fb->is_pmem =3D value;
> >  }
> > =20
> > +static bool file_memory_backend_get_readonly(Object *o, Error **errp)
> > +{
> > +    return MEMORY_BACKEND_FILE(o)->readonly;
>=20
> I thought using macro this way not acceptable and one should use
>=20
> HostMemoryBackendFile *fb =3D MEMORY_BACKEND_FILE(o);
>=20
> return fb->readonly;

I'm not sure where this is forbidden or why? I've updated the patch as
suggested anyway.

Stefan

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/zN18ACgkQnKSrs4Gr
c8h7PQgAgpvbzUTA5Q0Bu8RGbsh1Ek4Ig6mJKzZdmEE6TOs135csdGkNvmRMfXSX
jmpv51HG5g54D3NNL45wuFwLUCot2kSx5bfN+MnU4twDPQ4Jlcv2Ui0Zy85J4SjL
ZkxayVmBxZbcc4roCZld/0nRiAVhOUH4Zh/AJ56d7Gaigjq8a1T1WV/BIeErBr7y
CrdNjSnOpMQ+76X/GUFCz3hT8CaFsSVpdpJdFWTPo6HLJQhwBQXK7reqDHjgRCIh
bR6om2X4BtB2J148AhhC5h6pshCldq3qXCvcQ61e1s9Hf6qsOnHggwdFn5R3NMSs
nT8YooDMBKP1RtjTkbPv6qsFAP9vNA==
=Laka
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--


