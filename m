Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8E3E5593
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:37:03 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNFu-0008Le-Oi
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNE1-0005bE-Tz
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNDz-0006En-KQ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iAM0OABZr+K7BvCc3eBtKOUniraYfd+Nfze4CYCWzyE=;
 b=dM0knnRQozwSyzDi3AKCwfQVUcXags/3edQ9wB9wm1kknm4xsGXmcPG0JklTBIbwbvJxzE
 HiA9kxuE+VzM1nPhXAviVc431eU4DGhFcmAFx5K4bu9yt6jyhA1GiMUGOyjtsgicu3u4SB
 uuQ5l7FGhUSZ6DpTL5/GqPKaRLcQUZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-x4-DZ0ljOTS9jt3pcTpUDQ-1; Tue, 10 Aug 2021 04:35:00 -0400
X-MC-Unique: x4-DZ0ljOTS9jt3pcTpUDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FDCE96E541
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:34:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06DF17DE54;
 Tue, 10 Aug 2021 08:34:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5EEC718003AA; Tue, 10 Aug 2021 10:34:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] MAINTAINERS: review kraxel's entries.
Date: Tue, 10 Aug 2021 10:34:43 +0200
Message-Id: <20210810083450.2377374-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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

You probably have noticed that Laszlo stepped down from edk2=0D
maintenance (see commit 2669350db2c3 ("MAINTAINERS: remove Laszlo=0D
Ersek's entries")).  This applies not only to qemu, but also the edk2=0D
project.=0D
=0D
I'll go try fill the hole he left and shift my priorities towards edk2.=0D
This naturally comes with the bad news that I'll have less time to work=0D
on qemu.  The good news is I'm not going to disappear in a poof of smoke=0D
and will be available for questions even when coding and maintaining=0D
less than I did before.  I'll also try to finish up my work in progress=0D
things (mostly modules stuff).=0D
=0D
So, a good opportunity to review all my entries in the MAINTAINERS files=0D
and adjust them.  Switched most entries over to "Odd Fixes" status.=0D
I'll probably review again in a few months, possibly orphaning things if=0D
needed, but lets see how it goes this way first.=0D
=0D
If someone wants take over as maintainer for something I'll happily stay=0D
as Reviewer for a while to help with the transition.=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (7):=0D
  MAINTAINERS: update edk2 entry.=0D
  MAINTAINERS: update sockets entry.=0D
  MAINTAINERS: update audio entry.=0D
  MAINTAINERS: update spice entry.=0D
  MAINTAINERS: update usb entries.=0D
  MAINTAINERS: update virtio-input entry.=0D
  MAINTAINERS: update virtio-gpu entry.=0D
=0D
 MAINTAINERS | 16 ++++++++--------=0D
 1 file changed, 8 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


