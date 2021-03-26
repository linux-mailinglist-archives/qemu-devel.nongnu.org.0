Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3C34AEB6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 19:45:47 +0100 (CET)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPrSs-0005Gp-Va
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 14:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrRL-0004os-F1
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:44:11 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrRK-0002Qa-2Q
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:44:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id g20so3467343wmk.3
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fhkbjyaOT0CHmmnxyhxMQxk93pu/tPQ70STRog9oiz4=;
 b=PVA6+2WaJn1Uehh3qm1h74X7nzzkOTbruBwad6Ks7ukKaXascqaK7c3rmkTyTFGVaH
 Zkv8ExxBdQy7MvKXGtMoLHhxF8/tUBWVwxIHXgDWdEJusEJhW5m84wB3ke5HvgSv5oO4
 S8o+0t6nfigjDDQLd63eqXPqG8M50sKVzE1XIcGw0Xh95r17K1lbBdcqCnhvdpHVVKTP
 k8mlfjFX9RIglb4fwoQnp6srvOkDbjR/a7ZZJbxU601GP/3n5R321SHKGzYKP/YQhzEA
 Hi/kGTYCIQlapiBdAR6P9SRz82PN0EupAqdtCiruN8NlhoMou84wS7kLwSeg/rVq0Wf9
 WZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fhkbjyaOT0CHmmnxyhxMQxk93pu/tPQ70STRog9oiz4=;
 b=JINB1EgqlnfuHiJfcjXuyz8C/MTVX5pUUW3lI6vE7DefP+8A/99KjE+Rc4aogbk8Ah
 48ZE4q2hlDWPyEB8ogl8utdvcAgdApxzcyxQK+VvK9r1Z/a+WmthxmABLfXVpzD1vf9O
 podzNpTR1ZEfvY7ryOmthj4nm53EEsIDyLIsLuGpQHNoD9VnB/8iH71YH2q9daDMty0P
 wo87wk+NQhl7LHt5mu/onJ6le4RD6Q8/VQ9zixMcB52JcECZJ/zrA8fC3ltt1hrMZ6O7
 hdt0TxIjHfb9u/S1KeRnO9gFt6WhfkrN4oPbxsfRHJ0rGyWKND2kEL7a/IYUyMzOIDyV
 bRJw==
X-Gm-Message-State: AOAM530a+EFJLrGwmUAXoTCs7J6YitjXZBNynSXEh+vxEKmfXefW3E+y
 WwqUIQSh8oGxptsMndRklxMw0goEIbkepw==
X-Google-Smtp-Source: ABdhPJx70c82FH9/vEuWAev65jYbN3WsXu6woqKB7zHQDqOfvl7ZeFNxtsK0oeZks1x8vUF6xYZGmQ==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr14123129wmq.96.1616784248425; 
 Fri, 26 Mar 2021 11:44:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u9sm12007203wmc.38.2021.03.26.11.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 11:44:07 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL v5 39/43] hw/hppa: Implement DINO system board
To: Richard Henderson <richard.henderson@linaro.org>
References: <20180130044621.10464-1-richard.henderson@linaro.org>
 <20180130044621.10464-2-richard.henderson@linaro.org>
 <CAAdtpL5Uvvrkucyh=8+dveMeQsR4hHhynUCoF3AKT+g3mPaY0Q@mail.gmail.com>
 <6a7d7e79-e2b6-740c-72b1-4d8a62538c77@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7fcd34e0-bcf7-840a-07d2-f5001e748ca3@amsat.org>
Date: Fri, 26 Mar 2021 19:44:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6a7d7e79-e2b6-740c-72b1-4d8a62538c77@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/26/21 1:29 PM, Richard Henderson wrote:
> On 3/25/21 5:17 PM, Philippe Mathieu-Daudé wrote:
>>> +    /* Set up windows into PCI bus memory.  */
>>> +    for (i = 1; i < 31; i++) {
>>> +        uint32_t addr = 0xf0000000 + i * DINO_MEM_CHUNK_SIZE;
>>> +        char *name = g_strdup_printf("PCI Outbound Window %d", i);
>>> +        memory_region_init_alias(&s->pci_mem_alias[i], OBJECT(s),
>>> +                                 name, &s->pci_mem, addr,
>>> +                                 DINO_MEM_CHUNK_SIZE);
>>
>> Where are these aliases mapped?
> 
> gsc_to_pci_forwarding

Doh I missed it, thanks!

