Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5202E5FE092
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:11:45 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2gK-0005Sb-E5
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj2cl-0001f3-Ph
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:08:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj2ck-0005Dl-BY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665684481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OOzG0ly7qbdciLS8NCk50Kql3DenNg6/9UlXFovGxiM=;
 b=Jkx7nK9EQkBvcWrdWfpCy/iPC6Avkqx1kKyISnh/LOWxpRNlRUhfjBaz5WExjaj8FeqtTK
 pjStjxVSKBV05wSd5xdG7H4Y4v/1tUMGmhiPz1x64mtIeSuHnvc3tARPItOXbDLaVQwDP5
 Qy3PfJ4832UEXe5oEgX34/qGR0Jn6l4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-eMXmqoVKOP6KDNV1lWtsYg-1; Thu, 13 Oct 2022 14:07:58 -0400
X-MC-Unique: eMXmqoVKOP6KDNV1lWtsYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25E7D101A54E;
 Thu, 13 Oct 2022 18:07:49 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68279208744F;
 Thu, 13 Oct 2022 18:07:48 +0000 (UTC)
Date: Thu, 13 Oct 2022 14:07:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
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
Subject: Re: [PATCH v6 02/13] blkio: add libblkio block driver
Message-ID: <Y0hT8rvWu7hoxad3@fedora>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-3-stefanha@redhat.com>
 <20221007103905.vvwq3nladi3rtbim@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hLygo8Bx5hVW1zN/"
Content-Disposition: inline
In-Reply-To: <20221007103905.vvwq3nladi3rtbim@sgarzare-redhat>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hLygo8Bx5hVW1zN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 12:39:05PM +0200, Stefano Garzarella wrote:
> On Thu, Oct 06, 2022 at 05:34:56PM -0400, Stefan Hajnoczi wrote:
> > +    ret =3D blkio_get_int(s->blkio, "max-segments", &bs->bl.max_iov);
>                                                      ^
> Should we use `value` here, since we check it in next lines?
>=20
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to get \"max-segments\": =
%s",
> > +                         blkio_get_error_msg());
> > +        return;
> > +    }
> > +    if (value < 1) {
> > +        error_setg(errp, "invalid \"max-segments\" value %d, must be p=
ositive",
> > +                   bs->bl.max_iov);
>                      ^
> Ditto.

Yes, thanks for catching this.

--hLygo8Bx5hVW1zN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIU/IACgkQnKSrs4Gr
c8iVqggAoHoQrBY566BTVHFnJVnwH+YXBIdgrCmCjX+TxvMv3cLTfUk4Ce2OLW1V
WwLl/+R+14Cfo5hvse7Gq0tS7+X3Wp6UcRvkEU1PVybkReOoe6RUbuQ02diAsi5Z
6pfhMwZL6iCXGt0x94mcxWpVKUIsW4OGkDvjIahgjF7tfuRyJapj71uA4RwvYKOz
WyI/jqUsGcer4wrH+USu16CrFN3MRNYBdOrGYL8Wkx+aaLeowk8LRSKBhxnjPCSA
js17bpYi12qcEbWmUu23tRIHU8uKAzf93fySNkjl3283NwhF+R+uHL0oTjCYBKRz
XY3bS/RbMEoicByQTEW8vQ+iFHRatg==
=TddN
-----END PGP SIGNATURE-----

--hLygo8Bx5hVW1zN/--


