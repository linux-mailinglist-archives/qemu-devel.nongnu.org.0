Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6B4ABF6A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 14:24:43 +0100 (CET)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH40X-0007aM-SW
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 08:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH3pA-00006k-SY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH3oz-0000dk-Ng
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:12:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644239524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skA1hKhRdC1YwQ4Wm3oQAW2DyJ/CJc5n0UIxESPnxyY=;
 b=TtO61Ikl6gi+ur60Mql93knHQC4HEv7cWkCoJVxdZwuXfjBwtLPhmxyokltpTdBi8aIAy7
 JUG20GhRdf+QQgm8pSnqlzJ/zc2HkBB50T+z0iox/+KOXZWw6GA8qTawYRw7N1ySSmPXl4
 IqNmuevbl71XFLuTOQqLiI5rsCPV5lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-3FXFV7YpOSCM3Eo6x9Vijw-1; Mon, 07 Feb 2022 08:12:03 -0500
X-MC-Unique: 3FXFV7YpOSCM3Eo6x9Vijw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2564B100C66B;
 Mon,  7 Feb 2022 13:12:02 +0000 (UTC)
Received: from localhost (unknown [10.39.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F8771038AC9;
 Mon,  7 Feb 2022 13:12:01 +0000 (UTC)
Date: Mon, 7 Feb 2022 13:12:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 1/5] linux-headers: Add vduse.h
Message-ID: <YgEaoFwlZH3++9hu@stefanha-x1.localdomain>
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-2-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LGL4yicKcjlLwOG5"
Content-Disposition: inline
In-Reply-To: <20220125131800.91-2-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LGL4yicKcjlLwOG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2022 at 09:17:56PM +0800, Xie Yongji wrote:
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index fea4d6eb65..4c7846076f 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -198,6 +198,7 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
>           "$tmpdir/include/linux/const.h" \
>           "$tmpdir/include/linux/kernel.h" \
>           "$tmpdir/include/linux/vhost_types.h" \
> +         "$tmpdir/include/linux/vduse.h" \
>           "$tmpdir/include/linux/sysinfo.h"; do
>      cp_portable "$i" "$output/include/standard-headers/linux"

VDUSE is only available on Linux hosts so it should go in linux-headers/
instead of standard-headers/linux/:

  # - linux-headers/ for files that are required for compiling for a
  #   Linux host.  Generally we have these so we can use kernel structs
  #   and defines that are more recent than the headers that might be
  #   installed on the host system.  Usually this script can do simple
  #   file copies for these headers.
  #
  # - include/standard-headers/ for files that are used for guest
  #   device emulation and are required on all hosts.  For instance, we
  #   get our definitions of the virtio structures from the Linux
  #   kernel headers, but we need those definitions regardless of which
  #   host OS we are building for.  This script has to be careful to
  #   sanitize the headers to remove any use of Linux-specifics such as
  #   types like "__u64".  This work is done in the cp_portable function.

--LGL4yicKcjlLwOG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIBGqAACgkQnKSrs4Gr
c8h5EwgAn1C923TEIW7REK1UPiMEFo8APS9/0Uh+qXr2w6e2iwvxwI/DhdjEL17f
DFXfsFSMW1/8qIofy6FxVXSPPf3sz16qMZcQILvL/ZO7lZSP9FZ9v+/ZbUS5XVst
pAaXBj3ubEYGDg6Sg1NSzhaxSzZGSNFalEvvCxlhaOvuw8nseVbV+7kKKz1zskjZ
nMGWTftfDk2H5PY1jPF9x9DdWVxatTJuDos4eRivbwn298r7Ywx0BltcpGb6fNeX
hff6FQOtcKdedH7ioK9EFH9DxqajTnk3xlnMhmZfvUZevpKvgVqjYtxCmeSA6EBu
a7hAyaaI7+8BZdSJVhdCN0D4CKJe3Q==
=ktjj
-----END PGP SIGNATURE-----

--LGL4yicKcjlLwOG5--


