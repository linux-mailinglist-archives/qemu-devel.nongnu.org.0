Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CAA3AB418
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:55:14 +0200 (CEST)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrY9-0006yT-97
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKm-00080U-K1
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKk-0007pE-Rv
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dUmXqyUsDqyfNq4Amqd9Ss+zlV7MUPOL37A1eZ8AlSY=;
 b=MxFFTkz7larzzwJu0pE56fuF9XuvWfjO/P4D20EcajonWKTt5pi5Vvm3U6qhekwOFhBkGo
 wnlyAcO5T8HZ+2pwnTTPgAOvLwBDCEe/0EEhYKTLLmVXDTyJHcIom25lSmemusZ9sgP5eL
 4vfV1db2+iQHuZ0MGbGkNOWcDX8HKbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-FBWndRJpO-KNKOsMB4-Wfw-1; Thu, 17 Jun 2021 08:41:20 -0400
X-MC-Unique: FBWndRJpO-KNKOsMB4-Wfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2340B9F92B;
 Thu, 17 Jun 2021 12:41:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E535C22A;
 Thu, 17 Jun 2021 12:41:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB51618000B2; Thu, 17 Jun 2021 14:41:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Audio 20210617 patches
Date: Thu, 17 Jun 2021 14:41:00 +0200
Message-Id: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 38848ce565849e5b867a5e08022b3c755039c11a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210=
616' into staging (2021-06-16 17:02:30 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/audio-20210617-pull-request=0D
=0D
for you to fetch changes up to 986bdbc6a29c4d7ef125299c5013783e30dc2cae:=0D
=0D
  coreaudio: Fix output stream format settings (2021-06-17 12:00:26 +0200)=
=0D
=0D
----------------------------------------------------------------=0D
audio: bugfix collection.=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (2):=0D
  audio: Fix format specifications of debug logs=0D
  coreaudio: Fix output stream format settings=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/audio/sb16: Avoid assertion by restricting I/O sampling rate range=0D
=0D
Volker R=C3=BCmelin (4):=0D
  alsaaudio: remove #ifdef DEBUG to avoid bit rot=0D
  paaudio: remove unused stream flags=0D
  audio: move code to audio/audio.c=0D
  jackaudio: avoid that the client name contains the word (NULL)=0D
=0D
 audio/audio_int.h            |  2 ++=0D
 audio/alsaaudio.c            | 10 +++----=0D
 audio/audio.c                | 15 ++++++++---=0D
 audio/coreaudio.c            | 48 +++++++++------------------------=0D
 audio/jackaudio.c            |  3 +--=0D
 audio/paaudio.c              | 10 ++-----=0D
 hw/audio/sb16.c              | 14 ++++++++++=0D
 tests/qtest/fuzz-sb16-test.c | 52 ++++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                  |  1 +=0D
 tests/qtest/meson.build      |  1 +=0D
 10 files changed, 102 insertions(+), 54 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-sb16-test.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


