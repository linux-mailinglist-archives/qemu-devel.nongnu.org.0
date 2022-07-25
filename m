Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C2E57FFB1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:19:13 +0200 (CEST)
Received: from localhost ([::1]:43614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxzM-0006py-4M
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oFxwX-000406-VC
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:16:17 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oFxwW-0008K9-9A
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:16:17 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10d867a8358so14647755fac.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3AiK8bpuIWf9xj+ZZl1vQPovFjcoodwMABkvu41rK6k=;
 b=EAaFmNCEqmSvgUyHSSv6uXgmu179aKhAcNLcNI3LTMlT6/hMYE9lIFvP8h0Eqjr6u7
 bNnJKtLOsXzpbcv2CVnKAAL56jP3TRzoxGfRlcfIkYYGjnd8UAJ84acwoO6bMd/l/nQp
 CcEbC3dQRRr3j0tJ1LSeTvRUL/d4OCLx/2nof6msI9O6Fpmf0gpbjXMKe/aK02c+zqVC
 Oio6eqwXXQND3NbKaSd7r3kzbNzdUIakkAyfgO+93jdErmRE8OFK467nfUXO2WLWkfbB
 yuS1wmS8hParNgkFfkudeZkpaZktyvow3oBT23JZzygDmQj1rsWbFe/Mqru6PjtGNmSW
 g+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3AiK8bpuIWf9xj+ZZl1vQPovFjcoodwMABkvu41rK6k=;
 b=f/pe+bfoNBABJ2Tz0gLOkENiBzkfuTINIuaBBw73p3HszuwIMyTWYNFsAuGUQnsQaZ
 aApx+c1/1q7W1m2cs6AanIhwjqp58Hd176DrvrDDwm6KF0GEx1NioMEvxm3nHtzXu17z
 uIVLqQQUZJp4cYbtnK5IEg0RWz1cJVFm0J3YjENBG1wmoRCjyW/CJ0/miZODFT3bQVMl
 8NNAIWYjACuM0LDTbtqPlbAHSw/WvD0C+AONdQ3QyhoES2P1ZVpZ2p2DLYpNi5JcKgFK
 Nh8xWWTvZe/TFVn6u9uTjmZ86yGMhf84ZJ/lVIa+YZXPw0CEVyHNLJ+Fdo7BGC1+FJ44
 pQXQ==
X-Gm-Message-State: AJIora9R4aX+1yIOFVnSGzTGRS3qbNi4Cp1RQDGCUe0qvAbGbgx9ktlV
 e1kUT6889lkdpvdsNwqy6zk=
X-Google-Smtp-Source: AGRyM1syS+3Cs56h6YxL8GUGDTTVNqWM6LGszZBffkOiOp52si9GXMT+0x58hh6XnTv4K3bhi1t6KQ==
X-Received: by 2002:a05:6870:5586:b0:10d:cca6:ab78 with SMTP id
 n6-20020a056870558600b0010dcca6ab78mr5874506oao.94.1658754974668; 
 Mon, 25 Jul 2022 06:16:14 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:1396:9fee:cbb9:2bbd:ebf6?
 ([2804:431:c7c7:1396:9fee:cbb9:2bbd:ebf6])
 by smtp.gmail.com with ESMTPSA id
 p81-20020acaf154000000b00325cda1ff87sm4913150oih.6.2022.07.25.06.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 06:16:14 -0700 (PDT)
Message-ID: <da81ff9a-069b-1a7a-b633-f47696110759@gmail.com>
Date: Mon, 25 Jul 2022 10:16:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 00/10] add hmp 'save-fdt' and 'info fdt' commands
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <Yt5eJDhwdQclX5fY@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yt5eJDhwdQclX5fY@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/25/22 06:11, Daniel P. Berrangé wrote:
> On Fri, Jul 22, 2022 at 04:59:57PM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> After dealing with a FDT element that isn't being shown in the userspace
>> and having to shutdown the guest, dump the FDT using 'machine -dumpdtb' and
>> then using 'dtc' to see what was inside the FDT, I thought it was a good
>> idea to add extra support for FDT handling in QEMU.
>>
>> This series introduces 2 commands. 'fdt-save' behaves similar to what
>> 'machine -dumpdtb' does, with the advantage of saving the FDT of a running
>> guest on demand. This command is implemented in patch 03.
>>
>> The second command, 'info fdt <command>' is more sophisticated. This
>> command can print specific nodes and properties of the FDT. A few
>> examples:
>>
>> - print the /cpus/cpu@0 from an ARM 'virt' machine:
>>
>> (qemu) info fdt /cpus/cpu@0
>> /cpus/cpu@0 {
>>      phandle = <0x8001>
>>      reg = <0x0>
>>      compatible = 'arm,cortex-a57'
>>      device_type = 'cpu'
>> }
>> (qemu)
>>
>> - print the device_type property of the interrupt-controller node of a
>> pSeries machine:
>>
>> (qemu) info fdt /interrupt-controller/device_type
>> /interrupt-controller/device_type = 'PowerPC-External-Interrupt-Presentation'
>> (qemu)
> 
> Please don't add new HMP-only commands. These should be provided
> as QMP commands, where the HMP is a tiny shim to the QMP.

I wasn't sure if this would be useful to be in QMP, but perhaps it's better to
let QMP consumers to decide whether use it or not.

I'll repost both as QMP commands with an HMP layer on top of them.


Daniel

> 
> If you don't want to think about formally modelling the data
> for 'info fdt' / 'query-fdt', then just put an 'x-' prefix on
> the QMP command and return printed formatted data, as illustrated
> in:
> 
> https://www.qemu.org/docs/master/devel/writing-monitor-commands.html#writing-a-debugging-aid-returning-unstructured-text
> 
> With regards,
> Daniel

