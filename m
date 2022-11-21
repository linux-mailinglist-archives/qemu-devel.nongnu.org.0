Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D56328B8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:55:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox987-0006c5-Br; Mon, 21 Nov 2022 10:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox984-0006VO-Q1
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox983-00038B-As
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669046078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GEdrq/9FBEsEdk+Ftu3ywVvp5u8sRgNlD0i7BG4UfF8=;
 b=ePuYKO3PSvZKO/9tBntEPpZvt6srHVS3DSPcEZ7OyVcgQZ/e2Pv3lAhX+r/o91HVuBl4eU
 GFEj+aV5+u0iccJDoRoM/Ccph9HI9jVDO6k9l78fD/rzM8sRJtRJVpkCvTUf81QQ98+W2O
 tDE+Sbk0TIwB9RV7Jy7+ULzM50Kj9Vs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-8723iqMgNkGJfw4j0E6-rg-1; Mon, 21 Nov 2022 10:54:35 -0500
X-MC-Unique: 8723iqMgNkGJfw4j0E6-rg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF5C6101A52A;
 Mon, 21 Nov 2022 15:54:34 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25E4D17582;
 Mon, 21 Nov 2022 15:54:33 +0000 (UTC)
Date: Mon, 21 Nov 2022 10:54:30 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 0/8] Next patches
Message-ID: <Y3ufNvZ6CAcPBOkj@fedora>
References: <20221121125907.62469-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VF67uiVbQzL3Obtq"
Content-Disposition: inline
In-Reply-To: <20221121125907.62469-1-quintela@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--VF67uiVbQzL3Obtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--VF67uiVbQzL3Obtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN7nzYACgkQnKSrs4Gr
c8iUEgf/dNqMxgiK0xfWcsq4q5vOJ5D73tstw1DC/8PsHluvPh6COJ8jL3rQ6D+1
kyUnLTb4sBfEWAS8iOM/mOgB/kQOZTGANtLg/auwhXTAiBJHhSOcbittmxRapw9R
nMPb3Kv6Al+l/0aaia1vsvdfWUvawq3mWHxbQQtnwTIXJl4o3Msz2i58nSHTA1CV
MP4Cs11DhWOAFr28mDJuqhMd3Qcgt5bf8Ivhib++DIJ5qQIGRniWnFPzOwUDfl0K
G1qBiVE4jjmBIJGoKpVMcXFfKTfWNrSxDrA6wK4hOAL8aQPCnnAW9MU6odlwKEtN
TKIwtKc3jWlzHrlg7Tkd2+TosVT0vg==
=HsIJ
-----END PGP SIGNATURE-----

--VF67uiVbQzL3Obtq--


