Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C25D533D03
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:52:37 +0200 (CEST)
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqUq-0001Mq-4T
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntqRw-00085L-Po
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntqRv-0001RI-8n
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653482954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wEdQDsovO6y3LEeEY/cP5E3ezNnzZKl4HM/2ZZyB6tU=;
 b=GPQftzJYYgAFd1nD5gljXHVBgcKP0YyK8wG4wKGp7WOxe/UfoEKJTYB+jb1CbzeFckbDPe
 sOtVa5W/ph89RtEXwXZVIBV/mWNQR4cu9ZiOdmXW8p6YWD9UxcUsCJ/lMY4x1Fsus1SGxx
 XT8/2PxJbYFk++NQP3esQXyMZ8dkCFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-c1CtRGZqNWGO9hoRsIH94w-1; Wed, 25 May 2022 08:49:11 -0400
X-MC-Unique: c1CtRGZqNWGO9hoRsIH94w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E6528001EA;
 Wed, 25 May 2022 12:49:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B43B8492C3B;
 Wed, 25 May 2022 12:49:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com,
 <qemu-block@nongnu.org>
Subject: [PULL 0/1] Block patches
Date: Wed, 25 May 2022 13:49:08 +0100
Message-Id: <20220525124909.867787-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

The following changes since commit 0cac736e73723850a99e5142e35d14d8f8efb232:

  Merge tag 'pull-riscv-to-apply-20220525' of github.com:alistair23/qemu into staging (2022-05-24 15:55:12 -0700)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 29320530cf6684646b3a642fdbb5bc77ee8039de:

  docs: Correct the default thread-pool-size (2022-05-25 11:01:38 +0100)

----------------------------------------------------------------
Pull request

A small documentation fix.

----------------------------------------------------------------

Liu Yiding (1):
  docs: Correct the default thread-pool-size

 docs/tools/virtiofsd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.36.1


