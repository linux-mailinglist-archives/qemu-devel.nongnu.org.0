Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096B3ED0F2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:21:08 +0200 (CEST)
Received: from localhost ([::1]:54448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFYnr-0003w5-4A
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFYmL-0002yy-LX; Mon, 16 Aug 2021 05:19:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFYmJ-0005WU-OB; Mon, 16 Aug 2021 05:19:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u16so5426214wrn.5;
 Mon, 16 Aug 2021 02:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=88UwPYwv7O+LMTGkC3QaSox+4Qe9iCz1Lh3YkyPWRpM=;
 b=lx8Pahma/T/W6xzS4C1/x79wWpsPMLxSDw4kQUDADd7NDmNkXFJSR9svGjaHmhTumB
 AeVYQLVj5rcBO7IqRFPrBiO9MLENnRM5Yche/KwCD1BJh35CUQzpGKxyJ5p7P6GkUNOz
 0QzGVpw5r+nFGv3IWoOwImvFBow+FxGI0rbl3HQw4/b/K8IV2HQooCKOiPQG1ODu9m4R
 R9u6pIWbyC8gttktq3GMHnLOPVcnPBFJDzihtV2SG5OLOsdQZj/qTvaK8sohATsNxSFY
 22mqMBiEKtA87jCpJsgppRhO150OmjUvQShyoCbmd5ZOyeJmmFDJHglZpnZTzRsHUcCC
 RwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=88UwPYwv7O+LMTGkC3QaSox+4Qe9iCz1Lh3YkyPWRpM=;
 b=LriwaAXLvROYk4Y4kvWzWVMMhtzkdJiC0AcjYmkGm12QFEQWRl8+QWjiF2cf97u2iI
 5wVVWjMFnclqnoKOc7V3NH0UuUbpDJF5qIxPOACFXbUxp0inYtwMzbHKhx16yG0JcR3B
 t8bahUNh9TkiHNieJSYN7S44EALPSfUSfNtUgtM0Prazsjqw7diYEYJmulolJpi5S9yN
 npznYaSXtdAAosvIxGkOQcvN7/rM7Lcs3zRe+9Cj39b/068XLJOF4uR99bTTBb5lb3vd
 s3o+hz4c2YZHukXiplTd6JcQwqG8JqF4+0UZSSmONMnvPvQ2d1R4mogCdNyBM1zUQxhh
 O9Ig==
X-Gm-Message-State: AOAM533eBdZjdtqQxe8o6An1+G4QyDHQRHwhTiQO9ZHRm7M9hwW19PdU
 qeT/yRcj1yDQ8RUh7QQOIOQ=
X-Google-Smtp-Source: ABdhPJzehex7tshGbFbm12/pUoUi8/iLzjs+Dr44yDU5D8trlSEcMopw/20rEtvhVwg9WM4wveAxbg==
X-Received: by 2002:adf:ba4d:: with SMTP id t13mr17116321wrg.424.1629105569899; 
 Mon, 16 Aug 2021 02:19:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b201sm5484030wmb.6.2021.08.16.02.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 02:19:29 -0700 (PDT)
Subject: Re: [PATCH v2] hw/dma/pl330: Add memory region to replace default
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FC85F@SHASXM03.verisilicon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3425c177-6425-0e71-b3d6-2a2198b117e6@amsat.org>
Date: Mon, 16 Aug 2021 11:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4FA1FC85F@SHASXM03.verisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jianxian,

On 8/16/21 8:46 AM, Wen, Jianxian wrote:
> L330 needs a memory region which can connect with SMMU IOMMU region to support SMMU translate.
> 
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> ---
> Changes v1 -> v2 (after review of Peter Maydell):
>  - Use the dma_memory_read/dma_memory_write functions, update function AddressSpace* parameter.
> 
>  hw/arm/exynos4210.c  |  3 +++
>  hw/arm/xilinx_zynq.c |  2 ++
>  hw/dma/pl330.c       | 20 ++++++++++++++++----
>  3 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 5c7a51b..af0e482 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -171,8 +171,11 @@ static DeviceState *pl330_create(uint32_t base, qemu_or_irq *orgate,
>      SysBusDevice *busdev;
>      DeviceState *dev;
>      int i;
> +    MemoryRegion *sysmem = get_system_memory();
>  
>      dev = qdev_new("pl330");
> +    object_property_set_link(OBJECT(dev), "memory",
> +                                    OBJECT(sysmem), &error_fatal);

Incorrect style alignment. Maybe simply:

       object_property_set_link(OBJECT(dev), "memory",
                                OBJECT(get_system_memory()),
                                &error_fatal);

>      qdev_prop_set_uint8(dev, "num_events", nevents);
>      qdev_prop_set_uint8(dev, "num_chnls",  8);
>      qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 245af81..e0b3a73 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -312,6 +312,8 @@ static void zynq_init(MachineState *machine)
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
>  
>      dev = qdev_new("pl330");
> +    object_property_set_link(OBJECT(dev), "memory",
> +                                    OBJECT(address_space_mem), &error_fatal);

Incorrect style alignment.

>      qdev_prop_set_uint8(dev, "num_chnls",  8);
>      qdev_prop_set_uint8(dev, "num_periph_req",  4);
>      qdev_prop_set_uint8(dev, "num_events",  16);
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 944ba29..b8a4448 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -269,6 +269,9 @@ struct PL330State {
>      uint8_t num_faulting;
>      uint8_t periph_busy[PL330_PERIPH_NUM];
>  
> +    /* Memory region that DMA operation access */
> +    MemoryRegion *mem_mr;
> +    AddressSpace mem_as;
>  };
>  
>  #define TYPE_PL330 "pl330"
> @@ -1108,7 +1111,7 @@ static inline const PL330InsnDesc *pl330_fetch_insn(PL330Chan *ch)
>      uint8_t opcode;
>      int i;
>  
> -    dma_memory_read(&address_space_memory, ch->pc, &opcode, 1);
> +    dma_memory_read(&ch->parent->mem_as, ch->pc, &opcode, 1);
>      for (i = 0; insn_desc[i].size; i++) {
>          if ((opcode & insn_desc[i].opmask) == insn_desc[i].opcode) {
>              return &insn_desc[i];
> @@ -1122,7 +1125,7 @@ static inline void pl330_exec_insn(PL330Chan *ch, const PL330InsnDesc *insn)
>      uint8_t buf[PL330_INSN_MAXSIZE];
>  
>      assert(insn->size <= PL330_INSN_MAXSIZE);
> -    dma_memory_read(&address_space_memory, ch->pc, buf, insn->size);
> +    dma_memory_read(&ch->parent->mem_as, ch->pc, buf, insn->size);
>      insn->exec(ch, buf[0], &buf[1], insn->size - 1);
>  }
>  
> @@ -1186,7 +1189,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
>      if (q != NULL && q->len <= pl330_fifo_num_free(&s->fifo)) {
>          int len = q->len - (q->addr & (q->len - 1));
>  
> -        dma_memory_read(&address_space_memory, q->addr, buf, len);
> +        dma_memory_read(&s->mem_as, q->addr, buf, len);
>          trace_pl330_exec_cycle(q->addr, len);
>          if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
>              pl330_hexdump(buf, len);
> @@ -1217,7 +1220,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
>              fifo_res = pl330_fifo_get(&s->fifo, buf, len, q->tag);
>          }
>          if (fifo_res == PL330_FIFO_OK || q->z) {
> -            dma_memory_write(&address_space_memory, q->addr, buf, len);
> +            dma_memory_write(&s->mem_as, q->addr, buf, len);
>              trace_pl330_exec_cycle(q->addr, len);
>              if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
>                  pl330_hexdump(buf, len);
> @@ -1562,6 +1565,12 @@ static void pl330_realize(DeviceState *dev, Error **errp)
>                            "dma", PL330_IOMEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>  
> +    if (!s->mem_mr) {
> +        error_setg(errp, "'mem_mr' link is not set");

You use DEFINE_PROP_LINK("memory", ...) below, so use 'memory' in
the error message.

> +        return;
> +    }
> +    address_space_init(&s->mem_as, s->mem_mr, TYPE_PL330 "-memory");

I'd rather not name an address space with '-memory' suffix (I'd expect
a MemoryRegion instead). The last argument is just a description in the
monitor (info mtree *).

>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pl330_exec_cycle_timer, s);
>  
>      s->cfg[0] = (s->mgr_ns_at_rst ? 0x4 : 0) |
> @@ -1656,6 +1665,9 @@ static Property pl330_properties[] = {
>      DEFINE_PROP_UINT8("rd_q_dep", PL330State, rd_q_dep, 16),
>      DEFINE_PROP_UINT16("data_buffer_dep", PL330State, data_buffer_dep, 256),
>  
> +    DEFINE_PROP_LINK("memory", PL330State, mem_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };

