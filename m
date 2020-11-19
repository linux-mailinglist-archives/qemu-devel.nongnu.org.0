Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B42B8FDF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:07:37 +0100 (CET)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgqm-0006SF-En
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfgq3-00061w-GG
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfgq0-0006fN-T2
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605780407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pelFnaPE7SyCqo5Mx6/CvGfy3DRQDzdBqFc3GBn/a/k=;
 b=DbIaTE4vFtK9x90eE8GwjZpX93BHnj+OlXM5wFqrPp43tLziIY23P1LGGupJ0vQb10ozHb
 O4JuW4+DehMI3MV2jbvQ+St1QVs1p1fWniTNDE3OPzgre/HH0+PMGzMD281cgZZtszTcfn
 zCSSTyucy8e0aIyPmfXCdvZ0LE1Dhhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-RpATiN_yOpeqPet5MBMV9w-1; Thu, 19 Nov 2020 05:06:45 -0500
X-MC-Unique: RpATiN_yOpeqPet5MBMV9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71D0E100C661
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:06:44 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 168935D6A8;
 Thu, 19 Nov 2020 10:06:41 +0000 (UTC)
Date: Thu, 19 Nov 2020 10:06:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/4] meson: move qxl trace events to separate file
Message-ID: <20201119100640.GF701869@stefanha-x1.localdomain>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119084448.24397-4-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 09:44:47AM +0100, Gerd Hoffmann wrote:
> Move qxl trace events to separate trace-events-qxl file.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Can we put modules into their own subdirs so that the existing meson and
tracing infrastructure (e.g. scripts/cleanup-trace-events.pl) can handle
them without modifications?

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2Q7AACgkQnKSrs4Gr
c8jkUgf/WEvXzY18Hx3MdMYWxCGa1dX5MfKvvSymowtJRSfmBSqAzqYHHjC9Iao8
0ZH/BTiCgLW2YuT3TF/6xmoNVxQn084ObsI4pWk2xId64KLEBjQhRUdld3oZP/v1
xIK3UUiWwQICKMvlzPIlGla2zv0Q+S6gYrn3N205yfDc5RmpD4akbdvn0o9hQQ7k
qJXeqt5y7CsQ9ySaZ4s3IfK610ePmOaREYGUDCQiNsHmXIbZcq/vGsx5/VhgC0il
t8Dp/bGmc2yzSkSNLchNNAc+cbZc9Axj6gbmh67HueIqDsDgWgXmYBGK/WZf0hJm
3dqkDFVd0PKTxMGzpR+Uv1PvOmFEng==
=vKr8
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--


