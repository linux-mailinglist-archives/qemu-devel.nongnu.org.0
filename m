Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7D221FBE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 11:34:06 +0200 (CEST)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw0HG-000100-18
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 05:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jw0Eo-0006V7-1s
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:31:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28363
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jw0El-0002Oi-2L
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594891890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OBbTIfZN25PRaPD9WzUTdPYzJ0SFNpcoRovwxynboNk=;
 b=PFbFPKZEoV2fGZ856cuqfohtSCrLd2dTHKFYfnKHnbPRE1KrtYnoDmwEXp/RlpOBqnuBp9
 bIA7ZyGlmk2WvNKk7tL4Qe5gJJOsK5Y0pNc2G31GNQE/R+J2gdBZM0u0Lu2dCRjlGFLsQM
 on7NqN/4wmLbc8xdR7hnw0il5P7vvP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-bIYYJLdZPF2Q5o1RBLwHjw-1; Thu, 16 Jul 2020 05:31:28 -0400
X-MC-Unique: bIYYJLdZPF2Q5o1RBLwHjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54A4A1009442
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 09:31:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC74F710D7;
 Thu, 16 Jul 2020 09:31:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A5A6917444; Thu, 16 Jul 2020 11:31:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Fixes 20200716 patches
Date: Thu, 16 Jul 2020 11:31:17 +0200
Message-Id: <20200716093119.10740-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 01:59:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8746309137ba470d1b2e8f5ce86ac228625db940:

  Update version for v5.1.0-rc0 release (2020-07-15 19:08:07 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/fixes-20200716-pull-request

for you to fetch changes up to 4084e35068772cf4f81bbae5174019f277c61084:

  usb: fix storage regression (2020-07-16 10:20:27 +0200)

----------------------------------------------------------------
fixes: usb storage regression, vfio display ramfb bug

----------------------------------------------------------------

Gerd Hoffmann (2):
  vfio: fix use-after-free in display
  usb: fix storage regression

 hw/usb/dev-storage.c | 3 +--
 hw/vfio/display.c    | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.18.4


