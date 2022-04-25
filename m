Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A550DC0F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:10:31 +0200 (CEST)
Received: from localhost ([::1]:45774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niujm-0005bX-Bf
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOu-0004AS-KH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOr-0006Gm-FB
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650876532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QCdYgc731pmhkz2pQ2VslwUg3y3A/zYkZ7v9k+cUitc=;
 b=drb8UKyEgLFhWeXx1B2NLHTUo6y4bF1RkjY431Ucj5zmF1pemIDlPsWYj2ekQRARfCw7bG
 JKa+EmzMa1N2IdpY13AM8LufNqWHzyBzeJ0b/8mObBCJzmlJDykt1fVjrduKmtdP6qyjjE
 OVGyjNMOl0z+VikUOsUim9l06l9b+9g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-FB87fCuMOeaDpSX10WHQOQ-1; Mon, 25 Apr 2022 04:48:49 -0400
X-MC-Unique: FB87fCuMOeaDpSX10WHQOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02D49811E75;
 Mon, 25 Apr 2022 08:48:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D224111DCF2;
 Mon, 25 Apr 2022 08:48:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Block patches
Date: Mon, 25 Apr 2022 09:48:41 +0100
Message-Id: <20220425084844.1086768-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:

  Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to d45c83328feab2e4083991693160f0a417cfd9b0:

  virtiofsd: Add docs/helper for killpriv_v2/no_killpriv_v2 option (2022-04-21 12:05:15 +0200)

----------------------------------------------------------------
Pull request

Small contrib/vhost-user-blk, contrib/vhost-user-scsi, and tools/virtiofsd
improvements.

----------------------------------------------------------------

Liu Yiding (1):
  virtiofsd: Add docs/helper for killpriv_v2/no_killpriv_v2 option

Sakshi Kaushik (1):
  Implements Backend Program conventions for vhost-user-scsi

Stefan Hajnoczi (1):
  contrib/vhost-user-blk: add missing GOptionEntry NULL terminator

 docs/tools/virtiofsd.rst                  |  5 ++
 contrib/vhost-user-blk/vhost-user-blk.c   |  3 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c | 77 +++++++++++++++--------
 tools/virtiofsd/helper.c                  |  3 +
 4 files changed, 62 insertions(+), 26 deletions(-)

-- 
2.35.1


