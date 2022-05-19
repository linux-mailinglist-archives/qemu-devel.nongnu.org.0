Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E752D32E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:56:34 +0200 (CEST)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfhh-0005l7-2g
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nrfdo-0004Kt-5g
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nrfdj-00086W-Su
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652964744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCZK8Jq8LxXt+dZVbiz16itIrrFwWL7SjKWrqb7Gsu8=;
 b=PEUCUL7IKVwo37ENc0glgX27Ny+8d35/FYxMFttIkZge9b5BjPIKSts3uQPgZ5JxCLFIx+
 2hZh7L9DCQGWSQbM8U7KuytanzuT94Lu/K7ttFtSWs86biMRQhWkZYzqbKycna5d8LPSxK
 lJbX/b38rRzjBlA3UQrMVkal2bPya0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-4aAC_a8DMLaBG0SyOIIXwg-1; Thu, 19 May 2022 08:52:20 -0400
X-MC-Unique: 4aAC_a8DMLaBG0SyOIIXwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66AD985A5BA;
 Thu, 19 May 2022 12:52:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD782166B25;
 Thu, 19 May 2022 12:52:18 +0000 (UTC)
Date: Thu, 19 May 2022 14:52:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YoY9gbDm9CBRYm1m@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
 <YoYpjVdPcIDyd7i+@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iVZjRYF2OtjL5dmr"
Content-Disposition: inline
In-Reply-To: <YoYpjVdPcIDyd7i+@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--iVZjRYF2OtjL5dmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 19.05.2022 um 13:27 hat Stefan Hajnoczi geschrieben:
> On Wed, May 18, 2022 at 06:14:17PM +0200, Kevin Wolf wrote:
> > If we want to use drain for locking, we need to make sure that drain
> > actually does the job correctly. I see two major problems with it:
> >=20
> > The first one is that drain only covers I/O paths, but we need to
> > protect against _anything_ touching block nodes. This might mean a
> > massive audit and making sure that everything in QEMU that could
> > possibly touch a block node is integrated with drain.
>=20
> > I think Emanuele has argued before that because writes to the graph only
> > happen in the main thread and we believe that currently only I/O
> > requests are processed in iothreads, this is safe and we don't actually
> > need to audit everything.
>=20
> I'm interested in the non-I/O code path cases you're thinking about:
>=20
> Block jobs receive callbacks during drain. They are safe.

We've had bugs in the callbacks before, so while they are probably as
safe as they can get when each user has to actively support drain, I'm
a bit less than 100% confident.

> Exports:
> - The nbd export has code to deal with drain and looks safe.
> - vhost-user-blk uses aio_set_fd_handler(is_external=3Dtrue) for virtqueue
>   kick fds but not for the vhost-user UNIX domain socket (not sure if
>   that's a problem).
> - FUSE uses aio_set_fd_handler(is_external=3Dtrue) and looks safe.
>=20
> The monitor runs with the BQL in the main loop and doesn't use
> coroutines. It should be safe.

The monitor does use coroutines (though I think this doesn't make a
difference; the more important point is that this coroutine runs in
qemu_aio_context while executing commands) and is not safe with respect
to drain and we're seeing bugs coming from it:

https://lists.gnu.org/archive/html/qemu-block/2022-03/msg00582.html

The broader point here is that even running with the BQL in the main
loop doesn't help you at all if the graph writer it could interfere with
polls or is a coroutine that yields. You're only safe if _both_ sides
run with the BQL in the main thread and neither poll nor yield. This is
the condition I explained under which Emanuele's reasoning holds true.

So you can choose between verifying that the monitor actively respects
drain (it doesn't currently) or verifying that no graph writer can poll
or yield during its drain section so that holding the BQL is enough (not
true today and I'm not sure if it could be made true even in theory).

> Anything else?

How to figure this out is precisely my question to you. :-) Maybe
migration completion? Some random BHs? A guest enabling a virtio-blk
device so that the dataplane gets started and its backend is moved to a
different AioContext? I'm not sure if these cases are bad. Maybe they
aren't. But how do I tell without reading every code path?

Well, and the follow-up question: How do we make sure that the list of
"anything else" doesn't change over time when we rely on auditing every
item on it for the correctness of drain?

Kevin

--iVZjRYF2OtjL5dmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmKGPYEACgkQfwmycsiP
L9bgcQ/+PEl/x3DUK8VUHOv8sXIALmsa61C247e9kAKvP79Smum8B6Sqss9Sctfw
/0nui/slRj/1fhyL2GkhkVTq5kS4kbQufigElkRkLLRntxEAes2PaZ8FA2/hFRTg
hY1WB2Ksh5oFozqpxRF5Z7Ec7oZ72bY3x2YBY4F8bDl8K5zBFu2K8qBwhMP16oo1
BzCv2qh+dSg//JG+Ssr4pO7TVa60wO2lOwfHPXadIaWV49E+8Cut7a3sPeSrvDEe
TWGsmH+TJJ5U+5G9Vjh49laf5QroXof474/JM/gHMZ80X6xYJUusu0PB4kINR/76
Jbup5+Suq+31gOfNBFDcfAZ4DH7Ew/xSKSEqIl6QdYAN33g3FXFA3XjRrunsnMaH
SD1vAjyNoF4AY6OSNknxnTvYdNw5vL562IgDC9CJPPTpe/F89Jb59dowA6M3puVF
pZsuSP3r7e2nVxBZNNjge0k3uuV8clWRuy+tEE2usPlM5zf0NUD4s8kURvMZyRWY
o9g3NGeTRT5K2lPOtWsMiba6HHr2+QsKP2wtq2sdjo+vWjC3YjHVPkCGm3WohElo
8B2eRvzCsciN1s/KMslD0/zJ51VmP8M3MB0AOaXyrqU+lbev0aRZneW8/fII3SBJ
CmpqtOhz51L0Jsfpmi52//xIZC9DKIRprLxUAfH5ooHQiFzTET0=
=bpQd
-----END PGP SIGNATURE-----

--iVZjRYF2OtjL5dmr--


