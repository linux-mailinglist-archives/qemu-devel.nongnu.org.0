Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2752F931D
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 15:56:32 +0100 (CET)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19Tj-00065q-U4
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 09:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RE-0004Nx-Sh; Sun, 17 Jan 2021 09:53:56 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RC-00040e-7D; Sun, 17 Jan 2021 09:53:56 -0500
Received: by mail-pf1-x42e.google.com with SMTP id b3so8669587pft.3;
 Sun, 17 Jan 2021 06:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RxdKtO/FiMxWvfgiYYveWU7zuT36I4thGWqj5spF5yg=;
 b=iwE64ANQ4rHSvcH4cl/gfvZHG1FOS2wbR+16/MKdz6zz/IlRPzPMqYqecFUrQTYR1n
 6xk7IVTZIt5fDfn5yIoL1VGJCp9zqKHN9OBjf9/KZrvE45CB+C9fF4QPZmgt9Om8BCEh
 OtmUPCUga5I3qhM1XKMkGzFC/Brjvr7c6k/CtzaPoi5AKstGVytN/LKxjrglwgxt9Yjc
 10/YVzdpTz//8kTT5h/t6LxMklOW3A6zSTY6wjVTTWc4C7/gnuwP7sqWtzzfgg0wwvG1
 HOgPlWsjIST7cfGq5RgNzbn6JeDzOTnve3gV9Duap/jszzDO+o2ezQws502eexeHl3Va
 UMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RxdKtO/FiMxWvfgiYYveWU7zuT36I4thGWqj5spF5yg=;
 b=bEMma+Mx+yC66xUlYrqQmmQHBuNoy4vY5MNhfzN03cAPMj4yTsx88z3E24/2qX/SRw
 zQ0CrPYP6lFavSrgmI1EfI/xJE0L/w2oC9zUVrqiX330Tt7WMeZvtzBPBuKMilCXtrDe
 2M7ePOwfCHXaR+IhEhGE+EM1doy50h1c34ZFowlm+tqBfWEYnVknU2f5Y01AlBa3Ie/r
 wtnQagMnKFgXglJOVgYgqwcxl7+U+ufdVfCVTewCNKD+P6AASi4e6aDPMdvwLFaXmPKU
 h5YRtFpQQfuQswKOtdKm9AHq9qXSwTBpNX0BWnQukQ5LtXD0rfgCsPw1PY49rTSye67n
 vAXA==
X-Gm-Message-State: AOAM530j/ixKeD49lRkyPRodykTFWQl7SMug7ZkHpohv/E94EZOv5Kro
 urL4zHQ/3GNXIHzOHOwz+kFsQwv2Va2sxw==
X-Google-Smtp-Source: ABdhPJw6jnsd985Kan/DovP6vTL0xXtp3VdAYjUcGwMFLBYbGg4LzstHb1MBhYHsu2qK9edRUsZmaw==
X-Received: by 2002:aa7:84d5:0:b029:19d:da20:73fe with SMTP id
 x21-20020aa784d50000b029019dda2073femr21894055pfn.16.1610895232434; 
 Sun, 17 Jan 2021 06:53:52 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:53:52 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 01/11] hw/block/nvme: remove unused argument in
 nvme_ns_init_zoned
Date: Sun, 17 Jan 2021 23:53:31 +0900
Message-Id: <20210117145341.23310-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42e.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_ns_init_zoned() has no use for given NvmeCtrl object.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 274eaf61b721..32662230130b 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -204,7 +204,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     }
 }
 
-static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
+static void nvme_ns_init_zoned(NvmeNamespace *ns, int lba_index)
 {
     NvmeIdNsZoned *id_ns_z;
 
@@ -321,7 +321,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         if (nvme_ns_zoned_check_calc_geometry(ns, errp) != 0) {
             return -1;
         }
-        nvme_ns_init_zoned(n, ns, 0);
+        nvme_ns_init_zoned(ns, 0);
     }
 
     if (nvme_register_namespace(n, ns, errp)) {
-- 
2.17.1


