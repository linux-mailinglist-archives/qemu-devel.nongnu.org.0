Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA743B354
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 15:43:39 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfMjq-0003Us-4b
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 09:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMhn-0001PC-Qr
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMhk-00024P-P5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635255687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VCs+Q+D/fCaqL1U4ipxOp1MLN1RaMnC0nj2Y3Iuhb4=;
 b=VmvfWuSCxKnL0gaCxrANTADFwjVN+cRUE5l0lTR/BS4WC7iyQTLTeWJUdGwoSo5vUTHGJu
 nvNLjpckxXER/YX014xLi9VKYhqN/qOlYDkD0CXmgl87/JAZcyLu6tSZjmKDVuc73FGFtK
 sEve2gN0iTBNYHnRIojWjy5katikKKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-uQjB71AJNv6c13lW7EUjbQ-1; Tue, 26 Oct 2021 09:41:25 -0400
X-MC-Unique: uQjB71AJNv6c13lW7EUjbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8515050752;
 Tue, 26 Oct 2021 13:41:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29C7560862;
 Tue, 26 Oct 2021 13:41:24 +0000 (UTC)
Date: Tue, 26 Oct 2021 14:41:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXgFg0aHtvXNorUS@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
 <YXa7zMZG2saNHInI@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXa7zMZG2saNHInI@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aKn1vK3xF+mGyVgl"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aKn1vK3xF+mGyVgl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Actually, nevermind what I said about the callback scenario. I don't
think that is a problem because the compiler cannot assume the __thread
variable remains unchanged across the callback. Therefore it cannot
safely cache the value.

So I think only the header file scenario is a problem.

Stefan

--aKn1vK3xF+mGyVgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF4BYMACgkQnKSrs4Gr
c8i7ZQf8C2oIBocHebdmbES0le2I5/L5gz39txwMP0+ocXV4u9fvoFq6LH8MH9VE
R4deDiBvV98cvIz3YsiXTSqO3dxZuvjeklJpNVg7/BkgkjMbfzftLeXcHKTZS1y7
CbuZXd06z6XXLp7BMXCItESuRWBuLVeS6fKKz9XIR+aetQz0le/YPYn6i7VdZg8t
aangfQV5XdB3/HbWrKdMSG+sRdE14lJg1LtVy0/vq1MnNveyJWNE81b8RDgwVrXQ
GxxvKmt8eZkuyyFMOnFNq5S3/401IHxt8aHY2xF6G8USZZ3F4p1eZYvJFjmP3wRC
zetnYqC5RY9lmAPHXU9GKIfG9Rh+ug==
=p39+
-----END PGP SIGNATURE-----

--aKn1vK3xF+mGyVgl--


