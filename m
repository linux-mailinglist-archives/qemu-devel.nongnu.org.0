Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D855E2D9CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:37:35 +0100 (CET)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqqs-0005Pr-Sa
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1koqmr-0003W7-M9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1koqmq-0007Wp-5O
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607963603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n0dA+fIBgLlYPBa+JxxPoXRRrX356xrMmeS7KTzYuaM=;
 b=P7RWWX0xSejYe/CWvr1BbkKOBV14c/09IS9K5Sdw6KiHk0484Lze+LkhrbGfisnCKOrdTL
 TDtYjbGWxZL5zkLQyobkP81tNdE95hRvtDQjIEP7SKtjkztW7LLD1D3rxJEq6k15EOS965
 J2r9N0VmXgDDx6wyEbh/qhvZujwyNnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ikY8T35yNZ-PjgkxeMa3Lw-1; Mon, 14 Dec 2020 11:33:19 -0500
X-MC-Unique: ikY8T35yNZ-PjgkxeMa3Lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83732180A089;
 Mon, 14 Dec 2020 16:33:17 +0000 (UTC)
Received: from localhost (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24DD910023AD;
 Mon, 14 Dec 2020 16:33:16 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:33:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Glauber Costa <glauber.costa@datadoghq.com>
Subject: Re: [PATCH v1 0/2] Add timeout mechanism to qmp actions
Message-ID: <20201214163316.GD620320@stefanha-x1.localdomain>
References: <20200918140628.GA2509473@dev>
 <1ba06b0d-3fcf-3676-f9e0-52875851ff19@huawei.com>
 <20200921111435.GA2524022@dev>
 <20201013100033.GB164611@stefanha-x1.localdomain>
 <f70dc6ce-385b-a4f9-04a0-244018f3ddbb@huawei.com>
 <6fd02e2b-50fa-b667-efc6-47d1765bdd8c@redhat.com>
 <4eb92c5e-fa2f-50a5-a0f7-5cabe6e15bb4@huawei.com>
 <ab245c4580cd5aecc8c5d338fd0e2802cac029d5.camel@euphon.net>
 <20201208131057.GB272246@stefanha-x1.localdomain>
 <CAMdqtNWGYu-U5pECzffNvu8Dv_hMfwJ9w5RPoLjF-_NX4cfjdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdqtNWGYu-U5pECzffNvu8Dv_hMfwJ9w5RPoLjF-_NX4cfjdw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org,
 Zhenyu Ye <yezhenyu2@huawei.com>, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com,
 Glauber Costa <glauber@datadoghq.com>, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 08, 2020 at 08:47:42AM -0500, Glauber Costa wrote:
> The work we did at the time was in fixing those things in the kernel
> as much as we could.
> But the API is just like that...

Thanks!

Stefan

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Xk8sACgkQnKSrs4Gr
c8gBsAgAp7PnH3lNQ3mMxbk7fZwBgzYEz0xknUaOIgvOh52OgMRS1CMydmGPJzXh
sKa+dD/t7JNPHHteHuQuL55o9af4hbBzOqq5958bt6bF+CUxI4t954niXyuZDW2T
IEGwzpj3gtlAt9VuFHURMiLMSeUQ2c3o+YfYXUwbWIh7g1ahhsRz7Hg+qtg3AMhp
f8WvryGrCmUbiHHIiioFfixYBngrsLrnOh4mL98yFWTiIv3FjFVV1KqPRUBkPgre
gxpnie2PkZN9+tefC10vSQvrQOe9GNxqdOcdwScTesfpb4MRUPdnLrXsr0ob6t3W
Hg5oI29jb7Wf+WA7XuMhRc//WaelPg==
=fIZS
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--


