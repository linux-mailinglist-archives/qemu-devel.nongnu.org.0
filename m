Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB249CEC5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:41:26 +0100 (CET)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkQG-00037W-LK
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:41:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCkOH-00025v-DO
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCkOB-00042f-FB
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643211553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0TfEEBZuuSlcpBaqyBs0VczUq+w2tpGb74a8R/iYfo=;
 b=Paq+SxnSnclCsQpROL8rS0JfeSpZNbkZjtYQf6CPg6AO96aYqKcqSXelEWKtipuI7pswei
 BDeuIcxu6G29DMatxv2REHXeWDwGUf4FihaIWQLfWTC9B907ODl0VZYsKaTxkxmqQT3x08
 Xe30EkptBm78fj2UCB9vZkyC1pKQIAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-QHrMeWNNOjud0EWXv05Mcw-1; Wed, 26 Jan 2022 10:39:10 -0500
X-MC-Unique: QHrMeWNNOjud0EWXv05Mcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E675210144E3;
 Wed, 26 Jan 2022 15:39:08 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9BDF2C2C2;
 Wed, 26 Jan 2022 15:38:47 +0000 (UTC)
Date: Wed, 26 Jan 2022 15:38:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: Re: [PATCH 0/1 v2] Patch to adjust coroutine pool size adaptively
Message-ID: <YfFrBmi3aXD5ChVn@stefanha-x1.localdomain>
References: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
 <TYCPR01MB83573704C604BC31B157B3EA805E9@TYCPR01MB8357.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rweXVm6GPR9V6VIP"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB83573704C604BC31B157B3EA805E9@TYCPR01MB8357.jpnprd01.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, Akira Oiwa <aoiwa@yahoo-corp.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rweXVm6GPR9V6VIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 10:01:30AM +0000, Hiroki Narukawa wrote:
> ping, how is the status of this patch?
>=20
> Link for this patch v2 on patchew is this one: https://patchew.org/QEMU/2=
0220111091950.840-1-hnarukaw@yahoo-corp.jp/
> The last message on patch v1 is this one: https://lore.kernel.org/qemu-de=
vel/TYCPR01MB8357E8D13D661265CDBB442C80519@TYCPR01MB8357.jpnprd01.prod.outl=
ook.com/T/#u
>=20
> The difference from v1 is use of qatomic_read().

Hi,
Sorry for the slow response. I will review this tomorrow (Thursday)!

Stefan

--rweXVm6GPR9V6VIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxawYACgkQnKSrs4Gr
c8htuAgAmdCs3e1VNrD3XgE4WnF3LIRG5DJbnt1Q4UVj66DRDjFFawguTUSQ/ce5
HGKccwl82WIRZ8fE8dvGpbYxnLf3Od27GL+4TwIi/BrHsI7nNxYnpPU7H36JWWdR
gt9bxbx4VZ6cyzpRKKZ3l/bEw2AgPZR9xn2xonyukOal3w3fcAP1Q9qsCtKMek6F
GoDlExKo5wd/inZXYy4IGz6AALf+4szPK6aZ0fGI2QuaQ57jPrJBe4rHttlUXXDi
vophun9urg266VGTiaTV52Z+m0L0SP17tb0gW2BGEyeTqhshN4jaWQf2BFJ7dKZZ
DQt1Kl5xG0CDfxtRqbXkB4x8J2F6jw==
=zI7k
-----END PGP SIGNATURE-----

--rweXVm6GPR9V6VIP--


