Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1A345FCD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:38:04 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhER-0001Is-SK
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhDD-0000UX-K8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhDC-0003at-6z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616506605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGk5KAtvmdj85GkWkgq3ulA8EZZa/6OZxgZGbkg3FI4=;
 b=Zm0k5CPZCz9gjLSrndjy3Vfa65X7LdfXDLowRyKrwg0dOkY4YolfaugMZ2GoAZ7vG2QGO5
 /Fpj3AM6uRT0FUZ46FzjcUBzFNLEwlFDZvb0t7MOmOLcZaHgz4oX1n2LTGWdlc506cgKmU
 kqK2AV3QxvwfCCGXrlW+Q5c1+fDLZIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-vn4AJrfvMkKQD1NzPcxEdQ-1; Tue, 23 Mar 2021 09:36:43 -0400
X-MC-Unique: vn4AJrfvMkKQD1NzPcxEdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7245C183E241;
 Tue, 23 Mar 2021 13:36:41 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67AA25D6AD;
 Tue, 23 Mar 2021 13:36:40 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:36:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yuri Gribov <tetra2005@gmail.com>
Subject: Re: [PATCH] [NFC] Mark locally used symbols as static.
Message-ID: <YFnu57GV4lnK33gt@stefanha-x1.localdomain>
References: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="awf51F4+BiTgyoyY"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--awf51F4+BiTgyoyY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2021 at 10:55:42PM +0300, Yuri Gribov wrote:
>  scripts/tracetool/format/c.py                 |  2 +-

My Reviewed-by is specifically for this tracetool file.

Stefan

--awf51F4+BiTgyoyY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ7ucACgkQnKSrs4Gr
c8gHkQf9GkqbjJSuq8OCSoVw/Hyu9Vckxvuy2RKzcFv2gK7TULUwPYdElAcGLasq
x4sXHVZJQAzBchP25oNBNY9qwE7rsTcpyNB0wx94hak2j3asrbgTQiwkdDoll7hv
ulPFzhLJtgBgBDu8lcJ7APeONhjfBI2GlGJ9IovVebTeAWeg/Hh8vO++qX9RYhbj
OpgsHel4mbaD5NH+NFfFKIsUBABnDc7PNN/jhOSXXfCplEn6gQVsrrs6EJbUobnZ
Hk7up9Yg1zH8vUVyGJATDRl94/EXQU4RMthCuhgNwr+t01dPTih7e2xTlxLR9pdA
o80wuYd8VuuwlACGYF8yhLpy7Daqjg==
=/4TX
-----END PGP SIGNATURE-----

--awf51F4+BiTgyoyY--


