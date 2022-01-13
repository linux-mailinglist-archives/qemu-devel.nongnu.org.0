Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32648D454
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 10:28:09 +0100 (CET)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7wOs-0004CE-Rq
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 04:28:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7wLT-0002zZ-Jg
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:24:35 -0500
Received: from [2a00:1450:4864:20::42a] (port=40702
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7wLR-0006yK-Qw
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:24:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id x4so8898223wru.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 01:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3JCVJ0E1Gx/A/P8+bz9lLDg1SSlc/CRYoEw+gkaXDPA=;
 b=i/zBfQaNHCvrCoGttgjuGn2ROgTZNNukW/WguE4DHfNWFYUHDGRHFrZTWXVwB4fcKq
 3MOtgr9aOUpX2SH2AnL6+TtT18GPZwe9REQRfZUTxiRaQMDff5r4VY3A49fdVXJlhK71
 pQ6Mt/xt/SJqqR9stmvDW3g2/Qs0dEhceb30nHNZFmFeEMbFAUC3eCgKVKk/wecjvXgR
 TeM4mEvnsKbyornYxfMz1FoCRyeqy4Npb25XTbIXyXr9vCZI7xA03qeB2plz1Ew82O02
 pu/xm1tgAWk51Wg6d0rQSbF9kUgvisRImxRPXQJBntaNvovqkAI5nmtnfh07JN7v+fuQ
 NWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3JCVJ0E1Gx/A/P8+bz9lLDg1SSlc/CRYoEw+gkaXDPA=;
 b=iM7OsZ1sWU6JGo1sStmek5Pif4OjdpdIt/PE4VDg6IvnORZk3HZCYJThPmvy+SzvSS
 G9geu0sc/bvMI/xVMpFYmhWbnTqn7AWfOczp3tvzCVd3ARhCodhlOpK+V16pww6cYi8J
 w7nZWWZLEiVgZtdx8okDu3Z8aASshc3fyjMwZE7VUOIBFNs3LRzhC4aN5g/3S9LOjmQO
 /vrTZQqWTHEGEGUbJinmsVK3pkV1ka9aqGZ2EvXOmroteDUzYgl+2R+jODv0Gz3gETM4
 yF6qHZiI2LgNhwFimKeMWKxJeXYf6uegUdzJAt0UA0uaNhotwOnWWEjC56XK+SqMNf+b
 nRJA==
X-Gm-Message-State: AOAM532gO4hL4OWpf5uGrrzD02F00M6Ur/cB/E24U29U74VaXYoumrE9
 J/NJOyJ7uL2cqAs5t4GiwaM=
X-Google-Smtp-Source: ABdhPJy8z/yL+Iwl1pnQhoP/b0RCn2ZMvxeTb9CtF3e6U2CexwfQEVEjAROqHwivgiaM3dI6hLAv9A==
X-Received: by 2002:a5d:64a9:: with SMTP id m9mr3202170wrp.143.1642065872045; 
 Thu, 13 Jan 2022 01:24:32 -0800 (PST)
Received: from [192.168.3.175] (205.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.205])
 by smtp.gmail.com with ESMTPSA id b14sm2406210wri.112.2022.01.13.01.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 01:24:31 -0800 (PST)
Message-ID: <1dfcfd7a-5f21-f467-32e3-c8db5476ab29@amsat.org>
Date: Thu, 13 Jan 2022 10:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] malta: Move PCI interrupt handling from gt64xxx to
 piix4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220112213629.9126-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220112213629.9126-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bernhard,

On 12/1/22 22:36, Bernhard Beschow wrote:
> Hi,
> 
> first-time contributor here. Inspired by an article in LWN [1] I figured I'd
> get my hands dirty with QEMU development. According to the article my goal is
> to eliminate some "accidental complexity".
> 
> While studying the code I noticed some (accidental?) differences between piix3
> and piix4 where the PCI interrupts are handled. Moreover, I noticed presence of
> global variables in piix4 which probably constitute a limitation of QOM's idea
> of configuration-driven machine creation. By applying piix3 concepts, i.e.
> moving the interrupt handling from gt64xxx to piix4, it's possible to both
> eliminate the differences and resolve the global variables.
> 
> The patch series is structured as follows: Patch 1 eliminates the differences,
> patch 3 resolves the global variables. Patch 2 is a preparation for patch 3.
> Some of my further comments regarding the patches are:
> 
> Patch 1:
> * pci_slot_get_pirq() looks quite malta-specific. Neither gt64xxx nor piix4
>    seem to be the perfect fit. So I moved it to piix4, analogous to piix3.
> * The i8259 property moved from MaltaState to PIIX4State looks quite redundant
>    to the isa property. Could isa be used instead, eliminating i8259?
> 
> Patch 2:
> * Besides piix4, there were four further cases where the PIC array was passed
>    as the opaque parameter to the pci_map_irq_fn's. AFAICS in all other cases
>    the DeviceState is passed instead. With this patch, consistency is
>    esablished.
> * Passing PIIX4State to piix4_set_irq() paves the way for eliminating all
>    global variables left in piix4.c (see patch 3).
> 
> Comments welcome.
> 
> Cheers
> Bernhard
> 
> [1] https://lwn.net/Articles/872321/
> 
> Bernhard Beschow (3):
>    malta: Move PCI interrupt handling from gt64xxx to piix4
>    pci: Always pass own DeviceState to pci_map_irq_fn's
>    isa/piix4: Resolve global variables

Did you forget to sent the patches?

