Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26FC5E6B6B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:04:45 +0200 (CEST)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRV7-0007EV-1D
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obPuT-0003vP-9Q
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obPuR-0006mk-7Z
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663867364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L9U8ooAWOVwVjZNA8J1lsc3K9ZR0K90k9/uBBuz352c=;
 b=EENB7xl0fJ5msAnvMSuCIAlzyVK/Hu+msJPKY/xY58OmmKi2VBDxAFgvdxntBKgpRYPPFL
 LjvdoI72bEblQoNh0UZR0HpsIHm0GwcHlNHbSQplav/K2NK377L5zLtu984qSpBvl+4jaw
 VxTPfNjDl3MCqL0UAeSdENCdR3rJO14=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-VqV9tRjkNO6eRgv41eb1Uw-1; Thu, 22 Sep 2022 13:22:43 -0400
X-MC-Unique: VqV9tRjkNO6eRgv41eb1Uw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8A963C106A4;
 Thu, 22 Sep 2022 17:22:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318E91402BDB;
 Thu, 22 Sep 2022 17:22:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com
Subject: [PULL 0/1] Block patches
Date: Thu, 22 Sep 2022 13:14:46 -0400
Message-Id: <20220922171447.166958-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6338c30111d596d955e6bc933a82184a0b910c43:

  Merge tag 'm68k-for-7.2-pull-request' of https://github.com/vivier/qemu-m68k into staging (2022-09-21 13:12:36 -0400)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to f16d15c9276bd8f501f861c39cbd4adc812d0c1d:

  virtiofsd: use g_date_time_get_microsecond to get subsecond (2022-09-22 13:13:47 -0400)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Yusuke Okada (1):
  virtiofsd: use g_date_time_get_microsecond to get subsecond

 tools/virtiofsd/passthrough_ll.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.37.3


