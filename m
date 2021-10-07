Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D4425560
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:27:05 +0200 (CEST)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUMS-0006h5-Nz
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYULP-0005sY-Id
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYULO-0007EQ-7n
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tKq9TotD89CFhKDybGkx1AO7IRTeHvn8lXEBrLgfZ/E=;
 b=UuP0510WJT2vzA01bk1U2kmB73hA+wYBgo5hK6+IE+XTHW5MHouu98DNANwsgw4vIwX6Y+
 vjeCEaazpG90ZCEXZVgZv3djPOmHrbnVjJJQFSexh7sgLK02mflcVk806WkdJwHlCDKoDe
 mzn1DMQVAURsyfQuSae/3aNZH7qY9I0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-y5ZBRU9oMHGm8stiYjJ-0A-1; Thu, 07 Oct 2021 10:25:56 -0400
X-MC-Unique: y5ZBRU9oMHGm8stiYjJ-0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BA76A0CAB;
 Thu,  7 Oct 2021 14:25:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6C7C1002388;
 Thu,  7 Oct 2021 14:25:54 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:25:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 12/25] assertions for blockob.h global state API
Message-ID: <YV8DcWX7pEg4qx6T@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-13-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-13-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+9iWQhQuGdzPJXFl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+9iWQhQuGdzPJXFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:32:02AM -0400, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+9iWQhQuGdzPJXFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfA3EACgkQnKSrs4Gr
c8jDrwf/SiY5dF8x9lzZL2UrXpT8+mMMhUo32+Oc6TlvrB81IdoxnYiMwuH0PjKw
h6IznjXfQH2FXtZkvX7OGG65BYwDXi6siwbCHgNA6Lh26m0LPDcB52r7TFlnz5wt
4e5eFz+gU0D8VrWrXBdXpv+tfAR9ll6XjFkAa6GEIDqDmYhIgPev8HYPNvrONjnm
vBGWBDYgboUpseOZ/gddpHJFC+k1LpGM41yNm5RypqV/GM9A8in2zJyhCNfi2Ezc
6AoB9C8zS6RRXM0wfHDsA02xL212ZjhW6N/+8D9eALcCtd13+iuvpSNKJPOUUYLg
UTF1y4A5E1JNhZzUyJf6x0h95oZxww==
=mDqv
-----END PGP SIGNATURE-----

--+9iWQhQuGdzPJXFl--


