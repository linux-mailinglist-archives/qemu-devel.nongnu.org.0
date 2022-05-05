Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C7551C51D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:28:31 +0200 (CEST)
Received: from localhost ([::1]:43134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeL7-0003QO-Oh
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBR-00027x-Pi; Thu, 05 May 2022 12:18:34 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBP-0005ju-RB; Thu, 05 May 2022 12:18:29 -0400
Received: by mail-ed1-x52a.google.com with SMTP id p18so5800840edr.7;
 Thu, 05 May 2022 09:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3N5ocw7wyJjyTDsryXEF2wyCqbBVbiZiu2UEGxzxkc=;
 b=d3oby60CYMPot/H08C8LeATp6tAjV0OEX4I7K8IeuARphjQ6NJPhA2kFaRrNuulI3t
 BTXg2A02Sd4x+C7D+3Ih5Z/W2zdBpBFfti5qwEwbexwNgLQgsCCjAHoRB4ugJaLvB+4J
 a0Ao9mZh5/WkFkKpRgeXvIOVmXZJzTmqhje76DomG/faepUwhr5AbKwAM86JtsUR4G6E
 UGqynHkL0BSZQVUFD4l0TSvOgkUcSocx2GY/yIrLv+0v+lzxXO0JjCxmv+zkr1dQ5SrT
 eVt5D8XoNDgviCnWCUCG+HxDvAYMMV45jWQ6gSEO7jjbXnHcGhlI/1lFbl34fAKOcOaU
 nsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T3N5ocw7wyJjyTDsryXEF2wyCqbBVbiZiu2UEGxzxkc=;
 b=bBE0vJSXW2DD0LkjFYvd0onYxL9Go684d8X7Mshp5Qavf8utsf6gmG9eJBzLqbJLoc
 K3tlZaNO1uwygBQv43+itxuCl8IZMDybdhdihGEB/KAHHd0UgHWJvSJSWRvaM/qC35hx
 ReN3dVMQZMPlIzcW1jmcNZ4ypATNDIBnAHmLAl/l7vPwdfHSK+6BnTqjZn/anQ3utXRv
 WNDPVahyQOAyWbhHD/EMLiLrMiLzxj5h4RjWmw62p/rFmj/tGe7n48S2IJnQmuDWcK0R
 DuqjFTqB2VMxK7k05LhQsbHvH44D8K16duDxCyNC1MdD8SaRtKu+6QDvzTDuNs/j5qR9
 t0OQ==
X-Gm-Message-State: AOAM5327NyWsykPYFif0nCwCgqf1b52/KY+QyTnIDb5aUWTN7Q8i/Rgl
 //KrB9nisBqqsWcKEMNAaMjrF8gFR/A=
X-Google-Smtp-Source: ABdhPJy0h8+C0scy9Y5eP95wLW/fFSPNpdii8ufdVYda1mX3y1wjO0ySPXv6jYDy0MpxLHdrKLuekA==
X-Received: by 2002:a05:6402:11cd:b0:427:bf42:44ef with SMTP id
 j13-20020a05640211cd00b00427bf4244efmr24748369edw.336.1651767505527; 
 Thu, 05 May 2022 09:18:25 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org (open list:e500)
Subject: [PATCH 07/11] hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
Date: Thu,  5 May 2022 18:18:01 +0200
Message-Id: <20220505161805.11116-8-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Commit 28290f37e20cda27574f15be9e9499493e3d0fe8 'PPC: E500: Generate
device tree on reset' improved device tree generation and made
BINARY_DEVICE_TREE_FILE obsolete.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 2bc3dce1fb..7f7f5b3452 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -47,7 +47,6 @@
 #include "hw/irq.h"
 
 #define EPAPR_MAGIC                (0x45504150)
-#define BINARY_DEVICE_TREE_FILE    "mpc8544ds.dtb"
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
 #define DTB_MAX_SIZE               (8 * MiB)
-- 
2.36.0


