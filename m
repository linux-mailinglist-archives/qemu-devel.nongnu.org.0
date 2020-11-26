Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E572C5325
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:38:42 +0100 (CET)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFbl-0003kL-81
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFTv-0003kJ-Ow
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFTs-0006XE-Fk
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nM2YOWlL4oKxjru1lmnZu7dVtPS06ZweI/bTapfx3O4=;
 b=PsS+EWdvA+R9kVtnNopbghS+103obClxaMHd9uJJzKHB+UPT1yv34vJ0UqZhToSe6rF/n/
 8D8jCt1b2TRdisiSqCGplF4nkgznu8Y2FmOrE53jxt3Eyb884pjyz1d3dyPfb0kV0pDMIm
 4W0l96c22THfUS0/PyP0wN2NAuOIgVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-WJLo0Jd-NR2c4b9I2Xgi-g-1; Thu, 26 Nov 2020 06:30:29 -0500
X-MC-Unique: WJLo0Jd-NR2c4b9I2Xgi-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 983A0190A7A0;
 Thu, 26 Nov 2020 11:30:28 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C95E1001E73;
 Thu, 26 Nov 2020 11:30:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/13] audio: remove GNUC & MSVC check
Date: Thu, 26 Nov 2020 15:29:11 +0400
Message-Id: <20201126112915.525285-10-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-1-marcandre.lureau@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires either GCC or Clang, which both advertize __GNUC__.
Drop MSVC fallback path.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/audio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 46578e4a58..d7a00294de 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
 
 #if defined AUDIO_BREAKPOINT_ON_BUG
 #  if defined HOST_I386
-#    if defined __GNUC__
-        __asm__ ("int3");
-#    elif defined _MSC_VER
-        _asm _emit 0xcc;
-#    else
-        abort ();
-#    endif
+      __asm__ ("int3");
 #  else
         abort ();
 #  endif
-- 
2.29.0


