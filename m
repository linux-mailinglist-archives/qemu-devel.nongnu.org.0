Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6830DF80
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:18:19 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KrC-0001c4-Py
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7KlS-0004fC-4f
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7KlQ-0007nu-Jh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WFFElJhbj+k+/bG7WCqbrB+XfBVMbaaeRTR3iK7UrJs=;
 b=SdZR8MridqeEmHVw8OItVJabYwuqcXpnrtvBKWVQ5qmXjGrXGI1QlRyZURXSnEa9rzoDos
 cfqexxOnX7fE17ispe9myueK72FdPXdT/zZxQCpGcd5HzcLjrnni5KM3YCgdVwR6Dm61SS
 TzDN07FpjPdeUtky9aNQIg1s6hQnvFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-aog4uAYpPsujYljt3cL5Mw-1; Wed, 03 Feb 2021 11:12:03 -0500
X-MC-Unique: aog4uAYpPsujYljt3cL5Mw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AA336D4E0;
 Wed,  3 Feb 2021 16:12:01 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDC0D71C80;
 Wed,  3 Feb 2021 16:11:51 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:11:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v21 00/20] Initial support for multi-process Qemu
Message-ID: <20210203161150.GA241524@stefanha-x1.localdomain>
References: <cover.1611938319.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2021 at 11:46:01AM -0500, Jagannathan Raman wrote:
> This is the v21 of the patchset. This version has the following changes:

The docs/multi-process.rst file caused Sphinx to fail with "document
isn't included in any toctree". I moved it into the system emulator
documentation to resolve this. The new path is
docs/system/multi-process.rst.

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAay0YACgkQnKSrs4Gr
c8iI4wf7BsVfUZga0hgU8KqxYKLoDm0LmdkhPIa4emk5H2ManKQUEeWS659mfosv
sPZGe1QlQkTpBo2RnytuqEvN1fIPabwmZmAGosYsVIBDEfMjOFBLgIEg5HxwioGR
/o45/MRYsDvYxpKFV14fvwd6IgB43e/g4hyMEozFIQ4sJ5hEjcAqwrq5smpxWner
oc8IX0LloDdaq/0hVX1ch/vaVOPmTZ9ybAuT1hYIGZyeFlSqnUHMKbgaPsBx4DMB
X9+qn1dmt+sxWWTi+puyRGFwPcTt5vmAQxKpGib1eNDRJEZ7LZKJkKMhx+kwMAR7
MHRU6ptoRgmfE9Wsz5Vhitika8RNWQ==
=j/k3
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--


