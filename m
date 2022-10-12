Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE235FCD21
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 23:28:22 +0200 (CEST)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oijH3-0007G5-5x
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 17:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oijEM-0003Bp-56
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oijEK-0003ec-0q
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665609931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3+CelZ2mnGarKETb4Aynro1xiZqKi8dHeoh6sXV3nU=;
 b=M7NukloXIzlo1UnFHmX3urBI5UXmVmFcSt+nQjvxbQtxKnZBzX3wwU28nOG0VIqeRrz3ic
 uJ0dztF4Zs/E1y1dR+5f9pTZOpFLe3tIX23CWvEmB+x/C97kszcRGbenffzf5nQ5piH92O
 FfUVxNvnY4XFHmT+eN8r+0rjfCfigg4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-I3pUJRM1NkKekCdPvm1XVA-1; Wed, 12 Oct 2022 17:25:29 -0400
X-MC-Unique: I3pUJRM1NkKekCdPvm1XVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90818101A5BB;
 Wed, 12 Oct 2022 21:25:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC01A208744D;
 Wed, 12 Oct 2022 21:25:28 +0000 (UTC)
Date: Wed, 12 Oct 2022 17:25:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/28] target-arm queue
Message-ID: <Y0cwx/CjLI+sn6zH@fedora>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3xKGxXeAiTB87TfQ"
Content-Disposition: inline
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--3xKGxXeAiTB87TfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--3xKGxXeAiTB87TfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNHMMcACgkQnKSrs4Gr
c8hy7Af9HcWPV6Jb3FZmWJQgVKYktWZmr86I0rUxZlXsGMBiXxCBKpMcTiKOKguC
UGRWnwBjvxFEVUKspIGwAe6+1c+d/ql9pK/G5IjPQP0jFe0m+2EAYzCAAcH5QQeu
BPPrjP4LzJVXzDpqCd7QbSrd2CNq6IuALZWIPjFnD4BBuTpWoBwRL1VuR/1YhN/p
KG6cgHofAfD5FnnvooENZwtdTJfEwo9fHQCikBW7h5E5jm5uPigK3XQ5Sg49T3gF
QtjV8ShJVDcwBgDH/xXiASrDN33vTanSatMIkY/fPtqCgBLYNZJp9EgbyhfPOVpW
sh5UBH7+ja2GSv/0ZKmDh0dPirv9IQ==
=zuXM
-----END PGP SIGNATURE-----

--3xKGxXeAiTB87TfQ--


