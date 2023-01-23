Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF53678DB8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 02:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8S5-00067d-9n; Mon, 23 Jan 2023 20:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mr.bossman075@gmail.com>)
 id 1pK55S-0001he-Ck
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 17:14:46 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mr.bossman075@gmail.com>)
 id 1pK55P-0000it-O3
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 17:14:46 -0500
Received: by mail-qt1-x82b.google.com with SMTP id g16so9543900qtu.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 14:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:reply-to:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ea4CQWauu0D4jmEu5atMkYUmuu8BPCmG7UTcpSGdauI=;
 b=EJK0HJ4M0GPu0Lyjis2d+EyKY0wpF04ukXWk5kPB3+7ZVDHvi+TXI4lkV/K+ej3n9F
 1Y0v3qgc19o+HRxcoOFkzPx+rOAiyhtYqcsnhQBKnqiptrliyG8gQ7eylNgIrZTAAwt1
 5SvsXv0p+t/VbRB0THPR5wZXzaiHGr+rc1Z0Q9XQEqmMw7UgW0Z1FYYil4aVBIlnVQTm
 12JFvUESG18Vhk+RqMbgQzdmODuAEou2M6FP7QRwUFCLaM61X0NCLbypPBnVZ4kbAy8+
 kQybAariUHPFnB/kQC0rZUznuDmk8zdtJSPrHFzgPICpdBRd6uPUUxPxbgq8QGiIQrjQ
 noRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:reply-to:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ea4CQWauu0D4jmEu5atMkYUmuu8BPCmG7UTcpSGdauI=;
 b=Ee3lqa4t1CgAXmRZHNv8ecBnbLeg2Po1Fvk23oDjP8mHSWmIGtqgVKbT0IFKcXTmSy
 UaiVYK47mwVGGn7NP7VmlepRbqOFqH0EqD1JPqfhJ9XuCxvj3NESRFKbGN1qdFbslyvo
 Vs+nQ4C0MagI73qPpVnq8HK1iKtXmy8D4SqBjlEhNkajfDPx/Oj2+obg7r7GnIHd3KzT
 tB4Wh0vvpM5Y8dXf0+yVf25uQMaosjf3rqm5Cw32DBp3B5ROroklmie0wIGY/hhHs5LW
 /opWRKdweOSy8qrQaS9k6Ghus248etw8JN00hayM9MZsV/s9PlOZvxPeIexidPqOEJq7
 KZZg==
X-Gm-Message-State: AFqh2kqLP7kJo5gInFfICJQpTAPYUfEF5E8OAY03q06teEsioaYH6/2o
 rBrcCgxRqjsA4fBV1iF3oVI=
X-Google-Smtp-Source: AMrXdXsG4Irhdd7SIGxl2AS82OEfxJa90yTsONNfEnOksO6nSXhj9ecJbsk1c60fn8BJLgAKmCG3OQ==
X-Received: by 2002:a05:622a:6005:b0:3ab:d187:9e7 with SMTP id
 he5-20020a05622a600500b003abd18709e7mr38043336qtb.44.1674512082256; 
 Mon, 23 Jan 2023 14:14:42 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net.
 [108.26.182.112]) by smtp.gmail.com with ESMTPSA id
 g18-20020ac87752000000b003b7ea583c7csm74745qtu.58.2023.01.23.14.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 14:14:41 -0800 (PST)
Message-ID: <56b3f55d-9178-984b-6ef4-af7309b008d4@gmail.com>
Date: Mon, 23 Jan 2023 17:14:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
From: Jesse Taube <mr.bossman075@gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=mr.bossman075@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 23 Jan 2023 20:50:19 -0500
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
Reply-To: 20230123035754.75553-1-alistair.francis@opensource.wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 > From: Alistair Francis <alistair.francis@wdc.com>
 >
 > If the CSRs and CSR instructions are disabled because the Zicsr
 > extension isn't enabled then we want to make sure we don't run any CSR
 > instructions in the boot ROM.
 >
 > This patches removes the CSR instructions from the reset-vec if the
 > extension isn't enabled. We replace the instruction with a NOP instead.
 >
 > Note that we don't do this for the SiFive U machine, as we are modelling
 > the hardware in that case.
 >
 > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
 > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 > ---
 >  hw/riscv/boot.c | 9 +++++++++
 >  1 file changed, 9 insertions(+)
 >
 > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
 > index 2594276223..cb27798a25 100644
 > --- a/hw/riscv/boot.c
 > +++ b/hw/riscv/boot.c
 > @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState 
*machine,
 > RISCVHartArrayState *harts
 >          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
 >      }
 >
 > +    if (!harts->harts[0].cfg.ext_icsr) {
 > +        /*
 > +         * The Zicsr extension has been disabled, so let's ensure we 
don't
 > +         * run the CSR instruction. Let's fill the address with a non
 > +         * compressed nop.
 > +         */
 > +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
		reset_vec[2] = 0x00000513; /*     li   a0, 0 */
Shouldn't it be li as a0 should contain the cpu number. The regs are
initialized with 0 so its not necessary but nice to be explicit.

Thanks,
Jesse T
 > +    }
 > +
 >      /* copy in the reset vector in little_endian byte order */
 >      for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
 >          reset_vec[i] = cpu_to_le32(reset_vec[i]);
 > --
 > 2.39.0

