Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD2F30DFEB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:42:50 +0100 (CET)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LEt-0000vO-E9
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7L4k-0007kg-Oe
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:32:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7L4h-0003xN-Nd
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1HxJrfCGp0uazMXjy4IL7yhg7W9zzN/PPCbuvWCVMLc=;
 b=dDiLQPrUCJv4Q2W/L3dhCDZ2SgvQVP15SDDTaJys1JVTNuCOS37QrDKqgk25lOavP/k/q4
 CvYYYCa3D+UO2TieUv25BaTwIfA8U/GTlI1PVEjCPfkdiWJqJ1zQRAglZWFKGljsLKvtsD
 kV4I7zrbtlXwTspR/qEiwKliKJu7nvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-vr3iQduYNEycvaRLLssIaQ-1; Wed, 03 Feb 2021 11:32:12 -0500
X-MC-Unique: vr3iQduYNEycvaRLLssIaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8AF385B6C0
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 16:32:11 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 903EE60D07;
 Wed,  3 Feb 2021 16:32:08 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:32:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <20210203163202.GF241524@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
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

--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:20PM +0100, Gerd Hoffmann wrote:
> First version that actually works.  Only qxl covered for this RfC,
> other modules will follow once the basics are hashed out.
>=20
> v3:
>  - handle initialization of modular tracepoints.

Cool, this looks promising!

> TODO:
> Enabling modular tracepoints via -trace cmd line doesn't work yet.
> Guess we need to store the list somewhere for later re-processing.
> Error handling is tricky, specifically the "tracepoint doesn't exist"
> error.  Suggestions / ideas are welcome.

Two ideas:

Global trace event name list
----------------------------
Build *some* global information about all trace events, including
modules, into the main QEMU binary. For example, generate an array of
all trace event names so QEMU can always print an error if a
non-existent trace event name is used. (This is similar to the
trace-events-all file, which is a global list of all trace events.)

Module name prefixes
--------------------
Allow an optional module/group prefix like qxl:my_trace_event. When the
user says:

  --trace qxl:my_trace_event

QEMU knows that this trace event belongs to the "qxl" module/group. It
will not attempt to load it until the qxl module registers itself.

If "my_trace_event" doesn't exist in the qxl module:
1. If the qxl module is not loaded we don't hit an error. Nevermind.
2. When the qxl module is loaded pending events are resolved and an
   error is printed.

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAa0AIACgkQnKSrs4Gr
c8iokQgAmWg1eRLe6SyDD8mbj4+6x6Z4m7bxQFgJXxcg+Amk/ToetwzIj60LduGL
dyWD70x8DByOotfDdgzbRj4o0eUTHPU0F+fwhsrjai8ZhcHmG/51S+OmSd+UofP0
/fmsUL/PGtyGpQ4EeCJunSfv2ao8mqGxJ+WnwCDIg4tBxYC3QAvH3MBHRyY+gpNa
oojhT/m5wV7VPc4Xw91iejNWX2mOGxhxo10vEcKY0w4SQkpQqe4mfWq/MxREkyiz
9mk7RvncZmTcknfy4oJX3Y2+3b3iLBE6fx2/Az5EX4g3eiAHDVN/VUBq5d0pYSj3
GIqdDU2EcVLu9JQfSvfQpZb9Ny0yHA==
=7wUN
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--


