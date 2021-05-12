Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B898F37C9EB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:50:13 +0200 (CEST)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgs3o-0001ZY-KY
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrxC-0004BY-Fl
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrx6-0003pg-VM
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620837795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pg4WWR11+C6QB+MmPuxnZ598tg/zCDGTZGEyuSvhc/Y=;
 b=CGXrmtpzzGDgER6whAVei1ETUnQ7hf7y2vlD+IPTwQ/86fRTa+6tBPnJoJclo0GWzL2+fF
 3x1iXYIoOQWdwgafil0PyC63JfcOm4r6Iyrz2oBX+wQCkZXkHtjCDBJKDgfoehIfZacCSh
 cW4CA3jFuOxhCVKYR6O7JEppFzKbcSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-K9WShe7NP7eNzkbdH3uexQ-1; Wed, 12 May 2021 12:43:12 -0400
X-MC-Unique: K9WShe7NP7eNzkbdH3uexQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 058B31012D92;
 Wed, 12 May 2021 16:43:11 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82E1460CE6;
 Wed, 12 May 2021 16:42:59 +0000 (UTC)
Date: Wed, 12 May 2021 17:42:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update
Message-ID: <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FF8oNhgXYx8kkWYd"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FF8oNhgXYx8kkWYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:
> Provide the cprsave and cprload commands for live update.  These save and
> restore VM state, with minimal guest pause time, so that qemu may be upda=
ted
> to a new version in between.
>=20
> cprsave stops the VM and saves vmstate to an ordinary file.  It supports =
two
> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (=
or
> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
> paused state and waits for the cprload command.

I think cprsave/cprload could be generalized by using QMP to stash the
file descriptors. The 'getfd' QMP command already exists and QEMU code
already opens fds passed using this mechanism.

I haven't checked but it may be possible to drop some patches by reusing
QEMU's monitor file descriptor passing since the code already knows how
to open from 'getfd' fds.

The reason why using QMP is interesting is because it eliminates the
need for execve(2). QEMU may be unable to execute a program due to
chroot, seccomp, etc.

QMP would enable cprsave/cprload to work both with and without
execve(2).

One tricky thing with this approach might be startup ordering: how to
get fds via the QMP monitor in the new process before processing the
entire command-line.

Stefan

--FF8oNhgXYx8kkWYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCcBZIACgkQnKSrs4Gr
c8jYEwf/RBGnLt9skKOND2VsaWoKPVv4sSj8SdRpe4n9O5Cv5Rcy5wy7hmAZejOn
PSw6XW9guwfCYbYwED+H6x+XV9TZ68/27awcQ+XGtiCOuV2it97Q9SXecFr18whz
j8XmxkRVq4VuY4SSf6s9lk8Pzahh+wQtExV3C0kY7Qommm93Dn/Ynk0Nvu/tUD0O
gQEkDJzV1WRB+Vp/iSnYhdt8NUBickbQcB1LDYiDSLYpOG2Cb3xw1Ec6oPqS/FUE
oYax8ovgQ9BoLiywY73yYrLi5VbNO39laZYxPpRADOGLs7UcJGzkTGUIURfhyylM
93d16OMcuknXvuA/Dq0PXkHPuW+hTg==
=AB/s
-----END PGP SIGNATURE-----

--FF8oNhgXYx8kkWYd--


