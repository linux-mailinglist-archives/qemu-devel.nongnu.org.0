Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E4E765
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 18:14:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL8vC-0003Y8-Ms
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 12:14:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hL8rp-0001Eq-9p
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hL8ro-0003w8-CI
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:10:57 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:44660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hL8ro-0003vp-7s
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:10:56 -0400
Received: by mail-io1-xd2e.google.com with SMTP id r71so9416749iod.11
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 09:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4VLnEBOIrNsmLlfpoPUK7E2/ZiMjfNK4XWC8HwWuZF0=;
	b=HQ+75C5C4cIWtOufjUa9Gwp7N1yK5QlqJiWtehmpS/Md//SlChHt6F7fFdfaTgNMxY
	Vw1dm3j+zq3xftlbh/kiPQqseY/T8hXwQoHjhE7hnBkMSGTQKz6yiIZm4v3g0zLKGoSO
	QSST2XYKxvxqGqFT1nXJf2C7g/VmdonWfF8hOxlOKV/Xb8KiU07HscFMzeTF9apRtuiC
	/HxSpBCe3RSgLqnaUHOEc83EIXSO2wf3gf6UlmXsbPBCZezwdk9WOuFq4r21/bA3w+Jb
	imbnJe11Q4CsTzSQJmGgPBHdLqyKIWEkgnbqkvp+/bDSd2Xzuw+VxbjrkelRx/WwxIo4
	N63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4VLnEBOIrNsmLlfpoPUK7E2/ZiMjfNK4XWC8HwWuZF0=;
	b=XhDuSnZYEEL6xcgDsB36ny9MBjGUf7Bg7ZHTZgpP9mlEM7Wvxztk39+r4FDCXTsqds
	u1vdF9O2UFykuvQwo28a8/QHjK5fgACe6KftvXDw32hmiIN1e6RaFYVBn5hJ9F49OFkO
	84YhZIdpH8s0o4ScRZ1nRC346XNyfBcw+lrkOGqQpQeGUoloy6nGEkUvMgcHFJNmLaFO
	0/MgA+v2WvZUlz3x8z3ZEEADp8w8vl2KX+OWgKluie/2XVYRz7eq6ldHE/HF8kqsTMQr
	0/OX3gQH35cyIw1HoDzfk9SzLguf7fIfFjwXI2lsT0gZW5yRhmNiC/IPz0urPyxt8vEE
	2SvA==
X-Gm-Message-State: APjAAAVUrYKHzDmZFoGzg7ef//LmJMGzeoQ8JvGgK0q8H5/WwkOeVGE8
	sg3w1Cxc3m14DzoNrWnTsEPvmdujWS8=
X-Google-Smtp-Source: APXvYqzJVTuZ7CP/gAQH0SARLGgffw7VYSGS99nU18yGkqXHPDWbrHfjzXu2314ZQsawWQtkEGdVCw==
X-Received: by 2002:a5d:9ccc:: with SMTP id w12mr29240069iow.253.1556554255253;
	Mon, 29 Apr 2019 09:10:55 -0700 (PDT)
Received: from localhost
	(CPE64777d5479c3-CM64777d5479c0.cpe.net.cable.rogers.com.
	[99.228.64.175]) by smtp.gmail.com with ESMTPSA id
	64sm15706201ite.42.2019.04.29.09.10.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 09:10:54 -0700 (PDT)
From: Stefan Hajnoczi <stefanha@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Apr 2019 12:10:46 -0400
Message-Id: <20190429161046.10527-2-stefanha@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429161046.10527-1-stefanha@gmail.com>
References: <20190429161046.10527-1-stefanha@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d2e
Subject: [Qemu-devel] [PULL 1/1] trace: fix runstate tracing
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yury Kotov <yury-kotov@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yury Kotov <yury-kotov@yandex-team.ru>

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190426102115.30002-1-yury-kotov@yandex-team.ru
Message-Id: <20190426102115.30002-1-yury-kotov@yandex-team.ru>
Signed-off-by: Stefan Hajnoczi <stefanha@gmail.com>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 4019a4387d..d9fea0a119 100644
--- a/vl.c
+++ b/vl.c
@@ -725,7 +725,7 @@ void runstate_set(RunState new_state)
     assert(new_state < RUN_STATE__MAX);
 
     trace_runstate_set(current_run_state, RunState_str(current_run_state),
-                       new_state, RunState_str(current_run_state));
+                       new_state, RunState_str(new_state));
 
     if (current_run_state == new_state) {
         return;
-- 
2.20.1


