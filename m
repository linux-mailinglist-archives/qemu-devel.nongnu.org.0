Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E835C517F80
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:11:46 +0200 (CEST)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlndJ-00084O-T1
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln6t-0006bF-IA
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln6q-00043N-Pa
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651563492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c50vPfifeXyJL+s8pWyJZvStZwpl9XtvI+Q472AX1XU=;
 b=VGTbowKAJtbozE2p8N1Pzyb2HDOldwuX3Y9h3JI4JBms+Z6jsHVFH1vN0+vOo5K65bH3c0
 Wr2AyPEy6umElr2yRrlw9rQ4JGUB05Ew2rcE4uvcWv25Fibk8f5SFZeXP2L3DDoL767/X4
 yygma6PJJueKLnWnrNhyCtgBKG/HfIE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-5axR5c2oPNCy2-Sp9AwGsw-1; Tue, 03 May 2022 03:38:09 -0400
X-MC-Unique: 5axR5c2oPNCy2-Sp9AwGsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72373834C06;
 Tue,  3 May 2022 07:38:08 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F9389E71;
 Tue,  3 May 2022 07:37:38 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 0/8] qapi: Primarily whitespace tweaks
Date: Tue,  3 May 2022 09:37:29 +0200
Message-Id: <20220503073737.84223-1-abologna@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If patch 8/8 is accepted, 7/8 should be squashed into it to reduce=0D
churn.=0D
=0D
Changes from [v1]:=0D
=0D
  * use a more fine-grained split for whitespace changes.=0D
=0D
[v1] https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg05406.html=0D
=0D
Andrea Bolognani (8):=0D
  qapi: Drop stray trailing symbol=0D
  qapi: Fix comment indentation=0D
  qapi: Add missing separators between sections=0D
  qapi: Drop unnecessary empty lines in comments=0D
  qapi: Drop unnecessary empty lines outside of comments=0D
  qapi: Drop unnecessary whitespace in comments=0D
  qapi: Reduce whitespace used for alignment in comments=0D
  qapi: Stop using whitespace for alignment in comments=0D
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


