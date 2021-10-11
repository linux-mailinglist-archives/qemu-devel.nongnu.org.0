Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE201428D42
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:43:28 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZueN-0005CO-Cz
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZucE-00030Z-0B
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZucA-0000jp-SL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633956070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C/S062kWsIFqfHKpBMslZhfmbN8hPRxtCEii+TsBXf4=;
 b=Y+fTJJ8Q0r3J8wusB5WKGiF+Zm1tJYk2GOFs1Izjxs4ZvK/kR8cBvayIQ05vt4O+Tg/YcW
 +2AZByKZ+WZqL5sLHHSPGcCovAd/7eLC/FXy2oRBxYld+Rch8ql5NDsuI1vMKioZdf2EyQ
 NRDPgE94oMLMzv6IVACV4ceiurlz8oA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-c0p012bhMrqGCXsTQsQ0Ng-1; Mon, 11 Oct 2021 08:41:07 -0400
X-MC-Unique: c0p012bhMrqGCXsTQsQ0Ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1808A18125C4;
 Mon, 11 Oct 2021 12:41:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CABC45BAF7;
 Mon, 11 Oct 2021 12:40:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/2] Block patches
Date: Mon, 11 Oct 2021 13:40:42 +0100
Message-Id: <20211011124044.9090-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ca61fa4b803e5d0abaf6f1ceb690f23bb78a4def=
:=0D
=0D
  Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20211006' into s=
taging (2021-10-06 12:11:14 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to 1cc7eada97914f090125e588497986f6f7900514:=0D
=0D
  iothread: use IOThreadParamInfo in iothread_[set|get]_param() (2021-10-07=
 15:29:50 +0100)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
Stefano Garzarella (2):=0D
  iothread: rename PollParamInfo to IOThreadParamInfo=0D
  iothread: use IOThreadParamInfo in iothread_[set|get]_param()=0D
=0D
 iothread.c | 28 +++++++++++++++-------------=0D
 1 file changed, 15 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


