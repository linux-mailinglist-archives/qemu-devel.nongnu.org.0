Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC158D60C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:12:55 +0200 (CEST)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLLIE-0005lv-QZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLLEk-0001oI-Ky
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLLEe-0005Yl-5Y
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660036148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H9G+y/D5M+9l+Tj3IPWGUg1vy7tB6hwJt0Dq3bXsRmw=;
 b=hzLPWlD+I3DyM+kxSIPl7B1hTfJoDhZvc63GOECZGw29NR9nbckJiGfa5Amfy699y/mZNR
 LMB8szCz7oFXr9dhelkWcqa6TXvRuCYxc6b+ETeB+eWv8xEn9XqTyIax1mwHp7wxd+m1Xs
 cX9d88DXItCrVHi0QUDhyOn75nrdA4o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-Qw2fyet5PYCjRGOtE6d2Bg-1; Tue, 09 Aug 2022 05:09:05 -0400
X-MC-Unique: Qw2fyet5PYCjRGOtE6d2Bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C91882999B2A;
 Tue,  9 Aug 2022 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-255.pek2.redhat.com
 [10.72.13.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D8B44047D22;
 Tue,  9 Aug 2022 09:09:02 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL] Net patches
Date: Tue,  9 Aug 2022 17:08:58 +0800
Message-Id: <20220809090859.28338-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit ca5f3d4df1b47d7f66a109cdb504e83dfd7ec433:

  Merge tag 'pull-la-20220808' of https://gitlab.com/rth7680/qemu into staging (2022-08-08 19:51:12 -0700)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 7cf745dd9c25f0740dc1009598b58dd8dd989876:

  hw/net/rocker: Avoid undefined shifts with more than 31 ports (2022-08-09 17:02:18 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Peter Maydell (1):
      hw/net/rocker: Avoid undefined shifts with more than 31 ports

 hw/net/rocker/rocker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)



