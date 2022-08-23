Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4759ED72
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 22:37:50 +0200 (CEST)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQaej-0004Su-Iz
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 16:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQacu-0002sM-P1
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 16:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQacs-0005Rj-JE
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 16:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661286954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NkcUS6jctxv2huOZfChFO2tXAUw16Qu/r7qf06I4nes=;
 b=ZbBZzgx/WKlwmCAuPaIXHiLA9wHzVFp5CBUQxOR1Nts4Q9l91s1IP9eebmEl7fMFeWp6kH
 C+aQOvRydVc+I2ltVrY0H2heUoKyOpP5XA56wraT8TlCINU0jYNunkw8loL+lyphastvb4
 4netHqxwrwDjm5u06fFxAhYrFCVOhX8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-0Dq9_3OdOS-0kbzBaj-HFw-1; Tue, 23 Aug 2022 16:35:49 -0400
X-MC-Unique: 0Dq9_3OdOS-0kbzBaj-HFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42E3238164CE;
 Tue, 23 Aug 2022 20:35:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 563B01121315;
 Tue, 23 Aug 2022 20:35:45 +0000 (UTC)
Date: Tue, 23 Aug 2022 16:35:43 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Xie Changlong <xiechanglong.d@gmail.com>
Subject: Re: [RFC v4 00/11] blkio: add libblkio BlockDriver
Message-ID: <YwU6H/tFQkQok96O@fedora>
References: <20220822222402.176088-1-stefanha@redhat.com>
 <15ad1a46-00e5-ccc8-1c7e-f6061bc68c0c@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q9ieYPhee3N3ySSd"
Content-Disposition: inline
In-Reply-To: <15ad1a46-00e5-ccc8-1c7e-f6061bc68c0c@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Q9ieYPhee3N3ySSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 08:31:03PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> On 8/23/22 01:23, Stefan Hajnoczi wrote:
> > The remainder of the patch series reworks the existing QEMU bdrv_regist=
er_buf()
> > API so virtio-blk emulation efficiently map guest RAM for libblkio - so=
me
> > libblkio drivers require that I/O buffer memory is pre-registered (thin=
k VFIO,
> > vhost, etc).
>=20
> Hi!
>=20
> So patches 01-11 are for performance optimization? Don't you have some pe=
rformance measurements for it?

Good point, I'll gather some data and share it.

Stefan

--Q9ieYPhee3N3ySSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMFOh8ACgkQnKSrs4Gr
c8gd/wgAixakci4mYgBdS1bzYWvwGDc+x21opL1FBQup4oOYqjEWTg8is+pe1e5f
/eWn0qvbN438tu3iNM3FvNvzd//JJy7auoKOdTzerhL6U/DXqEWO7vRwB9TIFVJI
3NtDc1ojCYmDZoldx0onl0PO302iQUCXWu5/55fT9LeJvJaFZ22KJvKWD8JRPEJN
pFf2wlXb6hzBEJRpgdxMAUIKJgIpwL2C3JUKPzkeNi+5DZ7pwyThyUISwE6GRlmc
mnreN/vgYl290cV32gE+f+guvwFU/tJhxRlwQYtR15GSnNSWam+G10eEzzGzVAvw
uley5ZWZFVCIhp3EvUuTnYy58SMOSw==
=rBXJ
-----END PGP SIGNATURE-----

--Q9ieYPhee3N3ySSd--


