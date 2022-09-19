Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16A5BD260
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 18:44:31 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaJsk-00006l-J0
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 12:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oaJnq-0005Ms-Kg
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 12:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oaJnn-00017m-Tk
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 12:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663605562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qCkrF/DT6atejfqvW5oEZsv376vSSU4b6doGCS+czlA=;
 b=MX3euJNFXLwT+2xBkMLo24vh6FnbJBDESHpwQTSN73T3zl3wj6e8mucqLTXRktfSFK0dgF
 DBmuMeZa09QmRwJohV3BoqPjj1tS9CZ8pmQqawv2/5zuTy5xYFFw+g/+/l+fdQoB5TglGX
 54C0T83usxGCDrpFn3iWoXOrBSU4Xrw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-NDEbrt-HPEK5I0FP7lV2Lg-1; Mon, 19 Sep 2022 12:39:19 -0400
X-MC-Unique: NDEbrt-HPEK5I0FP7lV2Lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 975C0185A7AB;
 Mon, 19 Sep 2022 16:39:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 160A1140EBF5;
 Mon, 19 Sep 2022 16:39:17 +0000 (UTC)
Date: Mon, 19 Sep 2022 12:39:16 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
Message-ID: <YyibNC4CbniKUTmi@fedora>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <87czbvzu9e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hH4//zbcGvns4eLw"
Content-Disposition: inline
In-Reply-To: <87czbvzu9e.fsf@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--hH4//zbcGvns4eLw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 07:51:40AM +0100, Alex Benn=E9e wrote:
>=20
> Alex Benn=E9e <alex.bennee@linaro.org> writes:
>=20
> > Hi,
> >
> > This is an update to the previous series which fixes the last few
> > niggling CI failures I was seeing.
> >
> >    Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cle=
anups
> >    Date: Tue, 26 Jul 2022 20:21:29 +0100
> >    Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>
> >
> > The CI failures were tricky to track down because they didn't occur
> > locally but after patching to dump backtraces they all seem to involve
> > updates to virtio_set_status() as the machine was torn down. I think
> > patch that switches all users to use virtio_device_started() along
> > with consistent checking of vhost_dev->started stops this from
> > happening. The clean-up seems worthwhile in reducing boilerplate
> > anyway.
> >
> > The following patches still need review:
> >
> >   - tests/qtest: enable tests for virtio-gpio
> >   - tests/qtest: add a get_features op to vhost-user-test
> >   - tests/qtest: implement stub for VHOST_USER_GET_CONFIG
> >   - tests/qtest: add assert to catch bad features
> >   - tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
> >   - tests/qtest: catch unhandled vhost-user messages
> >   - tests/qtest: use qos_printf instead of g_test_message
> >   - tests/qtest: pass stdout/stderr down to subtests
> >   - hw/virtio: move vhd->started check into helper and add FIXME
> >   - hw/virtio: move vm_running check to virtio_device_started
> >   - hw/virtio: add some vhost-user trace events
> >   - hw/virtio: log potentially buggy guest drivers
> >   - hw/virtio: fix some coding style issues
> >   - include/hw: document vhost_dev feature life-cycle
> >   - include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
> >   - hw/virtio: fix vhost_user_read tracepoint
> >   - hw/virtio: handle un-configured shutdown in virtio-pci
> >   - hw/virtio: gracefully handle unset vhost_dev vdev
> >   - hw/virtio: incorporate backend features in features
> <snip>
>=20
> Ping?

Who are you pinging?

Only qemu-devel is on To and there are a bunch of people on Cc.

Stefan

--hH4//zbcGvns4eLw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMomzQACgkQnKSrs4Gr
c8g+KwgApKxhz6bsGPXRkXy4wQMtluL11SjRlBt1qaqvjvaXOfvUhP/RhMilp+n4
XSkJK7gSTWSVoq0C40K0cdGM6miQS6/Ezwi6eiNdh9j6pKedsWyHNFbudlpa2YD8
WYnUip0yd2REaYA78V1rfqS+CGbUILD3ME0RQeRM2tb9NmIpEIIBlz+GTlgG085B
hzj4MmgCLthC18+dvhaPv6BAxqp4tnJ6xKmQoWEeDDWQ+aB4d2xdbbS+Edbm8asi
9TZM9OxFWoxn+GGfh8Ml8Voo0/cVtJHv27AqOhxA9G+y6xtn7A/LfQZB1FNVtoF6
7/fCMC9TUYiouozXb251jPSzySh87g==
=jSxF
-----END PGP SIGNATURE-----

--hH4//zbcGvns4eLw--


