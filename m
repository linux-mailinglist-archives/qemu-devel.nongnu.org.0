Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8975AD224
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:11:32 +0200 (CEST)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAws-0004GU-Ru
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFG-0003D9-HY
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVAFE-0000Sb-Vi
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662377184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FK85KEHhusvpPjC8HrI02MbWipDTmMEz22xOyY0agxI=;
 b=OyF7YOipDXcYfRNVdzl06AfxVfr8okQyN7NXMbqnA/kLtadefYk8pjI1emnWwiz94Op79h
 cZwqHnC3XxNlXi68WME573uYyPcsM4e5HTX/miXrc2v3vIZblApN5iLXr4xwocvWaEKV5h
 vKMaUDhagqmyxajOdNE430um3SP+pfA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-XZKcWWb7NLuSrWOI0M7-IA-1; Mon, 05 Sep 2022 07:26:22 -0400
X-MC-Unique: XZKcWWb7NLuSrWOI0M7-IA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDE68037AA
 for <qemu-devel@nongnu.org>; Mon,  5 Sep 2022 11:26:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 162D91121314;
 Mon,  5 Sep 2022 11:26:21 +0000 (UTC)
Date: Fri, 2 Sep 2022 16:34:16 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/39] i386, SCSI, build system changes for 2022-09-01
Message-ID: <YxJoyNJYeCNRVd19@fedora>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="itM64DdXL8yyyeHe"
Content-Disposition: inline
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--itM64DdXL8yyyeHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--itM64DdXL8yyyeHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMSaMgACgkQnKSrs4Gr
c8iO3Af/QOjYcZ3mMfWiGX/aNeQTrF7vFfm0kSRFjOgE2QWpj/0EQbuEp1GuiO8P
+jtEKKgi+H5X+sH9rC3sg1UoN6BgGvBX98uF79i3THkhN0mtsA0diXU83EvqhXdx
ZL4UY/bXk0f+Tiusz62kHlbuiMfbzpvj8/FMQVOCy1ul+bJDdoIKUKF1b54L5rqb
UoSODWf0UXreAMyWAsXbkKgA+IQ+JUEDpIFLCzFXrHbrCLpXrsgc7/W+bEU/7MzE
D2v9AGCyQ41VnvzCTlJ4b1Dkvi6NaW9acET6gxAUW6FSmDJOOJyPM7CojaVnqz1v
1qQC/P8F9wvgW3cY/kJl9O+0Ge8kvg==
=hkxz
-----END PGP SIGNATURE-----

--itM64DdXL8yyyeHe--


