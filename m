Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94D2DAB62
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:50:06 +0100 (CET)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7u9-0002KY-HQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kp7qT-0000Cm-8y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kp7qQ-0005Fj-Oo
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608029173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K14QTVhBQ3CE0WtoVDXFvq0t/xG37r+Bnj0ZERpeQJo=;
 b=ejr1O7l9deZQAdTAPgyzmnwOc65xc57tP9N/iAkmwBVDeQFoHpwA63oHuENO51tIz+N23w
 MIzVMlcUBmUAEASSNYnTgTP6kPZxbSqAI6cLrZAQGlSbUfFLyDhjmwuZMzhLMPSBxZuaWi
 zqMkmzJlw4fxTinEQ9NAvYccAyZnclE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-Gt58ArBNNF-zYz0SDxfvyA-1; Tue, 15 Dec 2020 05:46:09 -0500
X-MC-Unique: Gt58ArBNNF-zYz0SDxfvyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F562107ACF7;
 Tue, 15 Dec 2020 10:46:07 +0000 (UTC)
Received: from localhost (ovpn-117-148.ams2.redhat.com [10.36.117.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC96610074EE;
 Tue, 15 Dec 2020 10:45:56 +0000 (UTC)
Date: Tue, 15 Dec 2020 10:45:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v13 00/19] Initial support for multi-process Qemu
Message-ID: <20201215104527.GA677211@stefanha-x1.localdomain>
References: <cover.1607922214.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:14:40AM -0500, Jagannathan Raman wrote:
> This is the v13 of the patchset. Thank you very much for reviewing v12 an=
d
> sharing your feedback.
>=20
> We have addressed all the comments from the v12 review except for the
> following two items, which we will be addressing in subsequent patches:
> - Prefix log messages with PID in the logging subsystem.
> - Refactor vfio-user and multi-process code to avoid logic duplication.

Aside from the missing ./configure option needed to easily compile out
this feature, I'm happy with this series. I think that should be solved
before merging this patch series.

The series passes Gitlab CI.

I have not run multi-process QEMU since there is no test case or
launcher. Please send a test case as a separate patch series.

Stefan

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Yk8cACgkQnKSrs4Gr
c8g62Qf+LKYk5+Ulp+kQKdKmcdk6aArhEPfeLmKIpNvPXE7v0ICYMgXyC3f4koYS
yRH2ZSO6fpAXEHtdzoYffCJ4hgrom0eXLJTo7GcFXmbYYLDZwc3TeDzv2OvN77/o
qZWFIO7rtpWaW/L0cP7dmrLuB6DgMUDDd6BTebhz1PT2ZNkUDa0QJBIPMKB1IF0S
g6zr8JNE7cjdb7uIaAoNq4FnaSHc9RTc5+TWkbIRTTwuEzYxtDWQbdUP13ZgDyNk
d8N0fGNzhso77GQq7fhjPxzOybH+npbz2jTxM8SNu9rkwyQLX9mwW9A8kO42f9Xc
yAe3+a9RGsccVMVQKtAXICk2b1q/Mg==
=qZHq
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


