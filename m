Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF712F62C1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:11:48 +0100 (CET)
Received: from localhost ([::1]:36558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03Ln-0005cC-GE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l03FU-0007Fd-AG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:05:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l03FS-0000lm-MY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610633114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ccYwf1pgxG8x4hCL7N+vtp0DPC8ed37RQHvdMMqyT24=;
 b=N0sSxmM0MvhZpVru/pfei9NR1csXTw2hnRDykK2CCgyFLstGk5P/ODUkrDsD5/aLwBaEVf
 2utjMy4sRZ8inQi9MqCHEVjA160OFlbvK1fypadydJtwWGi211NeNqQazLq5S/W4fS56AG
 JbSy6USdsY7359GAHbEid6cLtmswdJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-BtfphHHXMVCnfTudNHzLbg-1; Thu, 14 Jan 2021 09:05:12 -0500
X-MC-Unique: BtfphHHXMVCnfTudNHzLbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8C2319251A3;
 Thu, 14 Jan 2021 14:05:10 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7371218A50;
 Thu, 14 Jan 2021 14:05:07 +0000 (UTC)
Date: Thu, 14 Jan 2021 14:05:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 0/3] nvdimm: read-only file support
Message-ID: <20210114140506.GE292902@stefanha-x1.localdomain>
References: <20210104171320.575838-1-stefanha@redhat.com>
 <20210104210226.GI18467@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210104210226.GI18467@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 qemu-devel@nongnu.org, eric.g.ernst@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 04, 2021 at 04:02:26PM -0500, Eduardo Habkost wrote:
> Is anybody already going to merge this?  If not, I can merge it.

Great, thank you for merging it, Eduardo!

Stefan

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAAT5IACgkQnKSrs4Gr
c8iyawf9GBkckeJJwgmnE3JDsU4q8xw3lF1B/BycFFzdg65U+tIvKFIjFaWzVqi+
DLSXa9JO6FkEs1tHgvzKANj3q9O7ugfGEMJJ2vFJALJDZVBXsmL0wiAZ+jvEyMM6
m+3uivZqlrZPk3YC9Tf/WZ3UbkTdjSKb0xRAi+EO22ZDaOjTzqyZky8j2shNcEqA
Uy6UGDuN13A0fbrHA0v4re0x+ROaxHMFkJr/RqKFKQVxUWUyOi/MkR4zc8fisNlK
t91ALaFnVTG9r6cFSWmhq1zOT3or1xzUEAsCsV51EgMskXyKU1SPFB5T+E6pU/w6
8nRS+Egxdw72aJ4pnwHwjwyHNgUiUQ==
=n1MP
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--


