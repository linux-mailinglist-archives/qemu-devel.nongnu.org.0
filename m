Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9883B2EC9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:18:22 +0200 (CEST)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwOJI-0006yn-Q2
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwOHy-0005bD-6c
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwOHv-0000u9-92
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624537013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qyinjTRCDlVjrtvKLGZ0VcyGiDJ/Vp8WsAljnr1cNxQ=;
 b=A/g03agijQ7ckhJ5MQImZt5mRC4bkG903TLYRKUaKHDSFlw4VAe4JstGYahA4hk1n9/+C5
 M5gypfg+zS/ICRlJBPiOJHaXG9douUaIFIo0xTD1+ZDUlm4ipUPq/On9NGcWg4+k0ncew+
 Xyw4BnDzaGgNGFL6W2hii/LaBtP5nug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-bBEpSK-lNgiqvKb7AirrzQ-1; Thu, 24 Jun 2021 08:16:52 -0400
X-MC-Unique: bBEpSK-lNgiqvKb7AirrzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 803381835AC5;
 Thu, 24 Jun 2021 12:16:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 180711001281;
 Thu, 24 Jun 2021 12:16:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6DF98180060E; Thu, 24 Jun 2021 14:16:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Audio 20210624 patches
Date: Thu, 24 Jun 2021 14:16:37 +0200
Message-Id: <20210624121639.2422367-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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

The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pul=
l-request' into staging (2021-06-22 16:07:53 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/audio-20210624-pull-request=0D
=0D
for you to fetch changes up to 60e543f5ce46d4a90a95963b3bab5c7d13a2aaa9:=0D
=0D
  hw/audio/sb16: Restrict I/O sampling rate range for command 41h/42h (2021=
-06-24 11:42:54 +0200)=0D
=0D
----------------------------------------------------------------=0D
audio: bugfixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (1):=0D
  coreaudio: Lock only the buffer=0D
=0D
Qiang Liu (1):=0D
  hw/audio/sb16: Restrict I/O sampling rate range for command 41h/42h=0D
=0D
 audio/coreaudio.c            | 102 ++++++++++++++---------------------=0D
 hw/audio/sb16.c              |  31 ++++++-----=0D
 tests/qtest/fuzz-sb16-test.c |  17 ++++++=0D
 3 files changed, 77 insertions(+), 73 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


