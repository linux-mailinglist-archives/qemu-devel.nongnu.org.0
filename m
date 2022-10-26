Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012DA60E800
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:01:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlcc-0005Gm-NG; Wed, 26 Oct 2022 14:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlca-00055b-04
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcY-0006zI-JP
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tNHARpogLaMP+711BvvXYgWkFYW5zbf+tIGg8UEBoMw=;
 b=MOFXArq6Mk4sPI8psrLMVVjrgHFD7KRNBsjWYIEuTssYkgO++AFhufnWyaFrjWuBup98Fp
 bzvHe3kPhEW242K33UrWf4dWfP/3qen3QyQoCrD0xMs1u2jf/QE0WB5hDXlTOeHaH07tC0
 bSwvGJtT8D+UMOAc4+PNWvFyH734+n8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-2chrGxF1PxWEL_BETFkyDw-1; Wed, 26 Oct 2022 14:59:18 -0400
X-MC-Unique: 2chrGxF1PxWEL_BETFkyDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 373691C09C87;
 Wed, 26 Oct 2022 18:59:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD9A477F55;
 Wed, 26 Oct 2022 18:59:17 +0000 (UTC)
Date: Wed, 26 Oct 2022 14:54:36 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 00/47] tcg patch queue
Message-ID: <Y1mCbEEMCxpMLeA3@fedora>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UbNERPSEGMNSk9kb"
Content-Disposition: inline
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--UbNERPSEGMNSk9kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--UbNERPSEGMNSk9kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNZgmwACgkQnKSrs4Gr
c8gP5AgAnHw7wgi8O2odnX4wr1lRMDe+G6sLtUwlWjlKbrkTBlGRzB+K7VVJJZkM
6U4AVP4lz+Nw4ZxFkZU7vYrwLrEkbERX7kkKsI92xoLa4IsE7/K5yx1l/JtyAQUP
ETfpuZwr1kCTdSK1UVTYZ21lxRXEhgIz+NIkNLt0YkDurpzRxtCXyIrJeHxgQ7gb
NufvjHaBNIUT3++R2tjRV5nU9we9jLxMpNPBl7jcGttLxULGTkRa4gqDhYEmWpf2
BhXPejzIOCQT2zDm8NNSxeYSLmGSl+RsJ1qOmwcctQW2n621ZoHOPAIyLWlQ4YUe
KRvzb+TswGZ4ObumyUstzemdoFPPdw==
=JeY4
-----END PGP SIGNATURE-----

--UbNERPSEGMNSk9kb--


