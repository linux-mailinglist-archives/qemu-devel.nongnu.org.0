Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A173E459B3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 11:57:39 +0200 (CEST)
Received: from localhost ([::1]:49734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbixm-0004mn-Is
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 05:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hbihy-00088I-Hs
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hbihx-000616-FS
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:41:18 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:33068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hbihx-0005zN-4w
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:41:17 -0400
Received: by mail-yw1-f68.google.com with SMTP id n21so840782ywh.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 02:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tnoOKx5YEaCxTRjixNQN8WLain0g/428iMlYG1AWqIc=;
 b=kaeKpxMeFIEojB9lQeyR51BX6EFYJ4sBPU9B+AWshnIrUgRChn3YbeKAbhTF06UjZM
 W74MrXzhfjiwkjnktENI+AmJycq95ZyXXjWuVmJNweFFs29E5OP2ELDEdyHSR4QBxKpj
 1GgB/Urn84uDxURiHPEGBbLFNinHXu0p6hIi6LlpphzVycsrMg3DpkpSOa6ZOoz96EbL
 ItFDrnGYhTfGwaXpujUropDtCdjawrXMgE40t0QJxsuLUd0wExfjLp26M5SMqHS0mDFF
 DwHZg1PCUJI2nVoLYXJMu+Th7qagCTCMlKz8A3GZmuUUKEbATKBgv8QM2SGMQktKDMDY
 4Kbw==
X-Gm-Message-State: APjAAAUIaVuMSIhEBUYUVjdJzJZByE5ELPcckCN2Ep2/mmSBakkYv+7H
 5qcm2woOf5ExRzFrXB0v5+SpmNk7qtbGqQ==
X-Google-Smtp-Source: APXvYqyXYTHKSguw7s+WIwzcU7inKgH1NhKOIq7G1TVFv4QUoD4s2kXzhklpPS8YcJQ0XkcciIQ8dw==
X-Received: by 2002:a0d:e60a:: with SMTP id p10mr22784386ywe.370.1560505274951; 
 Fri, 14 Jun 2019 02:41:14 -0700 (PDT)
Received: from localhost ([83.137.6.186])
 by smtp.gmail.com with ESMTPSA id s5sm690942ywe.92.2019.06.14.02.41.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 02:41:14 -0700 (PDT)
Date: Fri, 14 Jun 2019 02:41:14 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Jun 2019 02:27:47 PDT (-0700)
In-Reply-To: <d4664adffe008df43f2a0760dd4e2b9cb834b652.1558131003.git.alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-bd7fc2fb-94f7-4afa-b03c-4f8674d5ade4@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.68
Subject: Re: [Qemu-devel] [PATCH v1 3/4] disas/riscv: Fix `rdinstreth`
 constraint
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 May 2019 15:11:04 PDT (-0700), Alistair Francis wrote:
> From: Michael Clark <mjc@sifive.com>
>
> The constraint for `rdinstreth` was comparing the csr number to 0xc80,
> which is `cycleh` instead. Fix this.
>
> Author: Wladimir J. van der Laan <laanwj@gmail.com>

I'm not sure what this tag is supposed to mean.  If this is the actual author
of the patch, then shouldn't it also have a SOB?

> Signed-off-by: Michael Clark <mjc@sifive.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  disas/riscv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 3ab4586f0a..c2578a3c4b 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -614,7 +614,7 @@ static const rvc_constraint rvcc_rdtime[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc01, r
>  static const rvc_constraint rvcc_rdinstret[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc02, rvc_end };
>  static const rvc_constraint rvcc_rdcycleh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc80, rvc_end };
>  static const rvc_constraint rvcc_rdtimeh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc81, rvc_end };
> -static const rvc_constraint rvcc_rdinstreth[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc80, rvc_end };
> +static const rvc_constraint rvcc_rdinstreth[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc82, rvc_end };
>  static const rvc_constraint rvcc_frcsr[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x003, rvc_end };
>  static const rvc_constraint rvcc_frrm[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x002, rvc_end };
>  static const rvc_constraint rvcc_frflags[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x001, rvc_end };

