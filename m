Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE2569D31
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:26:00 +0200 (CEST)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Mpj-0004PU-EA
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9MdF-0007Hd-Kt
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9MdE-0007ne-3C
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657181583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cLhZrCdUX8OtcKGwvLynTQpNA6mZonvcuUfAE6uH8bU=;
 b=SJ88I7wnfVcpCCAjyKhD0QAQWFbBQoSnccqIOr2GZGFSOl1PCKPBfUdtv/clLNLNI9SY2c
 OaZj/fSwOg5y0sxvUJOapPgdZHZm+jdcFd4gDfmoNVDM4LWMWm9x4cdx8fb6BfnnRODvaU
 pzZtKt8MikxHnBBSqiufO2/2rmvhEhQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-gphJhaVtMfu15U0YZctCaA-1; Thu, 07 Jul 2022 04:12:49 -0400
X-MC-Unique: gphJhaVtMfu15U0YZctCaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73E978339A0;
 Thu,  7 Jul 2022 08:12:49 +0000 (UTC)
Received: from localhost (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9E951121315;
 Thu,  7 Jul 2022 08:12:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/2] Block patches
Date: Thu,  7 Jul 2022 09:12:45 +0100
Message-Id: <20220707081247.1416955-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 8e9398e3b1a860b8c29c670c1b6c36afe8d87849:

  Merge tag 'pull-ppc-20220706' of https://gitlab.com/danielhb/qemu into staging (2022-07-07 06:21:05 +0530)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to be6a166fde652589761cf70471bcde623e9bd72a:

  block/io_uring: clarify that short reads can happen (2022-07-07 09:04:15 +0100)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Dominique Martinet (1):
  io_uring: fix short read slow path

Stefan Hajnoczi (1):
  block/io_uring: clarify that short reads can happen

 block/io_uring.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.36.1


