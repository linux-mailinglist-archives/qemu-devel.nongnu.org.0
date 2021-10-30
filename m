Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E0B440971
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 16:13:26 +0200 (CEST)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgp6q-0000S6-NM
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 10:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgp4q-00082i-KY
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 10:11:20 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:47069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgp4o-0001V1-2l
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 10:11:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2652807wmb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A0wAxcXIChXJp5+N/JAgvoOd7yFS0CcDvJkEm0LlkXg=;
 b=A5tQs6OojHuWndBrT/8tC1bLmoRKrQIy3+7JFCGnX3mpZEbkYd9T8mGfs2j9bjKIzr
 q+O/+/OKTUf3yTESZeHVbm8f0y6AMJmE7/WkdGt2xNuDbEEDwo3AoCdfW4FRLuAkEpyh
 DnaKHuWP2utPk6vx+E90QzhvZBS0iYT5lz1VluLX8HG7cWklH/PQiUvXNzD1S8K3ogHg
 /IZ2W4++h3LaCOpMrCEh3QMlj9TdYQaoNNw1YLe5qN4HHDlbUkCtlaQDEBZVN8k3uUEU
 JTdrWiUdzGIpeNM5B2OG67Jct4UMNl7qIFB03KGGGQl+ZHQ6E7eYFjm9QIuwSuyHSc8a
 7MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A0wAxcXIChXJp5+N/JAgvoOd7yFS0CcDvJkEm0LlkXg=;
 b=hOsdmwN0PEiNVeaq20EQ1MoOQPLPI6dyURxTcN9wwgjcr1wAkXZKWlgi9U80tJbB7e
 /lp2SCRUOIdCqSU3pd5L9UbSw8oU7PRoW3vvS4udP4NO2COjZl9qAD3+KkJ+6vFZaFbt
 Yzcpg9jD763dwF6pk82jLVMtVcUsNk+3sYZA9mw20OcWv9PpB6fSbPHRUUPABZIea5DE
 X8cDOYdrg/w3uBvm8sKvJC1nJzBRYQLN+niv2AacpxvFDIA/vosQuBRWsN945ZVdnEZO
 vl7HPTM3MBRjNMlh3Kp0wgCxYNTaUC+fKNL49WuAw2Naw1SIgu7jsqgmRrymHH0TWOLr
 iEUQ==
X-Gm-Message-State: AOAM532WyAfdoyVeTEZX9uJjAl9UWLJ/yJP9GbAeA3UJXSedRKjcARHe
 LMQa7H8ESsR5lzfK+5staQo=
X-Google-Smtp-Source: ABdhPJwKxhQ2YsWUCV7pZZlZ5UBqOYnAizSKmQdg4TCbOCgrUfReTWNU/25bbXRgVjZmh5DerdA5qA==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr27063006wmb.101.1635603074615; 
 Sat, 30 Oct 2021 07:11:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h16sm1223518wrm.27.2021.10.30.07.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 07:11:13 -0700 (PDT)
Message-ID: <e4639a3e-fe0a-7732-4c33-65b94626d087@amsat.org>
Date: Sat, 30 Oct 2021 16:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 07/30] hw/sh4: Change debug printfs to traces
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <b776043e811ab3caf200515e1350bdcccd1cc47b.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <b776043e811ab3caf200515e1350bdcccd1cc47b.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/char/sh_serial.c   | 13 ++-----
>  hw/char/trace-events  |  4 +++
>  hw/intc/sh_intc.c     | 79 +++++++++++--------------------------------
>  hw/intc/trace-events  |  8 +++++
>  hw/sh4/sh7750.c       |  8 ++---
>  hw/sh4/trace-events   |  3 ++
>  hw/sh4/trace.h        |  1 +
>  hw/timer/sh_timer.c   | 22 +++---------
>  hw/timer/trace-events |  5 +++
>  meson.build           |  1 +
>  10 files changed, 52 insertions(+), 92 deletions(-)
>  create mode 100644 hw/sh4/trace-events
>  create mode 100644 hw/sh4/trace.h

> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
> index eddad7c195..cd4e07dcba 100644
> --- a/hw/intc/sh_intc.c
> +++ b/hw/intc/sh_intc.c
> @@ -9,13 +9,12 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "cpu.h"
>  #include "hw/sh4/sh_intc.h"
>  #include "hw/irq.h"
>  #include "hw/sh4/sh.h"
> -
> -//#define DEBUG_INTC
> -//#define DEBUG_INTC_SOURCES
> +#include "trace.h"
>  
>  #define INTC_A7(x) ((x) & 0x1fffffff)
>  
> @@ -57,20 +56,14 @@ void sh_intc_toggle_source(struct intc_source *source,
>          }
>      }
>  
> -  if (enable_changed || assert_adj || pending_changed) {
> -#ifdef DEBUG_INTC_SOURCES
> -            printf("sh_intc: (%d/%d/%d/%d) interrupt source 0x%x %s%s%s\n",
> -                   source->parent->pending,
> -                   source->asserted,
> -                   source->enable_count,
> -                   source->enable_max,
> -                   source->vect,
> -                   source->asserted ? "asserted " :
> -                   assert_adj ? "deasserted" : "",
> -                   enable_changed == 1 ? "enabled " :
> -                   enable_changed == -1 ? "disabled " : "",
> -                   source->pending ? "pending" : "");
> -#endif
> +    if (enable_changed || assert_adj || pending_changed) {
> +        trace_sh_intc_sources(source->parent->pending, source->asserted,
> +                              source->enable_count, source->enable_max,
> +                              source->vect, source->asserted ? "asserted " :
> +                              assert_adj ? "deasserted" : "",
> +                              enable_changed == 1 ? "enabled " :
> +                              enable_changed == -1 ? "disabled " : "",
> +                              source->pending ? "pending" : "");
>      }
>  }
>  
> @@ -101,10 +94,7 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
>          struct intc_source *source = desc->sources + i;
>  
>          if (source->pending) {
> -#ifdef DEBUG_INTC_SOURCES
> -            printf("sh_intc: (%d) returning interrupt source 0x%x\n",
> -                   desc->pending, source->vect);
> -#endif
> +            trace_sh_intc_pending(desc->pending, source->vect);
>              return source->vect;
>          }
>      }
> @@ -199,30 +189,22 @@ static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
>          return;
>      }
>      if (!source->next_enum_id && (!source->enable_max || !source->vect)) {
> -#ifdef DEBUG_INTC_SOURCES
> -        printf("sh_intc: reserved interrupt source %d modified\n", id);
> -#endif
> +        qemu_log_mask(LOG_UNIMP,
> +                      "sh_intc: reserved interrupt source %d modified\n", id);
>          return;
>      }
>  
>      if (source->vect) {
>          sh_intc_toggle_source(source, enable ? 1 : -1, 0);
>      }
> -#ifdef DEBUG_INTC
> -    else {
> -        printf("setting interrupt group %d to %d\n", id, !!enable);
> -    }
> -#endif
>  
>      if ((is_group || !source->vect) && source->next_enum_id) {
>          sh_intc_toggle_mask(desc, source->next_enum_id, enable, 1);
>      }
>  
> -#ifdef DEBUG_INTC
>      if (!source->vect) {
> -        printf("setting interrupt group %d to %d - done\n", id, !!enable);
> +        trace_sh_intc_set(id, !!enable);
>      }
> -#endif
>  }
>  
>  static uint64_t sh_intc_read(void *opaque, hwaddr offset,
> @@ -235,12 +217,9 @@ static uint64_t sh_intc_read(void *opaque, hwaddr offset,
>      unsigned int mode = 0;
>      unsigned long *valuep;
>  
> -#ifdef DEBUG_INTC
> -    printf("sh_intc_read 0x%lx\n", (unsigned long) offset);
> -#endif
> -
>      sh_intc_locate(desc, (unsigned long)offset, &valuep,
>                     &enum_ids, &first, &width, &mode);
> +    trace_sh_intc_read(size, offset, *valuep);
>      return *valuep;
>  }
>  
> @@ -256,13 +235,9 @@ static void sh_intc_write(void *opaque, hwaddr offset,
>      unsigned long *valuep;
>      unsigned long mask;
>  
> -#ifdef DEBUG_INTC
> -    printf("sh_intc_write 0x%lx 0x%08x\n", (unsigned long) offset, value);
> -#endif
> -
> +    trace_sh_intc_write(size, offset, value);
>      sh_intc_locate(desc, (unsigned long)offset, &valuep,
>                     &enum_ids, &first, &width, &mode);
> -
>      switch (mode) {
>      case INTC_MODE_ENABLE_REG | INTC_MODE_IS_PRIO:
>          break;
> @@ -282,18 +257,10 @@ static void sh_intc_write(void *opaque, hwaddr offset,
>          if ((*valuep & mask) == (value & mask)) {
>              continue;
>          }
> -#if 0
> -        printf("k = %d, first = %d, enum = %d, mask = 0x%08x\n",
> -               k, first, enum_ids[k], (unsigned int)mask);
> -#endif
>          sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
>      }
>  
>      *valuep = value;
> -
> -#ifdef DEBUG_INTC
> -    printf("sh_intc_write 0x%lx -> 0x%08x\n", (unsigned long) offset, value);
> -#endif
>  }
>  
>  static const MemoryRegionOps sh_intc_ops = {
> @@ -416,11 +383,8 @@ void sh_intc_register_sources(struct intc_desc *desc,
>          s = sh_intc_source(desc, vect->enum_id);
>          if (s) {
>              s->vect = vect->vect;
> -
> -#ifdef DEBUG_INTC_SOURCES
> -            printf("sh_intc: registered source %d -> 0x%04x (%d/%d)\n",
> -                   vect->enum_id, s->vect, s->enable_count, s->enable_max);
> -#endif
> +            trace_sh_intc_register("source", vect->enum_id, s->vect,
> +                                   s->enable_count, s->enable_max);
>          }
>      }
>  
> @@ -438,11 +402,8 @@ void sh_intc_register_sources(struct intc_desc *desc,
>                  s = sh_intc_source(desc, gr->enum_ids[k - 1]);
>                  s->next_enum_id = gr->enum_ids[k];
>              }
> -
> -#ifdef DEBUG_INTC_SOURCES
> -            printf("sh_intc: registered group %d (%d/%d)\n",
> -                   gr->enum_id, s->enable_count, s->enable_max);
> -#endif
> +            trace_sh_intc_register("group", gr->enum_id, 0xffff,
> +                                   s->enable_count, s->enable_max);
>          }
>      }
>  }
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 6a17d38998..9c7e41f41c 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -238,3 +238,11 @@ goldfish_pic_write(void *dev, int idx, unsigned int addr, unsigned int size, uin
>  goldfish_pic_reset(void *dev, int idx) "pic: %p goldfish-irq.%d"
>  goldfish_pic_realize(void *dev, int idx) "pic: %p goldfish-irq.%d"
>  goldfish_pic_instance_init(void *dev) "pic: %p goldfish-irq"
> +
> +# sh_intc.c
> +sh_intc_sources(int p, int a, int c, int m, unsigned short v, const char *s1, const char *s2, const char *s3) "(%d/%d/%d/%d) interrupt source 0x%x %s%s%s"
> +sh_intc_pending(int p, unsigned short v) "(%d) returning interrupt source 0x%x"
> +sh_intc_register(const char *s, int id, unsigned short v, int c, int m) "%s %d -> 0x%04x (%d/%d)"
> +sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size %d 0x%" PRIx64 " -> 0x%" PRIx64
> +sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size %d 0x%" PRIx64 " <- 0x%" PRIx64
> +sh_intc_set(int id, int enable) "setting interrupt group %d to %d"

I had to include the following diff to successfully build on 32-bit
hosts:

-- >8 --
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 1bc9948be30..c9b0b0c1ecc 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -206,7 +206,7 @@ static uint64_t sh_intc_read(void *opaque, hwaddr
offset, unsigned size)

     sh_intc_locate(desc, (unsigned long)offset, &valuep,
                    &enum_ids, &first, &width, &mode);
-    trace_sh_intc_read(size, offset, *valuep);
+    trace_sh_intc_read(size, (uint64_t)offset, *valuep);
     return *valuep;
 }

@@ -222,7 +222,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
     unsigned int k;
     unsigned long mask;

-    trace_sh_intc_write(size, offset, value);
+    trace_sh_intc_write(size, (uint64_t)offset, value);
     sh_intc_locate(desc, (unsigned long)offset, &valuep,
                    &enum_ids, &first, &width, &mode);
     switch (mode) {
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 9c7e41f41cf..9aba7e3a7a4 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -242,7 +242,7 @@ goldfish_pic_instance_init(void *dev) "pic: %p
goldfish-irq"
 # sh_intc.c
 sh_intc_sources(int p, int a, int c, int m, unsigned short v, const
char *s1, const char *s2, const char *s3) "(%d/%d/%d/%d) interrupt
source 0x%x %s%s%s"
 sh_intc_pending(int p, unsigned short v) "(%d) returning interrupt
source 0x%x"
-sh_intc_register(const char *s, int id, unsigned short v, int c, int m)
"%s %d -> 0x%04x (%d/%d)"
-sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size
%d 0x%" PRIx64 " -> 0x%" PRIx64
-sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size
%d 0x%" PRIx64 " <- 0x%" PRIx64
+sh_intc_register(const char *s, int id, unsigned short v, int c, int m)
"%s %u -> 0x%04x (%d/%d)"
+sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size
%u 0x%" PRIx64 " -> 0x%lx"
+sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size
%u 0x%" PRIx64 " <- 0x%lx"
 sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
---

Next time please run a CI pipeline.

