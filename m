Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65097268E01
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 16:41:23 +0200 (CEST)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHpfW-0005A2-G7
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 10:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kHpJA-0001kW-Tc
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:18:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43525
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kHpJ6-0000kY-GK
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600093091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oETInUiFWpxHf215yFoCpZHKJLSv7N4yWD2WVpGTVKU=;
 b=ezRiYeMNtXU8BE58hfni8QsV+14RGhIYke7+933n7+NjfFiomKSYu4b1o4y1WosVEvOAub
 CiWx07FvA5Gh8qkiD8LGYsyAujIdi09uNINgwTmQjbX9lmmjfE6/Mb4ua5QWKsAQedGyDM
 aj6PQSCmqEc4SbBqmsdJZ1f/uu8lJ1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-_KYfvAvuOtmWAJ03XzDVvg-1; Mon, 14 Sep 2020 10:18:08 -0400
X-MC-Unique: _KYfvAvuOtmWAJ03XzDVvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C3F801AC2;
 Mon, 14 Sep 2020 14:18:07 +0000 (UTC)
Received: from localhost (ovpn-114-32.ams2.redhat.com [10.36.114.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A51FD7B7B9;
 Mon, 14 Sep 2020 14:18:03 +0000 (UTC)
Date: Mon, 14 Sep 2020 14:44:42 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3] checkpatch: detect missing changes to trace-events
Message-ID: <20200914134442.GN579094@stefanha-x1.localdomain>
References: <20200811081158.4893-1-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200811081158.4893-1-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ztcJpsdPpsnnlAp8"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:33:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ztcJpsdPpsnnlAp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 10:11:58AM +0200, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  scripts/checkpatch.pl | 48 ++++++++++++++++++++++++++++++++++++---------=
---
>  1 file changed, 36 insertions(+), 12 deletions(-)
>=20
> v2 -> v3 :
>=20
> * move the check for missing changes to MAINTAINERS and trace-events
>   later on, as otherwise the check for in_commit_log will not be done
>   on an up to date value, causing fromfile and realfile to not be set,
>   and matching unwanted strings inside the commit log.
>=20
> * Ensure that at least one file name is passed to grep.
>=20
>=20
> ----
>=20
> v1 -> v2 :
>=20
> * track the "from" file in addition to the "to" file,
>   and grep into both (if they exist), looking for trace.h, trace-root.h
>=20
>   If files are reachable and readable, emit a warning if there is no
>   update to trace-events.

This patch still has an RFC tag. Is it ready to be merged?

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ztcJpsdPpsnnlAp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9fc8oACgkQnKSrs4Gr
c8jxzAgAxOFwyZPSvrhGQ5+i6Paxn/jSRZkgRRxKduQKOkRQuZ7NbLRqL5YBcmUq
sB3hqxLXOIy7Q91xM02zSf02qXxVRckGBIrtxrcvCCj3eJXFlj/EIQI0ius62T3p
3gH7H75LfBScJod1twGplSmMtpp/u+GarrqFKSj2909ETBtpzOjymNH2lA0J8Y3A
gt2FgSbLf8d2GijeSCcM4ln1Qz3Js0VCFjYf9EcOr3ky7uubzDx/pLHfS3UNZZEs
8qpJdXW6rLSK6e4DNjRRl6FoUhQmQGTGlhaxckdPvYNJpUKz7OOjfZddUlWuVmgm
qMbEgRn7uNrbF4VoIocFx923kvBqhQ==
=awgG
-----END PGP SIGNATURE-----

--ztcJpsdPpsnnlAp8--


