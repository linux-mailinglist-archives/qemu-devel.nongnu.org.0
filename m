Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7C33EE0C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:07:22 +0100 (CET)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMT5F-0004zH-6C
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMT3s-0004U5-EQ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMT3k-0006o0-Py
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615975547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcuzOz03Ry4LC5ltIuOKLR1FeHi9mFBW/NbAs2dsypc=;
 b=HC5XAVMir9uewPPy+Q/pe07NqVFX24RRWU/EWLA8Npxw0wWqB7cSSihveOv05jZgoguxEr
 MxFcW1vLcn3fO+23ZK+zFBSNgbk9M25yw26OxG08ZnJuaJTrASU5Js7RFYX/uKGYnXXJ7I
 KGsvmC2B/4qGZdLHeGXo7RArAQI9mrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-i_RGtdqpNS279sug-ADBYA-1; Wed, 17 Mar 2021 06:05:45 -0400
X-MC-Unique: i_RGtdqpNS279sug-ADBYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A0E81746D;
 Wed, 17 Mar 2021 10:05:44 +0000 (UTC)
Received: from localhost (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13B6E5C261;
 Wed, 17 Mar 2021 10:05:33 +0000 (UTC)
Date: Wed, 17 Mar 2021 10:05:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon
 crash reconnection
Message-ID: <YFHUbEdszo4nursr@stefanha-x1.localdomain>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAJ+F1CLZ4VtgKp5fEdC70m22PgV2VHvRHunR-nPOWDnJPFvqqg@mail.gmail.com>
 <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9Vc79ZT7RY7KtoLf"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, slp@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9Vc79ZT7RY7KtoLf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> Thanks for the suggestions. Actually, we choose to save all state
> information to QEMU because a virtiofsd has the same lifecycle as its
> QEMU master. However, saving things to a file do avoid communication with
> QEMU, and we no longer need to increase the complexity of vhost-user
> protocol. The suggestion to save fds to the systemd is also very reasonab=
le
> if we don't consider the lifecycle issues, we will try it.

Hi,
We recently discussed crash recovery in the virtio-fs bi-weekly call and
I read some of this email thread because it's a topic I'm interested in.

I agree with Marc-Andr=E9 that storing file descriptors does not need to
be in the vhost-user protocol. The lifetime of a vhost-user device
backend is not controlled by the VMM since the device backend is
launched separately. Therefore it's reasonable for the component that
launched the device backend to also have the responsibility of cleaning
up the vhost-user device backend.

Using the sd_notify(3) interface is a neat idea. It's supported natively
by systemd but you can also implement a compatible interface in your own
software. This way the vhost-user device backend can be launched using
systemd or your own software.

That said, if people find it more convenient to store fds using the
vhost-user protocol, then I think that is enough justification to add a
generic message to the vhost-user protocol. The important thing is to
make the message generic so it solves all crash recovery use cases. The
inflight fd messages were too specific and now we're having to think
about adding more messages again.

Stefan

--9Vc79ZT7RY7KtoLf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBR1GwACgkQnKSrs4Gr
c8jYOQf9E6s0sDs+N1LozftpB4f74CvIEp3WRfZUHlIxK70WayhhZXu41S7McL8I
XOIod9IFtXJ01ZobnW5MqAFuuz/iLjwd2bqItZl/FiYB6xGLpNBzBNST9a5MIuFs
CfRvdol5zaPKp1BMfXCKaBEMIAycyd3p+Pt1pfBt6MswfbSgFEKPaRB4UbNz8EmH
Km7fKIjeLYqUHlTUgq5tFlfZaFtXW3uG8aMc2jm35SbCn2NxyYBBKJpyfpYBmVXH
Xf6dVYNoPtLc/KPP8jCsKfWhhhQTHr9mR+m3yEXU9QUGQi4pQNnQ1i4RWpEnrSBi
K3igrjfGyc6XiPYwaFaZXOZWSEapWQ==
=GuLY
-----END PGP SIGNATURE-----

--9Vc79ZT7RY7KtoLf--


