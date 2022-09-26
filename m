Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA45EAEE9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:59:40 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsOH-0002tf-De
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4s-0008FS-DG
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:39 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:34325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4q-0002AH-VE
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:34 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1280590722dso10212093fac.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8k8m7tTIRsONuhUtiiTz4lsaFZ+v66z/dHGJZRmH4R4=;
 b=aMUze2F0FHOTqkPdQtsBjBlE7RYQ0kPjouz3EHBrkyiZhifCSo0JRjGPEQpOq26pNd
 6PQ0kkDNwrQUc+W6dFhJ8fV2qu3S6unXQTEBxgI2/PdXS/EDfNhOPOV5mY1ZxccmSH7u
 GCmQikVVUjlsdkqTqjBrKfRh5vzpysWNKT+D9sYhBO7rlROALLueCuYoIRPcLrlthct6
 5WNlymqTgDi3jIbXwYWkEqXJtAXaWUenYQpdxF3aKWG6MOwrbUBDv/xUp1qWauvJHTO7
 hHrWn/VjPOxR0TJnqItYjGLO7apSeaxgeIfcpvu/OfaipkmUEGINLrm8bebRYOXO/w9q
 juvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8k8m7tTIRsONuhUtiiTz4lsaFZ+v66z/dHGJZRmH4R4=;
 b=KjDhTqWzuop4B58oNbe/ATUkB6zGA8NxZZ7G1sN0TZuNgFZcJgCTiESB9+K8/veseM
 lmaiOY2uclSgwqLCH/I7rbymwER0mO3dQKa5ee+7utqk9rHrrS9Yvc1glmO18/PS0zyi
 6567oHFrKaZdSnmtsK8v+JT5JzrMZf5hEtUrSzutxoiC2n9h5AFW5azGbKteu1Zv+Z83
 RAgLW9ziZynUVFkTFXslsYYw1FdTWc6JAnSGjqY7nZam6x5x2qv0+j90dlSGBwgMktbE
 aWN89cpLjcwK23XRi0UJDVw+PiC8VZ0nbRJQHJVQVgqH0MuDDbQ92cd5riBsDSqvpBA8
 sC2w==
X-Gm-Message-State: ACrzQf3uj7avZZ2ifQknW+/gZCJD9qxXuObw3mQJW9sEsbfqKOPAG1Q2
 8qA1wJxVaA10CczaU5eg/grl3kQkwyo=
X-Google-Smtp-Source: AMsMyM65ReA/+PzOglZmVv5rpPWqcofLsQS/pHR7LWoV+FUhGN3wg8FFAhbJc03ogL1+gkPXv261jw==
X-Received: by 2002:a05:6870:d299:b0:131:6b65:b010 with SMTP id
 d25-20020a056870d29900b001316b65b010mr988250oae.234.1664213971088; 
 Mon, 26 Sep 2022 10:39:31 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 14/16] hw/riscv: set machine->fdt in sifive_u_machine_init()
Date: Mon, 26 Sep 2022 14:38:53 -0300
Message-Id: <20220926173855.1159396-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for 'dumpdtb' QMP/HMP command for the sifive_u
machine.

Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/sifive_u.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4c814a3ea..b139824aab 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -634,6 +634,9 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = s->fdt;
+
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
-- 
2.37.3


