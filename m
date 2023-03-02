Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B603A6A89F1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXp4M-0003bi-E7; Thu, 02 Mar 2023 14:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXp4K-0003Z7-Ga
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXp4H-00015S-Uf
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677787100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GkdxdVneRlEdyHeWzHApWiZlXkpsKQmabcaoR9smOxc=;
 b=MLUpQIPAzhhH/Z9Zk7v0C+kyuUpCzpII0E2gnZ07WdyQ/I00QNe25GY1UHGAjaVV6EP3+N
 MGZIoyGTb1iGXt7Xa8gMBug4aEqui/u6OB07poprz84H58THjnK7cCQ1ZXgB3n7AuwZ31c
 5HnwQSU3sYNnxXqXf516jb+C1XoTYHc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-x5rBKNdaMEmi3LaEcorGxg-1; Thu, 02 Mar 2023 14:58:17 -0500
X-MC-Unique: x5rBKNdaMEmi3LaEcorGxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B41B380664C;
 Thu,  2 Mar 2023 19:58:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55285492C14;
 Thu,  2 Mar 2023 19:58:15 +0000 (UTC)
Date: Thu, 2 Mar 2023 14:58:13 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 0/4] AioContext removal: LinuxAioState and ThreadPool
Message-ID: <20230302195813.GA2566691@fedora>
References: <20230203131731.851116-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yqCul0AJvHI8LkjW"
Content-Disposition: inline
In-Reply-To: <20230203131731.851116-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--yqCul0AJvHI8LkjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 08:17:27AM -0500, Emanuele Giuseppe Esposito wrote:
> Just remove some AioContext lock in LinuxAioState and ThreadPool.
> Not related to anything specific, so I decided to send it as
> a separate patch.
>=20
> These patches are taken from Paolo's old draft series.

Despite the concerns that I mentioned, an x86 guest booted up and ran
fio benchmarks fine in various configurations
(aio=3Dthreads/native/io_uring, iothread on/off).

Stefan

--yqCul0AJvHI8LkjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQA/9QACgkQnKSrs4Gr
c8hZiAf/e3oK2k9caNTjUPV6wl3j77OWy5DvtqaYXGAZhJTMGoyKADmXIFE8U/mx
uPoOJmV5yF0LQ5HxTNoSlumuPr1sldVA/8edd6Wy2fv1PqalzZzbDhj9HJNePcL5
bwGhCGsGKHfLYIJSqmXTOTIyH70pXQnlq9H1CaExGNfLNZI02EejXTMaNT6sAqvj
jWFG2T9Khkoz1yFquuj4z5Tdz04FgaVt30KXRzCOlYOPt/buAcZr5T8rdaZ9t+PW
+5fPvR4aBbTwkW6bucIUd/f0pj88eTv2ZXxS3+XiXdpqKk0d1HY8frJuyVkhngpl
odrBdAutIWpK8UpTDSOCqrTHU87H0Q==
=goeX
-----END PGP SIGNATURE-----

--yqCul0AJvHI8LkjW--


