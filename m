Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304DD613796
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUVd-0002Oj-VE; Mon, 31 Oct 2022 09:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTi-0008Ez-Ek
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTg-0007l8-MJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xOHeAKSgfn7G6cCQ2+G+xNDz55LoZ7kfH+WBgOhUN9c=;
 b=NSYkM5xGB5P74L/LgMJLNJanZJ8bChvopAwWmlN3X59/xCX4Vv+7pZ1Gusxiga/A3tmHDn
 hC97fcefyp1Oci2MEwYGg6iAOVlIQfQNDJcQJ6wWxUNQOQ94VroadGruupAZROsFjoT267
 ocA2mmltINiaqHODVqsim43nTcVEGxY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-weA3bde6PYGD9x0T1v5ckw-1; Mon, 31 Oct 2022 09:05:15 -0400
X-MC-Unique: weA3bde6PYGD9x0T1v5ckw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 281A63C0F660;
 Mon, 31 Oct 2022 13:05:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 627CF2166B29;
 Mon, 31 Oct 2022 13:05:08 +0000 (UTC)
Date: Mon, 31 Oct 2022 06:13:21 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PULL 00/58] Block layer patches
Message-ID: <Y1+fwYAzvZ8J9G9n@fedora>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r6CJ5qZlBh5Nnv52"
Content-Disposition: inline
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--r6CJ5qZlBh5Nnv52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--r6CJ5qZlBh5Nnv52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNfn8EACgkQnKSrs4Gr
c8jSdAgAwR3J5RybjRpjWgnhpHA91cLmHqAu2M+RkS1G8Gb9nwVMaa8vDYRAGVcQ
PAHKWB95NJ6e26ZU3m+/NXOu673ToOJ8y6qczDEVkYQGpvuzDiIPIibIoQVI8amC
D12GrWNiWL8AKYBeVsTjJnpPj06t1hIY1yCYcM4jTS8G9/z+qYPCYlgmv9Zom1JJ
61ult7Zg3HZv6cA0u1vKvLb1JSjndWjrnk4wqQ1vnMo87P/Y6VYhozNpC1pz6j8P
PJ/VB1vT0ETuxygJIhW0+qmoKVeLm5O9qlTSdFLmnZ4T5NdCx3TpLjmCKVMSjye1
rypNUxYhQav1Wq2AL8OcYLxtIxIBjw==
=HKGH
-----END PGP SIGNATURE-----

--r6CJ5qZlBh5Nnv52--


