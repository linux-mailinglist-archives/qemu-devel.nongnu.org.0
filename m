Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD3236CAE7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:09:16 +0200 (CEST)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbS91-0001we-KD
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbRx0-0001HP-D9
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbRwx-0006qz-Fp
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619546203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbR1299AXZXRsFXwIZF3DA5bw/FDmgWDqRMy4PbIQ9w=;
 b=bXiILNX2lL2WXyAm9hTd4BmBlQDVDdWpOYsG1G9p8y8jfJz9aXPwnWkxD3IxadLCHsCCZF
 dk2JfREUIsxZf85et1hgyj4rmYKx45EScRWi9pHb/ArXhRZO3bmZJLw8Wc38lf4RoEekTI
 /PzzSIsInnr6YAc2ggkkYR5H205L0Zs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-gDOsIE7NObOZskRhrVaX1w-1; Tue, 27 Apr 2021 13:56:41 -0400
X-MC-Unique: gDOsIE7NObOZskRhrVaX1w-1
Received: by mail-wr1-f70.google.com with SMTP id
 89-20020adf83e20000b029010c35eb9917so3104734wre.1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dbR1299AXZXRsFXwIZF3DA5bw/FDmgWDqRMy4PbIQ9w=;
 b=G5ZdAIo3Izpvur3d/IUZoVDNWJRNq79aOum6ULGCdxLMZHeZcWVcikcZzjOzOKqDqm
 m79jhfG+Xbw7Eqhfxyl5PBIyS7kx6dpTN5cWtUnYdgPqOCHCDsTiF6YAVn7dQbCoVrkQ
 Q2ndnPu+VKVUMYg6nN5zkl2d5b1fXc1NWzfLcUiW1pEz9/T2xt8tXyxJGuak5OGSBB/D
 +uvEMFw0Fn+eaaimAxuZxGck5wmjt4KcCh1U0rd+FTQ/ChGmPFR1Diu5JLUs5LUGQZT7
 5IRoFlTO+bDwL4iGGKsOm2SLlKxaYKfaLGkoAXc2ZCUSPdrEzmv4dhHy/qtCCh2PZDoJ
 n4iQ==
X-Gm-Message-State: AOAM533gjUBA9/sCCoi159r9YrRHtqFc2JYfG75aAhPGcEY31an5vwNP
 pD82JDgf0KHTECVICvYDtSC71m1wfcGus6FD15oXuX5an8tjFX+erisk1QQY0xYZZ1eprftnIOL
 XuhEsDaDtjGUxzcY=
X-Received: by 2002:adf:cf09:: with SMTP id o9mr30848409wrj.366.1619546200208; 
 Tue, 27 Apr 2021 10:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLgoBEAq1op7ERjWhHI22S8/CZOBshjQGt6zm2MdNfZQ7AMEOE4MAvuiyEGQbd3fcGj0hSJw==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr30848386wrj.366.1619546200036; 
 Tue, 27 Apr 2021 10:56:40 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p3sm2980313wmq.31.2021.04.27.10.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:56:39 -0700 (PDT)
Subject: Re: [PATCH 2/4] hw/block/fdc: Declare shared prototypes in
 fdc-internal.h
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
 <20210415102321.3987935-3-philmd@redhat.com>
 <5f7932fd-bdaf-6dbf-18df-70c3c0f32bd2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f7aec481-4186-1133-efb8-82322f8dd519@redhat.com>
Date: Tue, 27 Apr 2021 19:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5f7932fd-bdaf-6dbf-18df-70c3c0f32bd2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 6:53 PM, John Snow wrote:
> On 4/15/21 6:23 AM, Philippe Mathieu-Daudé wrote:
>> We want to extract ISA/SysBus code from the generic fdc.c file.
>> First, declare the prototypes we will access from the new units
>> into a new local header: "fdc-internal.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   hw/block/fdc-internal.h | 155 ++++++++++++++++++++++++++++++++++++++++
>>   hw/block/fdc.c          | 126 +++-----------------------------
>>   MAINTAINERS             |   1 +
>>   3 files changed, 164 insertions(+), 118 deletions(-)
>>   create mode 100644 hw/block/fdc-internal.h
>>
> 
> With our policy of not including osdep.h in headers, it's hard to verify
> that this header is otherwise self-sufficient.
> 
> 
> I think the only thing it needs (not in osdep.h) happens to be MAX_FD. I
> added osdep.h just to test:
> 
> jsnow@scv ~/s/q/h/block (review)> gcc -I../../include/ -I../../bin/git
> -I/usr/lib64/glib-2.0/include -I/usr/include/glib-2.0 -c -o
> test_header.bin fdc-internal.h
> fdc-internal.h:134:19: error: ‘MAX_FD’ undeclared here (not in a function)
>   134 |     FDrive drives[MAX_FD];
>       |                   ^~~~~~
> 
> 
> Should we include the fdc header from the internal one?

Yes, good catch, will do.


