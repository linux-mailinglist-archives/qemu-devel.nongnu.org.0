Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8534A757
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:31:47 +0100 (CET)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPlcw-0006A5-VA
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPlaN-0005Sh-2B
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:29:07 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPlaL-00089H-GC
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:29:06 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so5056461otn.1
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DWbRHDus6hi5mCxRdXKepdfMNQdE13xI/sU6E7wqix8=;
 b=sVsjdqEgOrvVhfngSWCjElH6LSXmUu6MF6HV6mYrE7esFQ0ls+qwYpVvZJIan+LLZv
 ZtNZtYjOfbKxBYxK8m3pTwv5b201vSzvF3L6nKrI4bK4BTL70XDpuRCCNTaZpjAp61GD
 tgEMtS8TwO4d+qm8wkf05nCyel2JZ7CHld7STxMXSbGTQ5UTjPrC8bVWkWnH8S47H2LG
 OuiCKASgXcwxdZW4i710vm2Vh4TmXl7imDgECGtqY3nYBGB3S62sET1Lpo+7h4f7deTJ
 PDYTqmhj6MtTcSSsGsiIm/ZoYdxQnZ1fEKJ+QHMhSkSvA5t/HA761UIFn2QP6RkBBvFa
 PZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DWbRHDus6hi5mCxRdXKepdfMNQdE13xI/sU6E7wqix8=;
 b=aWtU3ExIFPKBnqq3TGX6DtUSVxZFnECvnstYWwt6Q3tX3Mpbgv3/g2wyL4hYDKS0YB
 hBHQK/13bStc2GUh7O+viohcf5qGR9boCkRIWjVYGKSjYr6sTEEjgzoUlW2fy69AhCFU
 P+VRoUieaMv5RJ20tIm1n0dxrEmN4Cm+ZZ1RL/5fGeKUrl1sQYamWCLRtEtsFfZlZPwL
 8YNyge1mbkWBSkP0yHccpCOrSJbQGBXGy0cKZYTDA+QLzZ4JsBSO3G3mm+LomqX9sD0D
 14Yc1nL08VJiKYw4Ck8T3G3UpzzLHcuyV4zUTGiA0HZp9j2S34qyWrTnqGhkpYqSF9lb
 lhGA==
X-Gm-Message-State: AOAM532R+I5mTD5HKqy43Kpt+25tYiQ59+/hlD95uXW0sS+lv5oI6MtY
 httmMBODy2Q0rHJwR3+9ZAPmxA==
X-Google-Smtp-Source: ABdhPJyNSNM5uH/SaOy74GX3rsj6VR5ytzO9b0XgD0xpjVbeZ3agg3rUqbIzblx3JFBXGYDdGYT4Pw==
X-Received: by 2002:a05:6830:1bc2:: with SMTP id
 v2mr11367757ota.300.1616761743848; 
 Fri, 26 Mar 2021 05:29:03 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id s19sm1825642oou.21.2021.03.26.05.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 05:29:03 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL v5 39/43] hw/hppa: Implement DINO system board
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180130044621.10464-1-richard.henderson@linaro.org>
 <20180130044621.10464-2-richard.henderson@linaro.org>
 <CAAdtpL5Uvvrkucyh=8+dveMeQsR4hHhynUCoF3AKT+g3mPaY0Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a7d7e79-e2b6-740c-72b1-4d8a62538c77@linaro.org>
Date: Fri, 26 Mar 2021 06:29:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL5Uvvrkucyh=8+dveMeQsR4hHhynUCoF3AKT+g3mPaY0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 5:17 PM, Philippe Mathieu-Daudé wrote:
>> +    /* Set up windows into PCI bus memory.  */
>> +    for (i = 1; i < 31; i++) {
>> +        uint32_t addr = 0xf0000000 + i * DINO_MEM_CHUNK_SIZE;
>> +        char *name = g_strdup_printf("PCI Outbound Window %d", i);
>> +        memory_region_init_alias(&s->pci_mem_alias[i], OBJECT(s),
>> +                                 name, &s->pci_mem, addr,
>> +                                 DINO_MEM_CHUNK_SIZE);
> 
> Where are these aliases mapped?

gsc_to_pci_forwarding


r~

