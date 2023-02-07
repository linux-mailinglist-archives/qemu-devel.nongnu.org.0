Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14A68CFD6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 07:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPHqV-0007EO-TJ; Tue, 07 Feb 2023 01:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPHp0-0006Z6-Ls
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:51:19 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPHou-00054Q-8v
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:51:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so12415374wma.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 22:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GOZnn0xAf2BLigO826JIf+6VgZ1eVU4Y30duOgi4FUU=;
 b=q57+NTBfqmFAxxN+7UGnabWdfp55PhtPzQ/kIDj8zTSZxzGKemvqn6vyqxEseOFSom
 P7vyMOToqoWSOjSci87STB/z0D0tzhNId+co47pDhdiiubZbys93jywFQqNeqLDe7Ifv
 PpGq9SSnlw8ZyJbgaoyjes72sv5l5r2i2kP4o0Hgx4YoQDAV6wPKANHNG/+geXbE4bk1
 R/xP8sS0XiO7SSCtv/VP9a8Z42v4JW5aKDtv6FZTxSwS2KlSScHmOMPr7EerQpfWPakM
 hiAqI5SNPkdteLQRSVWdqTarw+VYqTXWYGeZgzjWmVUAZJAfF0JYgXYD5jkEBSLhifwW
 tScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOZnn0xAf2BLigO826JIf+6VgZ1eVU4Y30duOgi4FUU=;
 b=11qsDBkoDxlQdGjgibbyxgXkFTaxcekmXtT+8U7Svio5UIpNE0fS9Zlm8ByWqbKU5D
 t1o8uJ5pMLWKLJdkWDU4IFVc2Xjf5LOPnJxZu5j8fNk3CXzgcjIuYPc04s1EYApHnaAb
 fZUvY6LYrrVww44x3JD8BMCjCF2wBz148KeOsoO6rVovv5CJkbcCxZ9ohwx7X8FWLnqU
 z7QrC7XK0oNDedypJ58g/rXJmG2PNUr3UrHlFVvJf8MxnEUKwyCfKmhP4ZoO5jtQpafQ
 zgtlBk7z8nixtMeFtk2OPZbnO0VZxc07Md5s4tynUKOx5OHHRWXzDhRt0e1uUH+nX6Fy
 ux+w==
X-Gm-Message-State: AO0yUKU//i5BxXunmzA+15fMNG2ocdKHsWXkPTUktlSOIC3Gt7WPUpxG
 Q2j3H1ZB4tK8CeWbbYxuaNxWuw==
X-Google-Smtp-Source: AK7set/hx7DuTHKE6fQKBVJ1x1p9aNS83jnRu1s6lm8R/BRoDn+8RtfjQCWauWnj/Ma5WcBb9YF3NQ==
X-Received: by 2002:a05:600c:3596:b0:3df:d431:cf64 with SMTP id
 p22-20020a05600c359600b003dfd431cf64mr1945066wmq.39.1675752670604; 
 Mon, 06 Feb 2023 22:51:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i6-20020adffc06000000b002c3e28d0343sm6576355wrr.85.2023.02.06.22.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 22:51:10 -0800 (PST)
Message-ID: <98911d1f-59fe-4939-b022-c27b1013d9c1@linaro.org>
Date: Tue, 7 Feb 2023 07:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: cminyard@mvista.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 Doug Evans <dje@google.com>
References: <20220131222948.496588-1-venture@google.com>
 <20220131222948.496588-2-venture@google.com>
 <CAGcCb113A8y0zgXKvLjZEZJeMu-kDpJp0f5tUPyH--WfH36sLQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAGcCb113A8y0zgXKvLjZEZJeMu-kDpJp0f5tUPyH--WfH36sLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/2/23 00:24, Hao Wu wrote:
> Hi,
> 
> It seems like this patch set is reviewed but never merged. Who should 
> take this patch set? What are our next steps for them?

Having some interest in interaction with emulated analog world,
I could have an overall look at hw/sensor/. Co-maintainers welcomed!

> On Mon, Jan 31, 2022 at 2:29 PM Patrick Venture <venture@google.com 
> <mailto:venture@google.com>> wrote:
> 
>     From: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
> 
>     SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
>     interface that reports AMD SoC's Ttcl (normalized temperature),
>     and resembles a typical 8-pin remote temperature sensor's I2C interface
>     to BMC.
> 
>     This patch implements a basic AMD SB-TSI sensor that is
>     compatible with the open-source data sheet from AMD and Linux
>     kernel driver.
> 
>     Reference:
>     Linux kernel driver:
>     https://lkml.org/lkml/2020/12/11/968
>     <https://lkml.org/lkml/2020/12/11/968>
>     Register Map:
>     https://developer.amd.com/wp-content/resources/56255_3_03.PDF
>     <https://developer.amd.com/wp-content/resources/56255_3_03.PDF>
>     (Chapter 6)
> 
>     Signed-off-by: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>     Signed-off-by: Patrick Venture <venture@google.com
>     <mailto:venture@google.com>>
>     Reviewed-by: Doug Evans <dje@google.com <mailto:dje@google.com>>
>     Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>     Acked-by: Corey Minyard <cminyard@mvista.com
>     <mailto:cminyard@mvista.com>>
>     ---
>       meson.build               |   1 +
>       hw/sensor/trace.h         |   1 +
>       include/hw/sensor/sbtsi.h |  45 +++++
>       hw/sensor/tmp_sbtsi.c     | 369 ++++++++++++++++++++++++++++++++++++++
>       hw/sensor/Kconfig         |   4 +
>       hw/sensor/meson.build     |   1 +
>       hw/sensor/trace-events    |   5 +
>       7 files changed, 426 insertions(+)
>       create mode 100644 hw/sensor/trace.h
>       create mode 100644 include/hw/sensor/sbtsi.h
>       create mode 100644 hw/sensor/tmp_sbtsi.c
>       create mode 100644 hw/sensor/trace-events


