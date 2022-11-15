Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48238629BE8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:21:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwoH-00050T-G2; Tue, 15 Nov 2022 09:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouwo8-0004yF-Pl
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouwo6-0004MP-IR
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668522057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MxhEeGIO72CIjIIW8/BVkg0HIpFF7EnOI/XoQqDbPoM=;
 b=TpHnKmWjD3h6gQoVGKgOoHhwT+iWXB/ZZFeXKJT28gJFGrLqKJghrdU4JNlAn7ei+ouFpN
 pH/Y35FZShDO6w6WJELHRL3mDRgWFRiqUeYbsXKdV0OKlMpr5MuxXl2+MQtsomeNhXQtR2
 IxzV2cym3rBLtEdl0CxcVGK4X+8FYz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-O_vV0dhNNP28MiV2BH9pLg-1; Tue, 15 Nov 2022 09:20:56 -0500
X-MC-Unique: O_vV0dhNNP28MiV2BH9pLg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD309886067;
 Tue, 15 Nov 2022 14:20:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4984A492B1C;
 Tue, 15 Nov 2022 14:20:55 +0000 (UTC)
Date: Tue, 15 Nov 2022 09:20:51 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/11] Block layer patches
Message-ID: <Y3OgQ1FPvio3aV0O@fedora>
References: <20221114111954.37281-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qJezQRwXBTSKA/AL"
Content-Disposition: inline
In-Reply-To: <20221114111954.37281-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--qJezQRwXBTSKA/AL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--qJezQRwXBTSKA/AL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNzoEMACgkQnKSrs4Gr
c8gFHQgAvEnOZKbrE40/1b//CewmZwyRfJWkPAZvEE2CabU67M7DvM0P7ymkvilm
/fcCTq93p2ETc55iYSPmXPe19geT/yCU5otv6Hq9ZWa6Vh6m2f6iVnMHpXYfTyv0
oJfvzDQ9hie/7V+QqE3Toz68hT0BOF1MGQk/i6tYzUykIxGDsO5ONytEqOGWJSiy
zBrEMWUG9I2Dum/HjNO0IBHS+pGQGLh0R96dLAk4LEuR8QHXTomszXHtcXCfjBW3
EtBEFcLWWmrNa4kPORhbLK3NricEPMphN5RkZuiurjg+FSsYJUC5Bx+74xtbaOls
TlVa7oafwyh+EyxrYWLD1MtETl5/7Q==
=zmUT
-----END PGP SIGNATURE-----

--qJezQRwXBTSKA/AL--


