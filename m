Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0254854CC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:43:10 +0100 (CET)
Received: from localhost ([::1]:36976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57VM-0007Ud-KG
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:43:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1n57Rc-0004ft-OS
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1n57RZ-0001wf-HC
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641393552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TAaH369pYS+YHs4nV0osLAwGDPe/OFmbyewHWEfxhmA=;
 b=BmnOwHc1KmtklVTdjPgofjTcYs/gcQFtc5SPVek5gjkrfGqOTQDo+9AooYWJqd1Q+qmKpX
 FxSX1T14aLHz/54l7gTJ9u2i9D5kjgUPLDYZ+ZREfyd+CTBYzhSJnMfBxExINcALtO6loq
 sabEOyFmyC+FZRLFm47Vtg9uOkOVNeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554--oWKHv-4PTGF1bYvueNozg-1; Wed, 05 Jan 2022 09:39:09 -0500
X-MC-Unique: -oWKHv-4PTGF1bYvueNozg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB6888749A4;
 Wed,  5 Jan 2022 14:39:06 +0000 (UTC)
Received: from fedora (unknown [10.43.2.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE015DD1A;
 Wed,  5 Jan 2022 14:37:57 +0000 (UTC)
Date: Wed, 5 Jan 2022 15:37:54 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device
 JSON syntax
Message-ID: <YdWtQoOTY0XmZzjt@fedora>
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220105123847.4047954-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CGxs4C2x5jZIjKgS"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--CGxs4C2x5jZIjKgS
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Wednesday in 2022, Daniel P. Berrang=E9 wrote:
>The -device JSON syntax impl leaks a reference on the created
>DeviceState instance. As a result when you hot-unplug the
>device, the device_finalize method won't be called and thus
>it will fail to emit the required DEVICE_DELETED event.
>
>A 'json-cli' feature was previously added against the
>'device_add' QMP command QAPI schema to indicated to mgmt
>apps that -device supported JSON syntax. Given the hotplug
>bug that feature flag is no unusable for its purpose, so
>we add a new 'json-cli-hotplug' feature to indicate the
>-device supports JSON without breaking hotplug.
>
>Fixes: https://gitlab.com/qemu-project/qemu/-/issues/802
>Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>
>---
> qapi/qdev.json                 |  5 ++++-
> softmmu/vl.c                   |  4 +++-
> tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
> 3 files changed, 26 insertions(+), 2 deletions(-)
>

Tested-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--CGxs4C2x5jZIjKgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAmHVrT8ACgkQAk1z5KIM
l5TmWAf/aMr5A2I19ELZguSzgVP7YxIvH8L5Pq9CRT4a5aLeNJy6iBeMxxPUCODf
jPyoHiKQoLV3MoMngZmL1r4O8TizI5qeCuNcgjc9u0KkEG69re9gYSnlrKQhe41j
vgdm1NaNIs/reNzDXP30NzGNr2q1/5uYhDapF+O+Pwwir33/nwCChhrplmP1I+ao
pvdaeNDhEzkMwGUnoDKLJYf+IwoSjBMtFaYGd5qlELTJLW+HDTYHVBR20DP5u/tA
dxkMTXGGOoBnw8lPK8YBkPvVVEQ+tB6YrjXWWdXz3UH9J2zdyp1U/dFF+3TWwbei
oCmU4YpMz2EsbTHweHOvIniGhG9bZw==
=JInF
-----END PGP SIGNATURE-----

--CGxs4C2x5jZIjKgS--


