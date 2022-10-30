Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850E661376D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:08:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUUO-0000WF-W9; Mon, 31 Oct 2022 09:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTT-00088Q-Aq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTR-0007hM-KM
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/DKUqLwgnj8J7a8JP/cO7y/baQowDx320dXtTiyS1EY=;
 b=XqyhdHva/QmtgcBRnFXmmkioe/B01WOgBB9NB2Pdq67E2l+BcyKI49JA0+R1juP4BB9f2h
 uClBKVwfXgoNzLV60fO/FCdya/CPzZapSBAco2oBbP+QIv89q+uyMu/mKPnpPfLsNWeQwF
 qfYSA9pKBFGRAaflVa6bbuA87HZQad0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-VffZzJe8MNaYIAHcJJVmWg-1; Mon, 31 Oct 2022 09:05:00 -0400
X-MC-Unique: VffZzJe8MNaYIAHcJJVmWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28D26802536;
 Mon, 31 Oct 2022 13:05:00 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE431111E40B;
 Mon, 31 Oct 2022 13:04:59 +0000 (UTC)
Date: Sun, 30 Oct 2022 18:28:06 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/31] target-arm queue
Message-ID: <Y176dmGMz1rRd8zu@fedora>
References: <20221027125731.321978-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4NLUtt2u3+j7GZNJ"
Content-Disposition: inline
In-Reply-To: <20221027125731.321978-1-peter.maydell@linaro.org>
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


--4NLUtt2u3+j7GZNJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--4NLUtt2u3+j7GZNJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNe+nYACgkQnKSrs4Gr
c8gx0wf+ID2xKW+SxfcPVaESI++MElzOCFzD4NfZV7pYUY3lGbDWM4ZB/ht3s/X2
FQ7VQvjo+EZtqRvKu6YRMqaSp/UsLUqqOfquedT+xBpPxaiMUeCgssrWXsIanR8G
FMQ7hJFpvEvsk9l8kgqpZMgSsioxP2+N2URBi1/g+M6cagafTjR1mHYSriYSrEub
nt+TzF3rvaAbgtyumAOTPc6F8nPEPxQdY+wRIQu4RRe+NciyWOlnYxdVC0tfRmW1
fBMzYH0O1XD3zvCcosqv0/zsUwGOQIbYuAWA4lz8NjY+yO6Z91+d67Jkn7dW+fk9
fF4FpvMoReBZj+bgqV2y1XXiSbzI+g==
=paAt
-----END PGP SIGNATURE-----

--4NLUtt2u3+j7GZNJ--


