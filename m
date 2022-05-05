Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B651C51E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:28:33 +0200 (CEST)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeLA-0003aX-Th
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nme5J-0003ZB-Md
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:12:09 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:51123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nme5H-0003ql-75
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651767126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tHU5fpzotbO+Y2cwrw4LKAm117GCBwodQSowKJKUDik=;
 b=FJYz1Cv177doR0n4hbCkIqkvwO2AFM8wOwd72gxDfyrNusMz15XKS/UUE3lnGvHBNoAlaC
 yZ5zghrnAD9GktFnZ1GK3kJs9YB4JBz3nPZLI1CnPKmO+UCDHlf7lBs+BYkgssgsxBgMip
 7dhjoq4zflJp9p8L0SPbD0tiBDagZx4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-iwJ9QVIDMF6HXAECKt_pHg-1; Thu, 05 May 2022 12:12:05 -0400
X-MC-Unique: iwJ9QVIDMF6HXAECKt_pHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B1D93804068;
 Thu,  5 May 2022 16:12:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7AA714682CE;
 Thu,  5 May 2022 16:12:03 +0000 (UTC)
Date: Thu, 5 May 2022 17:12:02 +0100
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
Subject: Re: [PATCH v9 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YnP3UpTRMnt1TCcI@stefanha-x1.localdomain>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <29948a10c3f2db09686fb6d257e31e4f873cb7d5.1651586203.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b/LsQEU46TApT3PP"
Content-Disposition: inline
In-Reply-To: <29948a10c3f2db09686fb6d257e31e4f873cb7d5.1651586203.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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


--b/LsQEU46TApT3PP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2022 at 10:16:53AM -0400, Jagannathan Raman wrote:
> Assign separate address space for each device in the remote processes.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/remote/iommu.h |  40 ++++++++++++
>  hw/remote/iommu.c         | 131 ++++++++++++++++++++++++++++++++++++++
>  hw/remote/machine.c       |  13 +++-
>  MAINTAINERS               |   2 +
>  hw/remote/meson.build     |   1 +
>  5 files changed, 186 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/remote/iommu.h
>  create mode 100644 hw/remote/iommu.c

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--b/LsQEU46TApT3PP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz91IACgkQnKSrs4Gr
c8jOfggAnVvqPUhj7LwHXZHutJp9hkHrjgc784j3u/Ni4ie6fX944hq295WAHchB
V0IKSH527S1z/3iQUhYKTsJm92E9SdbttzPiM5GSC/fMM7Ka9HcOTr/7oXA2lmn3
sxVn/mK9ngUJ1vLTkeE70cAeW4TJ3szRUu8bva2+yf9+j5uzh4XR8dewY3CH5HUU
5qis1LJfylgHSMcAKV2MDUcKocluqm81iVFPUyQSbLMnPyztNlVuTL2H8jKaXYUE
UHbWM+TH85GNOsrbGx7rSYagjgZc4JGPUjj5MJkFdQU55Nf1s0QhXC1Yj4Bp+WXW
Ytm7fWeXcj2TvDuAJ88GNaXJFvmRfQ==
=JwYP
-----END PGP SIGNATURE-----

--b/LsQEU46TApT3PP--


