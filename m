Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95955150B5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:24:37 +0200 (CEST)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkTPv-000700-S2
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSqr-0007Sf-51
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSqo-0001Ys-89
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651247289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N22mtZCNisbNhbgrJgdMTCFSqzG5OOPG+LUCQ2L3FYo=;
 b=X1vedkDkaNrAL0fBNCbpg6SmLu2fJZNEQdIgRkSV9q7nwcthejbzC75DK/16fW/F1g1MZZ
 6gi6gnTCZ41gJWn3BceyrgXeVyS8vwtC3tmv6/+L+wMR7Uaqir92lDPxlTkFe6iEajlNhA
 eMkzLGf9oMY2FQHlZB0QSerc9JkX1Ss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-O4lnNblCO_qT_k_OLklg2w-1; Fri, 29 Apr 2022 11:48:05 -0400
X-MC-Unique: O4lnNblCO_qT_k_OLklg2w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CEAA1066543;
 Fri, 29 Apr 2022 15:48:05 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8D54538B0;
 Fri, 29 Apr 2022 15:48:00 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] qapi: Primarily whitespace tweaks
Date: Fri, 29 Apr 2022 17:47:51 +0200
Message-Id: <20220429154758.354610-1-abologna@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last patch could very reasonably be squashed into the previous=0D
one, but since the changes could be considered more controversial I=0D
thought it would be better if the two could be reviewed and judged=0D
separately.=0D
=0D
Andrea Bolognani (7):=0D
  qapi: Drop stray trailing symbol=0D
  qapi: Fix comment indentation=0D
  qapi: Add missing separators between sections=0D
  qapi: Drop unnecessary empty lines in comments=0D
  qapi: Drop unnecessary empty lines outside of comments=0D
  qapi: Drop unnecessary horizontal spacing in comments=0D
  qapi: Drop more unnecessary horizontal spacing in comments=0D
=0D
 qapi/audio.json          |  1 -=0D
 qapi/block-core.json     | 97 ++++++++++++++++++----------------------=0D
 qapi/block-export.json   |  2 +-=0D
 qapi/block.json          | 13 +++---=0D
 qapi/char.json           | 10 ++---=0D
 qapi/common.json         |  2 -=0D
 qapi/control.json        | 13 +++---=0D
 qapi/crypto.json         | 62 ++++++++++++-------------=0D
 qapi/dump.json           |  4 +-=0D
 qapi/job.json            |  1 -=0D
 qapi/machine-target.json |  1 -=0D
 qapi/machine.json        | 12 +++--=0D
 qapi/migration.json      | 19 ++++----=0D
 qapi/misc-target.json    | 13 ++----=0D
 qapi/misc.json           |  6 +--=0D
 qapi/replay.json         |  1 -=0D
 qapi/run-state.json      | 10 ++---=0D
 qapi/sockets.json        |  6 +--=0D
 qapi/ui.json             | 70 ++++++++++-------------------=0D
 19 files changed, 136 insertions(+), 207 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


