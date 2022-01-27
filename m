Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B333649DC53
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:13:08 +0100 (CET)
Received: from localhost ([::1]:48422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCztz-0003o0-Ff
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:13:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCzYu-00089Q-MM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:51:26 -0500
Received: from [2a00:1450:4864:20::429] (port=39672
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCzYs-00005B-OA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:51:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id s9so3101222wrb.6
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1HQ/FJaMmT/vIw2AaoQsrT8fWzd+0mAV16fK0DbF9L4=;
 b=INQGztOl8Kf2FGnaN0/meVzweXSnk2Q5bdoKwTKyzzoPEx1uOVA9zPfPkEIYTOexxt
 N/RHyaCEHQQp0j9Oiql5TzEnUVHxNC7pA36TAye+Y6UZ6thjud1Jyyh6/5OMqcogCYV2
 ZS77xmI8NfDbCJEHr5aJmpLcsmtHz21Oa+0LVbXLpjpTmMlLcFRIIk9NmxHGotxub5QF
 uuIp3K9MIdd2ZSBxppkC0AMlutx07G+Nw5F5rnEk68Azpo0QKs6R/hd2RVtFdVYfQTaX
 K2dTQrbuC552+F6xyCJDFDownx8J7TcGsHHU5AbpA7eoezpm/7h7yb0lLxBznUsODEAl
 OxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1HQ/FJaMmT/vIw2AaoQsrT8fWzd+0mAV16fK0DbF9L4=;
 b=7PtW/Eun8XXWsMMo+CVsd2J2XKMKUpU+hYQ7io4gZuVfitcZZEvHPmtDpfBgIl52Uo
 1oMcqzhyr8bFb8fpX5ELp2/1tLVP8Lshs/JMkCiBldhXUCD5XJ0VF0skIQXyo39nEq79
 YoiUkW+ctuFOoP6iwmz4K82tumzb2VgyWeaDU0UawdwqboGm2T+pA0rAO0DCJt6apnhx
 GlRPH97Hd3WPa0vB/5Ea+A6g2oMTTh01mqo1Frz0s4/YQtjyKCtKqIjDYWbrwNWGWJkL
 KNieuJT9t7byCYSt5Go8uTtLXxO0kQHXu5tIiFf/iCpyHgRQtzEzzLQ4ubUF7bVYetsH
 Gljg==
X-Gm-Message-State: AOAM530o3aPpVkDV10PZu9/2N2G3HEdAgD/cxc7jmlYt7lbt4/YqyHPV
 dALi1UYVDu7q/RyTgiPt7fU=
X-Google-Smtp-Source: ABdhPJy+NyepzQjAqRGnpWtwM/jcJko+j9tOFtf+mdfuWqU7Kh+OaC6yfk1ze4rFI4CnKG5HE3Zwbw==
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr1956541wrw.245.1643269876895; 
 Wed, 26 Jan 2022 23:51:16 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n15sm1741742wrf.37.2022.01.26.23.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:51:16 -0800 (PST)
Message-ID: <ccd1ccae-d9eb-8873-ded4-8caca5985b80@amsat.org>
Date: Thu, 27 Jan 2022 08:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20220120001242.230082-1-f4bug@amsat.org>
 <20220126165143.29352fb4.alex.williamson@redhat.com>
In-Reply-To: <20220126165143.29352fb4.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Alex,

On 27/1/22 00:51, Alex Williamson wrote:
> On Thu, 20 Jan 2022 01:12:40 +0100
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
>> This is a respin of Eric's work, but not making tpm_crb.c target
>> specific.
>>
>> Based-on: <20220120000836.229419-1-f4bug@amsat.org>
>> "exec/cpu: Make host pages variables / macros 'target agnostic'"
>> https://lore.kernel.org/qemu-devel/20220120000836.229419-1-f4bug@amsat.org/

[*]

>> --
>>
>> Eric's v2 cover:
>>
>> This series aims at removing a spurious error message we get when
>> launching a guest with a TPM-CRB device and VFIO-PCI devices.
>>
>> The CRB command buffer currently is a RAM MemoryRegion and given
>> its base address alignment, it causes an error report on
>> vfio_listener_region_add(). This series proposes to use a ram-device
>> region instead which helps in better assessing the dma map error
>> failure on VFIO side.
>>
>> Eric Auger (2):
>>    tpm: CRB: Use ram_device for "tpm-crb-cmd" region
>>    hw/vfio/common: Silence ram device offset alignment error traces
>>
>>   hw/tpm/tpm_crb.c     | 22 ++++++++++++++++++++--
>>   hw/vfio/common.c     | 15 ++++++++++++++-
>>   hw/vfio/trace-events |  1 +
>>   3 files changed, 35 insertions(+), 3 deletions(-)
>>
> 
> Unfortunately, FTB:
> 
> ../hw/tpm/tpm_crb.c: In function ‘tpm_crb_realize’:
> ../hw/tpm/tpm_crb.c:297:33: warning: implicit declaration of function ‘HOST_PAGE_ALIGN’ [-Wimplicit-function-declaration]
>    297 |                                 HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>        |                                 ^~~~~~~~~~~~~~~
> ../hw/tpm/tpm_crb.c:297:33: warning: nested extern declaration of ‘HOST_PAGE_ALIGN’ [-Wnested-externs]
> 
> This is a regression since Eric's v2.  Thanks,

This series is based on another patch that Paolo already queued
(see [*] earlier).

Next time I'll try to make it more explicit.

Regards,

Phil.

