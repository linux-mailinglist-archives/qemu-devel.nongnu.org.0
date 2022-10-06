Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40475F6954
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:10:06 +0200 (CEST)
Received: from localhost ([::1]:54274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRZd-0001RQ-TS
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogRYA-0007gU-PS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogRY4-0002vA-GS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665065307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BH56QYZEJSy72QibJzSHZ028GNf15BwZ9LgXQ8cYK1s=;
 b=iChAha3CVd56OwseCop/VTu/N9Gn3/Zln8v/QK5PsQK9OokOZH9hlBUdG/x16X7o03aXCB
 wKlu5fpHr7OKsMkzFFWbT9QrUw81iJNmTbWljg0HbeVj6uLaB6LrBhWhdhpI8pxU1Ota82
 ziiYC6FqaiyC56uLRqVtmaqn/uPbydE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-lrNlNrHdNhKjZ6gabE8JOA-1; Thu, 06 Oct 2022 10:08:26 -0400
X-MC-Unique: lrNlNrHdNhKjZ6gabE8JOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5296857F8F;
 Thu,  6 Oct 2022 14:08:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5072A1121314;
 Thu,  6 Oct 2022 14:08:25 +0000 (UTC)
Date: Thu, 6 Oct 2022 10:08:23 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v3 00/52] testing, gdbstub, plugin and gitdm updates
Message-ID: <Yz7hV6sm1V0N1g0+@fedora>
References: <20221006105556.3319342-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aVIWhekFuMyTtbDz"
Content-Disposition: inline
In-Reply-To: <20221006105556.3319342-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--aVIWhekFuMyTtbDz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--aVIWhekFuMyTtbDz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM+4VcACgkQnKSrs4Gr
c8gnXwf/efneZ+Roh3+4h86L6ETerMvYiugrgDUsJWVOLDtyiDXyHJb4Zw4ytCFD
9LQw9CmEj0Mo4hkh1iQbk+m5/xXzc7+P+EwMJKBLh2VFZgC9SVGyCGECfCWL0/6T
M44pvM5rpIA7QWbpjoFcEOuwPAwhP/QV7TqwE+nS4bTB3yfLokiFDWjB9SvEQCBL
nZkvhZ64WAg98fUya1XMwyGs/n4jVB8NjDTog0Wwf1hTNuO61XE3dim2POQ4DzFl
z8cA7ZM0s5gmsjmq7GhK4SjMQ6B9VcZL2JlRmqyFwKHueYsRzOwO5V54Hs+yRFVj
edridmRss9wJCq0RpBE3/YxC73a+Gw==
=MZI2
-----END PGP SIGNATURE-----

--aVIWhekFuMyTtbDz--


