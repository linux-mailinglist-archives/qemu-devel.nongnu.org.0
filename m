Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2C3C253E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:49:23 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qsc-0000LF-MM
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1qqr-0006du-64
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:47:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1qqk-0002O7-PD
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:47:32 -0400
Received: by mail-pl1-x631.google.com with SMTP id v13so5021651ple.9
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3sObSDj7mc5CWWDLARvw5iCTADFUxpN4tbIhkxj80dA=;
 b=n1DXeCaqMoQCgYkQScuJVbYNGW0JnKBnJJstDiAvpBmtBLAfwRAd85x89SeBV3r0Kd
 UQKC2774bAdIGiv6F70rQyalBAdWE5CGALvBAd5woxGZV2n+Z8VolpHjqGnmQX+qLFW3
 1jjcLXa95mlv1x4rM5XD3JqwV7dPcE/qs6HBe4+Rrl/JOR1p+yBDUaRaFCROyPs4M9z/
 e0B7+LZqzRdmLbBkl5zTY8rQSpMbZu/QvUInKQKpPxu0IftsVTY75X8qFnHQMqL8OA9P
 P+FwHQUR5qHW+kXYTH6ViIgTey3fGsTJJSzKvr39k2xJ3ZC2m1XkMtjphkp/bj/YvVcH
 zCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3sObSDj7mc5CWWDLARvw5iCTADFUxpN4tbIhkxj80dA=;
 b=spiBggsgElZM4y5VtVxQ0A3OAdZIU+YzGhZXrh04AoicTRYzy9B7GI/kfN3qcusODM
 ElbmzFBFsuxxzbS5sMzr8ePLXfvcgnHBl38FqX+uhnEs3gYBG7CKsgGL8XebWnmsgDch
 AVCuqgVpuPGCQXoZiZsEnKo7AvsYGuXGpjuLAwDj9p9xqx5HnJBpB7uiuGabeDm88/Ba
 hqnqn/ma/RnDdFGxOiwNqgA4zZAL5O1VFEto3PFeDc05P+fMH5ydkY2BOfQrqe+/XAnT
 6sk80lgV0z0drxTm72lpgMf/F8nKY15pbARfHy1URRjo7EI6/kRGbaQxaic405MH/IPE
 mhYw==
X-Gm-Message-State: AOAM531oxwkdMxxXtc+4ePGRcWuQpjImGUDb2BnTjXIWM8i0eno65dQn
 6ziyBGi5zeUlut0HvSUWQm850w==
X-Google-Smtp-Source: ABdhPJwr+hjL0uMcK/Q5QIpLSC7Q9MUdyrpyQWdN5SVq1vUp6X7hyu144cIhF6I6HjOgCSbt6DIeHg==
X-Received: by 2002:a17:90a:5b10:: with SMTP id
 o16mr34466237pji.76.1625838442315; 
 Fri, 09 Jul 2021 06:47:22 -0700 (PDT)
Received: from localhost (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id p10sm6514995pfn.147.2021.07.09.06.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 06:47:21 -0700 (PDT)
Message-ID: <f8b149b7-366d-f5cd-7820-7e5ceab0157d@ozlabs.ru>
Date: Fri, 9 Jul 2021 23:46:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <d18ddc97-2293-bd5e-f91d-2cc2cf1fcf89@eik.bme.hu>
 <83533520-a1b6-29b3-66ee-c770ee2ff80c@ozlabs.ru>
 <433d7bea-60be-2962-4974-ba74ea4fe84@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <433d7bea-60be-2962-4974-ba74ea4fe84@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 09/07/2021 23:28, BALATON Zoltan wrote:
> On Fri, 9 Jul 2021, Alexey Kardashevskiy wrote:
>> On 09/07/2021 08:34, BALATON Zoltan wrote:
>>> MorphOS still boots but this breaks Linux which changes a few things 
>>> in the device tree to fix it up to make it look the way it thinks is 
>>> better.
>>
>>
>> What are those things? What does the change break precisely? Does the 
>> kernel stop booting?
>> Can you please send output with the trace_vof_setprop tracepoint enabled?
> 
> It's fixing up some props that on Pegasos2 firmware are not how Linux 
> expects them.

Why does it need to fix them then? You are building the FDT in QEMU, 
built it in the way Linux like and then you do not depend on the kernel 
fixing them up. What do I miss?

 From traces I see that (besides PCI) it mostly sets props for 
linux-initrd/bootargs which you rather need to handle to keep the 
machine's properties and the FDT in sync.


> Without this it's not booting. Attached is the trace 
> output with VOF v23 as it is now (nosetprop) and another one after the 
> patch that adds setprop callback to pegasos2 I'm sending separately. 
> That patch restores Linux boot but I still think all this boilerplate 
> would not be needed if we kept the default to allow setprop and that 
> results in overall simpler code. If something breaks becuase of enabling 
> setprop by default (which normally works on real Open Firmware) it's 
> easy enough to debug by enabling vof_setprop trace points so I don't see 
> this adds any value other than making board code more complex.



-- 
Alexey

