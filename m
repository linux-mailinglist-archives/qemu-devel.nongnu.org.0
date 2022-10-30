Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841F613779
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:10:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUTs-0008Ms-9z; Mon, 31 Oct 2022 09:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTU-00088c-Ke
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTT-0007he-6h
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0RgX4O+D5dhrj/hBR3m/eD2GXGH9To7Ghah38eIquv8=;
 b=gS6kDtMOkIa1JOiGe+btGxD7izA4vimjZMdluyTFeTwXS+TGsyyPzd5R6S8CE+VEw3p3Yx
 T4YLNQmiGbBl5AGX3gy+LJy2NNe+zqsjXWMHK4V7XQlmwJs2H+k+FqN4a+Wm4wdbaNuR34
 HYIS9EGKfuHZhgMl+RwTupLh4lTnbmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-DSGdspaJN1WKuwWO6tTzYA-1; Mon, 31 Oct 2022 09:05:02 -0400
X-MC-Unique: DSGdspaJN1WKuwWO6tTzYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65669857F8F;
 Mon, 31 Oct 2022 13:05:02 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA011111E40B;
 Mon, 31 Oct 2022 13:05:01 +0000 (UTC)
Date: Sun, 30 Oct 2022 18:28:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PULL 0/8] QEMU Guest Agent patches
Message-ID: <Y176ln1cxwP/mq+a@fedora>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kMSu4nvqaa5AMgIx"
Content-Disposition: inline
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-1.048, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--kMSu4nvqaa5AMgIx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--kMSu4nvqaa5AMgIx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNe+pYACgkQnKSrs4Gr
c8h51wf/WWGk6BWtWnGx92MrjrRyB1/NwZen9gjhYe7K5b2fvIXltRyGeglG5mgS
imsvL46/d3QL7nfZJl8fK2S7nWS7+Pp4otKnnbxYMunphxqecGBqLGeLM4UIjTYf
ZXGXOcqMLhmeSnw/e8aiRlRCDnkF3BmT96jY/4Tf/sRJvWzfgnOySdQVOKTDEUgQ
sHv8hA04Zbd4VCRkQAmTOQEA9EZ1YWYjSF1lJNabRdaAm5q5uzu29yQ0gxcxRgmh
CLp9LRawq5kI8wuBEEaAyG1V0XejcjGiny7p5/I3fhRdvJHPg92RclnT1Kn05phA
Izv2m+7FJQwbcsYoKDnff10BfFIs9w==
=sVoz
-----END PGP SIGNATURE-----

--kMSu4nvqaa5AMgIx--


