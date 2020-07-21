Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBD22819E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:05:16 +0200 (CEST)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxstP-0004pO-Vi
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxsrD-0001tQ-W3
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:03:00 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50556
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxsr7-0008Rx-Im
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595340172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e+73MgWiHAno58a/q25pndG2pgZddq0Cx3WcgHj98hw=;
 b=ckTgTaQFzmXqdVM6FlvnPo0frklF5SLYyaGCZg+/++fh6bWA3qgtUmsiUj8hYzAIZu8Mwp
 B+hq1zQdCfhX6fTyrEhRoyrH2We00SRMjuGwfx1OgWKuRksae0LMLkfl7k4L5QlKy/o2K+
 XSFbg/YbIG2cWqlybYCxS0SUBs045xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-xsVsMCTpN1-xCugOZZX1tw-1; Tue, 21 Jul 2020 10:02:50 -0400
X-MC-Unique: xsVsMCTpN1-xCugOZZX1tw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBDFA100CCC6
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 14:02:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA6D287B00;
 Tue, 21 Jul 2020 14:02:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCF549D9E; Tue, 21 Jul 2020 16:02:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Fixes 20200721 patches
Date: Tue, 21 Jul 2020 16:02:42 +0200
Message-Id: <20200721140245.14634-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:26:46
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af3d69058e09bede9900f266a618ed11f76f49f3:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200720' into staging (2020-07-20 15:58:07 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/fixes-20200721-pull-request

for you to fetch changes up to d87350b065128e8156e7aca93e89a1ab9e5fa63d:

  module: ignore NULL type (2020-07-21 10:56:51 +0200)

----------------------------------------------------------------
fixes for xhci and modular builds.

----------------------------------------------------------------

Gerd Hoffmann (2):
  qxl: fix modular builds with dtrace
  module: ignore NULL type

Laurent Vivier (1):
  xhci: fix valid.max_access_size to access address registers

 hw/display/qxl.c  | 9 +++++++++
 hw/usb/hcd-xhci.c | 4 ++--
 util/module.c     | 3 +++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.18.4


