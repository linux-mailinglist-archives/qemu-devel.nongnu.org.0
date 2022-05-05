Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01B51C443
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:49:07 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdj0-00064O-0k
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmde9-0001OL-VY
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:44:07 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:35231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmde8-0004w8-Fs
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651765443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fCaGY44ipjdpono7WUMXJLE48RtLUdX4vplxyktHTRI=;
 b=CK8NuqCI9dInFe1eLHr6xMMlJ/PsR8nS16552ONVDj1yw4cy9AkD1n228LJSIRBwd5gAU5
 IiI/w1AJ1pYBngjQJ99BgQrrEFLPmq1rg0s2cmPJqfkO30SedqK+6jUilnIpWd1JXhmlS+
 hh2HnlTKrgmFcOxC0OkRHsJy6xiSAGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-MuACr9-RPD-lyHD4ANJ8sw-1; Thu, 05 May 2022 11:44:01 -0400
X-MC-Unique: MuACr9-RPD-lyHD4ANJ8sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24ACD8919B6;
 Thu,  5 May 2022 15:43:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B226440CFD45;
 Thu,  5 May 2022 15:43:52 +0000 (UTC)
Date: Thu, 5 May 2022 16:43:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 bleal@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 14/17] vfio-user: handle PCI BAR accesses
Message-ID: <YnPwtywhe/dhtWTG@stefanha-x1.localdomain>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <677a333e1c2843aafa8c6c2487e149208a5a5032.1651586203.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PLkU0UMYfVcFvg2C"
Content-Disposition: inline
In-Reply-To: <677a333e1c2843aafa8c6c2487e149208a5a5032.1651586203.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PLkU0UMYfVcFvg2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2022 at 10:16:55AM -0400, Jagannathan Raman wrote:
> Determine the BARs used by the PCI device and register handlers to
> manage the access to the same.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/exec/memory.h           |   3 +
>  hw/remote/vfio-user-obj.c       | 190 ++++++++++++++++++++++++++++++++
>  softmmu/physmem.c               |   4 +-
>  tests/qtest/fuzz/generic_fuzz.c |   9 +-
>  hw/remote/trace-events          |   3 +
>  5 files changed, 203 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PLkU0UMYfVcFvg2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz8LcACgkQnKSrs4Gr
c8imfAf7BzjbVK1PhHZygdpKxt5Qjde34vHvBRYh+npzp9p9QntdH9rZI8b5CVjp
aVvROLWhPceAQQEL0G9ccRt6B0DuMWAIi2wIi6QkSEbt5x+5Dd6FTFBTGTjPa46D
cEHwEnlZpDcGyBXc9Fg+YcC1tyPvmkkhM2nTpItcA5gTybHcLBjcow4OffZWQgaT
YPHfgXhto8lZoienZWKjmVKeF51SWwg0O7sbQMss2c22zT3jl1krMYITjviGWiEH
iR2b3SpD+jdWYJ1y1FU4AqEy+fwWzFSQil5Tr9bl8OO+bFcVwQJTHnKCX0MoIi5N
5nScMgG+fbu8cYOgmcm3QlqL+x3iPQ==
=KOWK
-----END PGP SIGNATURE-----

--PLkU0UMYfVcFvg2C--


