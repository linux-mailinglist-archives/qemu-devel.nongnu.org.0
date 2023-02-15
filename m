Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE26982A2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:48:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLsJ-0004tE-0S; Wed, 15 Feb 2023 12:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsG-0004qi-AK
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsE-0005Bf-PI
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676483237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w/F84SQrSlILY8D9V60Vpxm/XVlRV4VLfqZeABCMH4I=;
 b=BAuonxuN9Ei1lW7COJc0GcWEtSUFUKxwhxnohQ1TI5tUsDq7G1VY5t2pcXAp2vzoc4JrtN
 QsCIUXQo7EVOXEV0topKkF2YXEf0fiz+9tPNhy1421ziSV6IGITNm8X0dU8YRzwW0yuUqe
 MO5ExcHN1gipDBjOTP4mCzBTjQg3Ez4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-hLz81hr-MYmfdB7RzHAgrQ-1; Wed, 15 Feb 2023 12:47:16 -0500
X-MC-Unique: hLz81hr-MYmfdB7RzHAgrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF9AD28004F1;
 Wed, 15 Feb 2023 17:47:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE45040C10FA;
 Wed, 15 Feb 2023 17:47:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 0/5] Misc next patches
Date: Wed, 15 Feb 2023 17:47:07 +0000
Message-Id: <20230215174712.1894516-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f31e:

  Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu into staging (2023-02-14 14:46:10 +0000)

are available in the Git repository at:

  https://gitlab.com/berrange/qemu tags/misc-next-pull-request

for you to fetch changes up to 36debafddd788066be10b33c5f11b984a08e5c85:

  ui: remove deprecated 'password' option for SPICE (2023-02-15 11:14:58 -0500)

----------------------------------------------------------------
 * Document 'password-secret' option for -iscsi
 * Deprecate iSCSI 'password' in favour of 'password-secret'
 * Remove deprecated 'password' option for SPICE
 * Fix handling of cached read buffers with TLS

----------------------------------------------------------------

Antoine Damhet (2):
  crypto: TLS: introduce `check_pending`
  io/channel-tls: fix handling of bigger read buffers

Daniel P. Berrangé (3):
  block: mention 'password-secret' option for -iscsi
  block: deprecate iSCSI 'password' in favour of 'password-secret'
  ui: remove deprecated 'password' option for SPICE

 block/iscsi.c                   |  3 ++
 crypto/tlssession.c             | 14 +++++++
 docs/about/deprecated.rst       | 16 ++++----
 docs/about/removed-features.rst |  7 ++++
 include/crypto/tlssession.h     | 11 ++++++
 io/channel-tls.c                | 66 ++++++++++++++++++++++++++++++++-
 qemu-options.hx                 | 13 ++-----
 ui/spice-core.c                 | 15 --------
 8 files changed, 111 insertions(+), 34 deletions(-)

-- 
2.39.1


