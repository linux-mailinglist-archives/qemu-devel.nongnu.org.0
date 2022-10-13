Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603705FD9A2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:54:48 +0200 (CEST)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixjb-0000Ft-FQ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSu-0001Uo-5V
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSr-00042e-S9
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YaEsHZiiA9mFtPtxQkW5psgLocTBBIsAORT10EacUr4=;
 b=cWPsy88FfHgGqLQarkpyCPR/BzuOXjw2uy/JyfwGAhjsiHsL2efmpn9iSHjmMCxPj3pX6q
 pw6A2p7T3XnJE2oyQuruU2AdcFLQOX7T2a3HzEYcvcPTroXmkEsdAkae8jtrWFZd7UhIRA
 eCqaI7SYWOrnPqcslyNuWNEINiDVDwU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-dv8x64jwNFuWEp8oGw7ijw-1; Thu, 13 Oct 2022 08:37:27 -0400
X-MC-Unique: dv8x64jwNFuWEp8oGw7ijw-1
Received: by mail-ed1-f72.google.com with SMTP id
 z11-20020a056402274b00b0045ca9510fc8so1411435edd.23
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YaEsHZiiA9mFtPtxQkW5psgLocTBBIsAORT10EacUr4=;
 b=2TERc/zRlbkxuM+IIS10W/bw6LzMTMAswJ0uZKEEiXjFpU+xny2+6nuNRqByqtZ9H3
 QS+BGYECEYLK1KXmR5yI+Sf0VHiRylkIEoMbGGxgNQDfBI3zCpH4112Q5l4AYeP5QNg2
 mABecJrNvrhb0mVmz4igGT4OjiwYk69xLpzJBAXH832lKNkRA96B4mf40oGVxPyBfblY
 VHjqkwNu7mMH3xxr4LG73289mKTb9ZuO/2ibS+hcDhs4HSxEQWOkEcWpgAHPsLLned25
 UyUxjjAszwZfUZuePYROyE9DN8T8vI7ukW9TI2MBAcktATTzaIcS6oxJnDFcCeouSMp6
 mYIw==
X-Gm-Message-State: ACrzQf35PmaJOK0uY64PaL7bVtXRS5Xk5OElp6Z45SMLzpyBxYxVR5XH
 dmNv+4VGatPNA3MOYdSSDtU/+tiwd5uzhsNo6X/bd+X9gW7JQ1taWsaYiTt7MVwzclwcMaa/Sd7
 m5pGY/ydQvdiY7tyaflsbD0MZM2jIhGHsJPYK7DkKj3HFocJ9jw+v1XjGAojwvBRsZBk=
X-Received: by 2002:a17:907:724d:b0:78d:acf4:4c57 with SMTP id
 ds13-20020a170907724d00b0078dacf44c57mr17032802ejc.516.1665664645944; 
 Thu, 13 Oct 2022 05:37:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JEmqJF2BazrM7Pb2ehM0TNcLYLsFQUHF5Sf5ycyElxqDnqbev1Rd7VkNBBXQ7laVu2M6qLg==
X-Received: by 2002:a17:907:724d:b0:78d:acf4:4c57 with SMTP id
 ds13-20020a170907724d00b0078dacf44c57mr17032792ejc.516.1665664645677; 
 Thu, 13 Oct 2022 05:37:25 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a170906558a00b0073d796a1043sm2931970ejp.123.2022.10.13.05.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 04/24] ssh: add missing coroutine_fn annotation
Date: Thu, 13 Oct 2022 14:36:51 +0200
Message-Id: <20221013123711.620631-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

ssh_write is only called from ssh_co_writev.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/ssh.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/ssh.c b/block/ssh.c
index a2dc646536..ceb4f4c5bc 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1129,9 +1129,9 @@ static coroutine_fn int ssh_co_readv(BlockDriverState *bs,
     return ret;
 }
 
-static int ssh_write(BDRVSSHState *s, BlockDriverState *bs,
-                     int64_t offset, size_t size,
-                     QEMUIOVector *qiov)
+static coroutine_fn int ssh_write(BDRVSSHState *s, BlockDriverState *bs,
+                                  int64_t offset, size_t size,
+                                  QEMUIOVector *qiov)
 {
     ssize_t r;
     size_t written;
-- 
2.37.3


