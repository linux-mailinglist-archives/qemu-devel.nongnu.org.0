Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578CE2D72AD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:15:56 +0100 (CET)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kneWo-0000OR-Qb
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneTy-0007Ah-Vw
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneTw-0004ez-FQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607677974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y4TNYD6Y7inlhr0nBErf/fIbQUsgJs8EBkZ1UdprBPU=;
 b=Vobp1GjVKFrPNlqCiREP9bsymxBVuHALtEoraLltNzZosFSEwlv0+ght2vVxmLH27oVjXN
 cLuTE4rYvj8KZQ4dLkAPzUBjKLHwkaJtNVGxiw/KOjvhDaoYqAeSK1tL3+pPcmqfvtFumS
 w1XNaN1YO8OOHQo2nHCHyr4JJ0Gwe9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-v_nsTixAPvGXKs2biG7qiQ-1; Fri, 11 Dec 2020 04:12:52 -0500
X-MC-Unique: v_nsTixAPvGXKs2biG7qiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA3D459
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:12:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FAB210013C0;
 Fri, 11 Dec 2020 09:12:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C96EE17532; Fri, 11 Dec 2020 10:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Ui 20201211 patches
Date: Fri, 11 Dec 2020 10:12:42 +0100
Message-Id: <20201211091250.1415-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' i=
nto staging (2020-12-10 17:01:05 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20201211-pull-request=0D
=0D
for you to fetch changes up to 2951106143f6cf20b3a0e4f2078721503fe6418a:=0D
=0D
  sdl2: Add extra mouse buttons (2020-12-11 08:06:40 +0100)=0D
=0D
----------------------------------------------------------------=0D
ui/console ui_info tweaks.=0D
ui/vnc: alpha cursor support.=0D
ui/vnc: locking fixes.=0D
ui/sdl: add extra mouse buttons.=0D
=0D
----------------------------------------------------------------=0D
=0D
Darrell Walisser (1):=0D
  sdl2: Add extra mouse buttons=0D
=0D
Gerd Hoffmann (6):=0D
  console: drop qemu_console_get_ui_info=0D
  console: allow con=3D=3DNULL in dpy_{get, set}_ui_info and=0D
    dpy_ui_info_supported=0D
  vnc: use enum for features=0D
  vnc: drop unused copyrect feature=0D
  vnc: add pseudo encodings=0D
  vnc: add alpha cursor support=0D
=0D
Peng Liang (1):=0D
  ui/vnc: Add missing lock for send_color_map=0D
=0D
 include/ui/console.h |  1 -=0D
 ui/vnc.h             | 30 +++++++++++++++++-------------=0D
 ui/console.c         | 18 ++++++++++--------=0D
 ui/sdl2.c            |  2 ++=0D
 ui/vnc.c             | 26 ++++++++++++++++++++------=0D
 5 files changed, 49 insertions(+), 28 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


