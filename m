Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB481C42E1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 19:33:33 +0200 (CEST)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVeyC-0004Q7-Sx
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 13:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVeuW-000130-GG
 for qemu-devel@nongnu.org; Mon, 04 May 2020 13:29:44 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:56178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVeuV-0007Xh-Is
 for qemu-devel@nongnu.org; Mon, 04 May 2020 13:29:44 -0400
Received: by mail-pj1-x1042.google.com with SMTP id a32so164491pje.5
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 10:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oIg4ZVAATjB5vBCDoSz5TlVIGwyVc/B/6/h7+NqSlgM=;
 b=c4iUxUA2SqvIrFkHn6mvONBEFLe+HcD7Hd5mqFyts1Wc4i9qxRgi+hn8juqeonJneJ
 /4ptcuswct7TAe8sYnblX6+Mh6OewtXTQbx/NtE3tUIasN06CHRHyfJRsZHmyVSiYXvt
 PGAlIvi0KKDNHbw8H4KhDErnE+7Votp4+ioroWseisoCnt8iy5ldT+GttR6lNRZNcm0L
 OCJuT8+hxAkXEulQNO1cmd9o1t/FOIcmtCio35DVYBHcsP8JY19YWzzQQ35axze628Gg
 0Z+jdSSdUHNNnqRfFhiYRZPQcJvDS7uo38rUV5t00vBc3TrEBaBSRhsmXnUFRtO0DkP/
 Sn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oIg4ZVAATjB5vBCDoSz5TlVIGwyVc/B/6/h7+NqSlgM=;
 b=i6WTSXNzdeqor9wovCqzl7ch78C83PqMbRnv2acXsqWCAEj3oeeSTYdCmadxZxhgWC
 vBIMqzpGRVYIs0XQEwpiJmK5aeqrRVVtei/zCpoHsZc/mjUC5D6hVXI9exwKAdfgqZgN
 QSP1NWYuWOD2fbLrP4JeaUYUlF1V69upgVqQR1LcH8woQgQdb5VkTQAwGOFLdsC2gXho
 XpcimxdX6yGD9bPB/PFKQdscXel+fIeUZUvoX/T4BM2GvY9JpXE3fJ7gqhpO0MhZYFbG
 31gR5PPNnR9bI5gjoaJe0s+SncIPE1OIgZLiD2jg42/3UjqLuO37FaK/FXlVnJxVKBZH
 4Hjw==
X-Gm-Message-State: AGi0PuYTMaS8whxB1h2QupVFeFVlrDrF6IxlDtR10EfdD8LvVTohg0mi
 xwfvCkkWubrkiIWfAHL1Arw6Hw==
X-Google-Smtp-Source: APiQypL30AZ/irQueAbWN2LEeZZfTf9mYP+nRxE31RBA/B8CdWlqPxgeQOZxlFzJ4XC3yUtanv1NFw==
X-Received: by 2002:a17:90a:6d03:: with SMTP id z3mr101025pjj.32.1588613381980; 
 Mon, 04 May 2020 10:29:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id y63sm9617589pfg.138.2020.05.04.10.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:29:41 -0700 (PDT)
Subject: Re: [PATCH 4/4] hw/i386: Make vmmouse helpers static
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200504083342.24273-1-f4bug@amsat.org>
 <20200504083342.24273-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f01f89f6-10e8-5173-c68d-0fb779f77d0e@linaro.org>
Date: Mon, 4 May 2020 10:29:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504083342.24273-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/20 1:33 AM, Philippe Mathieu-Daudé wrote:
> +++ b/hw/i386/vmport.c
> @@ -23,10 +23,10 @@
>   */
>  #include "qemu/osdep.h"
>  #include "hw/isa/isa.h"
> -#include "hw/i386/pc.h"
>  #include "sysemu/hw_accel.h"
>  #include "qemu/log.h"
>  #include "vmport.h"
> +#include "cpu.h"
>  #include "trace.h"
>  
>  #define VMPORT_CMD_GETVERSION 0x0a
> @@ -109,27 +109,6 @@ static uint32_t vmport_cmd_ram_size(void *opaque, uint32_t addr)
>      return ram_size;
>  }
>  
> -/* vmmouse helpers */
> -void vmmouse_get_data(uint32_t *data)
> -{
> -    X86CPU *cpu = X86_CPU(current_cpu);
> -    CPUX86State *env = &cpu->env;
> -
> -    data[0] = env->regs[R_EAX]; data[1] = env->regs[R_EBX];
> -    data[2] = env->regs[R_ECX]; data[3] = env->regs[R_EDX];
> -    data[4] = env->regs[R_ESI]; data[5] = env->regs[R_EDI];
> -}

Why are you adding "cpu.h" when removing code?
Does that mean you don't need to add "cpu.h" to vmmouse.c?


r~

