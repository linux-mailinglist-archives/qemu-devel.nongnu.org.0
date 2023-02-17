Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA0E69B212
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4vY-0005CU-GG; Fri, 17 Feb 2023 12:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vW-0005BB-I8
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:42 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vU-0000uj-Sg
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:42 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 q14-20020a17090a430e00b00233d7314c1cso2146409pjg.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lx0M+hYFCHNKkG1Lj780I7YKmL/EVcbXsrThtaMCRAY=;
 b=0IAKTl7IOZDcQBpyC+XtwdOvgNyH0cRsksfIHNjGoiOMiLuO7na9vmfg2Qw0T21qej
 Z0uA9iaCSZtdh00tY9UB3f0wgHFTO2qqF+vOg47Y0pFVdE0k6ygmyxHw9zMcXpyUgkLR
 Za6j+49wqolcPQQOAbc3lfZzsmYi+XgRp36arQUtD8HT1cBFq8Hn3PCT8k7b+VmeYz2K
 GVr6mJP0MGT1fTdgLW3l5o+BKFLZN0cdZ8XHs/ebQ+LsjVx6uwj+bdhim2l8rOCg6qE0
 Nll2Oh+XZi/xlAK2ihurYmRnp976C4kOrCikDp4Nf5YJdKmC1rnU5fGTuIuI+Wsdp0bF
 UFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lx0M+hYFCHNKkG1Lj780I7YKmL/EVcbXsrThtaMCRAY=;
 b=HIIOkP1TP1Zc7bdyR67YweP+ExC4xq2CrwxZ3B0LQ1vU5CcyrNsWnUHsoTVh4umY9p
 SyRL79zmz8lpjpx4tGTtZAMThqJ0+E/TaJ4DYSyyuHb9O5AFKQsbQH0Y+i0y4X+yXqwW
 4VCs4d8NXCoiX+IXWNFRWwfwK/IsNy3Ikq/Syu7lq4NZlfX4q1Ntzopj9+tuwt0HyUf+
 BruFAuJ+SiMylGKZxZZ7yX8Co5EaYUMkdY0D1zaMYPLhey6rMZ2++viY2CWK5fzHt8aN
 xXnbIwPKeFe+g2QAwq4aES/Ca+5QXFAMMgifIjfIPp04piegaw5Df1RfV8awSc/oY4Io
 zfPg==
X-Gm-Message-State: AO0yUKUfNaOGPoQkkGzjdAAaw5k9rF5ujv6vUkMWDfsJMSlSDu3IT5Kl
 NLmOb/vrW3eGDaYbN2Y1noThMQ==
X-Google-Smtp-Source: AK7set9sE7ST4pvAvj18OxHgEkHYxP03G9nfBG8KifcsLBXY23qXJF+kExlZF9l8MDn78pDoqHEVxg==
X-Received: by 2002:a17:902:fad0:b0:199:190c:3c15 with SMTP id
 ld16-20020a170902fad000b00199190c3c15mr1111746plb.49.1676656419672; 
 Fri, 17 Feb 2023 09:53:39 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 y9-20020a170902ed4900b0019a256bfe96sm3404335plb.242.2023.02.17.09.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:39 -0800 (PST)
Subject: [PULL 6/9] MAINTAINERS: Add some RISC-V reviewers
Date: Fri, 17 Feb 2023 09:52:00 -0800
Message-Id: <20230217175203.19510-7-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

This patch adds some active RISC-V members as reviewers to the
MAINTAINERS file.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..847bc7f131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -287,6 +287,9 @@ RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <alistair.francis@wdc.com>
 M: Bin Meng <bin.meng@windriver.com>
+R: Weiwei Li <liweiwei@iscas.ac.cn>
+R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
-- 
2.39.0


