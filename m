Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B23E59C9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:20:24 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQk4-0007kz-0F
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQia-0005pY-VH
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQiW-0008Nl-Rn
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628597928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x28+7t55PCFFfJmIIg1t45fVbUK90mo9C3jpjraWWiA=;
 b=Brk7uk/Hyb59j88ddR4RJLmbDSDnrhlpBHh1fsP0Rd78byiZNKYnwPI1ekMU5gIwBWtYq0
 vos8Gq2iRPbKuSlIHWvWNOxVL6/EllFihgpzFW4TwVbabLcF7fijIdPDyzSon6W4SOINwS
 I+shdE82xEm0fVCw2gNknxy0DzUjQr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-CsXj0EK_MPuM1QjcqMhgWg-1; Tue, 10 Aug 2021 08:18:46 -0400
X-MC-Unique: CsXj0EK_MPuM1QjcqMhgWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 239B8879A01
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 12:18:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A41779D0;
 Tue, 10 Aug 2021 12:18:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 06B8A18007AC; Tue, 10 Aug 2021 14:18:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Fixes 20210810 patches
Date: Tue, 10 Aug 2021 14:18:36 +0200
Message-Id: <20210810121840.2525726-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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

The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb=
:=0D
=0D
  Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20210810-pull-request=0D
=0D
for you to fetch changes up to 6ff5b5d6d521001135d1bd5c609e8834099f01d8:=0D
=0D
  ui/sdl2: Check return value from g_setenv() (2021-08-10 10:56:39 +0200)=
=0D
=0D
----------------------------------------------------------------=0D
fixes for gtk, sdl and audio live migration.=0D
=0D
----------------------------------------------------------------=0D
=0D
Dr. David Alan Gilbert (1):=0D
  audio: Never send migration section=0D
=0D
Peter Maydell (1):=0D
  ui/sdl2: Check return value from g_setenv()=0D
=0D
Volker R=C3=BCmelin (1):=0D
  ui/gtk: retry sending VTE console input=0D
=0D
 audio/audio.c | 10 ++++++++++=0D
 ui/gtk.c      | 10 ++++------=0D
 ui/sdl2.c     |  5 ++++-=0D
 3 files changed, 18 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


