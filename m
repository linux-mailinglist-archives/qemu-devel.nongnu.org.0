Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9547924A142
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 16:08:16 +0200 (CEST)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8OlD-0005XR-4i
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 10:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8OkW-00058X-J0
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8OkT-0005n0-St
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597846048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MwF9GF+8FyvNaeQ3PLC4//yt1hnoRiP3I5Fwa7QmUFM=;
 b=TYLMIo2YjvCABMuKmso0u0PwYPyLiQIliq1h8PkNBAQVczPKyr3vD6BaogoOHJcVviSF3X
 HAMnHdZFRJCDj0Fmh2x/R+9yaZDI47vKUC6YjzzouZcDFTpPJQuF8oxaoO3aNzjKviB0hi
 G+xBmEDTHxv5cfuCiM+BI2bMFpe1L4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-yszqqC2-O5K5tFyFv-gOlQ-1; Wed, 19 Aug 2020 10:07:25 -0400
X-MC-Unique: yszqqC2-O5K5tFyFv-gOlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB196186A568;
 Wed, 19 Aug 2020 14:07:24 +0000 (UTC)
Received: from localhost (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8BEA1002391;
 Wed, 19 Aug 2020 14:07:20 +0000 (UTC)
Date: Wed, 19 Aug 2020 15:07:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2] memory: Add trace events to audit
 MemoryRegionOps fields
Message-ID: <20200819140719.GB366841@stefanha-x1.localdomain>
References: <20200806152613.18523-1-philmd@redhat.com>
 <d87db8e9-40b1-334d-22b0-90674ddf8177@redhat.com>
 <161c9d87-677b-6806-b080-4aebfd5275c4@redhat.com>
 <20200819091417.GA357031@stefanha-x1.localdomain>
 <0134a5c1-dabb-76cf-a08c-c6ecfbe4af5b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0134a5c1-dabb-76cf-a08c-c6ecfbe4af5b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 10:07:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 12:10:20PM +0200, Philippe Mathieu-Daud=E9 wrote:
> But for now I'm not sure the check has to be enforced, because I'm not
> sure what we really want to do. First we need to figure out the 'bus'
> component of a a MemoryRegion (where it sits), as it affects the
> MemoryRegionOps possible range values.

The natural place to enforce bus-specific constraints is when
MemoryRegions are registered with their bus. For example,
pci_register_bar().

SysBus devices need to specify constraints manually since there is no
real bus emulation.

Stefan

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl89MhcACgkQnKSrs4Gr
c8gG4AgAlVVLaFiAeiehUBAZPindClW2tCZWb42ZB6ZqTr35j3Ol/XLjDNBzwPCK
RzoF3QbRY/pUjmmj6MSiW1DOlLAvQTfIKBe4XIft/hHePsGJyLgJgkg0ox+mMMCd
3AGs7qDvqVdiuJS7fhDIVCIO5wmo3vQNmDhylztNixp5Q1tDPtOW9OWGzMZl1gwZ
P2LRJjlTLmc6iAokiN3f7JY3pWl1LdnN/oqwdDNQLrB8Nglp2/1zWNHj7vmYpy2D
4DSrMEcHSkI/EoaXzB1TAH0/X0FxulLZ1vdglKwqc+kCgNyW/fgyLQrIIj5vAgWi
JvPfugsZTdCqrwk5dj/BdS/Aqo33fQ==
=Vmv3
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--


