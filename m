Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0F31E961
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:57:26 +0100 (CET)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChvx-0003AH-Si
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChr0-0007Lx-BO
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChqt-0004nJ-EU
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613649129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Islb+yKAmRsS30kwug995y3kor72kJzFI6yfx7e+Vl4=;
 b=PjrfCGPS0JnqanScv5w61s5UnMQY7mXeYM37mN1UwI36U9hn3LjJ3EnVd6MsYNfthQ3S6A
 f3XJtx94Lr59icgtUX7b2IxytX3sMna/l5P6Hx3fb0C0OVYIp+Tdd4VCbF8TJW69ngTdEA
 CXG5zuAhg8Y9FNCIL1EYw9xsGNnI6LM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-L-WOKxO7OO-WB3QeG6yn6w-1; Thu, 18 Feb 2021 06:52:07 -0500
X-MC-Unique: L-WOKxO7OO-WB3QeG6yn6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4522107ACED
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 11:52:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42BA919C47;
 Thu, 18 Feb 2021 11:52:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AACA818000BB; Thu, 18 Feb 2021 12:52:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Usb 20210218 patches
Date: Thu, 18 Feb 2021 12:51:59 +0100
Message-Id: <20210218115201.2765071-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 18543229fd7a2c79dcd6818c7b1f0f62512b5220=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull=
-r=3D=0D
equest' into staging (2021-02-16 14:37:57 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/usb-20210218-pull-request=0D
=0D
for you to fetch changes up to 6ba5a437ad48f10931592f649b5b7375968f362d:=0D
=0D
  usb/pcap: set flag_setup (2021-02-17 14:29:12 +0100)=0D
=0D
----------------------------------------------------------------=0D
usb: two bugfixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (1):=0D
  usb/pcap: set flag_setup=0D
=0D
Nick Rosbrook (1):=0D
  usb-host: use correct altsetting in usb_host_ep_update=0D
=0D
 hw/usb/host-libusb.c | 18 +++++++++++++++---=0D
 hw/usb/pcap.c        |  2 ++=0D
 2 files changed, 17 insertions(+), 3 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


