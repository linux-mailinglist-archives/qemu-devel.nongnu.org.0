Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D336512F50
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:09:57 +0200 (CEST)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk09s-0000wd-G2
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk05j-0007Uz-HX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk05i-0001iP-5M
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651136737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X3DVjtuhPGtEhKa5G0LcfXDUR8VyPTLml20Je8D0clo=;
 b=foGy5uXnr2OuwpwqhSpBTXapbzFn2DkOwW7txjVpI05E2ZscqwYMjNyoT0esSAhKSKj8TM
 x7/d5ZtrFP+hCID9bjZfebxmjPlb5mYdEJU+IbFNKUaP7bMsiT8mMJFCLTZj/5SELM7rj4
 nSz6WT9NF0upysnEeDYnhcstzDbCMFc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-GiCtdL8dPpSlBNkvfLUOKQ-1; Thu, 28 Apr 2022 05:05:34 -0400
X-MC-Unique: GiCtdL8dPpSlBNkvfLUOKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47E7C833961;
 Thu, 28 Apr 2022 09:05:34 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F152A401474;
 Thu, 28 Apr 2022 09:05:33 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:05:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH 2/6] virtio-scsi: don't waste CPU polling the event
 virtqueue
Message-ID: <YmpY3LotqYMnIivJ@stefanha-x1.localdomain>
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-3-stefanha@redhat.com>
 <CAMRbyyuQMstTZ75bwdb64wEf1oM3iYpKHTaBpPdnpHMnZ8+zDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Uekojc1htypdbjfD"
Content-Disposition: inline
In-Reply-To: <CAMRbyyuQMstTZ75bwdb64wEf1oM3iYpKHTaBpPdnpHMnZ8+zDQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Uekojc1htypdbjfD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 11:12:34PM +0300, Nir Soffer wrote:
> I tested patches 1 and 2 on top of 34723f59371f3fd02ea59b94674314b8755044=
26
> and it solved the issue.
>=20
> Tested-by: Nir Soffer <nsoffer@redhat.com>

Thank you!

Stefan

--Uekojc1htypdbjfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqWNwACgkQnKSrs4Gr
c8jhRQgAyI+IgxWxVnXSQdT2TysFtpCH3D+0Ir90QVYn7bcdcUVYcpAinlTBYGKa
OfqiHUBJVKAu2Xzd3XQCWCVTl1vSpFZLj4uDUWyvTJmiup7MfeeoSKJOm/vJmWay
jL9OL8jf0kgxp0+R8dtMS2cb4DmHCEpKY3W7EW8A/WBk7MALbyfjhBdmoEjbWpF/
8mjakQHAbb3nIJdDGqCPkdKFpteAZps9PIVM2vgIcAMZODN0UrH78sIkLsuxztpE
IItZCWpkto6numporCmXS0VhZrHhDX93GlqRX1NsT5CWDAOjGdvkDpU/qANYoxak
LMOE4hz2RqmGHgA7CsL2waH0Wizs3Q==
=2vFI
-----END PGP SIGNATURE-----

--Uekojc1htypdbjfD--


