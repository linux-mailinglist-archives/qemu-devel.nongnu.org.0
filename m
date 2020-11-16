Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3382B42F4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:37:20 +0100 (CET)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecox-0002X0-CF
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1keco4-00026Y-5U
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:36:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1keco1-0002uv-DF
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605526580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ucsUbIN8SZubMjTV33Y+QZRDvrz/lnZEHkhuv/SU76A=;
 b=IhKQGIkJDdA2T3KfKLqFB2/HobXtWd9IpC484fbMtXWgF2QuwHfOB34DsDig55HKvcgkoq
 b0IZe4GO9gbV8GovzBnULOgxmdJdidHdfbbuiOJDin/dGRghPjAi3RaUVDrDhUVI35yDDI
 p60SEfodI0TTLrWGG2aRzn3moTpo1Ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-jIw3vT9wPGuJhatOVUk1vg-1; Mon, 16 Nov 2020 06:36:16 -0500
X-MC-Unique: jIw3vT9wPGuJhatOVUk1vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0BE5186841C;
 Mon, 16 Nov 2020 11:36:14 +0000 (UTC)
Received: from localhost (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF3460BF1;
 Mon, 16 Nov 2020 11:36:04 +0000 (UTC)
Date: Mon, 16 Nov 2020 11:36:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116113603.GE96297@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111151014.GB1421166@stefanha-x1.localdomain>
 <20201111162810.675b1fe6.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111162810.675b1fe6.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 04:28:10PM +0100, Cornelia Huck wrote:
> On Wed, 11 Nov 2020 15:10:14 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Tue, Nov 10, 2020 at 01:14:04PM -0700, Alex Williamson wrote:
> > > On Tue, 10 Nov 2020 09:53:49 +0000
> > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > Or we could create a kobject for each migration parameter, but that
> > seems wrong too.
>=20
> Hm, ISTR that you can do something with ksets.

Thanks for the idea! Researching it turned up kobject_create_and_add(),
which seems to solve the problem without the heavyweight stuff I was
concerned about (defining dummy ktypes, sending uevents, etc).

I'll bring back the sysfs hierarchy in the next revision.

Stefan

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+yZCMACgkQnKSrs4Gr
c8glHwgAw9zLLl9qwjGyskxh/2evPAQ9qEJC5jWddMS6LQsnPxczgIUd0xlaM+cK
UXw81sQLxkqxt9HNykLvwNWd5sdwED+BzvnnqaZQC/M8W4do+oNqEAJOBZBTtlJk
bJH2riD4+GVCtn8fnl35RYMTbhL47Nu2zp14S9Bl7GfA8X2E/Ddd7wzCFymyn7by
rprTv4A4W9P1K9AQ6UzUTsOS1dTiQhIf81fCiRYBgjvJMiOqDHj3LbZN8+uiP8c6
2SDwMcDLeAQmVNtB9XmeR5N4x4DGxmFbsWzg5BSt763mKEaMCC/Wusm9ro5biH7V
8GyjsL+VOES6jKx8WAw620FjCeQrbg==
=ARck
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--


