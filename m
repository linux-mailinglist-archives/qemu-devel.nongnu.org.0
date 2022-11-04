Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F62619416
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:04:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtXg-0006rX-1R; Fri, 04 Nov 2022 06:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqtVv-0003L3-GG
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:01:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqtVt-0000zi-Cz
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:01:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id o30so2715826wms.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZgWQyL9IDx1xkcAYmfb4xJdmkf5TIHKpAlyn018hqMg=;
 b=Uj5dZeKNSbryGRZQ0UcYvK+1awe00UOTWkZ7c4a6bLNdS/t4UISV6Wyn82vQ5TXOqu
 9dJcFNEMJym30wqkALVJm9KnV3hn/OanA5LRe7tO2+TMYzlcTItWuvOGnBy9yneo1nII
 pDfUWspgw4HVSs23lWUxJrcf87dP0jBXZtJNp63c8rSeEycBe82FUHh1MD3YEFZ2vxDr
 yKTq+gOqtBCDOvCYABygSCwQio51jUJNy5noItZAWrximAxVR5YZwQvGQdOL1ALX9eI5
 MDXN5/GKXsUYZXOD10m4pGtfuPXnHKN/416llmKmfVKv5RhVVz0ax5nru8JUzwUr2OHF
 pYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZgWQyL9IDx1xkcAYmfb4xJdmkf5TIHKpAlyn018hqMg=;
 b=2zGFKdYJyDGFD5b+4lUAQGI1IuvlWDDZJXwmlzYETwFDYEXtajJKI25fmowWspiSp2
 kul5PdBEqqrhk1BLrcow9ALWdQIxnmalL/6FjCZbIV/hN+VSZTQBIlwDD/U1st1xDJBH
 A/fTR4ssKP+Elmt3zi7Cq/YQpDYflLpwQ30RP2lecWXC6sStTIf0GCTWX1Ns2bwc/NBT
 Zu9YCPZCcbsfrzS7srcs4AI5Sn2LdHum76kKwvcP3eVvCPNAWpWtuDozDKjc+0my+tFT
 PXI062/Sba41u1avwxjQ+E6NZxqFcUUAXAOyc7bdLZWcnsAmFzcHh9ePj1mdjR4E1zI2
 rOkA==
X-Gm-Message-State: ACrzQf3vry3JxAzxIB40XdfJuIXlLTGRYGBMupfPxfMuh24/WNjirjla
 41aedQkXHGXtXMTDZoiOugi8Gw==
X-Google-Smtp-Source: AMsMyM4Drl1Fmhidlkjq+2RU7A1+yYibdiAplz3m9p7QxMEaWV85zSsVGXmICjoT9hJVaCqiXt12Tg==
X-Received: by 2002:a05:600c:1508:b0:3cf:6cc1:c3b4 with SMTP id
 b8-20020a05600c150800b003cf6cc1c3b4mr20057054wmg.156.1667556077952; 
 Fri, 04 Nov 2022 03:01:17 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c1c0f00b003c21ba7d7d6sm2480685wms.44.2022.11.04.03.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 03:01:17 -0700 (PDT)
Message-ID: <63718a3c-e8f5-579b-3d23-41b0d992ea19@linaro.org>
Date: Fri, 4 Nov 2022 11:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3] linux-user: implement execveat
Content-Language: en-US
To: Drew DeVault <sir@cmpwn.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>
References: <20221103173212.3724698-1-sir@cmpwn.com>
 <b22ae5f1-41d9-3739-e219-a717b7ab8b98@linaro.org>
 <CO3F6B8K38DE.1OTGB55K8CMB2@taiga>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CO3F6B8K38DE.1OTGB55K8CMB2@taiga>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 10:55, Drew DeVault wrote:
> On Fri Nov 4, 2022 at 10:53 AM CET, Philippe Mathieu-Daudé wrote:
>> Splitting this big patch would ease review:
> 
> It's only +165/-131, are you sure it really needs to be split?

I tend to ignore patches over 120 lines of change :)

In this case it is about execve(), so critical enough to have me
spend the time to figure out your changes and decompose them.

Think about someone looking at your patch in months and not having
to do that decomposition again.

Anyway, it is up to the maintainer who will merge your patch ;)

>> 1/ Replace safe_execve() by safe_execveat()
>>
>>      -safe_execve(exec_path, argp, envp))
>>      +safe_execveat(AT_FDCWD, exec_path, argp, envp, 0));
>>
>> 2/ Extract do_execve()
>>
>> 3/ Convert do_execve() to do_execveat() adding dirfd/flags args
>>
>> 4/ Add TARGET_NR_execveat case


