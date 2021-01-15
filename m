Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A276F2F76AC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:28:36 +0100 (CET)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MLL-0007pE-Jg
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHT-0002tD-WE
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHR-0007rs-OF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z4W3UnRtW9teKaF+YVFO1n03d5504Dqv+Sahd35w/fI=;
 b=W4Ra4gUzvcGx5NYzw5YX+jvEc/G4Phr3M9Crra77OeoqCkTYlugfZeZBI+5phMl+7hfzao
 QOzAtPjqUWgebeZyV5ghcQS6MLKr/LzHUPqo2UtPbneXhBwBsDszQfRDpm1thdeHaSORQu
 PH6OwbMqYIYrAtNapwMZsMPjGKzHpts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-SludvI3UOBSaSpBn7Yo7LA-1; Fri, 15 Jan 2021 05:24:31 -0500
X-MC-Unique: SludvI3UOBSaSpBn7Yo7LA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D418030A8
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:24:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43AF677708;
 Fri, 15 Jan 2021 10:24:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7AFF21800606; Fri, 15 Jan 2021 11:24:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Ui 20210115 patches
Date: Fri, 15 Jan 2021 11:24:13 +0100
Message-Id: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 45240eed4f064576d589ea60ebadf3c11d7ab891=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-yank-2021-01-13' i=
nt=3D=0D
o staging (2021-01-13 14:19:24 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210115-pull-request=0D
=0D
for you to fetch changes up to 763deea7e906321f8ba048c359f168f60d51c14e:=0D
=0D
  vnc: add support for extended desktop resize (2021-01-15 11:22:43 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
ui/gtk: refresh rate fixes.=0D
ui/vnc: add support for desktop resize and power contol.=0D
ui/vnc: misc bugfixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Alex Chen (1):=0D
  vnc: Fix a memleak in vnc_display_connect()=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (1):=0D
  ui: add support for remote power control to VNC server=0D
=0D
Gerd Hoffmann (3):=0D
  vnc: move check into vnc_cursor_define=0D
  vnc: move initialization to framebuffer_update_request=0D
  vnc: add support for extended desktop resize=0D
=0D
Nikola Pavlica (2):=0D
  ui/gtk: expose gd_monitor_update_interval=0D
  ui/gtk: update monitor interval on egl displays=0D
=0D
Volker R=3DC3=3DBCmelin (3):=0D
  ui/gtk: don't try to redefine SI prefixes=0D
  ui/gtk: rename variable window to widget=0D
  ui/gtk: limit virtual console max update interval=0D
=0D
Zihao Chang (1):=0D
  vnc: fix unfinalized tlscreds for VncDisplay=0D
=0D
 include/ui/gtk.h |   3 +-=0D
 ui/vnc.h         |  15 +++++=0D
 ui/gtk-egl.c     |   3 +=0D
 ui/gtk.c         |  25 ++++----=0D
 ui/vnc.c         | 147 ++++++++++++++++++++++++++++++++++++++++++-----=0D
 qemu-options.hx  |   4 ++=0D
 6 files changed, 169 insertions(+), 28 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


