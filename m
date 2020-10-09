Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B9288FE1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 19:18:32 +0200 (CEST)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQw2K-0000N0-1F
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 13:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQvcw-0002iY-8V
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:52:18 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQvcu-0007ig-NX
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:52:17 -0400
Received: by mail-wm1-x343.google.com with SMTP id 13so10490564wmf.0
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gzKMTpfzwgqoBRPDRCgc9oD8o1aB2gP5trer2RP085Q=;
 b=BtCUCJLvtgjHhXQ5Bg2Mya52NyU2jsVN8gthEu1cxE69DTCDlcZ+T2kOZlegt/baFE
 OASTVBVub2W0McLShk1eQG9ej+LZ/xEKsdaT7ADRKcTjeKcHY6m1rznADysjB6L3/Tvy
 g/bjJJ/SpfjrIGuvgEfFYFmPRf74A+kR73P7C4y91824F+P3it6k6B90XprttzLfWU3B
 qNMOiaiYB2P3zd3Ur5wIDJ1IoFl6GVAKkzwYxRNVO1QK1gsReLJgDpaicbjO/5KolyOw
 7JQs+CCUk7/3oIUc8wcWuVUgR+CtdyMIpktRzeEQ6BdOEj7KRQgv/hDZaoEuMTc4/7c8
 QP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gzKMTpfzwgqoBRPDRCgc9oD8o1aB2gP5trer2RP085Q=;
 b=oMHHdmrQhqyJIOTWoThYdE93bTCi5JZOZPgh+iNOxnlfQ4E3kZ9ru5bpz0S1OgnL35
 ceTpeKakRS+YMjVRzxKBurtIxA0MZbsm88HoMVYMlLwDJzHhFdm+FW+RXN4QRL9zRP+9
 ieSIrEv1rVmSkBEonCAWC3mfnvPxt2GH505s5zuXw0QNlEjiHtz4sB9qfJlNAUEOWr8V
 UVDQVKehr8HAf2mlb3deqKQ6h3Hwsl2/N1Ue2yLaYCrJXdwjQTV6zq3wGqbKNKIkA8eM
 KeV+pDI3OmusV12/3tCU1wjlacvz9E1Z6meW0bbev8E1u/QKXk4HgFUu9oDQDmGXazcE
 wrgA==
X-Gm-Message-State: AOAM53268KMojl1/T7WB4k2SFFppTeQsrdYfmyDbowERFG2nKNnqW1zx
 CyINnbWIpPH56y4hi6oeUVTVGLo4c/U=
X-Google-Smtp-Source: ABdhPJyQz/eYbJOyU3PqisG6CLh+Trz5RqlFyuzsaL3Dgyk1FiIatGlnWG7xHfWLjnJiY6COh0203w==
X-Received: by 2002:a1c:e045:: with SMTP id x66mr15227567wmg.104.1602262335256; 
 Fri, 09 Oct 2020 09:52:15 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id p13sm12777125wmb.5.2020.10.09.09.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:52:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] MAINTAINERS: Update Paul Burton email address
Date: Fri,  9 Oct 2020 18:52:07 +0200
Message-Id: <20201009165208.2905569-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009165208.2905569-1-f4bug@amsat.org>
References: <20201009165208.2905569-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Chen Huacai <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paul's Wavecomp email has been bouncing for months, and in
commit 2b107c2c1c (".mailmap: Update Paul Burton email address")
we already removed the expired email.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782743b7ef0..702f73823fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1161,7 +1161,7 @@ S: Maintained
 F: hw/intc/loongson_liointc.c
 
 Boston
-M: Paul Burton <pburton@wavecomp.com>
+M: Paul Burton <paulburton@kernel.org>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: hw/core/loader-fit.c
-- 
2.26.2


