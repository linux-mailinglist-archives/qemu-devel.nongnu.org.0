Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB034600A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:47:09 +0100 (CET)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhND-00065G-LL
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhLj-00054O-KP
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhLg-0000Vf-Kr
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616507131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5AxyvAGf/nIuQg2dYxK/nV3ZsQWnzRs36zOrss3GqEg=;
 b=h2R+DGlLug5pREk+3IPodOGcGMuc9/u6TE9KbCmfSmxEshlTCNozd8leKHYlUndYFqOrAb
 YHVyXEMTrRKwgNoKPFZpMD7gWD8F2b5QAh9mcOvImGI2GcyuZEjwFp7p2Ku0MexcKn6tTF
 3NTD7IGgyj7FxIADR0ZMLU7VnXyM/N8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-uredp_DrO2uu0Ei86sTbCg-1; Tue, 23 Mar 2021 09:45:24 -0400
X-MC-Unique: uredp_DrO2uu0Ei86sTbCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D84AE180FCDB;
 Tue, 23 Mar 2021 13:45:07 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5591710023AF;
 Tue, 23 Mar 2021 13:45:07 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:45:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [External] Re: [RFC PATCH 0/9] Support for Virtio-fs
 daemon crash reconnection
Message-ID: <YFnw4kRo21yXlbxK@stefanha-x1.localdomain>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAJ+F1CLZ4VtgKp5fEdC70m22PgV2VHvRHunR-nPOWDnJPFvqqg@mail.gmail.com>
 <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
 <YFHUbEdszo4nursr@stefanha-x1.localdomain>
 <CAFQAk7ia5HsX0e4WBrhDtytGKnd5LsPrUSz9DJVFoo+ShDRP7Q@mail.gmail.com>
 <YFh45AUkh1OzbE6H@stefanha-x1.localdomain>
 <20210322201326.GH446288@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322201326.GH446288@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wuS6R2OceLl3Kyfx"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vrothber@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, dwalsh@redhat.com,
 QEMU <qemu-devel@nongnu.org>, virtio-fs@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>,
 Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wuS6R2OceLl3Kyfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 04:13:26PM -0400, Vivek Goyal wrote:
> On Mon, Mar 22, 2021 at 11:00:52AM +0000, Stefan Hajnoczi wrote:
> > On Wed, Mar 17, 2021 at 08:32:31PM +0800, Jiachen Zhang wrote:
> > > On Wed, Mar 17, 2021 at 6:05 PM Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> > > > On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> > > I agreed with you that a virtiofsd must be launched by a software lik=
e
> > > systemd. So we are planning to define more generic persist/restore
> > > interfaces (callbacks). Then anyone can implement their own persist/r=
estore
> > > callbacks to store states to proper places.  And I think in the next
> > > version we will implement default callbacks for the interfaces. Inste=
ad of
> > > vhost-user messages, systemd's sd_notify(3) will be the default metho=
d for
> > > storing fds, and several tmpfs files can be the default place to stor=
e the
> > > shm regions.
> >=20
> > Okay, great!
> >=20
> > I was thinking about how to make the crash recovery mechanism reusable
> > as a C library or Rust crate. The mechanism is a combination of:
> > 1. sd_listen_fds(3) for restoring the fds on restart.
> > 2. sd_notify(3) for storing the fds.
> > 3. memfd or tmpfs for storing state (could be mmapped).
> >=20
> > I'm not sure if there is enough common behavior to create a reusable AP=
I
> > or if this is quite application-specific.
>=20
> I am wondering what will happen for use cases where virtiofsd is running
> inside a container (with no systemd inside containers).
>=20
> Do container managers offer systemd like services to save and restore
> state.

It appears so, at least for Podman where sd_notify is explicitly
mentioned:
https://www.redhat.com/sysadmin/improved-systemd-podman

As mentioned in this email thread, the socket activation and
sd_notify(3) interface can also be implemented by non-systemd software.
Anyone running a custom container runtime or orchestration software
could add these interfaces (they are reasonably simple and the protocols
are documented in the systemd documentation).

Stefan

--wuS6R2OceLl3Kyfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ8OIACgkQnKSrs4Gr
c8gkLwf/Y8kynUlQ/LDECaTWekzges0TxYpXfBhQCZ7AjQ1nu2yxTGiw9jUbdRid
jTndmCQHhTfRPTiYR7SAcfiiIb+gDd+e4DrMQma0xQKNiFz9zRoyDId6ZzWIUpcy
JyWsnBUfHxGqTYdycequqd34OPl1gnwOnTMdc6hunoo96t7sW2Km8z0I8QW4kyAT
lr4/1xbrh1fcbr7C/uTxT22NllHbN0N8hnwKx+iiY4Fj5jjTVQFQoERjHCsPxWQg
GHxsUMBlhB1YUUgtWT5T0pW8+S4l93lqLoAi5l2wFyx5m0Pyf1bzSu9jop7XSmwT
aiU/xcl4Z96WAECDLfq0Vbrsb7DMEQ==
=cPN0
-----END PGP SIGNATURE-----

--wuS6R2OceLl3Kyfx--


