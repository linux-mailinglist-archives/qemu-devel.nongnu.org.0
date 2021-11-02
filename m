Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A2E4432B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:30:03 +0100 (CET)
Received: from localhost ([::1]:60154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwfi-0000JZ-IL
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcR-0005Vz-Eq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcO-0002ZN-K3
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zv4POPaDroXSr5MvhbVI8JBiagkh4t5htrL42TCz/wc=;
 b=POdENSuaCiEwjwK4L4CdiL54h6DaLUSMyXFhadGpN0wAKBL8HKU23gvpW2v61CyvfVlqeN
 NCco4Dn5LWPD1KPFEcCw6Nf+M+gGBqHszqVLB+1SiRqO8xcKBdC1Duw1HRz1rQP/SB7fMb
 XQLVUm0kRCPaW7eOJUnIn5I3gUYe41Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-qfWjhCo8Op-NxYy59146CA-1; Tue, 02 Nov 2021 12:26:33 -0400
X-MC-Unique: qfWjhCo8Op-NxYy59146CA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E544A81433A;
 Tue,  2 Nov 2021 16:26:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F62813ABD;
 Tue,  2 Nov 2021 16:26:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 952421801AA7; Tue,  2 Nov 2021 17:26:19 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] MAINTAINERS: add myself as partial audio reviewer
Date: Tue,  2 Nov 2021 17:26:11 +0100
Message-Id: <20211102162619.2760593-3-kraxel@redhat.com>
In-Reply-To: <20211102162619.2760593-1-kraxel@redhat.com>
References: <20211102162619.2760593-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Schoenebeck <qemu_oss@crudebyte.com>

Volunteering as reviewer for some of the audio backends; namely
ALSA, CoreAudio and JACK.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <E1mMVca-0005ZJ-Lo@lizzy.crudebyte.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 99618e6d9906..9ddba68701b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2285,11 +2285,13 @@ F: qapi/audio.json
 
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
 
@@ -2300,6 +2302,7 @@ F: audio/dsound*
 
 JACK Audio Connection Kit backend
 M: Gerd Hoffmann <kraxel@redhat.com>
+R: Christian Schoenebeck <qemu_oss@crudebyte.com>
 S: Odd Fixes
 F: audio/jackaudio.c
 
-- 
2.31.1


