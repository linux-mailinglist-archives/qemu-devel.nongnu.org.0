Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA1538C5F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 09:58:44 +0200 (CEST)
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvwm3-0006vB-Qy
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 03:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwkD-00055J-07; Tue, 31 May 2022 03:56:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwkB-00029t-Bu; Tue, 31 May 2022 03:56:48 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so1517731pjq.2; 
 Tue, 31 May 2022 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OxgTX07XLwQ1qt89MWReO9EHg1AGoMSluz2uN1rxANY=;
 b=AHpiESlXTvgImwcQo8SSRtUsRPoAC1Pt5yuIsso5XCbnCP4CklA7WUoTeTsAbKs3Ds
 6jRqvR2ucQQmYdsa0wSaCWfftUDJ8x+ZARuQHHl8nc/TIajQLCl5Gh+d9En9zMlh83dK
 v2QSVEIUXQ31pZr7Vkq4zUfBZWhCNr85K+0tYJQ7Xwr5iaE/rv/KnP1MfhFKjpzD+PQl
 3fVA0BXX+gyuEURAgh9oiSXIhXb1i+K5PqA07FB8YAY2anmBh5LvrmXT9CKVxfeAQv5c
 WQe0TOcRWThmoIcjBicfCplXZV8eXDg9pbLtfdonvXnwdAbcR39eOWMqnX5CBX4VTk8X
 GPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OxgTX07XLwQ1qt89MWReO9EHg1AGoMSluz2uN1rxANY=;
 b=ynojdQ6q5tN4uiKQQ3nWGYxRpVZwMjmfOc4jSTtiARiRMfyNzD7BoBPGj+XBdIASw8
 pCtmjvvZCa41MQm6QOCgpKPU2NYoxPatVhlzQ4iiSzm0FnfSfOJf+OyJVkDdLy/OSdod
 nTlVnAti8xRX0hR9TyQvXA+3F2GJy0GZcGhN486rdUqvK9XOr+tNnTgS7AsZ5tMb9v3T
 yYX2WZSvADDLsff8Np6vthtEd3AAZUwnZqFzSDuxUTQyQaA7M+eGWpBnmDj8jnCypFDA
 yCMzUBzTW/FU58iGpjQ9vYbyNvco08WRxurmqnkRXEmsuKPEiV/pUQ+kuBAsHAkWA38g
 C2Qw==
X-Gm-Message-State: AOAM530qcFXVAhE1HBqoizGSJgdyHUYSsnmHOBJ+7X/OfsyiXn29IAhp
 SMnQnoe1ga0XdsHYNK9zOV0=
X-Google-Smtp-Source: ABdhPJx58C7w/d/H6cnoFG58ZhkVHtR92oreURyK57/WkixQjpeIIOgFZcqU7+TCrU77EzG7q4eSLQ==
X-Received: by 2002:a17:90a:1d1:b0:1dd:220a:c433 with SMTP id
 17-20020a17090a01d100b001dd220ac433mr27824647pjd.196.1653983803749; 
 Tue, 31 May 2022 00:56:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a17090a8b8300b001e2afd35791sm1122384pjn.18.2022.05.31.00.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 00:56:43 -0700 (PDT)
Message-ID: <9dcf841f-2608-b815-f651-31ccff0ba055@amsat.org>
Date: Tue, 31 May 2022 09:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/25] hw/sd: Rework models for eMMC support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <a4496a43-3332-76b7-e4c5-7ab27a7b988c@kaod.org>
In-Reply-To: <a4496a43-3332-76b7-e4c5-7ab27a7b988c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 31/5/22 08:31, Cédric Le Goater wrote:
> On 5/30/22 21:37, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Rebase/respin of Cédric RFC:
>> https://lore.kernel.org/qemu-devel/20220318132824.1134400-1-clg@kaod.org/
>> (sorry it took me so long guys...)
>>
>> Pushed at https://gitlab.com/philmd/qemu/-/commits/emmc-v2
>>
>> I plan to queue patches 1-12 via sdmmc-next later this week.
>>
>> Cédric, if you are happy with this series, it should be easy to rebase
>> your other patches on top and address the comments I left on the RFC :)
> 
> Sure. I will for the first patches to be merged and I might introduce
> a base class.

Then consider patches 1-13 queued.

> Thanks,
> 
> C.
> 
>>
>> Regards,
>>
>> Phil.

