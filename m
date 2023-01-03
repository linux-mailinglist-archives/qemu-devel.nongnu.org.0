Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA4065C05A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCgm6-0005zF-VM; Tue, 03 Jan 2023 07:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1pCgm5-0005xm-6b
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1pCgm3-0006Lv-2p
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672750329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nGBN9FUXrQ1sV33VrkGSXm8QQZEWILv6d6JjjPxbixg=;
 b=MBopnPq01JRSuMmbp2bcI3FTkUh4wPWQeAGaS3ypznLpw6rl8n1l392x/ruloi+4Lhs2B6
 PJ9Pich7VI3Ei1H3xbWT50hR+l1euCBrwpH8Pb2ksIjpmDRBYWlp8UKDdRemyzsA3mGwvY
 63c+FBDgRMQV/eSNs5ts0cTq59fuql0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-_VLcsNwoOOeQhlX9J4JHVw-1; Tue, 03 Jan 2023 07:51:01 -0500
X-MC-Unique: _VLcsNwoOOeQhlX9J4JHVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B761929ABA11
 for <qemu-devel@nongnu.org>; Tue,  3 Jan 2023 12:51:00 +0000 (UTC)
Received: from fedora (ovpn-193-232.brq.redhat.com [10.40.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE22C492C14;
 Tue,  3 Jan 2023 12:50:59 +0000 (UTC)
Date: Tue, 3 Jan 2023 13:51:13 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] i386: Deprecate the -no-hpet QEMU command line option
Message-ID: <Y7QkwZbuscV7zpYQ@fedora>
References: <20221229114913.260400-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5tedRCdJDVduqAcB"
Content-Disposition: inline
In-Reply-To: <20221229114913.260400-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jtomko@redhat.com;
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


--5tedRCdJDVduqAcB
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Thursday in 2022, Thomas Huth wrote:
>The HPET setting has been turned into a machine property a while ago
>already, so we should finally do the next step and deprecate the
>legacy CLI option, too.
>
>Signed-off-by: Thomas Huth <thuth@redhat.com>
>---
> v2:
> - Rebased to current version from master branch / adjusted version info
> - Dropped the descrpition in hw/i386/pc.c (already done via another patch)
>
> Note: The "hpet" property should now show up in the output of the
> "query-command-line-options" QMP command since commit 2f129fc107b4a, so
> it should be feasible for libvirt now to properly probe for the property .
>
> docs/about/deprecated.rst | 6 ++++++
> softmmu/vl.c              | 1 +
> qemu-options.hx           | 2 +-
> 3 files changed, 8 insertions(+), 1 deletion(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--5tedRCdJDVduqAcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQT+Rn5j0qdK2hQgnuAU0rOr/y4PvAUCY7QkwQAKCRAU0rOr/y4P
vCNUAPsFo3kw1z/LCq/z0hIkL3r2UavmASc8fgzTpp7NmKI2jQEAgAF42t+8GtPt
dVR8iBoNrl08qZfOYA2nCWi2nU2RugE=
=LqK6
-----END PGP SIGNATURE-----

--5tedRCdJDVduqAcB--


