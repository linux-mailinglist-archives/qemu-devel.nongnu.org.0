Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB227AB05
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 11:44:33 +0200 (CEST)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMphw-000304-QY
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 05:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kMph9-0002H8-IN
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 05:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kMph8-0005rP-3C
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 05:43:43 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601286221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sTo3TAQunM09AhUIkXVcbxoe47DKLpEAeu/DwoPiEZ0=;
 b=SOMffuuJme/dV1ei0GUIENxlKHJe0Kb3UHePwsM4hpfIB3vDMXgUbkpBKLlHTcVuOB7HdA
 m5hw+Z4yneA4+bJZ7CoIG6QbPEKyZ7aALgSz1b4A1ngBWQ1ocmBSRy2D/rVwtSB6Id06Qr
 Y+R0ubLdalF68Au1clxZGU8EAgbfYF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-gOEhlM9vO5iN63K4lVV39g-1; Mon, 28 Sep 2020 05:43:38 -0400
X-MC-Unique: gOEhlM9vO5iN63K4lVV39g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95D6D1074641
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 09:43:37 +0000 (UTC)
Received: from localhost (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2897C614F5;
 Mon, 28 Sep 2020 09:43:37 +0000 (UTC)
Date: Mon, 28 Sep 2020 10:43:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/10] scsi: switch to bus->check_address
Message-ID: <20200928094336.GC44353@stefanha-x1.localdomain>
References: <20200925172604.2142227-1-pbonzini@redhat.com>
 <20200925172604.2142227-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200925172604.2142227-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:29:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
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
Cc: qemu-devel@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2020 at 01:25:56PM -0400, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/scsi/scsi-bus.c | 122 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 75 insertions(+), 47 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9xsEgACgkQnKSrs4Gr
c8hd4QgArr3MpymtGN22KgYZUlZcBcvJYVyJMt/77PVKSGrLzlIxe9rpQEmVJUJ/
98bycu10JfCYrMyFktFsSyJiun8zi32kW0yvHsB5kk7kuvYb7S0sokrpT28Irj4g
72uXYtoR6l9rdVRWyyJ09NQ0aSXs2Luxz6hGjYcjfPXTm5292+RVtJlDxS6tJZvf
U6lCvD6+KKcKlu6zmIQNReeneBGswP+DeVFOTG5AN7WXNvlBI2xDmxbg7VW9gmYI
lSOeEsY4SGUUH9IuDDa5yKf9/rjttvAf5IBvI9qGyixAWyyah3fgXqjRAJYucl0N
hJfLqL17UpiFFrR15zmaTbzLWqCrPg==
=/AbS
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--


