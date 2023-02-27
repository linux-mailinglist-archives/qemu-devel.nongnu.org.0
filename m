Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0136A43A3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:03:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe59-00025x-17; Mon, 27 Feb 2023 09:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4P-0000oE-O6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:46 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4O-0007dp-7T
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:37 -0500
Received: by mail-wr1-x430.google.com with SMTP id t15so6329306wrz.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eMvi4KhirUzuoIPRZhoENemFll4CeurZVpqkoOYKjcs=;
 b=tyUSwV3/PCCXvaHAcHhrUDAbn/V97nEHaHd3imUbBajQm3TxP+PscISkVuBpJzI0hO
 MPYiuu8+L6ShtIf97bRFzz8BHNZ6lU9ekHAW+bSjQC3lYbiAdfAhXIPqKzGCxKfFWMpO
 GPDoH5JWSZBdADo/G0QqGcm3gBv659ya1MnH8VlioKyXOdqtWTX2iuBDImlG4uhfiz8X
 S+TAQ0asRIMjusaimquGDCOGXBSAm48zBo5XE26s3yiH2uZwSI5aQ4shA2YrjLa5kgAr
 m2YhiBGKueWO13HrOrDkcAp+6/yXB1KVbrwFQ+ZEPbbwnctNUhxK+JEa4A2VoWyof6FG
 ZGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eMvi4KhirUzuoIPRZhoENemFll4CeurZVpqkoOYKjcs=;
 b=2judL8hsvjs6XbkzsHmEf7lMJfKJ09+0mr5I4BfkOAD16RImECXErs+fEUSE6iBM9q
 2TtXnFPOz7dRwpPPd/LSYn+5xTI18S2HEdSAyzgyiZ7P1/92TPpoppGLSMaIB5mTHp4V
 L8+9cYUsW8X1OZhRz9D/PRZlQiqWvx9PfvgxBW4KLWxSeUVLHvNnO2PI6oFXLMW4munn
 wZC+tl9GQ0azwVACHhgaEDyl0XG7ABH2B76GMOal5ri2H+IP8HLfdT5O4Q+HVG+UeYA0
 Hvp7s/NhoCxb30J6e2ra7k3xRzyNPHIHEaOJ7IZVEb61biTjeLY4iOgMUghN9+No8Wij
 pjlA==
X-Gm-Message-State: AO0yUKXLs+YXSnXAaQnVDfWQPhXmiIKZQTH6+q1wKzMg+fO743h6v/Bc
 0XQ4gKMvpyIKACa/ctfgI5/UB4S2Cu8dRwA3
X-Google-Smtp-Source: AK7set9+tT21/jvoil/DWXhbJDQg7zEBhvejo/sSx55qdyO1hWZ4q2GDg7nyEyt5K6E6M1Oi4nBmqw==
X-Received: by 2002:a5d:66c3:0:b0:2c9:79f4:101f with SMTP id
 k3-20020a5d66c3000000b002c979f4101fmr6247404wrw.34.1677506494660; 
 Mon, 27 Feb 2023 06:01:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/25] iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
Date: Mon, 27 Feb 2023 14:00:59 +0000
Message-Id: <20230227140102.3712344-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since commit be8d853766 ("iothread: add I/O thread object") we
never used IOThreadClass / IOTHREAD_CLASS() / IOTHREAD_GET_CLASS(),
remove these definitions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20230113200138.52869-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 iothread.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/iothread.c b/iothread.c
index 3862a644712..b41c305bd96 100644
--- a/iothread.c
+++ b/iothread.c
@@ -25,10 +25,6 @@
 #include "qemu/rcu.h"
 #include "qemu/main-loop.h"
 
-typedef ObjectClass IOThreadClass;
-
-DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
-                       TYPE_IOTHREAD)
 
 #ifdef CONFIG_POSIX
 /* Benchmark results from 2016 on NVMe SSD drives show max polling times around
-- 
2.34.1


