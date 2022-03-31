Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E564EE9AF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:22:12 +0200 (CEST)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCXr-0001TT-Mi
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:22:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1naCMY-0007wd-Pl
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1naCMX-0005hr-73
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648800628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uuMRLKGxUfbfuKZ0+beAe0YNa3W57UggbdmuQkTqB8k=;
 b=OQMYcSvtef+Hu7XaouBiZtW3zEXYt11Uf99WLohdzDc9cuRq/FVD9PCZBYLuHlj736sx4+
 L+H0vBMiluoMpciWRsOgKYXvTKYg4VtXUXcusZhXEdAmXtKX70FotYl8rywG2WOI8ow/To
 xtf8jAROM2ZPSTjRuUga0hFWT+7uhfk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-lJe-hsumOWi0Y6TcA6JJtw-1; Fri, 01 Apr 2022 04:10:25 -0400
X-MC-Unique: lJe-hsumOWi0Y6TcA6JJtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24E5E185A7A4;
 Fri,  1 Apr 2022 08:10:25 +0000 (UTC)
Received: from localhost (unknown [10.39.192.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2982C15D42;
 Fri,  1 Apr 2022 08:10:24 +0000 (UTC)
Date: Thu, 31 Mar 2022 17:17:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] tests/qtest: attempt to enable tests for virtio-gpio
 (!working)
Message-ID: <YkXT/yYzmhA3pJ27@stefanha-x1.localdomain>
References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
 <20220121151534.3654562-1-alex.bennee@linaro.org>
 <87r16iwij6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qsb03fRPWPGgbZAh"
Content-Disposition: inline
In-Reply-To: <87r16iwij6.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Qsb03fRPWPGgbZAh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 10:52:56AM +0100, Alex Benn=E9e wrote:
>=20
> (expanding the CC list for help, anyone have a better idea about how
> vhost-user qtests should work/see obvious issues with this patch?)

This is better than no test :).

Stefan

--Qsb03fRPWPGgbZAh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJF0/8ACgkQnKSrs4Gr
c8iawQf8DgS2ePZMThWf9wqNGCBCWC+c+ETgOZKSlpzqeOnRFH1Y/OALPcxoHLZ2
jKOtzEcYSgEtlFwMd5fPlSLvxhAqMEHwZ/StEDStWrlxa34bKMwqkAi+c9ReXnmv
qZ93pEgQ+TNJN40iLQ1Npjeuo6Pt2kXa5YD0hZPewG4oiaC1ow9tBfN5m2gTcl87
cPzfzCXf8UY4w3G7u06WbonjyOuhzkXyXY9d5IOhuuFpmJJ1xqGBK06Coq/8H0hi
z9VIQ8zTUK16xnURhViP3eexMAM2j10nMHoSovDKJFQU/XTwvn2KBcjVYfMK52g2
0JU2eVTZoiTvj+cpdaWL6jV6grCgOQ==
=KNS9
-----END PGP SIGNATURE-----

--Qsb03fRPWPGgbZAh--


