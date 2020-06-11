Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8D1F7158
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 02:26:32 +0200 (CEST)
Received: from localhost ([::1]:40170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjXWh-0004q9-3U
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 20:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1jjXSw-000734-TX
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 20:22:38 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:33226)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jjXSv-0001Jg-E4
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 20:22:38 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id F3620444E6;
 Fri, 12 Jun 2020 10:16:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1591920973;
 bh=gPfDx0oOx78hVDtbsa3uYMHvYIzSXfoDfgaF8sNcNrE=;
 h=From:Date:Subject:To:Cc:From;
 b=AdirZgRO3VyI0We6O/MCkbfwaUxOMetZ8SvmPnRy0h/hokK33pkc7aYuvoEtu16pM
 0/wUesMZgC/uEdC63/+NMvPk9jv45ptfYl4rz4L5vkPTHTIB2y4Dr55qg34gprfWsa
 NQFziR9HYhEHNkQ+Zh74mBkMIQfTldy+Zs0rcsg8=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id D7A853A0680; Fri, 12 Jun 2020 10:16:12 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
Date: Fri, 12 Jun 2020 01:14:19 +1000
Subject: [PATCH 3/6] audio/jack: remove invalid set of input support bool
To: <qemu-devel@nongnu.org>
Cc: <kraxel@redhat.com>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200612001612.D7A853A0680@moya.office.hostfission.com>
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 20:16:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/jackaudio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index fb8efd7af7..58c7344497 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -607,9 +607,6 @@ static int qjack_thread_creator(jack_native_thread_t *thread,
 static void *qjack_init(Audiodev *dev)
 {
     assert(dev->driver == AUDIODEV_DRIVER_JACK);
-
-    dev->u.jack.has_in = false;
-
     return dev;
 }
 
-- 
2.20.1


