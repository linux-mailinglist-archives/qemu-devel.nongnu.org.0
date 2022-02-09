Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501EA4AEFD2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:12:32 +0100 (CET)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHktj-0000mM-BO
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHkJ7-0002r6-5L
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:34:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHkJ2-0003MR-46
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644402875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dNOyyvBg/LFiGhZIYL+vmXEfhkyOZh/CdhkUz7BJMlY=;
 b=VaeadthcIDLe5bVTJPb5srwiv0d+bG4Q1JQHavtXCXa8WcAsOkB7oA0qGhtM4vbkr6P2gb
 UZIW/k6gL/r5Z5/h0fh1GJFl5LHsCka93OGIPn6Sfs8+J+cP9EktyP57cMJjoe8AqmHDHv
 caD08MIe5pPMTi8fd9Og5aNXvW+AqDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-_bxJcRzAP7238tFbarkIMw-1; Wed, 09 Feb 2022 05:34:31 -0500
X-MC-Unique: _bxJcRzAP7238tFbarkIMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E4F874980;
 Wed,  9 Feb 2022 10:34:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C462B7B6D4;
 Wed,  9 Feb 2022 10:33:58 +0000 (UTC)
Date: Wed, 9 Feb 2022 10:33:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [RFC 0/8] ioregionfd introduction
Message-ID: <YgOYlWl8akWuUCEM@stefanha-x1.localdomain>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MJAyuJFmPBQhQxDg"
Content-Disposition: inline
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MJAyuJFmPBQhQxDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 11:22:14PM -0800, Elena Ufimtseva wrote:
> This patchset is an RFC version for the ioregionfd implementation
> in QEMU. The kernel patches are to be posted with some fixes as a v4.

Hi Elena,
I will review this on Monday. Thanks!

Stefan

--MJAyuJFmPBQhQxDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIDmJUACgkQnKSrs4Gr
c8jsAAf/a9gUfDwMtkUdnRKycEWPLHt+ZA7z9HAOC7IMcWTEn/6lAZohHGJKw9Nl
1Luux4q0Yh7FRvdM/011BqvE+eAdx8dQ91wna/vDlk90dU+kOSUKVQwS/Y40a+/O
512QqyVeStFgl4USMLYqIVqaIeQWK6CJDpCuGem/nB4kFVhUF63qrXf6jInALk7s
U8eOHA+17QQU8ciHbNxOWsmZPJX3dAGbGoH4qe3zvMqMdFzcWz72nmtRyQyoZbXI
V2ZfFUjpBgHCYG5gaJKYNFn26546FtvKfX0GWjrLEI30sg8A1iPlkGmwMCrF+F8I
ELRHNutPUFaDH5yxo65wHDv1mbPYOw==
=YkVG
-----END PGP SIGNATURE-----

--MJAyuJFmPBQhQxDg--


