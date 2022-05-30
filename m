Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D96537E38
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:53:30 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfpq-0005zV-1H
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfd9-0001eN-Mx
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:40:27 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfct-00072t-H2
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:40:23 -0400
Received: by mail-pl1-x633.google.com with SMTP id n8so10372640plh.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aJsyQPAcl5L39Lss0pc83wcqlYCE8Jq9i7Pug92qbQc=;
 b=lexOkl7oZGYsq02HPKK2F8m23A57H3IppgVSJf/+3IutNY1jJsjJ4B3QpGgO5sjH0x
 Dq4ftTnSZM3wk7dn2DgO2iaU9mOTj1EE+b+/8CGvVIJj+xBYtu1j9z76BUzwrR6dyhlq
 PpLBM7x3Lxyk3RM1kgldnphbbIAlXKp/aEcSB3LbP11XWpoz+qlQEnIpJG4QXYoU6pyl
 yWwZOH/Ncc2VtN9uUz6l2BAfhRMz8dp/B9lC+5JlweCAhT92XkAg+zn69hOSVD1kpeC2
 /gOUklIyrYR/BlvAsG8Jd1C6soe0M8V/e0bsVa6S0C14Fn5M3ypklAwhUU5hOaj7qvCi
 xddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aJsyQPAcl5L39Lss0pc83wcqlYCE8Jq9i7Pug92qbQc=;
 b=MXwCZY2WCKtPwwKYu6hXv3glKrvi5cgZO0g6ehiFPt5tANHTOEwaBtSBbQ8J8grIiH
 9IQQv3ltI0ZutaTb7HsHil73GIiRZdAeG6wReBN28FQStM2ujUl4V7zlkljorcY9hDrl
 FGcK1p6miRrcDnRc6FPTfN77QrShkO560YM+4HMHiOfFrms83Sf38JenaG0PIjmPHzjU
 DH/HOnglF4XmFn5WXga5IGfss1xsdjTUc3wgFJRFhbU8faY0+6gbDTyYATKGkpy/GKCE
 EK4rWjfaVHh11eWzw6E9ZK+9BHv9Z5qX0c4uskLQz4Z2XbK3rOshbOIOaKIlLDK3fa2S
 qD/Q==
X-Gm-Message-State: AOAM531Un0kUMKxlCtY6GSVYuE0iL24opEs7gOyKYjA2j0JUWZ7XjrLw
 U4HdS7I9Fu31EAyGyLdVTrk=
X-Google-Smtp-Source: ABdhPJxbWPzABI6407kT6NrMYUMV7cZqnPlUZGAHf0CMvEPPPC2BugWXX41HkvgMIF7TBhrLMU+pAA==
X-Received: by 2002:a17:902:9b8a:b0:163:d0ad:f9e8 with SMTP id
 y10-20020a1709029b8a00b00163d0adf9e8mr7009427plp.79.1653918005885; 
 Mon, 30 May 2022 06:40:05 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170902f60900b0015e8d4eb1f9sm9221836plg.67.2022.05.30.06.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:40:04 -0700 (PDT)
Message-ID: <13077fc2-4b9b-f4a8-1a24-651043416727@amsat.org>
Date: Mon, 30 May 2022 15:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/3] memory: Track whether a Device is engaged in IO
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220527161937.328754-1-alxndr@bu.edu>
 <20220527161937.328754-2-alxndr@bu.edu>
 <CAFEAcA-PXO8ZGS_DA6E65MK2pvnnepbpA-vc_90xdARLj73=iA@mail.gmail.com>
 <20220530130944.27md44gr2yp7gx5i@mozz.bu.edu>
 <CAFEAcA_uNwY582GuCw6xqiDqyG3K6uqZB-ojB-Qcn5Hkzp4ZRg@mail.gmail.com>
In-Reply-To: <CAFEAcA_uNwY582GuCw6xqiDqyG3K6uqZB-ojB-Qcn5Hkzp4ZRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/5/22 15:28, Peter Maydell wrote:
> On Mon, 30 May 2022 at 14:10, Alexander Bulekov <alxndr@bu.edu> wrote:
>>
>> On 220530 1219, Peter Maydell wrote:
>>> On Fri, 27 May 2022 at 17:19, Alexander Bulekov <alxndr@bu.edu> wrote:
>>>>
>>>> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
>>>> This flag should be set/checked prior to calling a device's MemoryRegion
>>>> handlers, and set when device code initiates DMA.  The purpose of this
>>>> flag is to prevent DMA reentrancy issues. E.g.:
>>>> sdhci pio -> dma write -> sdhci mmio
>>>> nvme bh -> dma write -> nvme mmio
>>>>
>>>> These issues have led to problems such as stack-exhaustion and
>>>> use-after-frees.
>>>>
>>>> Assumptions:
>>>>   * Devices do not interact with their own PIO/MMIO memory-regions using
>>>>     DMA.
>>>
>>> If you're trying to protect against malicious guest-controlled
>>> DMA operations, you can't assume that. The guest can program
>>> a DMA controller to DMA to its own MMIO register bank if it likes.
>>
>> If this is the case, then it seems the only way to fix this class of
>> problems is to rewrite device code so that it is safe for re-entrancy.
>> That seems to require significant upfront work to support behavior that
>> is often not even specified.
>> Simply spot-fixing the fuzzer re-entracy bugs seems like a dangerous,
>> incomplete solution.
>>
>> Can we disable re-entracy by default, to fix the security issues, and
>> allow device code to "opt-in" to re-entrancy?
> 
> That's a different question, ie "are there legitimate cases where
> devices try to DMA to themselves?". I don't know the answer, but
> I suspect not.

There is a niche where it might not be legitimate, but it is (ab)used
and Paolo wants to keep such cases working. I already responded to
Alexander here:
https://lore.kernel.org/qemu-devel/380ea0e5-a006-c570-4ec8-d67e837547ee@redhat.com/

