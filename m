Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22975F39A8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 01:12:52 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofUcF-0008US-Kj
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 19:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofURv-0001UD-MZ
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofURs-0001tC-MU
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664838128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BDscDHRRF22FhryMzVNX+v9CqZgd+3AkQC2K5fAL64I=;
 b=Wi3X5Zl+qs+y91K+wn9ZenYCVXkp9kcT0akAeoOm2hP6T8+kmqKagCPg1lMielNOuuszDR
 pxfc94MGp3l0Qcp5sp7mZmGTqjufRfdZY9r3pdOpsAGb2bAdiicTxKeeJrA1mJv7vnBaDG
 /UQVPeHHzXOUfmdfZVaFNzS3o8YbIyU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-xJpf5WVvOgO7r0Rf2TSyTw-1; Mon, 03 Oct 2022 19:02:05 -0400
X-MC-Unique: xJpf5WVvOgO7r0Rf2TSyTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F77F101A528;
 Mon,  3 Oct 2022 23:02:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0417A492B04;
 Mon,  3 Oct 2022 23:02:03 +0000 (UTC)
Date: Mon, 3 Oct 2022 19:02:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PULL 00/18] Block layer patches
Message-ID: <Yztp6hnOwpiN78VJ@fedora>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GfdcIStO8do5p4cY"
Content-Disposition: inline
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GfdcIStO8do5p4cY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--GfdcIStO8do5p4cY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM7aeoACgkQnKSrs4Gr
c8hFHAf/TRMWEqrVgN9Gi19QjOe6igp9l/Z/PRhv2BHp8U6CODHf9M46ItOa3fD0
+kkwOq+FpGgWP90Qbuhb+Es1J/StmOXrdepVsrU6ffZetP9lRuQ7+tIDBVNaJU25
qu6pEmTXLRzsIbYOsSjE7piHfjnu64q8LUzL2rhTCL+D4oU3Z1cWhKUeQhLrcY0J
lq/0Yu9a/HZfzNt07/otmU/dqgBOw3GBVjUvhzRSuuTrZKe8RER0vccCG9GCZpb/
ROnFFM3OdO0jd9Aqdb2m2hRZMV/dzgrB2tfLiHMKGpv6zqnbuji7rJlnURrpXDSe
3MYGAUj5CN1/CuBnkPka1rJagpvkfQ==
=/868
-----END PGP SIGNATURE-----

--GfdcIStO8do5p4cY--


