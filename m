Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0846F7A49
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrR-000848-DI; Thu, 04 May 2023 21:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrP-0007zK-4x
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrN-0006t5-LD
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aad5245632so8430105ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248624; x=1685840624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=faGYL4VJj7cZEOd1ZUz2qNV6mXJyIvHtFi+9mAQJHcc=;
 b=NTOUn65pVMNpbErR0Fz9oX2kkV8uuyH8WN0NytEDn/zVjaPaM6wUZBwK8jjTNZGDYS
 mvDRo2bV12XlVtqAYxwQGyk7Lbxp/XO2sxTEPYbhChazXWM1pxNnsX2dB/Qw4hPdVprC
 QiPZME9sa6zh9s0Uba9N+UkxKoCChW0Hq1wmyQd9oYpy74QKIstL0lHpD45l47ZtkBAH
 jPg4r6focRC76zyHVfMkB55UpydoyINi2zlqzPZvM+is+dhRyANKw4xtEfqi4HdOJ7b6
 Kro0DYMw1bkNnVSe37Sd7PH3L5SOOxYlup1/8FH0UOeZcNT44vFL8KyG6ERXNK9DVYU8
 03Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248624; x=1685840624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=faGYL4VJj7cZEOd1ZUz2qNV6mXJyIvHtFi+9mAQJHcc=;
 b=Mh+sERemOqx4lMEQbiKntdjepmaGxMbgXH/4ihBi2x1jaBskPuk6aimcQy/AtLEi1L
 DmXB0EPxCoN+dN80n5y/L2BlyMyZgqJGn5cFbxCecGUcSyXgiL+hSXFrdWxJvQt22ia5
 /aAiaXt5Nd3pamnRDRqr53/XWVBOYqCa6RabybAGINBJ2j/LEHpKAUOaZpHm/yFkumUd
 Jvkd+la1ouzUUhX95ebwAs3dtBlP+Pt1lDxtGOv/O8SAxNkTTnhah1vfClgZUvlB9NBl
 PGrRD1wS5JcP+/xwKGbQlYyfmnmwNaoovEC9tkqMkVQuDQ6mMUlzZh2ToUaO+rjL58i2
 M6Pw==
X-Gm-Message-State: AC+VfDyQt5N28JUGetLJo8OJkejzDlgxgsqKhTGQ//kuMNBFx5WzeLun
 BaFz2WHgS2lPf1p5KkKpn8ajuYQKYwQRsw==
X-Google-Smtp-Source: ACHHUZ60Uv6zpz29QyTlac0W6H0fNgqa82oSHVJ9h8De7BOQatxymd1/bIe9jIXwb4JjT7PLCTVUoQ==
X-Received: by 2002:a17:902:db08:b0:1ac:3103:c555 with SMTP id
 m8-20020a170902db0800b001ac3103c555mr3919596plx.58.1683248623851; 
 Thu, 04 May 2023 18:03:43 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:43 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/89] target/riscv: fix invalid riscv,
 event-to-mhpmcounters entry
Date: Fri,  5 May 2023 11:01:20 +1000
Message-Id: <20230505010241.21812-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Conor Dooley <conor.dooley@microchip.com>

dt-validate complains:
> soc: pmu: {'riscv,event-to-mhpmcounters':
> [[1, 1, 524281], [2, 2, 524284], [65561, 65561, 524280],
> [65563, 65563, 524280], [65569, 65569, 524280], [0, 0, 0], [0, 0]],
> pmu: riscv,event-to-mhpmcounters:6: [0, 0] is too short

There are bogus 0 entries added at the end, of which one is of
insufficient length. This happens because only 15 of
fdt_event_ctr_map[]'s 20 elements are populated & qemu_fdt_setprop() is
called using the size of the array.
Reduce the array to 15 elements to make the error go away.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230404173333.35179-1-conor@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 22e2283c76..96ce2dbe49 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -35,7 +35,7 @@
  */
 void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
 {
-    uint32_t fdt_event_ctr_map[20] = {};
+    uint32_t fdt_event_ctr_map[15] = {};
     uint32_t cmask;
 
     /* All the programmable counters can map to any event */
-- 
2.40.0


