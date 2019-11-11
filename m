Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13149F78D2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 17:31:27 +0100 (CET)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUCb7-0006N0-1n
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 11:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iUCRm-0005in-9n
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iUCRl-0003Jw-8s
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:21:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59408
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iUCRl-0003Jf-51
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573489304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=olu6X+f7cBSJJtezAfharfp+tvEfViynwT3zaJwaAek=;
 b=WOUABWHakfYqIvlqL0X/JbHwjaonlq5RQExPAgDzR3v9WpsDNOu5Sz6sk8nNZhqswnclVR
 5bMzCWYPj/auv5WLEo/udb4Ub0qSw+dBKzTAMopY6Vj9wkmMjR7l4m5GG7d3BgFSSvkYkA
 qaukq8/Ey20C08TaW7AWEngIOn0PPds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-y14W_-62PSGWyQwnoNVqjw-1; Mon, 11 Nov 2019 11:21:41 -0500
X-MC-Unique: y14W_-62PSGWyQwnoNVqjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75626186923B;
 Mon, 11 Nov 2019 16:21:39 +0000 (UTC)
Received: from localhost (ovpn-117-169.ams2.redhat.com [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2C254145;
 Mon, 11 Nov 2019 16:21:33 +0000 (UTC)
Date: Mon, 11 Nov 2019 16:21:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [RFC v4 PATCH 32/49] multi-process: Use separate MMIO
 communication channel
Message-ID: <20191111162132.GI402228@stefanha-x1.localdomain>
References: <cover.1571905346.git.jag.raman@oracle.com>
 <b2594fdefb278f890762d12639524c4db7667393.1571905346.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b2594fdefb278f890762d12639524c4db7667393.1571905346.git.jag.raman@oracle.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HuXIgs6JvY9hJs5C"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, thuth@redhat.com,
 john.g.johnson@oracle.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 quintela@redhat.com, berrange@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, ross.lagerwall@citrix.com,
 kanth.ghatraju@oracle.com, kraxel@redhat.com, kwolf@redhat.com,
 pbonzini@redhat.com, liran.alon@oracle.com, marcandre.lureau@gmail.com,
 mreitz@redhat.com, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HuXIgs6JvY9hJs5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 05:09:13AM -0400, Jagannathan Raman wrote:
> Using a separate communication channel for MMIO helps
> with improving Performance

Why?

--HuXIgs6JvY9hJs5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3JiowACgkQnKSrs4Gr
c8h6KwgAtrUp0+pY9jpAbzWucliqTKHODDubZrwiHX5/cqCHFlCgYHKAFJSNOElY
zaUMGcnku+GzDi7k2fEo5XE7rfdAEsANXQMkriFLasqDwIXrAMivcojSgREd+jY2
MFP+CwRJV2NcJ1foNpkPMrMT6YQWtAsiPz9R1UXRMD+anbCd10MmSV+aYP+q3n1X
7lBtjN7lo01b726JvJGnKf2zpmq11azdAflrPSSnqCXXskIV+lWIpEo3hSjiOd3b
3gF19pplhICzDuuKOL6/7cWQdsNmg1vBt/48J74CXKYKluaos5LdLqQtO9l6LzlV
opwBPxN+9kxA8+gokPLAooRTcCdXcQ==
=UhwM
-----END PGP SIGNATURE-----

--HuXIgs6JvY9hJs5C--


