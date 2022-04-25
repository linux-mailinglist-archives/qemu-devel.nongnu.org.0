Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6B50D94E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 08:18:08 +0200 (CEST)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nis2w-0005V0-Ut
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 02:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nirvj-0003gN-3k
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 02:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nirvg-0006Ii-8y
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 02:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650867034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s68X2WwHh/4u9uuVvTA3Rl/xsHue0yWdgGFCKzJNSnc=;
 b=hNYfqhjYAKQjRs0Lk5CrInONG2XNxZEKSW400QBcowR5yFQcZ97W507qROv/T7uPScjbTz
 8sl5A69Tkv/cJg44rHWhePDJURmuknwUFbqPbCxIKJQWnnovhmCpL+DBkSTA786EiKP/ms
 pvK8oOsZfzqEvtc0n/cPKzFkAImKiA8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-HakXQnalPUSW3lWREP5yuA-1; Mon, 25 Apr 2022 02:10:31 -0400
X-MC-Unique: HakXQnalPUSW3lWREP5yuA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ECA33804061;
 Mon, 25 Apr 2022 06:10:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07522432105;
 Mon, 25 Apr 2022 06:10:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B214518003A7; Mon, 25 Apr 2022 08:10:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Kraxel 20220425 patches
Date: Mon, 25 Apr 2022 08:10:23 +0200
Message-Id: <20220425061029.3932731-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f=
:=0D
=0D
  Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu int=
o staging (2022-04-21 18:48:18 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/kraxel-20220425-pull-request=0D
=0D
for you to fetch changes up to ef798418a3037434951002d0afc5f3d919e294db:=0D
=0D
  avocado/vnc: add test_change_listen (2022-04-22 13:43:28 +0200)=0D
=0D
----------------------------------------------------------------=0D
vnc: add display-update monitor command.=0D
screendump: add png support.=0D
vmsvga: screen update fix.=0D
=0D
----------------------------------------------------------------=0D
=0D
Carwyn Ellis (1):=0D
  hw/display/vmware_vga: do not discard screen updates=0D
=0D
Kshitij Suri (2):=0D
  Replacing CONFIG_VNC_PNG with CONFIG_PNG=0D
  Added parameter to take screenshot with screendump as PNG=0D
=0D
Vladimir Sementsov-Ogievskiy (3):=0D
  ui/vnc: refactor arrays of addresses to SocketAddressList=0D
  qapi/ui: add 'display-update' command for changing listen address=0D
  avocado/vnc: add test_change_listen=0D
=0D
 meson_options.txt               |   4 +-=0D
 tests/avocado/vnc.py            |  63 +++++++++++++=0D
 include/ui/console.h            |   1 +=0D
 ui/vnc.h                        |   2 +-=0D
 hw/display/vmware_vga.c         |  45 +++++----=0D
 monitor/hmp-cmds.c              |  12 ++-=0D
 monitor/qmp-cmds.c              |  15 +++=0D
 ui/console.c                    | 101 ++++++++++++++++++++-=0D
 ui/vnc-enc-tight.c              |  18 ++--=0D
 ui/vnc.c                        | 156 ++++++++++++++++----------------=0D
 docs/about/removed-features.rst |   3 +-=0D
 hmp-commands.hx                 |  11 ++-=0D
 hw/display/trace-events         |   1 +=0D
 meson.build                     |  12 ++-=0D
 qapi/ui.json                    |  89 +++++++++++++++++-=0D
 scripts/meson-buildoptions.sh   |   6 +-=0D
 16 files changed, 406 insertions(+), 133 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


