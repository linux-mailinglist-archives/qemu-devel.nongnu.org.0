Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBB210EB0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 17:11:24 +0200 (CEST)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqeOQ-0004GU-Ec
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 11:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqeHu-0003Er-B7
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 11:04:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35241
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqeHr-0001Aq-Jw
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 11:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593615874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jB/tvOgH9gYdMrjSAjtjZo3N10VvJsvWWOx/SzBKw8c=;
 b=P++p22RW76Q/MnrEFN5bkyl1nRw4IXHTcDRED3UFhgFNhkROp7PQgRncETLyTAhM8bWh/g
 Qr4Ul4RQ4OpFkxAd94yNSB8HNHRoj0j/5vkpNAU7zqDvH0XBhdcCizFCnwrY7mXBScE4pX
 SG+9ISaHh4hkNMv6ENmvMmmR7d2hJrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-78E5Hc7_O2iOTHCqcxaBWA-1; Wed, 01 Jul 2020 11:04:30 -0400
X-MC-Unique: 78E5Hc7_O2iOTHCqcxaBWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868FE7BAE;
 Wed,  1 Jul 2020 15:04:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B5BC5BAE2;
 Wed,  1 Jul 2020 15:04:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46F6816E16; Wed,  1 Jul 2020 17:04:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Vga 20200701 patches
Date: Wed,  1 Jul 2020 17:04:12 +0200
Message-Id: <20200701150425.13739-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 01:05:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fc1bff958998910ec8d25db86cd2f53ff125f7ab:

  hw/misc/pca9552: Add missing TypeInfo::class_size field (2020-06-29 21:16:10 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20200701-pull-request

for you to fetch changes up to 8db2a4fd8abf6550479f7a8caa8f655c34238d6a:

  configure: vgabios cleanups (2020-06-30 22:54:47 +0200)

----------------------------------------------------------------
vga: bugfixes for ati and sm501, vgabios cleanup.

----------------------------------------------------------------

BALATON Zoltan (12):
  sm501: Fix bounds checks
  sm501: Drop unneded variable
  sm501: Ignore no-op blits
  sm501: Introduce variable for commonly used value for better
    readability
  sm501: Optimise 1 pixel 2d ops
  sm501: Use stn_he_p/ldn_he_p instead of switch/case
  sm501: Do not allow guest to set invalid format
  sm501: Convert debug printfs to traces
  sm501: Fix and optimize overlap check
  ati-vga: Support unaligned access to hardware cursor registers
  ati-vga: Do not assert on error
  ati-vga: Add dummy MEM_SDRAM_MODE_REG

Gerd Hoffmann (1):
  configure: vgabios cleanups

 configure               |   6 +-
 hw/display/ati_regs.h   |   1 +
 hw/display/ati.c        |  92 +++++++++++++++--------
 hw/display/ati_dbg.c    |   1 +
 hw/display/sm501.c      | 157 +++++++++++++++++++---------------------
 hw/display/trace-events |  12 +++
 6 files changed, 155 insertions(+), 114 deletions(-)

-- 
2.18.4


