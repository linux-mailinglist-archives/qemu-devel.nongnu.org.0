Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D36328B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:54:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox97v-00060s-SW; Mon, 21 Nov 2022 10:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox97t-0005wI-Nq
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox97s-000373-9D
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669046067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=J3sQqNi/ZJH3bQiqCuczJQF7e4PHay2nTA6LyXPWF/M=;
 b=Bc7qEDLbTtpJvytlVQD2ydJ/321LQEaMHQc0Hk3OC+titbRTLN4eyAeLI5euOV0q0hMBqt
 bEJ3cVmT/flKB9aWEqYcXuoGkC+pH7y5epkS8+ukUR3YcfUWZqQVax1izyHMvTLFkYl1Gw
 v7oe+B+i3Xs8FeN2ViyyKThYHYqU09M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-XYtLAmfWNwWBAW2xIVbBkw-1; Mon, 21 Nov 2022 10:54:23 -0500
X-MC-Unique: XYtLAmfWNwWBAW2xIVbBkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B75F801755
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 15:54:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E97BB40C6E15;
 Mon, 21 Nov 2022 15:54:15 +0000 (UTC)
Date: Mon, 21 Nov 2022 10:54:12 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/1] chardev patch for 7.2
Message-ID: <Y3ufJAX0DBp92veW@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xg7byBNuurHwwyBw"
Content-Disposition: inline
In-Reply-To: <20221121073611.1337690-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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


--Xg7byBNuurHwwyBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Xg7byBNuurHwwyBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN7nyQACgkQnKSrs4Gr
c8iOJQf+J/2rk6LKlQAvWDREfEdvh0wuRbOwduXd2jqLbYXZHYGVpGrMwsqyjwJv
istXiuJMArMsH0kvrHdhjgNzKcwF3mA/S7mvgGh2fR1f9jpyvXCyEtnoRccVjmIT
AY6Xx4VMYMPzG8ME8yHIDsEyl4gaeq9E8GDjzl3vj1keVFib2GqMjPG6e4p4q62E
UYXmJcfJtfEQ0/Z865BNcZuPpolMM4DqaMpm34raHhjsMG0llLTsCzUFxfJUP9Bb
SRNX/RTBJlK2vYmuNA/5QHF6nAsP7RvwluI0m3Uh6IbJDF/lVrITvuS3I1XoUrsY
5U062QkQG8ELeVmyPkOI8HjInujlwA==
=oIwC
-----END PGP SIGNATURE-----

--Xg7byBNuurHwwyBw--


