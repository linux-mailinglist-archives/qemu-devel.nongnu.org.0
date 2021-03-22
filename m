Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35915343ECE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:04:21 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIM8-0003lu-9r
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOIJ4-0001Hc-Qp
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOIJ2-0008I2-14
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616410867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2neSUoOKQlzRUDRQfXu8oad3mw9Yn0JoIdvnWS2K/SE=;
 b=Jy4UFszWWh9n2CHpHZHzJ9mFi2i+O9eYiXFg9t5Hhx3exRvzRmv4BESnI1axPICKFjnpq9
 zBWMoZGX8iLT9YRdRlAaZxT202fFQFy4o9qntd0Fqz9rlf88WAE4zAqMyrc/Q53Ck+rCpW
 WU1CaJKHczOrcjhAfejg970WFuoZ/SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-2XDGNYuKPUezIiVnOPCfdw-1; Mon, 22 Mar 2021 07:01:04 -0400
X-MC-Unique: 2XDGNYuKPUezIiVnOPCfdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD1A593A0;
 Mon, 22 Mar 2021 11:01:03 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 830D32B3C0;
 Mon, 22 Mar 2021 11:00:53 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:00:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon
 crash reconnection
Message-ID: <YFh45AUkh1OzbE6H@stefanha-x1.localdomain>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAJ+F1CLZ4VtgKp5fEdC70m22PgV2VHvRHunR-nPOWDnJPFvqqg@mail.gmail.com>
 <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
 <YFHUbEdszo4nursr@stefanha-x1.localdomain>
 <CAFQAk7ia5HsX0e4WBrhDtytGKnd5LsPrUSz9DJVFoo+ShDRP7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFQAk7ia5HsX0e4WBrhDtytGKnd5LsPrUSz9DJVFoo+ShDRP7Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LHuo8nVlDM+kCL5G"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

--LHuo8nVlDM+kCL5G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 08:32:31PM +0800, Jiachen Zhang wrote:
> On Wed, Mar 17, 2021 at 6:05 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> I agreed with you that a virtiofsd must be launched by a software like
> systemd. So we are planning to define more generic persist/restore
> interfaces (callbacks). Then anyone can implement their own persist/restore
> callbacks to store states to proper places.  And I think in the next
> version we will implement default callbacks for the interfaces. Instead of
> vhost-user messages, systemd's sd_notify(3) will be the default method for
> storing fds, and several tmpfs files can be the default place to store the
> shm regions.

Okay, great!

I was thinking about how to make the crash recovery mechanism reusable
as a C library or Rust crate. The mechanism is a combination of:
1. sd_listen_fds(3) for restoring the fds on restart.
2. sd_notify(3) for storing the fds.
3. memfd or tmpfs for storing state (could be mmapped).

I'm not sure if there is enough common behavior to create a reusable API
or if this is quite application-specific.

Stefan

--LHuo8nVlDM+kCL5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYeOQACgkQnKSrs4Gr
c8hnBQf9FKlO4m/ENo2rmyPC4ebpXwhckWnx4pd+GgxyREWwFcAKW4eSIo3PRmJ8
URE5mL5N3EAl7vi3YPb0lYzEBP1rGtbvhZAbcwOUVqJ6S1XbteLlLI+hxcjAwAFt
Ls3JACYr/wbvY6ZT44SaOdiMXVoMUtJi8F39yct+KOVtL84Roevuc1jtpIcfLQ1H
0izz6I3dRMwXWcob2tyufZS1v8AIc+c0PaBbuhRAfg8i26I7xtGVT1MdE0jf4rXh
R2BaqlBlSopsYqsCEtwvYwRRXgsTyRQ1V8hzjfaRkH88JU4DpKKfQfrzvjI3geqs
o7mOBl9icf7dmRpIyCzsYjmjkoOmdA==
=KfS+
-----END PGP SIGNATURE-----

--LHuo8nVlDM+kCL5G--


