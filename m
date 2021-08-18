Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FE3EFF1D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:30:16 +0200 (CEST)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGGxi-0007Wv-Kz
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGGwa-0006UX-8C; Wed, 18 Aug 2021 04:29:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGGwY-0001p8-IV; Wed, 18 Aug 2021 04:29:03 -0400
Received: by mail-wr1-x436.google.com with SMTP id k29so2167155wrd.7;
 Wed, 18 Aug 2021 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EhRYHhZkuSmQ/7t1T5DdYukSxZipS5UhmUSBsC9VVkI=;
 b=p/tWqKODBEsPJNzcRwTEHKPB+9YR1I36lSkQglX4SSxzE/TRQyvQUKXdbsnt59iMP/
 dFiZalxBxHMDxbqij8fyJnsWeaCMh30pT9cllESm/PhB4I1QLd7T3AflooDeavwGvsvA
 dHmNSJ8On8lar6f6PTSiRG3KjJnAMbhvAzNvCYtt5Qissfji3YtuU7clylrgiBnAkt43
 nTlsT1X2VD/biKvBsT3+pU8nBPfSGtVZbj5J1HHkpVSp0Kz31t/GL+idg7P/vSiRZrrg
 XMSZKTOy4BVpLHAYyuUqZ5a+Z9PklW1f0IAwQ5wO8NiGV4md9WhKKhMol1NtEptHerbr
 eecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EhRYHhZkuSmQ/7t1T5DdYukSxZipS5UhmUSBsC9VVkI=;
 b=PogVTo4ui03QH7XJJw8wifuWEYq2eVPf2M1cL4J/wW9+zYHsx+7yNLYV0Sgnw9bpBr
 4WTtWZN3pDvC+2zLKisuGLaDqH3yqpeOjRnLH3ToMKYbQ0dZqAW+wo7vW3b+mthVb276
 1BUZ4ro5j1HjYuAVk46qs2Ynj6US4fhdBEQdeZ1H8tMRbQ7pUF8XinFZSJwYeGu/2gvo
 DaGnEM0qRZmVNCaypP80/IQZ9tRTF+CaZs28SBtBqGaOT7fa7cXxFG3zy28QjyuDqrM8
 gsZmq766GqBK4SKed4n61MTKu/3OZMXoQMa5lcmZRM1zGPcczPZwYzf+o/9RWNVCXnTm
 BDLA==
X-Gm-Message-State: AOAM532JAD+gSnnMJpzNcEENLns+C5oj48x7QwikLDHp2JWkJ3imQs3Y
 ew0xE6P1FTZ5frWCnq9P620=
X-Google-Smtp-Source: ABdhPJyhB7rX2mrvUaMvz5CnGLxiJkDEd2sjU3nnVrLUeuQrcAIhbi9VtIlreF8Bx6frrlwVhRUytQ==
X-Received: by 2002:a5d:5592:: with SMTP id i18mr8962623wrv.271.1629275340507; 
 Wed, 18 Aug 2021 01:29:00 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b10sm6185694wrn.9.2021.08.18.01.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:28:59 -0700 (PDT)
Subject: Re: [PATCH v4] hw/dma/pl330: Add memory region to replace default
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FEB5D@SHASXM03.verisilicon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e58538ee-c3a7-cd83-1893-f1394c591a0e@amsat.org>
Date: Wed, 18 Aug 2021 10:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4FA1FEB5D@SHASXM03.verisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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

On 8/18/21 4:47 AM, Wen, Jianxian wrote:
> Add configurable property memory region which can connect with IOMMU region to support SMMU translate.
> 
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> ---
> v3 -> v4 (after review of Philippe Mathieu-Daudé):
>  - Avoid adding unnecessary AS, add AS if we connect with IOMMU region.
> v2 -> v3 (after review of Philippe Mathieu-Daudé):
>  - Refine code to comply with code style, update error message if memory link is not set.
> v1 -> v2 (after review of Peter Maydell):
>  - Data access use dma_memory_read/write functions, update function AddressSpace* parameter.
> 
>  hw/dma/pl330.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 944ba29..8ae56c7 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -269,6 +269,9 @@ struct PL330State {
>      uint8_t num_faulting;
>      uint8_t periph_busy[PL330_PERIPH_NUM];
>  
> +    /* Memory region that DMA operation access */
> +    MemoryRegion *mem_mr;
> +    AddressSpace *mem_as;
>  };
>  
>  #define TYPE_PL330 "pl330"
> @@ -1108,7 +1111,7 @@ static inline const PL330InsnDesc *pl330_fetch_insn(PL330Chan *ch)
>      uint8_t opcode;
>      int i;
>  
> -    dma_memory_read(&address_space_memory, ch->pc, &opcode, 1);
> +    dma_memory_read(ch->parent->mem_as, ch->pc, &opcode, 1);
>      for (i = 0; insn_desc[i].size; i++) {
>          if ((opcode & insn_desc[i].opmask) == insn_desc[i].opcode) {
>              return &insn_desc[i];
> @@ -1122,7 +1125,7 @@ static inline void pl330_exec_insn(PL330Chan *ch, const PL330InsnDesc *insn)
>      uint8_t buf[PL330_INSN_MAXSIZE];
>  
>      assert(insn->size <= PL330_INSN_MAXSIZE);
> -    dma_memory_read(&address_space_memory, ch->pc, buf, insn->size);
> +    dma_memory_read(ch->parent->mem_as, ch->pc, buf, insn->size);
>      insn->exec(ch, buf[0], &buf[1], insn->size - 1);
>  }
>  
> @@ -1186,7 +1189,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
>      if (q != NULL && q->len <= pl330_fifo_num_free(&s->fifo)) {
>          int len = q->len - (q->addr & (q->len - 1));
>  
> -        dma_memory_read(&address_space_memory, q->addr, buf, len);
> +        dma_memory_read(s->mem_as, q->addr, buf, len);
>          trace_pl330_exec_cycle(q->addr, len);
>          if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
>              pl330_hexdump(buf, len);
> @@ -1217,7 +1220,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
>              fifo_res = pl330_fifo_get(&s->fifo, buf, len, q->tag);
>          }
>          if (fifo_res == PL330_FIFO_OK || q->z) {
> -            dma_memory_write(&address_space_memory, q->addr, buf, len);
> +            dma_memory_write(s->mem_as, q->addr, buf, len);
>              trace_pl330_exec_cycle(q->addr, len);
>              if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
>                  pl330_hexdump(buf, len);
> @@ -1562,6 +1565,13 @@ static void pl330_realize(DeviceState *dev, Error **errp)
>                            "dma", PL330_IOMEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>  
> +    if (s->mem_mr && (s->mem_mr != get_system_memory())) {
> +        s->mem_as = g_malloc0(sizeof(AddressSpace));
> +        address_space_init(s->mem_as, s->mem_mr, s->mem_mr->name);

I'm not sure about the description. Anyhow, don't access MemoryRegion
internals, use memory_region_name().

> +    } else {
> +        s->mem_as = &address_space_memory;
> +    }

A bit convoluted but I like the result.

Maybe easier to follow as:

    if (!s->mem_mr) {
        error_setg(errp, "'memory' link is not set");
        return;
    } else if (s->mem_mr == get_system_memory()) {
        /* Avoid creating new AS for system memory. */
        s->mem_as = &address_space_memory;
    } else {
        g_autofree char *desc =
              g_strdup_printf("%s-as", memory_region_name(s->mem_mr);

        s->mem_as = g_new0(AddressSpace, 1);
        address_space_init(s->mem_as, s->mem_mr, desc);
    }

'desc' is optional, I don't mind if you prefer the simpler:

        address_space_init(s->mem_as, s->mem_mr,
                           memory_region_name(s->mem_mr));

>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pl330_exec_cycle_timer, s);
>  
>      s->cfg[0] = (s->mgr_ns_at_rst ? 0x4 : 0) |
> @@ -1656,6 +1666,9 @@ static Property pl330_properties[] = {
>      DEFINE_PROP_UINT8("rd_q_dep", PL330State, rd_q_dep, 16),
>      DEFINE_PROP_UINT16("data_buffer_dep", PL330State, data_buffer_dep, 256),
>  
> +    DEFINE_PROP_LINK("memory", PL330State, mem_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> 


