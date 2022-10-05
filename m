Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253565F597A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 20:03:55 +0200 (CEST)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og8kI-0006PR-8d
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 14:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og8cq-0007jk-Vk
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og8cn-0001p5-8I
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664992563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9Tv1Gse5BtEp753qlRgN7nUvK7PQXBrCERBtfjuGjk=;
 b=gjDLSKQfz9UaSHfji8p1Jd/IyrYiLmnTbMIMqjnyiDgHfzqxJD4sOcQeuE37gQigfGBqN6
 +sUr6xdik/vdSry2mYcTn9+eky49cuZWu/G/4yQnPbVxNdsePh/t/DLuNIAOmJv31DdoLr
 Ca6JhWiCZ0P/kRAQAMdUNOmdX3uUqjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-0NEEMdgBN5S8TIzH3WzFDQ-1; Wed, 05 Oct 2022 13:56:00 -0400
X-MC-Unique: 0NEEMdgBN5S8TIzH3WzFDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75C73101A52A;
 Wed,  5 Oct 2022 17:55:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5C2F2166B26;
 Wed,  5 Oct 2022 17:55:58 +0000 (UTC)
Date: Wed, 5 Oct 2022 13:55:57 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com
Subject: Re: [PULL v3 0/4] Hexagon (target/hexagon) improve store handling
 and gen_tcg_funcs.py
Message-ID: <Yz3FLSj8UibNWTOp@fedora>
References: <20221003181511.5535-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MMoqrh4bxT40roT0"
Content-Disposition: inline
In-Reply-To: <20221003181511.5535-1-tsimpson@quicinc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--MMoqrh4bxT40roT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--MMoqrh4bxT40roT0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9xS0ACgkQnKSrs4Gr
c8gTaQf/a4cTDomxPydY2Lzs1dFe55vWPyH3D9nOMXQnu3EUtpx6FN6lwrasLD+c
B3HShsixG2A4F7qL6qcaWjY1Wht5bwTevQ+BsYgFzvHzd5mvgvKXAZzDgYAIdG2S
dHj5zt3D0zs2N1tofmxD8k0V1JQnYE5tg7nk9GsS8YlEsLU+9ecW3G7P7wv3JI2V
Wra9v2RLqyknEClEY1YmGm0StCWLsxnTnr+FPllZEHGb2Bz1ZEGLX1R6kJu53TTp
ISE2raZIShplJZ65EffHCI6y/I0+vsmiRwJMSR6ZCI0ZWImdY3GkUQewICcsWxtV
9aEIcJIX3pQ1ZmZK4MMMlmU3a4yewQ==
=Ofk1
-----END PGP SIGNATURE-----

--MMoqrh4bxT40roT0--


