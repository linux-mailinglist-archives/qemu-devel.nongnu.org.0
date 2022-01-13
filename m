Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDC48D76E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 13:22:57 +0100 (CET)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7z84-0004Up-VS
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 07:22:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yfX-0003Ts-Bb
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:53:27 -0500
Received: from [2a00:1450:4864:20::534] (port=39752
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yfT-0004mt-7y
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:53:27 -0500
Received: by mail-ed1-x534.google.com with SMTP id c71so22086271edf.6
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z/E4koJlcsDcXYfgdV1kflHdsgymUmtk0lZi8iyB/9A=;
 b=O4kFl9mVBsl1ZgYoaNipU8C5mFrY1L9OX7vLPJx0umCkGDxRxxJZqSBdgk8mO/SjWg
 cxV4qVez9Mq8A6ZlaxCG00TcaD2yRFZ3tOOpXHtH0jqpqs2UNXhnKukqPEd9ELfMtgMJ
 pqLRu1d8NNRx2X88RHicBKN4cii9E7fGolrKH84FkF2JghN3az2LacGHbKdqhyFr+jBx
 n9zGQZ/bo41EHl8YJ0XSNHkfla8zq6LdKDxarhcbbQMJeOjlJdu8U7Ykr894d/+NdYi9
 /CUXgTf7W7dfexay+YY+GHs1NtcPjTe9KPL/OP7oa7N27zyyYSJ+iVnKNAl4rBvTjjcV
 IfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z/E4koJlcsDcXYfgdV1kflHdsgymUmtk0lZi8iyB/9A=;
 b=VvjC95aH8Zyw0yb3W7egq/jeIF1IzKPtzCXAXpLKg4hmowKr26YnoD9BGaGffG0SPg
 SocmVaHlnTm1L9xrqgbXYjitO77HTR/G9jQ5bI2fcBc8N7d2DtdZv3FApHWs+5cCrovD
 fHLUMTSFMQxk7J4cUsY0Cg7zoExX42oJjuSOse1diGQQ1/6zMUHkXKqJ/UdfWnlr/MCF
 T4YFxW5DUDmBUr9GpnyNYerufV7NEAQr30MF9ryEuxYAEmjM1qC9bkB1P5ERimtJNRyl
 6ijxjwTZHTVfKZRde8MjJU8bfkNpY2dn5L7EaHQ3TjelvhggGG0rn/sbMskRehoVHK9M
 xvcw==
X-Gm-Message-State: AOAM532IyEihSw7KCecyPB/V6ybx6e+X60FWTG9cIrhIN3SLh75AHstd
 CJaSyQ/+8NVB6o2q/Ug5+sI3uSXlIaYmbw==
X-Google-Smtp-Source: ABdhPJztZuL6lNw9qATqjyRHL7hR2Kvtt3uF7WlA7VHettw8Z95POoTyzwjqEm70pOVUcqXS0rUS0w==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr3802156edd.292.1642074799003; 
 Thu, 13 Jan 2022 03:53:19 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id e26sm793907eje.73.2022.01.13.03.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 03:53:18 -0800 (PST)
Message-ID: <9d2a9567-4c5f-47e2-491c-2bf523adcc4b@amsat.org>
Date: Thu, 13 Jan 2022 12:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] malta: Move PCI interrupt handling from gt64xxx to
 piix4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
References: <20220112213629.9126-1-shentey@gmail.com>
 <1dfcfd7a-5f21-f467-32e3-c8db5476ab29@amsat.org>
 <CAG4p6K5jx5eJC1BCBRsTdQ--dFv5TEjgRLP9qMjmkEh0q69EcA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAG4p6K5jx5eJC1BCBRsTdQ--dFv5TEjgRLP9qMjmkEh0q69EcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/1/22 12:22, Bernhard Beschow wrote:
> Hi Philippe,
> 
> On Thu, Jan 13, 2022 at 10:24 AM Philippe Mathieu-Daudé <f4bug@amsat.org 
> <mailto:f4bug@amsat.org>> wrote:
> 
>      > Bernhard Beschow (3):
>      >    malta: Move PCI interrupt handling from gt64xxx to piix4
>      >    pci: Always pass own DeviceState to pci_map_irq_fn's
>      >    isa/piix4: Resolve global variables
> 
>     Did you forget to sent the patches?
> 
> 
> I can see my patches in-reply-to my cover letter here [1]. Do I miss 
> something?
> 
> [1] 
> https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02786.html 
> <https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02786.html>

I should have checked there first. I found the patches in my SPAM box,
apparently due to "SPF=SOFTFAIL" (no clue...):

Authentication-Results: mx.google.com;
        dkim=pass header.i=@gmail.com header.s=20210112 header.b="Sf/DBOt0";
        spf=softfail (google.com: domain of transitioning 
shentey@gmail.com does not designate 172.105.152.211 as permitted 
sender) smtp.mailfrom=shentey@gmail.com;
        dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com

