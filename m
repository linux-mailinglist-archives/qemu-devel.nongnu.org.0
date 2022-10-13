Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29775FE360
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:35:37 +0200 (CEST)
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4vY-00042M-SW
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4qA-0007e8-38
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4q8-0001XC-Ep
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665692999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UIb8xuqQjm0EysSrp7XmEVg3IL+IezXzPqbVq5Vis1g=;
 b=e0oCM1p3kCPcr2OiKDZLx6YvV4Eb/+7f1Pwc9oTzKtLXIBgaoYUAKBo7ikjewFgcdTkVK4
 Y5EnQ23SjJGTwpRsDNXt+zhqEqaIpoUlPxjHN+fhV0kd0cy+NJqYoZr1K/wk1nF8+a3RVy
 GaMf7tGmsFT15byUTx00yJb+TEtrWRw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-UEZy_0FLPAKDrVo1G_ByYQ-1; Thu, 13 Oct 2022 16:29:57 -0400
X-MC-Unique: UEZy_0FLPAKDrVo1G_ByYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7950A381A720
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 20:29:57 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F28AC117DB19;
 Thu, 13 Oct 2022 20:29:56 +0000 (UTC)
Date: Thu, 13 Oct 2022 16:29:55 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/37] SCSI, i386 patches for 2022-10-11
Message-ID: <Y0h1Q9r/QuTZhXPS@fedora>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LkOuC4JSaVEwXTNf"
Content-Disposition: inline
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--LkOuC4JSaVEwXTNf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--LkOuC4JSaVEwXTNf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIdUIACgkQnKSrs4Gr
c8gh4Af+Ja+jIdyzgsXnaxmIJ5YKXRR7mHcf2DBv+lorNTBt2WHhaW+90NHkKJL+
rM5fhbSBzk1HadYw1mReZDKIWTH9773upIQXRVi9xeHPBbnIANtLUPZ4ZB6RVcPI
aRi4qivoZvHLwUJhDkjxmx3/IURazVh3tEYKgfbVH5b005Pg7mbyZvAmWn2GFdDr
2gWp1EvJzzJV7JJosYurRFw2VEbCWl4P6YdbAdqg8V5Ot8W3n70e/b/fFtNIlmhI
ldWusUtJLQQrKN7sK3ysawSwRQ7E8pV4j95BJJ9zzwsNlu1Z6miagiB6OI6Pe5aN
K86VLAa10EbYhCc5LT8+3ilJCjVfbQ==
=G8R/
-----END PGP SIGNATURE-----

--LkOuC4JSaVEwXTNf--


