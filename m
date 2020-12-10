Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B6A2D592F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:29:06 +0100 (CET)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knK87-0002lG-Mv
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knK5E-0001R4-Gk
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knK4w-0007od-U0
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607599545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvAsoREgQ/k56391ELB00thpkus2GKI+7OzLGEoFAI4=;
 b=NlEqCNvYbBMqrwLicf1lCt3mmQeV1ZvxmNhn01Hh0Dd9/yeZdlw/mkyVgr8kOj+K+kRMoB
 WfOOYRD7JOTLmJEK8HJHiOAdZ+BXD8909RLkLL/dgynb1FHGHJvcGgFQceer7/yGaQJXeg
 OO87b5sTk/5oGHTkWKEVDfyoQP5r0Y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-5UCMoVGjP822iXA6uHl7QQ-1; Thu, 10 Dec 2020 06:25:43 -0500
X-MC-Unique: 5UCMoVGjP822iXA6uHl7QQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A430BEC1A0;
 Thu, 10 Dec 2020 11:25:42 +0000 (UTC)
Received: from localhost (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63C1236FA;
 Thu, 10 Dec 2020 11:25:41 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:25:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH 1/1] trace: Send "-d trace:help" output to stdout
Message-ID: <20201210112540.GE416119@stefanha-x1.localdomain>
References: <20201125215245.3514695-1-dje@google.com>
MIME-Version: 1.0
In-Reply-To: <20201125215245.3514695-1-dje@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 01:52:45PM -0800, Doug Evans wrote:
> ... for consistency with "-d help".
>=20
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  trace/control.c | 12 ++++++------
>  trace/control.h |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/SBbQACgkQnKSrs4Gr
c8imBAf/XS9vDQ2plur6zngOUzPFWvHzHWx9vjoMhS8YCzWgefe7V676N3Qjfb0O
GpGl14BluZAuWVcPF7qYFlq0uC20pYS44qvTLu1V8ewncMT8AJGD8WW0r2p04qcb
v4p5t+BkZYxWPSUGHwdzDSFRrPNc5RsmIp03abN/vw2j06BHeG1N4GDr3Kp0KoyH
3rJc8JSJhfhOZqLLpOMq9xGvmOQVke4UgYiikNq9KCNWuSRXCx07Sxc5RSL3BpDz
W2yMcAPoypb0cKxxZFQJhtut9dbn6Va3WBWNwshUry1zvNmi2l5HNjG47xywWZKf
xAmXWwImtwXZ+qzX2LMyNfZDMZHpPg==
=EQBK
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--


