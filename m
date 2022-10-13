Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ADB5FE184
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:41:46 +0200 (CEST)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj39N-0000wL-3X
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj37z-0006Ma-Kj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:40:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj37w-0001Z4-HN
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665686415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I/mvNORg+N2jdf1nlPY2ldE+CQ5bUkBKjDATsRFbF0Y=;
 b=TkB7ao3TmtFvuPD6oDCRIH+lUVZ6+aVoQkcTFbncxF8YhzaUI017Ds88ATx8tXS157bRMi
 u9lu18lBNu78e0ZVUaEY5u7zsnbZ66q1uHcwyXN8PM1udI/nz863jFGQ6JGx9+vwS/36I2
 hM3VKMtL8vecMrO8+DC5dZuV3rfY5B8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-xEe_xn2iNtqGzv_NHoFglA-1; Thu, 13 Oct 2022 14:40:12 -0400
X-MC-Unique: xEe_xn2iNtqGzv_NHoFglA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BCD180280D;
 Thu, 13 Oct 2022 18:40:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D23B640315F;
 Thu, 13 Oct 2022 18:40:09 +0000 (UTC)
Date: Thu, 13 Oct 2022 14:40:07 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 sgarzare@redhat.com, "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: Re: [PATCH v6 00/13] blkio: add libblkio BlockDriver
Message-ID: <Y0hbhx4ZslieREdo@fedora>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <CAELaAXya2pSuX5AYwDBTti8AAUYxmMZj_6jwwRBcAjZYfmn=mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hSNIoUBKOKTWoFar"
Content-Disposition: inline
In-Reply-To: <CAELaAXya2pSuX5AYwDBTti8AAUYxmMZj_6jwwRBcAjZYfmn=mg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hSNIoUBKOKTWoFar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 10:46:59AM +0100, Alberto Faria wrote:
> On Thu, Oct 6, 2022 at 10:35 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > v6:
> > - Add untested nvme-io_uring driver. Please test in your nested NVMe en=
vironment, Alberto. [Alberto]
>=20
> I did some I/O verification using fio [1] and it seems to be working fine.

Thank you, Alberto!

Stefan

>=20
> Alberto
>=20
> [1] https://fio.readthedocs.io/en/latest/fio_doc.html#verification
>=20

--hSNIoUBKOKTWoFar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIW4cACgkQnKSrs4Gr
c8jfNwgAxr9+ThO0qEuP+qKsqUjBfKdxUxG6nr9reznMTPD8a/ivgu1DkmgAFdow
lFMrUf6Jm8Ec5M3GPDT9n4y0Y0txa++93Vl9FJ0p9ZExR7l3FK+0xc6w8Vs28qDy
who8D3dKRgk/OdbcV8o3V1C9TJFhI0ZrgsQja8wbLjDKh064qceqtRDtH5TJCZqq
uDA/5q3N5b+2BCdk/y/IOjkA+JxVLSPgioj6Wzv0tFggwAU1jMD5RxQ7p497p+Pe
L5pywc0WeL0hz53TbPxCpnCU1uJOn+MQLGK8uMQIedzbtCryaguOrAZgm45hhJ/5
5Q5sfxCsjqlSbDW9l5YA+1ypM4axLg==
=OVBF
-----END PGP SIGNATURE-----

--hSNIoUBKOKTWoFar--


