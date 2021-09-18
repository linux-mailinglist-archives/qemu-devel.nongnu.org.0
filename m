Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5937D41057E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 11:34:00 +0200 (CEST)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRWjP-0001ow-EI
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 05:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRWhM-0008Fr-54
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:47039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRWhK-0003ar-IS
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id x6so19129178wrv.13
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=IGojhCVmddLqlfXqivwB5525RsOzz98roY56xHNtRUU=;
 b=gTqnkXPWhmm0rhJ4db1Q5WZ64p8vpCI1xIni/uDeyojPKd9gBIGpc0stLMnzK6/rL1
 1F2LOtN7QLEmCHj7XLcQ31e4lD+ChFUv8Krecvn37JRM6TWb0bAvRGUzQSFXlKa3SHGy
 geOmkRXB8Skm0N6Qo+sIcYgnJ23h0OIbtRbGiqbibGxCQkIU38QNqLM0qHhOmsMirUhZ
 YnYNMiiEpLc8gl5kKUkUhvciVO8orUh5zthnQLXlXRnVTXDNIkFhvCiDmdgsIrR6kBhb
 fQWkkTe3rypLIwj7Xzgfkp18YhX2thRG8Q7blWJ+4ZF8mHd1Sawrq9XFWwP9QIzH31gg
 7viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=IGojhCVmddLqlfXqivwB5525RsOzz98roY56xHNtRUU=;
 b=W4V5naaDiORz0lwd13TVBITJyVYNxRxz/5kx2IcF6067vmi4t7CfLkOzoondN1GVOy
 Ns9UmgO2YF+fdsoSWF1agkz/o/gltL5CMFBGJM0YcnLg0QqBfFltu9jjjUUj+uYXHK+b
 QVb/iI2+MBMeWxwPyCKiOOOZxaLXDBkZGL0Mr/cGA1acvLxUr45uGDnRmJ1bFweq7mUT
 Ap8APcP06vscByZJBdFMh+I+Oyf/Ye3F9MNscebORYWXUb5YZC+WMA1Agjb1fOmtWbn/
 5XuA6U3iNCcsWtJJjeGEcAGviW/007TloXx0MARd04PDj1RLHUMH8lqZffjRMxjA1CiS
 B4Rw==
X-Gm-Message-State: AOAM533ZLIUePfRPmsL/KL7Wmlnd4tx7iTuViS9zBuvAEhWCXCcuolwy
 oBnVW4pB4xcRffnc17n9T4PrfuP5hSE=
X-Google-Smtp-Source: ABdhPJyrOrHBSFfKgoxuc2ULOQMn7Sdf+IQPMmx0SAJZywwM/eku62o+8+DQ0mB1OmEgNpWEUwuP3g==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr16865145wrn.238.1631957508993; 
 Sat, 18 Sep 2021 02:31:48 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id f8sm1301712wrx.15.2021.09.18.02.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 02:31:48 -0700 (PDT)
Message-ID: <282bb2b4-fa32-edd5-1a2f-3ed3d64592cd@amsat.org>
Date: Sat, 18 Sep 2021 11:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/2] coverity-scan: Add accelerator and sysemu
 components
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210708155735.1805767-1-f4bug@amsat.org>
 <d5b87a24-5fa3-eb9f-4105-76342f24f790@amsat.org>
 <ae47059f-623b-2499-8eaf-7d44ca3104e9@amsat.org>
In-Reply-To: <ae47059f-623b-2499-8eaf-7d44ca3104e9@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping^3

On 7/31/21 17:25, Philippe Mathieu-Daudé wrote:
> ping^2?
> 
> On 7/22/21 6:08 PM, Philippe Mathieu-Daudé wrote:
>> ping?
>>
>> On 7/8/21 5:57 PM, Philippe Mathieu-Daudé wrote:
>>> Add 'sysemu' component for issues not related to TCG.
>>>
>>> Since v1:
>>> - add accelerator components (Peter)
>>>
>>> Supersedes: <20210619091342.3660495-1-f4bug@amsat.org>
>>>
>>> Philippe Mathieu-Daudé (2):
>>>   coverity-scan: Add a component for each accelerator
>>>   coverity-scan: Add 'sysemu' component
>>>
>>>  scripts/coverity-scan/COMPONENTS.md | 17 +++++++++++++----
>>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>
> 

