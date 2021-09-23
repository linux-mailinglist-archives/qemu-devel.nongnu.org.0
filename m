Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D34415C18
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:39:47 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM8o-0001m6-Pm
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mTLzu-0005Z2-Oo; Thu, 23 Sep 2021 06:30:35 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mTLzt-0005Ar-8h; Thu, 23 Sep 2021 06:30:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id dw14so4148290pjb.1;
 Thu, 23 Sep 2021 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0LVBfFctC45wGutn9FkRommMJ/f7Xgr3xw2hOA3/6Q=;
 b=np85ghUSqcHZhKsWgew8WL/cX+8IBDOxUtdLBEZvkat68QFrOYoL2AfDp2hKv+pZw2
 UQsQ/5Xn19rR7St3LzJAnGGtvYZDznRyVGjrkhk0dSjuSjqJx34FMwg/Jh4nfg0ztqD9
 IvSQp+/QSwIxDF1Qc05YuUd+1urNKkC1Du6dwU3jpavLHIrvvZq4hBnoQBYBmcjkfJlP
 qWyPJ5IVNVK/6pYFFqtXSQgXgZwI0HFVMQNaAZJhib1G1pW95ais65RIkvn0P9zG3Umw
 NuEZd3wSIqGyfo3JAl23Q896+IPNgikAJP8hEPa9+BT3GMX1cyvHIVD2m3doKYPihInt
 X+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0LVBfFctC45wGutn9FkRommMJ/f7Xgr3xw2hOA3/6Q=;
 b=1SjEd9EifuQyXXi+9iBhwOMOvCzqHjlYlzZnDH1cdFCoN0DoLxYJfhSYeXidz+P8TF
 /jg27cHaRUdA7e+V4JOGy9zXRJoLfyHZdVEaIwBnSQt9C0Jo++qzF2e5Tyx9vImm6NAV
 yOeyxS2ZjXpVScYE0STcgnLXCIgMHwRd+64TEoga4r0A84hbiAdYezWwNNzn9mZ55ey0
 VWW3LB7ad9HIMPbxFCE/YACdt1iVaZtJ2B+Eh/m0+8JlsBf+210rMaVAB2D2pLQuzmih
 G/OqF/e5AmqIhTZTDQA8trxKEUZQNWqDgD/tCu7F9WGmvihjU2IMwUkFqPa7wFm3jwWS
 lcKA==
X-Gm-Message-State: AOAM5300yP5H6Shkb3KlttajxeLaRq1NzwCpVIDEaiweP8KDOH7+i6RC
 mfvefrRXMkMgY7Z6uTALlnQ=
X-Google-Smtp-Source: ABdhPJyEKDM8koYk7LRv0bknHW99vAB8C9HmdE5ddGWuMCu8fzihkoWwgvedwMftoW5Qxwz0shyNvQ==
X-Received: by 2002:a17:902:b68b:b0:13a:1239:b8d9 with SMTP id
 c11-20020a170902b68b00b0013a1239b8d9mr3245949pls.25.1632393031318; 
 Thu, 23 Sep 2021 03:30:31 -0700 (PDT)
Received: from lb01399.pb.local ([2405:201:5506:80a4:42e:ff20:b88b:632e])
 by smtp.gmail.com with ESMTPSA id p52sm5208050pfw.132.2021.09.23.03.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 03:30:30 -0700 (PDT)
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
To: xiaoguangrong.eric@gmail.com, pankaj.gupta.linux@gmail.com,
 lvivier@redhat.com, stefanha@redhat.com, pankaj.gupta@ionos.com
Subject: [PATCH v2] docs/nvdimm: Update nvdimm option value in machine example
Date: Thu, 23 Sep 2021 12:30:15 +0200
Message-Id: <20210923103015.135262-1-pankaj.gupta.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update nvdimm option value in example command from "-machine pc,nvdimm"
to "-machine pc,nvdimm=on" as former complains with the below error:

"qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
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


