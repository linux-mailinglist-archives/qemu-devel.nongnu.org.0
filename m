Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE897422AFA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:26:11 +0200 (CEST)
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlOU-0005X8-GY
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXlMq-0004qy-KV
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXlMm-0004RU-Aq
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633443862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ysNqJFI2j7PjVkZz+JmUzRsmEuusAVW4TIgx1EwGWvg=;
 b=Wq4KbTYjQjfu1xDot/AblzR8Amjuus4KzS+tCuX6lq1Ig3s6FzhO/VMceGaz7JqrM2cBth
 w0RZ1V5yiv7QrEUFOjUwVwWGovjOGAvILpIGOPWyWVaFCrdaAhjeNedG40laxszKXApXd0
 /DaIXyVh4d/xDHoUTIBjXtcNSu1tSDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440--WDDtGDgPLipzvQi0qtMHQ-1; Tue, 05 Oct 2021 10:24:09 -0400
X-MC-Unique: -WDDtGDgPLipzvQi0qtMHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 602B918125C2;
 Tue,  5 Oct 2021 14:24:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9E0B60BF4;
 Tue,  5 Oct 2021 14:24:07 +0000 (UTC)
Date: Tue, 5 Oct 2021 15:24:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
Message-ID: <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <YVxarQkCtPkhRc4Z@stefanha-x1.localdomain>
 <YVxdKpks4ARkVHlj@paraplu>
MIME-Version: 1.0
In-Reply-To: <YVxdKpks4ARkVHlj@paraplu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+krAb5OriK891f5F"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+krAb5OriK891f5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 04:11:54PM +0200, Kashyap Chamarthy wrote:
> On Tue, Oct 05, 2021 at 03:01:17PM +0100, Stefan Hajnoczi wrote:
> > On Wed, Sep 22, 2021 at 02:10:51PM +0200, Kashyap Chamarthy wrote:
> > > As of writing this, qemu.org is down, so I've used a one-month old
> > > copy[1] of the wiki from 27Aug2021 to do the rST conversion.
> > >=20
> > > My main motivation was to convert SubmitAPatch (when Peter Maydell
> > > pointed out on IRC that it's still on the wiki).  But it links to a
> > > couple more small wiki pages; so I converted them too:
> > >=20
> > >   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
> > >   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> >=20
> > What is the motivation for moving these pages from the wiki to qemu.git
> > (https://qemu-project.gitlab.io/qemu/devel/index.html)?
>=20
> They were linked to from the SubmitAPatch page.  I thought having one
> doc in qemu.git and the other two related docs on the Wiki was clunky.
> I can leave them on the Wiki as-is.  But I thought upstream is wants to
> move away from the Wiki to in-tree docs where it makes sense.

I meant SubmitAPatch too :). I may have forgotten or missed the IRC
discussion so I wanted to understand the reason.

Stefan

--+krAb5OriK891f5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcYAYACgkQnKSrs4Gr
c8i1zQf8CercirU/oyaCvHIAXaN22Ze39k3C+cKC1+O4svq3R5+szZriIZpJP+WC
vNsIN1o4V6X2OCC9V4I7ch08T1+BFNxx/ORa49fWObPEnqAsPm4c/3MEooB7Zwk3
nBCWbSA87LziziJlH35oi400k3pBYr5xuboVaADuEwxZ9Ribr/nFRNWe7UVTgD1q
EmqOX6/ZSKTWPbzHMmAtd4vGq5hHb1vXvyGiZXCS14HnXztkSuHc0GS2Q93cWXpo
BLbifCp/gojC/lkjnQYK2ZbXfpbu/8ZC+LQfR+JWRM2HK3geytdwM8/pZeO6IJNy
Gpth3VeHogIzOQo1fiOEgZA45ug1eQ==
=ZfFZ
-----END PGP SIGNATURE-----

--+krAb5OriK891f5F--


