Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4F30BAFC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:33:47 +0100 (CET)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6s4A-0001ho-7H
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6s2n-0000nV-SC; Tue, 02 Feb 2021 04:32:21 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6s2l-000304-38; Tue, 02 Feb 2021 04:32:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 190so1725668wmz.0;
 Tue, 02 Feb 2021 01:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OLkjZ9nxozjiKK+4NvlXfG6Ydbp1C3frT1S82SDbm/k=;
 b=CGPl04R42nD9VRH44EIMOaKmwZooboFOlReKsjiroXG6EPqTnEzTg5MSnkj/St6FII
 7iPAMoeSJvWob9BHx1gg7e1PfnhY7P8s7zfHcITHKZUkgsbuTXS2bBpg9TQsXT+JN2u2
 dkxFvLEB39E5zgo1i1fQVgQEaNup2J+tt8kTKA4I3ryL+VIZODnxsgs6v2YBbRGvoTPP
 rkFa+pS2cdka6XUtIj7UGWRayW+sSzOSt6SpX/EnqqoJ3UPW/X0uO+HBMWS+pDh/lhPm
 NWIeMwmWPQTL1yPEsBrmLOTASVDUawwVeurnqv8mpl3pckpbIJ7uUMtUR8OVnMtESUAX
 mOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLkjZ9nxozjiKK+4NvlXfG6Ydbp1C3frT1S82SDbm/k=;
 b=pYJXWeHa4nCuStd435GAXPIqBC+XSCG5+58kg8/sePdAiMQA5PZgPFqqW12bxecwUu
 +z4JKpS5jS55kugqYfLFyU1gfwaTHHgu8kINbOyKVg1PIepTssdYN97rCU2HPbbh7AWu
 2nfWnM9ffWb/zePgTigzabXvq/XRQ7NTfuC5MD2HsxY1/K3Xc49fQHS4zUR6AmYX229i
 pS+Jf6VD0eaBt9+I0iZSpnFBcJ7uxxpE6QLt7dhz5bpIGnyy4T94vhRlG/9tHkXbdcYM
 k30vf1AmK7xEGPfWutwNUUXTtmPG2Y8iP33dfAylAAlQDxqimMMQXdwycXmoRBwNSr6o
 owBw==
X-Gm-Message-State: AOAM533fFgiY3YwtwQFTFoMK7u7JxnoWx++2s487njs973bN9o/SJuQG
 yo+ffCceR+8com7wK623YSo=
X-Google-Smtp-Source: ABdhPJxdgDAxrerovllzWRxN92AdVvB0g32kXk0EF+JNODrFhegJ9LM+arnsq5baeRX8NZHykhYrDQ==
X-Received: by 2002:a1c:1b12:: with SMTP id b18mr2585504wmb.157.1612258336312; 
 Tue, 02 Feb 2021 01:32:16 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d30sm33164122wrc.92.2021.02.02.01.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 01:32:15 -0800 (PST)
Subject: Re: [QEMU-SECURITY] [PATCH] hw/intc/arm_gic: Fix interrupt ID in
 GICD_SGIR register
To: P J P <pj.pandit@yahoo.co.in>, P J P <ppandit@redhat.com>,
 QEMU Security <qemu-security@nongnu.org>
References: <20210131103401.217160-1-f4bug@amsat.org>
 <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
 <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
 <6d29aa57-2e6e-e81d-831f-803d9aae798f@amsat.org>
 <787280826.1146023.1612246917145@mail.yahoo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3bd70da2-39ec-6e6b-d46d-6052f1b8f0b0@amsat.org>
Date: Tue, 2 Feb 2021 10:32:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <787280826.1146023.1612246917145@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Li Qiang <liq3ea@gmail.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 7:21 AM, P J P wrote:
> On Sunday, 31 January, 2021, 08:48:26 pm IST, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote: 
>> Forwarding to qemu-security@ to see if this issue is worth a CVE.
>>
>> | On 1/31/21 11:34 AM, Philippe Mathieu-Daudé wrote:
>> | > Per the ARM Generic Interrupt Controller Architecture specification
>> | > (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
>> | > not 10:
>> | > 
>> | >    - Table 4-21 GICD_SGIR bit assignments
>> | > 
>> | >    The Interrupt ID of the SGI to forward to the specified CPU
>> | >    interfaces. The value of this field is the Interrupt ID, in
>> | >    the range 0-15, for example a value of 0b0011 specifies
>> | >    Interrupt ID 3.
>> | > 
>> | > diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> | > index af41e2fb448..75316329516 100644
>> | > --- a/hw/intc/arm_gic.c
>> | > +++ b/hw/intc/arm_gic.c
>> | > @@ -1476,7 +1476,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
>> | >          int target_cpu;
>> | >  
>> | >          cpu = gic_get_current_cpu(s);
>> | > -        irq = value & 0x3ff;
>> | > +        irq = value & 0xf;
>> | >          switch ((value >> 24) & 3) {
>> | >          case 0:
>> | >              mask = (value >> 16) & ALL_CPU_MASK;
>> | > 
>> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
>> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
> 
> * Does above patch address both these bugs? For BZ#1913917 'irq' is derived from 'offset' it seems.
> 
>         /* Interrupt Configuration.  */                                         
>         irq = (offset - 0xc00) * 4;

I haven't done a thorough analysis, simply tried to fixed this
bug ASAP as it is public so many users are exposed.

I had the impression the first call (writel 0x8000f00 0x5affaf)
break the heap, so the memory is inconsistent when the second
call (write 0x8000eff 0x1 0x0) is done, but better have developers
familiar with GIC and security auditing this again.

>> | > Correct the irq mask to fix an undefined behavior (which eventually
>> | > lead to a heap-buffer-overflow, see [Buglink]):
>> | > 
>> | >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
>> | >    [I 1612088147.116987] OPENED
>> | >  [R +0.278293] writel 0x8000f00 0xff4affb0
>> | >  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
>> | >  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
>> | > 
>> | > Cc: qemu-stable@nongnu.org
>> | > Fixes: 9ee6e8bb853 ("ARMv7 support.")
>> |
>> | > ---
>> | > Isnt it worth a CVE to help distributions track backports?
>> | > ---
> 
> Thank you for reporting this issue. Will process further.

Thank for the quick processing.

Regards,

Phil.

