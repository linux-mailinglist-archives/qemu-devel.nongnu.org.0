Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44060E2FB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 16:15:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onh6q-0006No-Gi; Wed, 26 Oct 2022 10:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onh6o-00064u-3U
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onh6l-0006KT-CR
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666793406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H/BPisbILzvIK20yKYmtR60yC2wL3JdKno5fDTD3QBU=;
 b=AYTB3UqMsN+qLSR7XTLsSUCDQ/japqjdEESyrw8nOWDVaVwOeVllmDVhPYqhHRwbEPh0qH
 J3m05nWjqth7sYeL79t9FIID9JU8FGyJzmJYKujr/iqbHI+eXm+p9QEZ44lLbZflwqy4dH
 1U4PGBv+IKVEgrA3AJjgC5fM/xG/kqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-WxppnJ1wOz6LUO8gdyJObw-1; Wed, 26 Oct 2022 10:10:04 -0400
X-MC-Unique: WxppnJ1wOz6LUO8gdyJObw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0181805AC5;
 Wed, 26 Oct 2022 14:10:03 +0000 (UTC)
Received: from localhost (unknown [10.39.195.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6359540E80E3;
 Wed, 26 Oct 2022 14:10:03 +0000 (UTC)
Date: Wed, 26 Oct 2022 10:01:25 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 00/11] Trivial branch for 7.2 patches
Message-ID: <Y1k9tVDUsEh/rN1j@fedora>
References: <20221025075358.3117373-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U/PXoOHO9AmtP53w"
Content-Disposition: inline
In-Reply-To: <20221025075358.3117373-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--U/PXoOHO9AmtP53w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--U/PXoOHO9AmtP53w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNZPbUACgkQnKSrs4Gr
c8g22gf/QLIPKpibbTK/zgJcjIbOW8t1YtaPl1LQlAVKRUhYBuYmtLUfuZqvpnyC
WHjKOuQE3N4ro/JNCZPr39V8JMxBmnyoEoDJoLspm8T0Fi7p+rPfdaBM1l8xDFiF
uqT/Ku+UZtOo0IIBo9a1tWkEmohKFlq2qGdOMJD8HyejlbvRAnNPO/sPennKkem6
dTRQtRDG24vMMZsYaXWQJtHOBEvbup4QwXC+D8rd0kYnDHI67JyNMCn+muf5NVgX
PmoInOx8gT/GP07zmqx6zITXNzt3f5ns01q/fu9QnOEpi65rXK7ShW44rRSDKd5n
F84oK9zOfH+e0wEho5QVweTyNhJMAQ==
=DQTg
-----END PGP SIGNATURE-----

--U/PXoOHO9AmtP53w--


