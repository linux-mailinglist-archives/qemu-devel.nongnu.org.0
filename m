Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55039602F84
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:20:39 +0200 (CEST)
Received: from localhost ([::1]:42222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okoOT-0005az-L3
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oknfV-00084C-Sk
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oknfT-0007TW-U5
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666103642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CULvQxwCVJgjccdrmf8SbUFwISUc/I8mnJw9lIQy3pk=;
 b=PImzKV4QUtiL/Dp5Lmg7SEI4C3tMLdzjT1z8MQru/ULPM1vM+MV6zS5AdEJzEdUPcNEbgN
 u618AbU/81AON8CGvjLhCxs1Z7gCxPIuCQRgDVO5wBjQB+SZk+3Bpy/aQXFJm2N0MI7cRy
 FyjiGS+dXwFMKH1wS3QY8rhED0dk/rY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-pIbfhIu4Mm-qpRb6-SJaqw-1; Tue, 18 Oct 2022 10:34:00 -0400
X-MC-Unique: pIbfhIu4Mm-qpRb6-SJaqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EE8B101AA6A;
 Tue, 18 Oct 2022 14:33:49 +0000 (UTC)
Received: from localhost (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F9E6111DD0D;
 Tue, 18 Oct 2022 14:33:44 +0000 (UTC)
Date: Mon, 17 Oct 2022 17:22:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com
Subject: Re: [PULL 0/5] loongarch-to-apply queue
Message-ID: <Y03HkidaptgFHbAP@fedora>
References: <20221017063944.1443723-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="noUJV1H2azqjKby8"
Content-Disposition: inline
In-Reply-To: <20221017063944.1443723-1-gaosong@loongson.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.256, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--noUJV1H2azqjKby8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--noUJV1H2azqjKby8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNNx5IACgkQnKSrs4Gr
c8hxDwf/ee1u80I1FYF8iqApXzAQLSUY4cHIk1CitHnbinjCiMJGKL7LJBi6XB44
PH51zh5mQwPMW5cNrBC/uVnVg+0CckCcCsPeXNSyuR9pG6dIvZY6IzjTzphxbiZO
AqJugRzBkUFaqnkH1gZb9tzILXlJooeEb0RBp9h/0LX9lgRiUAJUVnlYdZUf50h6
gwCz3JEhvkHFza7m5MEdDPaAr34G8bpuBFGOpQ9c5cRckuQHwqLnOfHEAiGWsKBV
JKOKgByXqpmamKmPPLNdu6N6q9DMpEQIk4azxHBNbzmjAYppH1Q0ZYWIbSfHXJcv
zlGvkSCILnfCDJsFiDQongX2HkB1iQ==
=5PWs
-----END PGP SIGNATURE-----

--noUJV1H2azqjKby8--


