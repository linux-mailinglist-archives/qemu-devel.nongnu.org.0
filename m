Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C82DAE46
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:50:30 +0100 (CET)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAij-00015S-Tm
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgu-0008FE-EY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgr-0007G8-Rb
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608040113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vcxW2oxUfk1DUoHskKidk+QZeY8Ed9/HTIgjDKs9R/g=;
 b=GKh4QmEr/PonJYOcAqyYAlyq1BSadPzVsnJJe6umQxMGnYNu84yMeh3uEPQtjNFYCxfQn0
 4sHyfZDtrYUHCzNDcRXwuXa2EDkit6qIMwM7CdDrM8muQ8gNZPCCkXm6qAJEV9Anb4E42G
 DZ8b5Y4KZs8UiVkifCryGikVCwjz9fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-X4iiUkHUNZaYM0_vFZVrWQ-1; Tue, 15 Dec 2020 08:48:31 -0500
X-MC-Unique: X4iiUkHUNZaYM0_vFZVrWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0135800C78
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 13:48:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B2665D6A1;
 Tue, 15 Dec 2020 13:48:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 81DA9A1E2; Tue, 15 Dec 2020 14:48:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Audio 20201215 patches
Date: Tue, 15 Dec 2020 14:48:19 +0100
Message-Id: <20201215134826.5504-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit aa14de086675280206dbc1849da6f85b75f62f1b=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20201213' i=
nt=3D=0D
o staging (2020-12-14 18:53:30 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/audio-20201215-pull-request=0D
=0D
for you to fetch changes up to 06c8c375389a54d8e4457d967f4f0896caecefb2:=0D
=0D
  audio: add sanity check (2020-12-15 09:28:52 +0100)=0D
=0D
----------------------------------------------------------------=0D
audio: coreaudio playback state fixes.=0D
audio: misc cleanups.=0D
=0D
----------------------------------------------------------------=0D
=0D
Eduardo Habkost (1):=0D
  cs4231: Get rid of empty property array=0D
=0D
Gerd Hoffmann (1):=0D
  audio: add sanity check=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (1):=0D
  audio: Simplify audio_bug() removing old code=0D
=0D
Volker R=3DC3=3DBCmelin (4):=0D
  coreaudio: rename misnamed variable fake_as=0D
  coreaudio: don't start playback in init routine=0D
  coreaudio: always stop audio playback on shut down=0D
  audio: remove unused function audio_is_cleaning_up()=0D
=0D
 audio/audio.h     |  1 -=0D
 audio/audio.c     | 31 ++++-----------------------=0D
 audio/coreaudio.c | 53 +++++++++++++++++------------------------------=0D
 hw/audio/cs4231.c |  5 -----=0D
 4 files changed, 23 insertions(+), 67 deletions(-)=0D
=0D
--=3D20=0D
2.27.0=0D
=0D


