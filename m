Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478293FD283
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:45:46 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLI7y-0004B9-P6
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5Z-0002Ii-5B
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5W-00064r-SZ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630471381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v6MfMTGUiaJCxykx0IDdPLGPtWskriX9Ut8ualJx6pM=;
 b=BGMEIO2jVN20lhLfYCzrDvsVKTEkHGNfuhycWmUvDJUywSAVE1lHzCDMBRtnbO8a3tUrGz
 WNyoojSA8zUVm5PwJ0K0T2iJucqM8CO8H0UWrNn0kUfCKrP31wHwDgcWyuKEMmIMhtSpCG
 hEuFAQUe35w2AtONMjEWKGsvraTiBZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-1PID3r0aMBaxLBuK1JiuXw-1; Wed, 01 Sep 2021 00:43:00 -0400
X-MC-Unique: 1PID3r0aMBaxLBuK1JiuXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F2F787D541
 for <qemu-devel@nongnu.org>; Wed,  1 Sep 2021 04:42:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31BC26060F;
 Wed,  1 Sep 2021 04:42:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B97DC180038E; Wed,  1 Sep 2021 06:42:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Audio 20210901 patches
Date: Wed,  1 Sep 2021 06:42:45 +0200
Message-Id: <20210901044248.3122252-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827=
' into staging (2021-08-27 11:34:12 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/audio-20210901-pull-request=0D
=0D
for you to fetch changes up to 0ebe43ea6a5ceb30b4372038fefddc9e224438f8:=0D
=0D
  MAINTAINERS: Split Audio backends sections (2021-09-01 06:34:30 +0200)=0D
=0D
----------------------------------------------------------------=0D
audio: split audio entry in MAINTAINERS file.=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  MAINTAINERS: Split Audio backends VS frontends=0D
  MAINTAINERS: Remove SPICE from Audio backends section=0D
  MAINTAINERS: Split Audio backends sections=0D
=0D
 MAINTAINERS | 61 +++++++++++++++++++++++++++++++++++++++++++++++------=0D
 1 file changed, 54 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


