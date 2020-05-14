Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D011D326F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 16:15:57 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZEeS-0000ff-5F
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 10:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEck-0007JD-6e
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:14:10 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEcj-0003lk-Dl
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:14:09 -0400
Received: by mail-lf1-x12e.google.com with SMTP id 82so1259816lfh.2
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXdbdMtZycVoB4yx0aXAJuiS2G/DZIxaDbZ/nG1ravs=;
 b=t7DviUITKWI+B3YUzmUIeXjCEWZiqstLHO8iYnKIPWht4YmBcGiAKiQjQHwqDGpk8J
 7QQ5+iBqYr8aPjmVr13NAdRxZSZR4c8No2G/9jVwFKwhuE9GARKHEM2kpqCdbb8r5duj
 KYddY3ImgkH1VH6TuiCfwCRU8J4edUO+1T0ndhS/JTvQfTs0M8W3n4hezvKTFJ2N745t
 oRLsBGcMKbWg3CvwJmwt4KwiX257IeTi8RuIGy0gmYYNNx7LRKUbMW5dYAQk0mCcsDK7
 zzWhzdwPlTB2N5Hd24GfVwY8j2oPQ6CBnfAPnFVZUNzJsgO6KgG2CwG9M6dCQPEU82+P
 2bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iXdbdMtZycVoB4yx0aXAJuiS2G/DZIxaDbZ/nG1ravs=;
 b=kY9Zy22iG0agqCdgSSnXDlA/rsdlmmdkLiF3fx/mWaoe/1DJwQ4+vSiAVFvKerbQdO
 6mSXXdMkAGLm7XjtCw7xBeouSO6OzUDc+8H/PZyrZlmbh/RbgJkfPkThgx8ZwxEHyjlI
 ClHy4nyWqVYyatDF+o3Xp1rlu4B6icsDAPOJcLRMEdRO8AaN1vifbNRH/kIlsdaocpbj
 HTkL3ZyKGuWOGk5g1+xKjr7hqLbeymveePpItb9HUuefWqip2tp9tVP360BC/S1GU0FA
 vOyBsfdZAMFnPLUfd0H1mmimaHw++sjWhy/qEwmsLTLHfpTloaCb2jjwW8AC5WlL1jsZ
 TVVQ==
X-Gm-Message-State: AOAM531AypGSH9jEf0kYGGRCCQJ+QbCgBx03fdGs+JtwBwFHlR0LdCu0
 XUlGsko/3UUtSY3LsIAp6yTI7tyMm5E=
X-Google-Smtp-Source: ABdhPJykSKS9NST/AmFqZ+DjdsDCwgSUYl9D+WJavQPT3argkkv95GK/G3NyKFN5gt3rNIEY1ChagA==
X-Received: by 2002:a19:ccce:: with SMTP id c197mr3542229lfg.59.1589465647581; 
 Thu, 14 May 2020 07:14:07 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id e16sm2440699lfc.63.2020.05.14.07.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 07:14:06 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 03/14] hw/net/xilinx_axienet: Remove unncessary cast
Date: Thu, 14 May 2020 16:13:51 +0200
Message-Id: <20200514141402.12498-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514141402.12498-1-edgar.iglesias@gmail.com>
References: <20200514141402.12498-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Remove unncessary cast, buf is already uint8_t *.
No functional change.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200506082513.18751-4-edgar.iglesias@gmail.com>
---
 hw/net/xilinx_axienet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 84073753d7..c8dfcda3ee 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -918,7 +918,7 @@ xilinx_axienet_data_stream_push(StreamSlave *obj, uint8_t *buf, size_t size)
         uint16_t csum;
 
         tmp_csum = net_checksum_add(size - start_off,
-                                    (uint8_t *)buf + start_off);
+                                    buf + start_off);
         /* Accumulate the seed.  */
         tmp_csum += s->hdr[2] & 0xffff;
 
-- 
2.20.1


