Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BF3D53A5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 09:13:19 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7une-00061l-1p
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 03:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m7umQ-00040g-44
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:12:03 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m7umN-0006H7-9J
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:12:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id n21so4647098wmq.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 00:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ADWwS/U5K4vAGcDsI303o9ZAZkML+r9ejuSJ5UL0Rc=;
 b=kNa7y9VxqLHxgEpc/mlhCpfSreWqSK7Q3mwVhS9cmP1KCWm0BiQTcS6yfS4Zzz69KM
 50l9RySY2agxOJkbmLv5DupEloAy80zEYSA4i0a06tMd6xYCVvFCo0CfamBtWbIux50A
 KK26Tfo8+gdsK4isQFi0LKIqi6H3CuqXrYoOXAn7qKuPieCABEOt80xsmKpHQZj3Cbwq
 6yUx/UoyqxzH1IDX76Z4pRbsstb5NE1i9eaJY6/5/tBDFcpVMQ+Kg67WzsAFT0YZSFxM
 bbQaR0W9HHFi+3H/lD3UpbN+Bied8rT9x9xvqU5l/akNm9GrSMPSM+jOTQBSu10EdosQ
 vcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ADWwS/U5K4vAGcDsI303o9ZAZkML+r9ejuSJ5UL0Rc=;
 b=t9KDb57sRJLqgDyDy662v9bB5WZqPSlX497n4LoinycSB2Fs/dVP6383WBZ+2PTxS2
 nuT5fL3VWJedS4DS4Op1SqDaWgzCTwqaQjqaRqON3v3GyqJzsVp5L+FUPF8wQn5IgMJB
 cFG8UQ6uxrdR64vty2ujfLnDgeFF3Ch0CWF6RIml8iLW+HpyTMFO+pO3Ja1FNTtnSXbH
 DofqNoIuamNzZr/NSUw+34kARnaET48t540+Q3C0vHDDd5e8XvJAVknE2erevQ90CvYz
 P5Ioxu6gtEK4CSb6xZtGc/WPqnTmrlDvJqmxuadPRZb8Y7Z6LZfa8hQzc7tmRszXfRpA
 ngOQ==
X-Gm-Message-State: AOAM533eRQizPt1ikXXNKK2W5FWLtVWTGyg0CgKwUgX007TBMQzeFftY
 6GArKBYuIwSFRUWnj84TVp76M/dJgL+82gzg
X-Google-Smtp-Source: ABdhPJwsrXTy+Om4u0NKCOtv/O2bqDVEtlxqtkP78ehZanCPio+9ed1mRUKcnmFAtRrw+ZprTRpSCA==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr2191873wmi.12.1627283516781; 
 Mon, 26 Jul 2021 00:11:56 -0700 (PDT)
Received: from lb01399.fkb.profitbricks.net
 (p200300ca572b5e23c4ffd69035d3b735.dip0.t-ipconnect.de.
 [2003:ca:572b:5e23:c4ff:d690:35d3:b735])
 by smtp.gmail.com with ESMTPSA id h9sm34524933wmb.35.2021.07.26.00.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 00:11:56 -0700 (PDT)
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
To: xiaoguangrong.eric@gmail.com,
	pankaj.gupta.linux@gmail.com
Subject: [PATCH] docs/nvdimm: Update nvdimm option value in machine example
Date: Mon, 26 Jul 2021 09:11:45 +0200
Message-Id: <20210726071145.150832-1-pankaj.gupta.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update nvdimm option value in example command from "-machine pc,nvdimm"
to "-machine pc,nvdimm=on" as former complains with the below error:

"qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"

Signed-off-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 docs/nvdimm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index 0aae682be3..fd7773dc5a 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -15,7 +15,7 @@ backend (i.e. memory-backend-file and memory-backend-ram). A simple
 way to create a vNVDIMM device at startup time is done via the
 following command line options:
 
- -machine pc,nvdimm
+ -machine pc,nvdimm=on
  -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
  -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
  -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
-- 
2.25.1


