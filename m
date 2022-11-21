Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B907631A5D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox1Ls-0003xF-0r; Mon, 21 Nov 2022 02:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ox1Lo-0003wi-RR
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ox1Ln-0002H4-9d
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669016178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xg+x76jZ81Jv4c6OFWIbbF4IV+OP3LpjFJ2kCUySPqE=;
 b=YO5kKV5Ft+gc15knEJGSQ+5GyV5eEgHOCoCmAGCissDGUeNjnWGHWTxy50iskoyGeZEHfa
 x6/JSNZ1sehGL6/MaBlKmGKI5Ss+rv5BINC6ylmyyPuL8dtaFpQE7Jk6t5m0DlRQTQmMN3
 5LzQfWMJ0X0nkCYVeKuZilettOCqQNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-zvhteuKUPkuywx548wjlbQ-1; Mon, 21 Nov 2022 02:36:16 -0500
X-MC-Unique: zvhteuKUPkuywx548wjlbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD1D987A9E0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 07:36:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6E86111E3F2;
 Mon, 21 Nov 2022 07:36:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 0/1] chardev patch for 7.2
Date: Mon, 21 Nov 2022 11:36:10 +0400
Message-Id: <20221121073611.1337690-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit a082fab9d259473a9d5d53307cf83b1223301181:

  Merge tag 'pull-ppc-20221117' of https://gitlab.com/danielhb/qemu into staging (2022-11-17 12:39:38 -0500)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/chr-pull-request

for you to fetch changes up to 06639f8ff53d1dbfa709377499e6c30eca9c3c9a:

  chardev/char-win-stdio: Pass Ctrl+C to guest with a multiplexed monitor (2022-11-21 11:30:11 +0400)

----------------------------------------------------------------
chardev fix on win32

----------------------------------------------------------------

Bin Meng (1):
  chardev/char-win-stdio: Pass Ctrl+C to guest with a multiplexed
    monitor

 chardev/char-win-stdio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.38.1


