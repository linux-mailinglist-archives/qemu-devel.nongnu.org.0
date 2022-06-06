Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4553E543
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:01:43 +0200 (CEST)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEEg-0000Lp-M5
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrC-0002IJ-V1
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrA-0000bp-8x
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7GE7wKxGfHrqOlyrA6BhbVBFiuUOVNOslDOFIi1kLg=;
 b=L4htsJbtA+Q/fvL0bKmnncPjkA2fu1yoCogFkD9lTw83qKFd8f6SWQ5R7wTRsB4MF80PUo
 3FwZWgYgY+ZjW4G2dt9UwUQQagwHWANt9o3gwOHvzjE+Z8F0/YPO7HfxCo3tHY1JClqyXR
 cyOwdH5dZik9vkX/Vy7wBrsza2nbrfA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-u2arxXBnOqKE-0syQWibAw-1; Mon, 06 Jun 2022 10:37:22 -0400
X-MC-Unique: u2arxXBnOqKE-0syQWibAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k15-20020a7bc40f000000b0039c4b7f7d09so2042073wmi.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7GE7wKxGfHrqOlyrA6BhbVBFiuUOVNOslDOFIi1kLg=;
 b=yrCf8d+D3d3+Yo+m9RVajYe2D/OaNEW29k9PcG97Dt4NLW/8YZXzCmRLAaxp/l6etN
 DR/9XLKU7YEcCJ7AOAarY29+Q6YbFTDfP2xS1OVln4T6ZVnHl0TraFfuiki+fOUFIE1K
 cUxoLCEETKv+4eiBLP1+UzTGj8VMy9O1MTWCVXYWBlOIBMFVXVHc/ENRJdFMPgdu5l14
 mawrt5C48HZAX01eXCj1WGAAfZGPCS+4yz5CRl6caa/bNvWnREL7JEjf337JigK7eviQ
 M8lLLVs8J3nLXafzkm0sAF+kBf7RE0jpxQlakKzp1OETtTcDeTgL09YHw1f0jw0QAx8I
 QcOw==
X-Gm-Message-State: AOAM531PH/AXaDZM7IAvvh3jshqEu+NU4hsG/TrTqUlRixkRc6LVuz9k
 oinN7hCcjYQatV2vpL9f5C1NtnwTVjwGL8fv+yM9EijKqtmxDE7wcFJk5HFtPDyVnF2NMeA37RS
 BFlvP0EpLycKj0dsTEpG99hg2DqWIFZnohGVgwYbeR0sbSdnNsc8DQ1Ttu8j72t9mFno=
X-Received: by 2002:a5d:498f:0:b0:215:4d13:477e with SMTP id
 r15-20020a5d498f000000b002154d13477emr14969372wrq.155.1654526240900; 
 Mon, 06 Jun 2022 07:37:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzITWb9SD9O5mYoBZHn8wf9NkkK4WNMVHcyglNFnyyYQQMbphRbnWAuBUpeMSyx/rtYvgrHWA==
X-Received: by 2002:a5d:498f:0:b0:215:4d13:477e with SMTP id
 r15-20020a5d498f000000b002154d13477emr14969330wrq.155.1654526240439; 
 Mon, 06 Jun 2022 07:37:20 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l14-20020adfe58e000000b002117ef160fbsm15179552wrm.21.2022.06.06.07.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 18/29] python: update for mypy 0.950
Date: Mon,  6 Jun 2022 16:36:33 +0200
Message-Id: <20220606143644.1151112-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: John Snow <jsnow@redhat.com>

typeshed (included in mypy) recently updated to improve the typing for
WriteTransport objects. I was working around this, but now there's a
version where I shouldn't work around it.

Unfortunately this creates some minor ugliness if I want to support both
pre- and post-0.950 versions. For now, for my sanity, just disable the
unused-ignores warning.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-2-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/qmp/util.py | 4 +++-
 python/setup.cfg        | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/python/qemu/qmp/util.py b/python/qemu/qmp/util.py
index eaa5fc7d5f..ca6225e9cd 100644
--- a/python/qemu/qmp/util.py
+++ b/python/qemu/qmp/util.py
@@ -40,7 +40,9 @@ async def flush(writer: asyncio.StreamWriter) -> None:
     drain. The flow control limits are restored after the call is
     completed.
     """
-    transport = cast(asyncio.WriteTransport, writer.transport)
+    transport = cast(  # type: ignore[redundant-cast]
+        asyncio.WriteTransport, writer.transport
+    )
 
     # https://github.com/python/typeshed/issues/5779
     low, high = transport.get_write_buffer_limits()  # type: ignore
diff --git a/python/setup.cfg b/python/setup.cfg
index e877ea5647..c2c61c7519 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -79,6 +79,7 @@ strict = True
 python_version = 3.6
 warn_unused_configs = True
 namespace_packages = True
+warn_unused_ignores = False
 
 [mypy-qemu.utils.qom_fuse]
 # fusepy has no type stubs:
-- 
2.36.1



