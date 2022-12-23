Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A56654BD5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 04:56:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Z8w-0005Iq-Oy; Thu, 22 Dec 2022 22:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p8Z8q-0005IY-Og; Thu, 22 Dec 2022 22:54:40 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p8Z8p-0005vZ-5Q; Thu, 22 Dec 2022 22:54:40 -0500
Received: by mail-lf1-x12a.google.com with SMTP id b3so5542177lfv.2;
 Thu, 22 Dec 2022 19:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hMgKS50buxG5u6eQHVXow7dss4+T6HHv2FK10nTZY0A=;
 b=eOqoqD0tSQJJ4lG8ej0Mkj9Wce4jDZb8th5nZLevZnjf+JTm7Vxo5caw5nbc77qjQq
 cUpdtiOiJyTgtlBQnh2cdGUDj5/xF21q+hCeXHkS2ge74K0CpGaLBNSZO0MN9+ubdTed
 1GA9ZIwH4hNjzRb5veU6a/4/QeoapnKpkNluMhye+c/Ax69dkp9pe+GhV8vcW8m3kovm
 0eWNOdhwODWfW158ll6g6He6nkBOXBJJC541YMR90GTwgazqFPyMVCVazVRE+9PgHqB1
 G240ayOXxI3M9r6i1XwtIOei7FEMeBI86FBbrb8b1ajDfcjmEQEsxlXawDBi58j3Gr3P
 bvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMgKS50buxG5u6eQHVXow7dss4+T6HHv2FK10nTZY0A=;
 b=T7dcgWyIcA3x0K1OyaZXuNEDlZFVsYwscgzAC6s/08UjLkNC4r/ZkQRtCZVWK6yBIB
 HpPktKgx/Wece1hi3gm5D+dW0VIp9FtLVWSO2LwhYPnoBwlBeFiwOIAbg7oGDILOyRF0
 IHqtzK9Tug9YH5FerBwwOBNQUJLFOMlhlpp9FgW9TBLf6eCHutcoFDAq42J7K9kqFjuO
 nnsyhRy7/K41XEVwKZWDSZ1dWNhBOR03196owq4xZCzFns5F5N98peVwlk3lzOb6LykN
 d2AuzQMn7XWU6kJ+M3Oa/8RbNcIT7jz0qkJj0qumx7EKZmgJOHUI7iwxDU/zviQgnJ0G
 rZHA==
X-Gm-Message-State: AFqh2kq36J0P2T6gLhd0ePkS7Y5nga7hTuGOEfsMV+dg99/SMXTE1igr
 TA6BwQj1qewC3AxNMWtyxKA=
X-Google-Smtp-Source: AMrXdXux76JtAihO6Es1t+bHIaJbMJB8OFP70k+rO9+3yOxHbYVQWQTIxVgcdpM+/VqUBUTlUfsCqw==
X-Received: by 2002:ac2:539c:0:b0:4b5:3e6e:382d with SMTP id
 g28-20020ac2539c000000b004b53e6e382dmr2072608lfh.29.1671767676802; 
 Thu, 22 Dec 2022 19:54:36 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 be31-20020a05651c171f00b0027a13ad14afsm248197ljb.125.2022.12.22.19.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 19:54:36 -0800 (PST)
Date: Fri, 23 Dec 2022 04:54:36 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
Subject: Re: [PATCH 5/6] hw/arm/xilinx_zynq: Remove tswap32() calls and
 constify smpboot[]
Message-ID: <Y6UmfCkKwD463kqQ@toto>
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221222215549.86872-6-philmd@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 22, 2022 at 10:55:48PM +0100, Philippe Mathieu-Daudé wrote:
> ARM CPUs fetch instructions in little-endian.
> 
> smpboot[] encoded instructions are written in little-endian.
> 
> We call tswap32() on the array. tswap32 function swap a 32-bit
> value if the target endianness doesn't match the host one.
> Otherwise it is a NOP.
> 
> * On a little-endian host, the array is stored as it. tswap32()
>   is a NOP, and the vCPU fetches the instructions as it, in
>   little-endian.
> 
> * On a big-endian host, the array is stored as it. tswap32()
>   swap the instructions to little-endian, and the vCPU fetches
>   the instructions as it, in little-endian.
> 
> Using tswap() on system emulation is a bit odd: while the target
> particularities might change the system emulation, the host ones
> (such its endianness) shouldn't interfere.
> 
> We can simplify by using const_le32() to always store the
> instructions in the array in little-endian, removing the need
> for the dubious tswap().


Hi Philippe,


> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 3190cc0b8d..4316143b71 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -71,6 +71,11 @@ static const int dma_irqs[8] = {
>  
>  #define ZYNQ_SDHCI_CAPABILITIES 0x69ec0080  /* Datasheet: UG585 (v1.12.1) */
>  
> +struct ZynqMachineState {
> +    MachineState parent;
> +    Clock *ps_clk;
> +};
> +
>  #define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
>                          extract32((x), 12,  4) << 16)
>  
> @@ -79,29 +84,21 @@ static const int dma_irqs[8] = {
>   */
>  
>  #define SLCR_WRITE(addr, val) \
> -    0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16)), /* movw r1 ... */ \
> -    0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
> -    0xe5801000 + (addr)
> -
> -struct ZynqMachineState {
> -    MachineState parent;
> -    Clock *ps_clk;
> -};
> +    cpu_to_le32(0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16))), /* movw r1 ... */ \
> +    cpu_to_le32(0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16))), /* movt r1 ... */ \

Looks like the callers all pass in constants, perhaps const_le32 should be used everywhere or am I missing something?


> +    const_le32(0xe5801000 + (addr))
>  
>  static void zynq_write_board_setup(ARMCPU *cpu,
>                                     const struct arm_boot_info *info)
>  {
> -    int n;
> -    uint32_t board_setup_blob[] = {
> -        0xe3a004f8, /* mov r0, #0xf8000000 */
> +    const uint32_t board_setup_blob[] = {
> +        const_le32(0xe3a004f8),         /* mov r0, #0xf8000000 */
>          SLCR_WRITE(SLCR_UNLOCK_OFFSET, SLCR_XILINX_UNLOCK_KEY),
>          SLCR_WRITE(SLCR_ARM_PLL_OFFSET, 0x00014008),
>          SLCR_WRITE(SLCR_LOCK_OFFSET, SLCR_XILINX_LOCK_KEY),
> -        0xe12fff1e, /* bx lr */
> +        const_le32(0xe12fff1e)          /* bx lr */
>      };
> -    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
> -        board_setup_blob[n] = tswap32(board_setup_blob[n]);
> -    }
> +
>      rom_add_blob_fixed("board-setup", board_setup_blob,
>                         sizeof(board_setup_blob), BOARD_SETUP_ADDR);
>  }
> -- 
> 2.38.1
> 

