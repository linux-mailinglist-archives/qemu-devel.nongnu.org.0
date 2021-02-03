Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5030DF6A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:15:14 +0100 (CET)
Received: from localhost ([::1]:37824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KoD-0006f4-0b
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7KmJ-0005WO-Oa
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7KmH-0007us-Fs
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yZA+V2pLqfFcbNeB+gg1gQVoVcshBWNAkea7rpkgWtc=;
 b=dI9smC4nz3fLDo4FS4s5Jl2Wvg4P2qvGfjbXMPXSLYJFH1CUabbiUYeUR533lujrfYVY9i
 9HLzuvzJM14sd4E/bfJ0WyMpv0Aiwbpiiio17TOPCaLEKTuFC2USEQMaO/9My/xo0eM8dr
 UxL8v7Q68kMRG2AYqCkPlhmgr0Hjh5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-anCT5JAmPJ-dMh-o8xXqhg-1; Wed, 03 Feb 2021 11:13:09 -0500
X-MC-Unique: anCT5JAmPJ-dMh-o8xXqhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA670107ACFB
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 16:13:08 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8122639A63;
 Wed,  3 Feb 2021 16:13:05 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:13:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 5/8] trace: iter init tweaks
Message-ID: <20210203161304.GB241524@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-6-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-6-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:25PM +0100, Gerd Hoffmann wrote:
> Rename trace_event_iter_init() to trace_event_iter_init_pattern(),
> add trace_event_iter_init_all() for interating over all events.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  trace/control.h        | 17 +++++++++++++----
>  monitor/misc.c         |  4 ++--
>  trace/control-target.c |  2 +-
>  trace/control.c        | 16 +++++++++++-----
>  trace/qmp.c            |  6 +++---
>  trace/simple.c         |  2 +-
>  6 files changed, 31 insertions(+), 16 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAay5AACgkQnKSrs4Gr
c8hjqggAiHZQA73Mtv1k2WPb6eEwkfYWY2/r6v/X69nP1sHT5z/AjlFTyIANI2w1
DIS33IbW883heczuB565Pk/G+WzmACYH13fvl5ANZYN5DxLD1JUcpQe8H1A/kSKD
6JaQaTRjurEKHiWQ/KuBPNi1Bgkyl63uYw3f1LmzWm+CkFZjdmV2B1fD9NeKJzHj
5fKun0BbYRSfbjjPOydnteu1cYGZYzN/kyh1/enrBPIHmNHyvJ9TKKXu5Tcd71HS
FJMUZNK4Y9hTjbU2iIwczB0hzhRv0V2zC12v9Bf/v+iO8z12DSLxHuXHYcsq5Txj
0NYlQzQtQ/WCxo1hx3wGtCIfejLPuA==
=zPWx
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--


