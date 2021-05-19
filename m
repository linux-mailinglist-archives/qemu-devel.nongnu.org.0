Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3B9388C6B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:12:17 +0200 (CEST)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljK7c-0006eZ-9c
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1ljK6I-0005xs-Or
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1ljK6H-0007Dm-1K
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621422650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RJ6SS1ew5+1ZDxhFdL9zsIR3rXcKfB64BdP8bgJNrzs=;
 b=gEoXhonRdYg1KoOPmx1FNMQ0cKLGOSc9CF8afImtbnjRcI8XuTMNIrJ8mcJQqPz5pghsL7
 Vg3t4vFMGzlIs0r2dIWC01L7zmC/7HWc+JAob+q1kWCPUBkO22cv8KHwf5PfYescV9eClM
 5sv0yHTGP8vl228aBvsd5wb0/kjYZug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-Gm9VLnZ_O4mQ40_Rw4gaXA-1; Wed, 19 May 2021 07:10:46 -0400
X-MC-Unique: Gm9VLnZ_O4mQ40_Rw4gaXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3D80E7B47;
 Wed, 19 May 2021 11:10:44 +0000 (UTC)
Received: from localhost (unknown [10.33.36.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B19E6090F;
 Wed, 19 May 2021 11:10:44 +0000 (UTC)
Date: Wed, 19 May 2021 13:10:43 +0200
From: Sergio Lopez <slp@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: GSoC introduction: Rust vhost-user-scsi device
Message-ID: <20210519111043.wdfge6vrc4hhgjyi@mhamilton>
References: <250A3378-EA7A-4B8C-8FEA-10AD611F00FA@canishe.com>
 <YKTW/JztNA7w1Jup@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YKTW/JztNA7w1Jup@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d6yqtjm7f3qfiq6z"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Gaelan Steele <gbs@canishe.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--d6yqtjm7f3qfiq6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:14:36AM +0100, Stefan Hajnoczi wrote:
> On Tue, May 18, 2021 at 07:10:31PM -0700, Gaelan Steele wrote:
> > I'm Gaelan Steele, one of QEMU's Google Summer of Code students this
> > year. My mentor (Sergio Lopez) has asked me to introduce myself and my
> > project here.
>=20
> Welcome, Gaelan! I look forward to your vhost-user-scsi contributions.
>=20
> I'd like to follow your project. Will you and Sergio use #qemu IRC to
> communicate?

As this project has a relationship with both QEMU and rust-vmm, I
suggested Gaelan to join both the #qemu IRC channel and the rust-vmm's
Slack workspace.

Thanks,
Sergio.

--d6yqtjm7f3qfiq6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCk8jIACgkQ9GknjS8M
AjVBFA//emgYeAD2E0V69iGc62MatUfFL8ZbxOYZwOb2JvN9/uVTWEehaAJd5DHE
iLioKOjisJU/a2RFgkVXvoHp+ClskyFwz2Qtw5/Wu9468ObaPvuDaCd7N8FeJ7QR
8JQs3vHC1tk2tZbH7A4/6EM8utlHlR8Lhb8HECWlz0xIxdqEKyTDxS3v+tKdXzYM
wo6eASnwBzX9I8/vO0p9kp2EGDug7GZRA9a4W1eJmMX1dqti/pjHMy/O+rU1Bptc
dt2qMO8r1n8Ggfi8hljBlovGsAM3eCNLFmzf9O0Ta6BrCpkUmyFQHi13VY97SRy9
2BPQzkd/GR3vXqfTGhmkW85j1DS51bOh8tdFjD25Z+x0sYOwzlDzAMwxAEqR+89p
TSeiEY3DSo9JoeNWMfhzTeyT21nyiGrpwPq73nXyQ7AcBPUKRQKl0l+RnucgUbcU
Tls85Ln5TYge23aZs2PbrpkQC0WlA84yRQzSK+7F4Q3HXwbjac1LKmGtYepLvXZb
TyhGFIekZdK31r0TwTcn23cREei744y6ybjonpOcrqjVmdwnIGa6lmka7cOn53s5
F2HyoP7Lug50Y0FmcdAGvvvfyeqlwJ0+KY4GSCD2PHLIVMHRlA4cxVa7xxFyDCh0
ux3XKFew5iQlPqOggc2YjK+w4I6+sO+iOcEwD+yVsbQ/4xgWRl8=
=JTFz
-----END PGP SIGNATURE-----

--d6yqtjm7f3qfiq6z--


