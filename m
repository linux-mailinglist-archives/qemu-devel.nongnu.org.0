Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D38158AD03
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:25:07 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzCE-0000Ur-O6
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7o-0006YM-QK
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7l-0007cV-29
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659712825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L2Qk/T5pDEpCliz/Xg2eicSxsZkuhsTGbYJsBsWi2cE=;
 b=L+gLsbYzEixqsRjhk3yp2D9fkPyU228EI8cTzmP+4Ol1oJGo7hJPforZ6hefgwCuQvtEiZ
 l63QfWcghO8USTkjAVVRfHTALhBfuYv4C7xaIP+eqPyzFcC897Sde7WdT/74b7n4Cfc6VI
 kWWUHY2jQmiK0/FvocThJhZk6ZI3sAU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-mgVc0uUAP7S7s4-olnTXaw-1; Fri, 05 Aug 2022 11:20:22 -0400
X-MC-Unique: mgVc0uUAP7S7s4-olnTXaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72D883C0E236;
 Fri,  5 Aug 2022 15:20:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1A0F2026D4C;
 Fri,  5 Aug 2022 15:20:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL 0/6] Misc next patches
Date: Fri,  5 Aug 2022 16:20:08 +0100
Message-Id: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit 09ed077d7fae5f825e18ff9a2004dcdd1b165edb:

  Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-04 17:21:13 -0700)

are available in the Git repository at:

  https://gitlab.com/berrange/qemu tags/misc-next-pull-request

for you to fetch changes up to e3fdb13e8851be570db41a50589ce82d11d61c12:

  util/qemu-sockets: Replace the call to close a socket with closesocket() (2022-08-05 16:18:15 +0100)

----------------------------------------------------------------
Merge misc patches

 * Display deprecation warnings in -cpu help
 * Fix zerocopy IPv6 handling
 * Clarify platform support policy on minor release/backports
 * Fix closesocket call in error path

----------------------------------------------------------------

Andrea Bolognani (1):
  docs: build-platforms: Clarify stance on minor releases and backports

Bin Meng (1):
  util/qemu-sockets: Replace the call to close a socket with
    closesocket()

Daniel P. Berrangé (3):
  target/i386: display deprecation status in '-cpu help'
  target/s390x: display deprecation status in '-cpu help'
  target/arm: display deprecation status in '-cpu help'

Leonardo Bras (1):
  QIOChannelSocket: Add support for MSG_ZEROCOPY + IPV6

 docs/about/build-platforms.rst |  5 ++++-
 io/channel-socket.c            |  4 ++--
 target/arm/helper.c            |  7 ++++++-
 target/i386/cpu.c              |  5 +++++
 target/s390x/cpu_models.c      | 23 ++++++++++++++++++-----
 util/qemu-sockets.c            |  4 ++--
 6 files changed, 37 insertions(+), 11 deletions(-)

-- 
2.37.1


