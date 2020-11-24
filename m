Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5B2C2693
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:55:01 +0100 (CET)
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXqW-0003TM-LP
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXoS-0002TL-Na
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:52:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXoQ-0004pX-N3
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606222369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pwN7Jsfy6C0mt8E2ywmzQeyWgEgMKwQQVB/esWilJpU=;
 b=gJb3JAvBaGqaeZukaNHhPI69dcvyGY4VsL779Z0nSj7U6QKrRONnbqs2bCxcIMLl3jy9br
 SR7iv3xtTtklXgHe/+P2qfTHq0C24b3t+21pwp43Qa2E6/Yb+JnAtS+kFH4BIfb9RV3Wov
 shOv9osLZwmQaA9jQRUXBvijdhEftzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-JJ5kAiSjOXWvrJDTskBZGg-1; Tue, 24 Nov 2020 07:52:46 -0500
X-MC-Unique: JJ5kAiSjOXWvrJDTskBZGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBB13423BA;
 Tue, 24 Nov 2020 12:52:45 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA8D760864;
 Tue, 24 Nov 2020 12:52:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove GCC < 4.8 checks
Date: Tue, 24 Nov 2020 16:52:33 +0400
Message-Id: <20201124125235.266884-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 richard.henderson@linaro.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Since commit efc6c07 ("configure: Add a test for the minimum compiler versi=
on=3D=0D
"),=0D
QEMU explicitely depends on GCC >=3D3D 4.8.=0D
=0D
Marc-Andr=3DC3=3DA9 Lureau (2):=0D
  Remove GCC version checks (all < 4.8)=0D
  compiler.h: remove QEMU_GNUC_PREREQ macro=0D
=0D
 include/qemu/atomic.h         | 17 -----------------=0D
 include/qemu/compiler.h       | 33 ++++++---------------------------=0D
 include/qemu/qemu-plugin.h    |  9 ++-------=0D
 scripts/cocci-macro-file.h    |  1 -=0D
 tools/virtiofsd/fuse_common.h |  4 +---=0D
 accel/tcg/cpu-exec.c          |  2 +-=0D
 tests/tcg/arm/fcvt.c          |  8 +++-----=0D
 7 files changed, 13 insertions(+), 61 deletions(-)=0D
=0D
--=3D20=0D
2.29.0=0D
=0D


