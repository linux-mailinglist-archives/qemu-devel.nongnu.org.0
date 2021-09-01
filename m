Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBEB3FD282
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:45:42 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLI85-0004Gv-3h
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5Z-0002Ip-EQ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5W-00064x-VB
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630471381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwloFgmZTmyEACIPfU9RfLTtclvN9p28GJVAC4tMD3A=;
 b=T7O4EZJFXvbxvXwledWprV4nFeo1OaL0LCUbam8trYQPzIm8ZnSOk1ELDVmnpAMFljTpWY
 C+Iouwv55E3lHr7GAwdH8agzgMfdGIZD3arAUGrw8/mTTbbYgzekkTT2JogFhyACx+pSmu
 gpZPUVSAxN/0QjxBAVE2V4SuhlaU4T4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-3KDpsXBVNEKVrxMn83nA2g-1; Wed, 01 Sep 2021 00:43:00 -0400
X-MC-Unique: 3KDpsXBVNEKVrxMn83nA2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE4F91854E21;
 Wed,  1 Sep 2021 04:42:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 317C11ABDF;
 Wed,  1 Sep 2021 04:42:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C33BD1800906; Wed,  1 Sep 2021 06:42:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] MAINTAINERS: Split Audio backends VS frontends
Date: Wed,  1 Sep 2021 06:42:46 +0200
Message-Id: <20210901044248.3122252-2-kraxel@redhat.com>
In-Reply-To: <20210901044248.3122252-1-kraxel@redhat.com>
References: <20210901044248.3122252-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210816191014.2020783-2-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dffcb651f460..8fb35b0d301d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1660,6 +1660,16 @@ F: hw/net/opencores_eth.c
 
 Devices
 -------
+Overall Audio frontends
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: hw/audio/
+F: include/hw/audio/
+F: tests/qtest/ac97-test.c
+F: tests/qtest/es1370-test.c
+F: tests/qtest/intel-hda-test.c
+F: tests/qtest/fuzz-sb16-test.c
+
 Xilinx CAN
 M: Vikram Garhwal <fnu.vikram@xilinx.com>
 M: Francisco Iglesias <francisco.iglesias@xilinx.com>
@@ -2261,17 +2271,11 @@ F: include/net/can_*.h
 
 Subsystems
 ----------
-Audio
+Overall Audio backends
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
 F: audio/
-F: hw/audio/
-F: include/hw/audio/
 F: qapi/audio.json
-F: tests/qtest/ac97-test.c
-F: tests/qtest/es1370-test.c
-F: tests/qtest/intel-hda-test.c
-F: tests/qtest/fuzz-sb16-test.c
 
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
-- 
2.31.1


