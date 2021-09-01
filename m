Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA2B3FD28B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:47:13 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLI9Z-0007Kq-25
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5c-0002L1-4Y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5X-000666-4e
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630471382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpFh4tL+e0wq8iSsajwLm1esT9UJW4sAeMzs4dfdVQU=;
 b=cdmlaYKDTiJ56AF+T5JH+d9I8tIrzS9xCNZiartv1sPkRuJYJ8sN0SnyxHRTmhHJRg2koy
 o55dE8saJWyH4XAHlAhrhRFIXPtNVOZ+HJBxrUDqUsgYbVxBlYc2Cpt2eQX7nfF+0PcTnq
 3vmk6n5bfwpTr0PMFYYqpql/BRBOAbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-4nDmzM6AO26DlmCliWiQMA-1; Wed, 01 Sep 2021 00:43:00 -0400
X-MC-Unique: 4nDmzM6AO26DlmCliWiQMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B66A387D542;
 Wed,  1 Sep 2021 04:42:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A67C860C9F;
 Wed,  1 Sep 2021 04:42:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D8A3F1800918; Wed,  1 Sep 2021 06:42:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] MAINTAINERS: Split Audio backends sections
Date: Wed,  1 Sep 2021 06:42:48 +0200
Message-Id: <20210901044248.3122252-4-kraxel@redhat.com>
In-Reply-To: <20210901044248.3122252-1-kraxel@redhat.com>
References: <20210901044248.3122252-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Split the Audio backends into multiple sections (OS / framework /
library), allowing developers with different interests to add their
contact to the relevant entries.

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210816191014.2020783-4-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 282ad5a059aa..0da62502246f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2275,9 +2275,51 @@ Overall Audio backends
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
 F: audio/
+X: audio/alsaaudio.c
+X: audio/coreaudio.c
+X: audio/dsound*
+X: audio/jackaudio.c
+X: audio/ossaudio.c
+X: audio/paaudio.c
+X: audio/sdlaudio.c
 X: audio/spiceaudio.c
 F: qapi/audio.json
 
+ALSA Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/alsaaudio.c
+
+Core Audio framework backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/coreaudio.c
+
+DSound Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/dsound*
+
+JACK Audio Connection Kit backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/jackaudio.c
+
+Open Sound System (OSS) Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/ossaudio.c
+
+PulseAudio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/paaudio.c
+
+SDL Audio backend
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: audio/sdlaudio.c
+
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
 M: Hanna Reitz <hreitz@redhat.com>
-- 
2.31.1


