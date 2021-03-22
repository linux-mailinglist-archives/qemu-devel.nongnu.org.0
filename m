Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B376343FFB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:38:51 +0100 (CET)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOItW-0000xW-9E
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOIra-0000IK-5k
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOIrY-00048O-EX
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616413007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KzL2NYi8DOqKR+7PCpNLJLmX6lm5yOIfQT3MyS83lTM=;
 b=hCXBpdKL2aGt3IqPGRCR/jqaCxDYfESXSK2cFuSH4CrFy7MIAvtXA8d0UkG3CfosXErgC8
 40hihW+DdaurHNNoZEICE9vKp39tsed69/Y9666XaWe+KTQ3HwfEFq0akdhtryLpyW4Qw6
 PTcXZFM95LifF4Gg0bGHpQ0/lgoVZus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-tOnnJekUPj-Iz-560pL32g-1; Mon, 22 Mar 2021 07:36:45 -0400
X-MC-Unique: tOnnJekUPj-Iz-560pL32g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FC4B10082E0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:36:44 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD05160C0F;
 Mon, 22 Mar 2021 11:36:40 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:36:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <YFiBRyV3DCMTWC+4@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PDqJfmEiFVFq6jYr"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PDqJfmEiFVFq6jYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:13:32PM +0100, Gerd Hoffmann wrote:
>   Hi,
>=20
> > > TODO:
> > > Enabling modular tracepoints via -trace cmd line doesn't work yet.
> > > Guess we need to store the list somewhere for later re-processing.
> > > Error handling is tricky, specifically the "tracepoint doesn't exist"
> > > error.  Suggestions / ideas are welcome.
> >=20
> > Two ideas:
> >=20
> > Global trace event name list
> > ----------------------------
> > Build *some* global information about all trace events, including
> > modules, into the main QEMU binary. For example, generate an array of
> > all trace event names so QEMU can always print an error if a
> > non-existent trace event name is used. (This is similar to the
> > trace-events-all file, which is a global list of all trace events.)
> >=20
> > Module name prefixes
> > --------------------
> > Allow an optional module/group prefix like qxl:my_trace_event. When the
> > user says:
> >=20
> >   --trace qxl:my_trace_event
> >=20
> > QEMU knows that this trace event belongs to the "qxl" module/group. It
> > will not attempt to load it until the qxl module registers itself.
> >=20
> > If "my_trace_event" doesn't exist in the qxl module:
> > 1. If the qxl module is not loaded we don't hit an error. Nevermind.
> > 2. When the qxl module is loaded pending events are resolved and an
> >    error is printed.
>=20
> Finally found the time to look at this again...=20
>=20
> So, we already have a "group".  Which is basically the sub-directory of
> the trace-events file right now, and it seems to be mostly a build system
> thing.  We get many small lists instead of one huge, but there seems to
> be no other effect.  We could change that though, by giving each group
> an (optional?) prefix.

Yes. This reminds me of an idea that was mentioned at the beginning of
this effort: maybe QEMU modules should always have their own directory
in the source tree instead of being alongside other source files that
are built into the main binary.

> There also is a probe prefix, apparently used by dtrace only.  Not sure
> how to deal with that.  It prefix is qemu-<target-type>-<target-name>.
> Giving qemu modules its own dtrace prefix looks sensible to me.  That
> would probably something like "qemu-module-<name>".

I think the DTrace prefix needs to be the same as the executable name,
but I'm not sure. I also don't know how that extends to shared libraries
like QEMU modules. I'm afraid you would need to investigate the DTrace
prefix.

Stefan

--PDqJfmEiFVFq6jYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYgUcACgkQnKSrs4Gr
c8jYSwf9E7Wpj2cZG//PXIrCFAV3I8ESLDRqqjeyzwv0PgmSSJlya6CusEQoyB17
AzF0bTWvglNndm+lQe4ByMqHXAAdwyQSTCXJOmSUY5wCmQMgQZUbYxfDBI4qW8el
LqMh+W8814Lh7e5etKsqmOT8f8nVkyVN4pbQK+secs8omZRgBYeUzCGy5rgZXPqp
KytvdP1rW+i1Ih0JMtdzUP9XEj2/M7QrliwHS5rWh1TWFauGpYytZzkReGtEJWf3
ur5U6Pj79MKD+ZWqgru4Ff/AgWah9uE1FvDTfNZsTHcxysYQXfBGoUnvjEytBdmV
x5jiXysemKTRsHBNiYsD1qGZuG9qqw==
=nMVc
-----END PGP SIGNATURE-----

--PDqJfmEiFVFq6jYr--


