Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C3400B7A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 15:24:46 +0200 (CEST)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMVf3-0002Tv-Av
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 09:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <01d97b400805d72bfa0c4e3eb899613f7aadba3b@lizzy.crudebyte.com>)
 id 1mMVdd-0001eb-A5
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 09:23:17 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <01d97b400805d72bfa0c4e3eb899613f7aadba3b@lizzy.crudebyte.com>)
 id 1mMVdb-00052W-FP
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 09:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=7eX7ridKXjxYjw2VPs5CDwHI2v/myu941PWiyMMNmh4=; b=XQE4+
 o6msWBnPhonwHy4RAjzT/1IU4ORCn2nujpMJLSJL89e1XEUYkVSb7LyLKh/STkmdVDHB2hFEsa/EH
 XfuzO/LK4nIsh76l81MmWikec5tuPPgJk+4lwGoJKEDI4Jtv4Gb17SWrS8IQrflaa5nBmH/jVv9Mb
 CGCm1XwRMxTx2XqFA7dBupxEbA0BGseunqapOonj5RW2bt3QpdYasxe49RMXYjgKP2kuHa81mGzPV
 WBHQlZSvJvMhIzroXsvbDgm05bjbIOl59kqhpeYICDWdB2I8mRkZ3OKi4gFpa7mO0SKmw9WKeyzMN
 ei0Ro5TRSw202Uq2CxKGl4da3nnMA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 4 Sep 2021 15:13:46 +0200
Subject: [PATCH] MAINTAINERS: add myself as partial audio reviewer
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <E1mMVca-0005ZJ-Lo@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=01d97b400805d72bfa0c4e3eb899613f7aadba3b@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Volunteering as reviewer for some of the audio backends; namely
ALSA, CoreAudio and JACK.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d923a6544..f018c1891a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2289,11 +2289,13 @@ F: qapi/audio.json
 
 ALSA Audio backend
 M: Gerd Hoffmann <kraxel@redhat.com>
+R: Christian Schoenebeck <qemu_oss@crudebyte.com>
 S: Odd Fixes
 F: audio/alsaaudio.c
 
 Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
+R: Christian Schoenebeck <qemu_oss@crudebyte.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2304,6 +2306,7 @@ F: audio/dsound*
 
 JACK Audio Connection Kit backend
 M: Gerd Hoffmann <kraxel@redhat.com>
+R: Christian Schoenebeck <qemu_oss@crudebyte.com>
 S: Odd Fixes
 F: audio/jackaudio.c
 
-- 
2.20.1


