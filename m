Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA14D8655
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:00:48 +0100 (CET)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlFf-0008Jo-1x
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:00:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTkyi-00076q-01
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTkyd-0002kh-US
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xLWCXjVMCZO0mnl5oTrkQJFAp/il+35Z2QxQDRUdQJY=;
 b=NbmmaFOSwFF4iowpMDC4lMGI4Wk/EK+nDbo0yDNViMPnPdlMyEg8vE8HGSYJ7bnI83oHnx
 1fAdznZwRxBIE1iyUd7QjV0BoISk3YzlsXLBQKxv0sAvB5WsbSRZOrDO+r28N75QlbwaSz
 qP3S51ybKSpr9wxSPFSRjO9Wt+arEkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-yelsTPsIMY-_ygPPpVC2Qg-1; Mon, 14 Mar 2022 09:43:09 -0400
X-MC-Unique: yelsTPsIMY-_ygPPpVC2Qg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C8841C0D109;
 Mon, 14 Mar 2022 13:43:08 +0000 (UTC)
Received: from localhost (unknown [10.39.195.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35818697C85;
 Mon, 14 Mar 2022 13:43:08 +0000 (UTC)
Date: Mon, 14 Mar 2022 13:43:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/35] stackless coroutine backend
Message-ID: <Yi9GaxLnS7ZcYmug@stefanha-x1.localdomain>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
 <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
 <a8997433-dfe6-58f7-d5ca-e0ec3e12b7f1@redhat.com>
 <YisWGCF9oIkr5yeB@stefanha-x1.localdomain>
 <a92b23e8-e545-a43d-7283-6c6d215a10f8@redhat.com>
 <Yis9wszzwwu2CGmZ@redhat.com>
 <1b458cc0-08a0-578d-83f3-90d5d94bd245@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4Stm5LyFeK1ddua+"
Content-Disposition: inline
In-Reply-To: <1b458cc0-08a0-578d-83f3-90d5d94bd245@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: hreitz@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4Stm5LyFeK1ddua+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2022 at 04:18:40PM +0100, Paolo Bonzini wrote:
> On 3/11/22 13:17, Daniel P. Berrang=E9 wrote:
> The question is what is easier to maintain, stack switching code that is
> becoming less and less portable (status quo with SafeStack, CET and the T=
LS
> issues that Stefan has worked on), a mixed C/C++ codebase (C++ coroutines=
),
> a custom source-to-source translator (this series).  The third might be m=
ore
> fun, but it would be quite a large enterprise and the C++ compiler writers
> have already done the work.

Or a C-to-C++ translator to keep the code in C but still use C++
coroutines :). (I'm joking.)

Stefan

--4Stm5LyFeK1ddua+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIvRmoACgkQnKSrs4Gr
c8igTwgAtV6WpjYMlCGtflmUw1pYE3CU2PPp5nW09sieuRfHJiGvGFP6ThOgiJ4c
4smHMUFGf7LOpU3ovgaFqgRFOlmEbicReA1P1HH78jvx5L75gvY63O/STfThRZzA
yn/x3Yo6DqDdAtUpDbIiPUMVZjeLpZ9i5DIX9pyEF7T0EyMII8DSxA0pVXWYGvJc
uh4SVvAZ3dPH4ubchYUwEWCrvmRHrW04uQo6IYihOTGdFlfV/ngEs87iMhz0lxKK
zrMK9vEsG026ls9nQlnQLeNXxDEKlGsywEf9EX1RCHT2/7Z2oHc+Dm2ZtND41DVL
JhhiJyf0cv4UbNZoPP2lMftm2FVG0w==
=Razh
-----END PGP SIGNATURE-----

--4Stm5LyFeK1ddua+--


