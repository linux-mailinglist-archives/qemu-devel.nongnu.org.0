Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B103238F2A6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:57:19 +0200 (CEST)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEpK-0001UY-GY
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llEnU-0008DU-6G
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llEnQ-0005eJ-M8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621878919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rw5M9YK++UU/iyCISrlTHz61UEu88qi5UBZnEZckseA=;
 b=IueE/qnztr0/3hjPdaO+GOJV60+/WqtJGy4SgPk/08m2OoAVhYL8NbdqB97/rDX/RcyMB8
 4joHV070eev9jgjz4AmrKx8LFUAOMZOCeYo8yo1+M1920utNfMX4wwiVh5YJRE/faAVCK7
 uQZp8joNkbCkyVT8JQ9r0M72yqGGjGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-1RSPfWCMNEyf6K5aGuoCyQ-1; Mon, 24 May 2021 13:55:16 -0400
X-MC-Unique: 1RSPfWCMNEyf6K5aGuoCyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB356802575;
 Mon, 24 May 2021 17:55:15 +0000 (UTC)
Received: from localhost (ovpn-114-16.phx2.redhat.com [10.3.114.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2960270583;
 Mon, 24 May 2021 17:55:01 +0000 (UTC)
Date: Mon, 24 May 2021 13:50:57 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [RFC 0/1] acceptance tests: bump Avocado version to 88.1
Message-ID: <20210524175057.GA1567491@amachine.somewhere>
References: <20210520204747.210764-1-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520204747.210764-1-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 20, 2021 at 05:47:46PM -0300, Willian Rampazzo wrote:
> CI pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/306904401
>

While not related to change in Avocado version (I've verified the same
behavior with 85.0), we need to investigate (further) one of the jobs
getting stuck here:

   https://gitlab.com/willianrampazzo/qemu/-/jobs/1281481564#L79

Would you care to take that task?

Thanks,
- Cleber.

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCr538ACgkQZX6NM6Xy
CfOy3g//WPxHutwESHXX8in1b9CjzXJm9B98R7oNwBazAyAJx5vL2dPyP897CrvC
ji01WnZJaRd9p8gtoxzpAiLowOvuMFfwyLZ8/L9h4UUcqBpf7nVHToSFAz84n4sj
23lzWsgPOrngH4JhWhKrwDW3PAhWLW2930zKD4rYhxu6apoM3qJ7r9fwgI3vnzBV
9mBed8ixxXGblesuADkGdN5LwGKCtq7+iJOX4lsLgtAY2RR1yPKlz7aVJ6LU7qeD
sviPor/4PrjyweoL9EW4w/swWg3djlUCHMeD7/gpI4cKQdJSjV9P2xBUjAw/dE+9
TBcXWpkcJLpXt5U1a3OfZmg7WkAqX008BOsGmESTFltBSMr5PlmechA1JAWX+wtZ
4JPmHxR9XbHB1o8oFUJLjnYFiSRG8lFgsPxiEWgXGbeHeV0++kIDKpzvNyhfb8NQ
UrjFPgFZ0Sheqs96d/8MVwRbtq94iMOsZ73KG5mOv56vlXGUfbkIhyhQd51J3q/U
fziDCpmANfWrk6Zq3cT59lhxBNSeuwB4ujp31Z8dBHdiCbD+bELXA1biBZ9nE/T9
uIy9siyDa8Dw8BxS1j1HgH5nnaioK5U7aAH8cLyVbbOaUobHbI1e9TbzSil7V/Ox
unY3zWtf8ZGjRnIND2Xqnp1VFH0zrWHPaouNR6cAxTB+pP8Lyjo=
=dadz
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--


