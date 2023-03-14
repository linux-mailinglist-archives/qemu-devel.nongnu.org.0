Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BB6B9B60
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7TE-0004tx-Dq; Tue, 14 Mar 2023 12:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TB-0004tT-Pn
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TA-0007OB-BR
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678811147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=thDz3B2zhUJKJDD9hrLr0d2K2T7COSMLmbQxjYlWdfA=;
 b=OFE8u4kKWyjbI4NK4jNyDHiYU1GHoOKrzJZaBfhMifL06VRdP9jasuBWVMjPnBE2QtBnub
 0L/qgxFAv9fo7uWEUkcenIt701v/9c6SA1iub2/IEoZ8bzP2ZNAv2ABc8nJUXsbaOh0z3n
 cKuQ7MmDX1GG/QMQKlq19EcXGzceUtw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-olg8u3ooOFaQCCHgWp-DXA-1; Tue, 14 Mar 2023 12:25:44 -0400
X-MC-Unique: olg8u3ooOFaQCCHgWp-DXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 045F01C27D89;
 Tue, 14 Mar 2023 16:25:44 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA1104042AC4;
 Tue, 14 Mar 2023 16:25:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 0/3] Misc next patches
Date: Tue, 14 Mar 2023 16:25:37 +0000
Message-Id: <20230314162540.385954-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 5cfda4ce79dd455f1726874a555260a70f84b2ec:

  Merge tag 'pull-request-2023-03-13' of https://gitlab.com/thuth/qemu into staging (2023-03-13 17:09:33 +0000)

are available in the Git repository at:

  https://gitlab.com/berrange/qemu tags/misc-next-pull-request

for you to fetch changes up to c3a2c84ae3c1d5483ec30731321a674797dc5203:

  io/channel-tls: plug memory leakage on GSource (2023-03-14 13:41:21 +0000)

----------------------------------------------------------------
Miscellaneous fixes

 * Avoid memory leak in TLS GSource usage
 * Avoid sending key releases for lang1/lang2 keys in ps2 keyboard
 * Add missing key name constants for F13-F24 keys

----------------------------------------------------------------

Matheus Tavares Bernardino (1):
  io/channel-tls: plug memory leakage on GSource

Ross Lagerwall (1):
  ps2: Don't send key release event for Lang1, Lang2 keys

Willem van de Velde (1):
  Add qemu qcode support for keys F13 to F24

 hw/input/ps2.c   |  6 ++++++
 io/channel-tls.c |  1 +
 qapi/ui.json     | 15 ++++++++++++++-
 ui/keycodemapdb  |  2 +-
 4 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.39.2


