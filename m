Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6A605C44
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:29:14 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSnS-0001u5-FR
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:29:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSfW-0004Xz-Q1
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olSKO-00025b-9k
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:59:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olSKM-00009Q-5t
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:59:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id bp11so33509473wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2eSGxxR+6bkaifl8xYiIr0R2wZmHSlxwW37JXX81Gn8=;
 b=Mf6gAUlEOktLi6eTxFYft8gb5GBY8J1tQvUI6l5mBrSPMgvYk/IfqcWiVLr2msrsYb
 KYajl8Rb/P4EqoNtGcbZDEmcuOb/X6VXXGCQLooCRQyUl6LsTJqgj9gAeaftIscM+4r5
 yTmlCsr7IuIbsJ9miIKAnHyxhPswwMVqpbm60zRTd1Or0FNRVRGbbzCN42h/lZW02Mip
 SkxR9OY8LGy1pVwYnMQiZX85tq2mFnKGZk4HyNhI1AP5OsVbBESYlciF0qVugen3bs7H
 /cZFwhYD00hOIZ/J/eI3amzRBfLA8hxEJKcRQ3xtTkJLf0XtXyvdNUoidlSrUrGNgmYI
 pBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2eSGxxR+6bkaifl8xYiIr0R2wZmHSlxwW37JXX81Gn8=;
 b=ZT4hVAjEPeALCMeaBcsvY2/i8LmvxOpHlZ2pQrKKIaMMBDRcG/l2eN/bVHmM1heT3M
 NeEoTTQgKJXBc1Y7+mzJ0/cPqY/koKfo4P4VCOiUztr3evzaOTNgeouqKriyNbK/CGJZ
 43H8I1aQsniCvuuavnv1iZi+el4tsdC0xtA1DpYkLyGXV00rFnRUippIogEzZ5SU0l97
 uWdIy4bXQJDJTOiwKVr3Boa4toNookaZYWj3B1y9TUYo5/2/ZqssDeM1HjSFf4rLzUFW
 BPGo6q35cAMVvu1tHPoSUEp/pt5oMpXAY+RPIGma++PmBOTLU1+DnAj8uBddjWLiH5ix
 zu8g==
X-Gm-Message-State: ACrzQf0S7vDV5u74iEMQtvAH5yXjn0rz8oCuy0xnHTYJiHQ7uYqdpxpY
 an4IVA8feG1qCDfs5vacTlDcBw==
X-Google-Smtp-Source: AMsMyM6T4dx1rbVkXOp9l/uuL9I3+3FyYwq04oRiyfip+VkNq8MugBarrj36fBJhGG70zGhx09tNyQ==
X-Received: by 2002:adf:d0c3:0:b0:22e:6ce8:f7a1 with SMTP id
 z3-20020adfd0c3000000b0022e6ce8f7a1mr7905511wrh.287.1666259936066; 
 Thu, 20 Oct 2022 02:58:56 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a05600c4a9b00b003c6b874a0dfsm2694906wmp.14.2022.10.20.02.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 02:58:55 -0700 (PDT)
Message-ID: <76141647-24f4-c57a-de12-821fb3567e90@linaro.org>
Date: Thu, 20 Oct 2022 11:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v7 1/2] hw/intc: Convert the memops to with_attrs in
 LoongArch extioi
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 f4bug@amsat.org
References: <20221020090455.2371099-1-yangxiaojuan@loongson.cn>
 <20221020090455.2371099-2-yangxiaojuan@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020090455.2371099-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/10/22 11:04, Xiaojuan Yang wrote:
> Converting the MemoryRegionOps read/write handlers to
> with_attrs in LoongArch extioi emulation.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_extioi.c      | 32 +++++++++++++++++---------------
>   hw/intc/trace-events            |  3 +--
>   target/loongarch/iocsr_helper.c | 18 ++++++++++--------
>   3 files changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
> index 22803969bc..16f2261844 100644
> --- a/hw/intc/loongarch_extioi.c
> +++ b/hw/intc/loongarch_extioi.c
> @@ -17,7 +17,6 @@
>   #include "migration/vmstate.h"
>   #include "trace.h"
>   
> -
>   static void extioi_update_irq(LoongArchExtIOI *s, int irq, int level)
>   {
>       int ipnum, cpu, found, irq_index, irq_mask;
> @@ -68,44 +67,45 @@ static void extioi_setirq(void *opaque, int irq, int level)
>       extioi_update_irq(s, irq, level);
>   }
>   
> -static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
> +static MemTxResult extioi_readw(void *opaque, hwaddr addr, uint64_t *data,
> +                                unsigned size, MemTxAttrs attrs)
>   {
>       LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>       unsigned long offset = addr & 0xffff;
> -    uint32_t index, cpu, ret = 0;
> +    uint32_t index, cpu;
>   
>       switch (offset) {
>       case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>           index = (offset - EXTIOI_NODETYPE_START) >> 2;
> -        ret = s->nodetype[index];
> +        *data = s->nodetype[index];
>           break;
>       case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>           index = (offset - EXTIOI_IPMAP_START) >> 2;
> -        ret = s->ipmap[index];
> +        *data = s->ipmap[index];
>           break;
>       case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>           index = (offset - EXTIOI_ENABLE_START) >> 2;
> -        ret = s->enable[index];
> +        *data = s->enable[index];
>           break;
>       case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>           index = (offset - EXTIOI_BOUNCE_START) >> 2;
> -        ret = s->bounce[index];
> +        *data = s->bounce[index];
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>           index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
>           cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> -        ret = s->coreisr[cpu][index];
> +        *data = s->coreisr[cpu][index];
>           break;
>       case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>           index = (offset - EXTIOI_COREMAP_START) >> 2;
> -        ret = s->coremap[index];
> +        *data = s->coremap[index];
>           break;
>       default:
>           break;
>       }
>   
> -    trace_loongarch_extioi_readw(addr, ret);
> -    return ret;
> +    trace_loongarch_extioi_readw(addr, *data);
> +    return MEMTX_OK;
>   }
>   
>   static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
> @@ -127,8 +127,9 @@ static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
>       }
>   }
>   
> -static void extioi_writew(void *opaque, hwaddr addr,
> -                          uint64_t val, unsigned size)
> +static MemTxResult extioi_writew(void *opaque, hwaddr addr,
> +                          uint64_t val, unsigned size,
> +                          MemTxAttrs attrs)
>   {
>       LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>       int i, cpu, index, old_data, irq;
> @@ -231,11 +232,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
>       default:
>           break;
>       }
> +    return MEMTX_OK;
>   }
>   
>   static const MemoryRegionOps extioi_ops = {
> -    .read = extioi_readw,
> -    .write = extioi_writew,
> +    .read_with_attrs = extioi_readw,
> +    .write_with_attrs = extioi_writew,
>       .impl.min_access_size = 4,
>       .impl.max_access_size = 4,
>       .valid.min_access_size = 4,
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 0a90c1cdec..6fbc2045e6 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -306,6 +306,5 @@ loongarch_msi_set_irq(int irq_num) "set msi irq %d"
>   
>   # loongarch_extioi.c
>   loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
> -loongarch_extioi_readw(uint64_t addr, uint32_t val) "addr: 0x%"PRIx64 "val: 0x%x"
> +loongarch_extioi_readw(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
>   loongarch_extioi_writew(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
> -

Thanks for splitting. Up to here is the first patch, for it:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Now what follows belongs to the next patch:

> diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
> index 0e9c537dc7..dd34bb54e6 100644
> --- a/target/loongarch/iocsr_helper.c
> +++ b/target/loongarch/iocsr_helper.c
> @@ -14,54 +14,56 @@
>   #include "exec/cpu_ldst.h"
>   #include "tcg/tcg-ldst.h"
>   
> +#define GET_MEMTXATTRS(cs) ((MemTxAttrs) {.requester_id = cs->cpu_index})

Note, you could move the env_cpu() call to the macro to simplify:

   #define GET_MEMTXATTRS(cas) \
     ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})

> +
>   uint64_t helper_iocsrrd_b(CPULoongArchState *env, target_ulong r_addr)
>   {
>       return address_space_ldub(&env->address_space_iocsr, r_addr,
> -                              MEMTXATTRS_UNSPECIFIED, NULL);
> +                              GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }
>   
>   uint64_t helper_iocsrrd_h(CPULoongArchState *env, target_ulong r_addr)
>   {
>       return address_space_lduw(&env->address_space_iocsr, r_addr,
> -                              MEMTXATTRS_UNSPECIFIED, NULL);
> +                              GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }
>   
>   uint64_t helper_iocsrrd_w(CPULoongArchState *env, target_ulong r_addr)
>   {
>       return address_space_ldl(&env->address_space_iocsr, r_addr,
> -                             MEMTXATTRS_UNSPECIFIED, NULL);
> +                             GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }
>   
>   uint64_t helper_iocsrrd_d(CPULoongArchState *env, target_ulong r_addr)
>   {
>       return address_space_ldq(&env->address_space_iocsr, r_addr,
> -                             MEMTXATTRS_UNSPECIFIED, NULL);
> +                             GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }
>   
>   void helper_iocsrwr_b(CPULoongArchState *env, target_ulong w_addr,
>                         target_ulong val)
>   {
>       address_space_stb(&env->address_space_iocsr, w_addr,
> -                      val, MEMTXATTRS_UNSPECIFIED, NULL);
> +                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }
>   
>   void helper_iocsrwr_h(CPULoongArchState *env, target_ulong w_addr,
>                         target_ulong val)
>   {
>       address_space_stw(&env->address_space_iocsr, w_addr,
> -                      val, MEMTXATTRS_UNSPECIFIED, NULL);
> +                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }
>   
>   void helper_iocsrwr_w(CPULoongArchState *env, target_ulong w_addr,
>                         target_ulong val)
>   {
>       address_space_stl(&env->address_space_iocsr, w_addr,
> -                      val, MEMTXATTRS_UNSPECIFIED, NULL);
> +                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }
>   
>   void helper_iocsrwr_d(CPULoongArchState *env, target_ulong w_addr,
>                         target_ulong val)
>   {
>       address_space_stq(&env->address_space_iocsr, w_addr,
> -                      val, MEMTXATTRS_UNSPECIFIED, NULL);
> +                      val, GET_MEMTXATTRS(env_cpu(env)), NULL);
>   }


