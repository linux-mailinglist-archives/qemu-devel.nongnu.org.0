Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DD3872F3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:16:22 +0200 (CEST)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litxb-0000j8-Ci
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1litwO-0007bZ-Gs
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1litwM-0000ZN-2P
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621322092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ez8FTSvg+LiMq6GhkyV8leRgBpuCFThpxbFAhfRS1HE=;
 b=ORpKw8rx8it7G4g65Dvd/tx9DuXW+dvkjbjyRJqyuHgiNxeOlHodMSuygJ9XbOwPWY4eOW
 ajqCxPzZ/Cso4qLBexxrkRjurC/2wGWm0msOSYPNJsc0IWOl5W4m02oxrSECZlhTn5LiTq
 S2N6iXm135WvyzunqmoyKNxvV9Rd4fw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-KG57cbDZMZG62Ugwim8Y9g-1; Tue, 18 May 2021 03:14:50 -0400
X-MC-Unique: KG57cbDZMZG62Ugwim8Y9g-1
Received: by mail-ej1-f70.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so1993447ejb.14
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 00:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ez8FTSvg+LiMq6GhkyV8leRgBpuCFThpxbFAhfRS1HE=;
 b=qhhuOsiwAIYUvJA5Hlff+UzCBCLWTgpYLgAQ4heX1qry0o3kEtR2wNIFCcjjGaqTrk
 Bj6l1mTMkbqQfOs5HEEDSArzFN0jc/OuIz6ENHTMbzmUtkpiC7ug6e8TQ/q8hR2zwFMP
 TC7uy+XxpaV71dCeHyEKXKNy6KYyE9u+0pti1DmZZ5SP6sfGTsoXaxNWwIvYBRWg+j5/
 cHFz4tZHlTOa5WCCZVb2TzpbzK+WS8w2SgjYkEy2ixObTdJxNZ5cPoIozLitO2rxozff
 mMw/CjYWmQQUwGBgTVW/pLizF5CtdD2kAylco8d7W2oGMcljOIML6qFI1Y+q6ipxpbaK
 SKpw==
X-Gm-Message-State: AOAM533ijZ5uMew442qbor8m48ZojD8YZt45V5Sk6lUAmuTgFNLXJ5qW
 HTknY8rwxFLkGaizHB96GbeEt2Dbkd1KMptnkWVgqN5+ar1lk3KKu+6soKFH8Jut3jS5dxMMg1s
 OLvZdHHGJtFWVLoo=
X-Received: by 2002:aa7:d65a:: with SMTP id v26mr2620133edr.185.1621322089570; 
 Tue, 18 May 2021 00:14:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd9yiGqQvA27KiFWfIWoZ3NQQoc3wPkToibhrNvkwNyX5UrDBY1lKUluCim4ZmzgNNVi4blQ==
X-Received: by 2002:aa7:d65a:: with SMTP id v26mr2620100edr.185.1621322089240; 
 Tue, 18 May 2021 00:14:49 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v8sm6194473ejq.62.2021.05.18.00.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 00:14:48 -0700 (PDT)
Subject: Re: [PATCH v4 0/9] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20210517183954.1223193-1-philmd@redhat.com>
 <6ef11e42-7778-762a-f11b-d88f1b688db3@redhat.com>
 <7ce0415a-50f9-d903-d1dd-d0b0b1757045@redhat.com>
 <b370382f-aa19-21b5-3c8a-9fac9be590d5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fc985d03-ee24-33e8-d527-7dbb979a9eed@redhat.com>
Date: Tue, 18 May 2021 09:14:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b370382f-aa19-21b5-3c8a-9fac9be590d5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Hervé, Aleksandar, Markus & Mark.

On 5/17/21 11:11 PM, John Snow wrote:
> On 5/17/21 4:50 PM, Philippe Mathieu-Daudé wrote:
>> On 5/17/21 9:19 PM, John Snow wrote:
>>> On 5/17/21 2:39 PM, Philippe Mathieu-Daudé wrote:

>>>> The floppy disc controllers pulls in irrelevant devices (sysbus in
>>>> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
>>>>
>>>> This series clean that by extracting each device in its own file,
>>>> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.

>> Not good enough:

> Yup, I see. Dropping it from the queue for now. Thanks!

The Jazz machines use the sysbus FDC model, but register a DMA channel.

The DMA transfer is done using:

    if (fdctrl->dma_chann != -1 && !(fdctrl->msr & FD_MSR_NONDMA)) {
        IsaDmaClass *k = ISADMA_GET_CLASS(fdctrl->dma);
        k->release_DREQ(fdctrl->dma, fdctrl->dma_chann);
    }

The IsaDmaTransferHandler is ISA specific...

I suppose the Jazz machines should use the ISA FDC model.

Hervé, Aleksandar, do you know?

Thanks,

Phil.


