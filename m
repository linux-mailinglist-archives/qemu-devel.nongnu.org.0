Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD247B1B5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:58:37 +0100 (CET)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLzg-0007DT-FY
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzKS7-0002KY-VE
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:19:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzKRt-00072Z-Ld
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+whCOvFvs/Zejw8l9wJtYsR3NlF9svw3UyrHTrMnUA4=;
 b=guDoWrKUDCiMCglUjvZRTcUkSdxYsaW5J4t13AsLjgfheyxs4do73zwShO5B/q0oNfLYiu
 ZZj7P6F739UB+JNLzr1qr/JTk8yAbD4dBSpmOFuXCjYq4h65vqZOf15wLq+irlOpcYSrVa
 42XrMKz+rNAWlqL1VbRho3qa2vKmUMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-i70MXGfMP5CnPjV7TEs-gA-1; Mon, 20 Dec 2021 09:06:24 -0500
X-MC-Unique: i70MXGfMP5CnPjV7TEs-gA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DB4081CCB6;
 Mon, 20 Dec 2021 14:06:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF1C312E34;
 Mon, 20 Dec 2021 14:05:58 +0000 (UTC)
Date: Mon, 20 Dec 2021 14:05:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <YcCNxTvJ6fZ1V28h@stefanha-x1.localdomain>
References: <YbiYAKIkLAgosXEH@stefanha-x1.localdomain>
 <CACGkMEsZfgDriSx1e=JOU4E8QyB5KoU+i2M2F8N12BrMbu5suQ@mail.gmail.com>
 <Ybm+YVQS1l73nnuU@stefanha-x1.localdomain>
 <CACGkMEtqujKwU=3P1VQ-PgAQPvzrpAf_huVzVZHAi11vyn8xPA@mail.gmail.com>
 <YbsClFXLq3kz7tJS@stefanha-x1.localdomain>
 <CACGkMEtwHj-y9nVvtszOYKYd1ohd-cdNe8xry-rYkD1Jk9U4Ow@mail.gmail.com>
 <YbxL4avaEZBSFz3B@stefanha-x1.localdomain>
 <CACGkMEtFLoLtVSyYiQzjgMU5LN0-K8LMk4pR43cOxHz2jw+H=A@mail.gmail.com>
 <YcA6qqao9jInSdOY@stefanha-x1.localdomain>
 <b066c3eb043a45619081bcd16c5f36d1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <b066c3eb043a45619081bcd16c5f36d1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q9bWfwgdCC/3VkxO"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--q9bWfwgdCC/3VkxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 09:17:40AM +0000, Longpeng (Mike, Cloud Infrastruct=
ure Service Product Dept.) wrote:
> > -----Original Message-----
> > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > Sent: Monday, December 20, 2021 4:11 PM
> > To: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>; Longpeng (Mike, Cloud Infrastr=
ucture
> > Service Product Dept.) <longpeng2@huawei.com>; parav@nvidia.com;
> > xieyongji@bytedance.com; sgarzare@redhat.com; Yechuan <yechuan@huawei.c=
om>;
> > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org; Dr. Da=
vid
> > Alan Gilbert <dgilbert@redhat.com>
> > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device suppo=
rt
> >=20
> > On Mon, Dec 20, 2021 at 10:48:09AM +0800, Jason Wang wrote:
> > > On Fri, Dec 17, 2021 at 4:35 PM Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> > Longpeng: Do you want to generalize this patch into a --device vdpa-hos=
t
> > that supports all device types?
> >=20
>=20
> Yes, I already told Jason that I'll start to develop the device next week=
 :)

That's great!

Stefan

--q9bWfwgdCC/3VkxO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHAjcUACgkQnKSrs4Gr
c8jtOQf9HstOf/VHv1n8zbYyJsLygx1JYsbos7T26hzitM0HpgxIfSmUEPY6LEd/
h7eNlwkdt/3NwmN2tplygde7Wjx8JkaBKjI62eX7aXSv+sfCZIE9YqCkApSmLwB/
pZ5dPcOSJolcHeedSS6KCie9nh9FWDWPp1+1iZjOfCcavv6/S18segsoheqtbdYt
PZnft5jz75CxkdGbqIlFAXIcxLohCRwbLkRRZ8sl6j7dTd30OPz5bwbNjaiV63aR
ty5Px8vwCDNVDgl0E322hRQK5gIz50gbvt15Jk9OLdAnzaIyaV185v01Q2BXWx32
eaSJFYmXgrsYkJpsR6lnVknDxI2cfw==
=52wU
-----END PGP SIGNATURE-----

--q9bWfwgdCC/3VkxO--


