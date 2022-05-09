Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC151FD3C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:50:01 +0200 (CEST)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2ps-0001IO-Tu
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1no2h8-0004fY-Ho
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:40:58 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1no2h3-0008OH-AT
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:40:55 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r192so7754373pgr.6
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7bSmEUZzsI64AguIEEl87s1ISPoy24+xy5/14maABDE=;
 b=lg/kHLUpgm75OZlEpsWbxwXwmdOm26WP9fbO2RDHZE7+kapkjGV6SMdtE15GkT/bqr
 Stfh7t3+xMKrhhX0CnIUbca/0SvmvUynJ1vfdSBqDI9BNiEsGYXdNk9HpJAVG2NWaiC/
 +tdFehDZZl5TBDFTMMlFsZMv+VlCBpC0Yf6xoQZHdCY+1pHbEDemc53ppBpL/x+Onbog
 gOZqB0h1+jpBPegEpjJ3PuwTvxR8IvcK1TWKVS2UyXOyMVnIr0uCOt5FhObMRz3CP0fx
 WCZLyy6tuiB4KSKe9kYBcJy7ArRulGX8JjeATiEmVyYHH737MhQlKU2+zNo2zURr4lnh
 S/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7bSmEUZzsI64AguIEEl87s1ISPoy24+xy5/14maABDE=;
 b=0IxkFY6WQMN/eLu/PifAAPDlf3HlE3AQjxL+keYW840G96IsVY+Ae12Exfde+ZsN+j
 tmG1g4xZQV++pF8+cVy84xQZ7XZn3t7c+BV8Nh6IlJF680DWfGujW7c6r54iyvlK8/Un
 oD/6NAJomaa/3IRUvupSU3MkH7y2rucj72GxY/yizAwxKXv8KZp0r8q5o/Gp9lI4CAnR
 DzjgY/uaV5FNr+zKOrIioOwawxmJ31ZthlDLE6nh1JmTGSOHK9P4glQfkWk5n+HWhVfB
 isORHMPkfTOkgbp99JDWjAlxBJb11Z1uv8MrvjoUtRH+eMPejd0TAWGeAje4JmUN38T4
 sQFw==
X-Gm-Message-State: AOAM531qHcrrCnlXIBZLM+f/k6IDSNlKdTS4L4uX1EFDWYtLilj5NLPD
 f2mt857q1KaHaSHdIGCRcfwDrA==
X-Google-Smtp-Source: ABdhPJyVveHuMpDn5mtmhLidafit2qkjvqQgWNoIhdAQtY51j56S5U9XU5GNNUKIPi7tES8hfNpZnA==
X-Received: by 2002:a05:6a00:1707:b0:50e:23d:834f with SMTP id
 h7-20020a056a00170700b0050e023d834fmr15932109pfc.82.1652100051641; 
 Mon, 09 May 2022 05:40:51 -0700 (PDT)
Received: from [10.255.89.252] ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 v10-20020aa799ca000000b0050dc7628166sm8581525pfi.64.2022.05.09.05.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:40:50 -0700 (PDT)
Message-ID: <1d3ffa3e-24a2-967c-4353-04fc5280bad6@bytedance.com>
Date: Mon, 9 May 2022 20:36:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Re: [PATCH 0/2] hw/nvme: support smart AEN
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
Cc: kbusch@kernel.org, k.jensen@samsung.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, hch@lst.de
References: <20220507072644.263105-1-pizhenwei@bytedance.com>
 <Ynj3OArUqeiCMyVc@apples>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Ynj3OArUqeiCMyVc@apples>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/9/22 19:12, Klaus Jensen wrote:
> On May  7 15:26, zhenwei pi wrote:
>> Hi,
>> In this series, firstly introduce smart related bits of aen cfg, then
>> support this in oaes.
>>
>> Linux guest does not support this currently, I also send a series to
>> enable smart AEN:
>> https://lore.kernel.org/lkml/20220507065026.260306-1-pizhenwei@bytedance.com/T/#t
>>
>> Test the two series together, works fine.
>>
>> Zhenwei Pi (2):
>>    hw/nvme: introduce smart bits of aen cfg
>>    hw/nvme: support smart AEN
>>
>>   hw/nvme/ctrl.c       | 9 ++++++++-
>>   include/block/nvme.h | 8 +++++++-
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
> 
> I'm not quite sure what you are trying to achieve here. Bits 0 through 7
> are reserved in OAES, they are not optional.
> 
> We already simply accept whatever the host configured with the
> Asynchronous Event Configuration feature. And you added the support for
> triggering custom AENs for those through the monitor.

Oh, sorry, I misunderstand OAES[7:0]. Thanks for pointing this out!

-- 
zhenwei pi

