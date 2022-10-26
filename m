Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A859E60E7E5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:00:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlci-0005cf-RP; Wed, 26 Oct 2022 14:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcc-0005M9-Jj
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcb-0006zj-4h
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ijru+VJFsKj1N40mOJoRAKg3aPmIPrlScgJiNFhrggk=;
 b=HFmEj8Lkhwf+4ptLFvTQoKuEQvIOT4hbB+RIIV535JzB84iwVBMRQyAWXyD7M4ROhs1S7H
 U/kWWg08VW2zoWqt0hW6xtPBOzRZpYmi+SzvzTq7lkcK7O6aaqrRUUdheBQLjpeUmC3frZ
 LiIqW/6LOXQ7TeJX1j2TwbDKDCRtx7g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-ez9fBI9oPeOKnkp2CD7ZaQ-1; Wed, 26 Oct 2022 14:59:21 -0400
X-MC-Unique: ez9fBI9oPeOKnkp2CD7ZaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C6F43C1022A;
 Wed, 26 Oct 2022 18:59:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0CCBC15BAB;
 Wed, 26 Oct 2022 18:59:19 +0000 (UTC)
Date: Wed, 26 Oct 2022 14:54:49 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL v3 00/11] Dump patches
Message-ID: <Y1mCeeSp/z0c07jg@fedora>
References: <20221026085540.254253-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+dl6JfLYdag99qWY"
Content-Disposition: inline
In-Reply-To: <20221026085540.254253-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--+dl6JfLYdag99qWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--+dl6JfLYdag99qWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNZgnkACgkQnKSrs4Gr
c8hhSQf+I73IbBPHd/CFUREc9bONftIubyorwRKG2nCvtMkrFS2e8oGRGycqRcoQ
e3NasXLwlqfavXPFZHu9G8UkYrwS+0LQZYBHlgiQxYYFvXYPize1FWTSDSgW2/Ed
pZ36CxNDW2C6S4MJat60GyXX0k9Qd42CCsAd6cvzoyzIgfNP8Wx1i513zuu8tm5J
76ku2wZQ0UbUUMMlwb/q5+SkK58NhTAyReHAxY7cuhy63slNFRkrvV+YMLaKLeSo
jN1hZs0YBEDluDBio0eIhJvdlx2LhCDWtlqUoWVtaL0IjZ1QFwhUg6YSFOd/fTJb
79xUqgKD26B/TG4CZLhUtk11XK4v/A==
=lopW
-----END PGP SIGNATURE-----

--+dl6JfLYdag99qWY--


