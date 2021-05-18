Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0838710B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:15:34 +0200 (CEST)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lis4r-0003Ll-Ca
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lis34-0000sQ-Dg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:13:42 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lis2y-00036C-8Z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:13:42 -0400
Received: by mail-pf1-x431.google.com with SMTP id d16so6531919pfn.12
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 22:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X0OAJxSHAEPE4bD8Weo1kRDZwudjH+pTx3SknWfL0G4=;
 b=vAx24Ok0UuTBDlAFMthHgM94p2zCydB2rIs63S74mp+t5P1WLnCMoE0ZQxTGhcNA58
 X0CadGQe9NrBaNxFoK38oaNlbsEL1A8H3N+Cf1O4CjTM4l9w6eoYnDPlVwGFwlQ2VQ5r
 o5TVZ3csT8WonRrmuRdCF0zCIwRkDWsFP0Lj/58pNnJJG/ZMQRITTv7nlS17ZXPIAVHb
 FAMykOoMOqRj/6vWMtzwkhCWB85W7gMbH5Risx8d6+SoXZy2DF/KfPXW00H/HlzQ6WGG
 uCV74z73KuXz83S1rg479sp8luiy2B83cRnKlkGS0DeDrIDZ9PSD3DK+uPQ5WqqXcQqi
 ulaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X0OAJxSHAEPE4bD8Weo1kRDZwudjH+pTx3SknWfL0G4=;
 b=Jts8b7ZVlyV/FfCrriaIMDr7tM8VraSfiVPerUnSO+lZehCtWmOzi2Pm0pH2TWS8Qx
 vLXMcxwN/4qPKfTjw/PBL+ozDeBpCl5tV4unbwT052yg/T8kWa9e/Kau2yDl3CFSUwyn
 do2rSHc6XFnuxmafJhUeSuPhRqbKLPdpXqQhMR1EmJxu8oK+yqyYzQtHPgtk+dP2Ccav
 b1kJfFITqUztUDtXuqdQfTa08gneQkmHP6cAW0pVzBAUN2OXTSu9eVxnl9NATtVzaTh9
 14hN1GK8DEhluIkKZYSmqp/8T7h/Hw+GlD4+l+Zj5YSKH5s11b3+YwhpcHClIAt9hfzN
 JaqA==
X-Gm-Message-State: AOAM5318ip6kF00c3FLNqBMqmpaWo/detY/Hc0Bm8o7pHpfaVSzBMxO8
 P9D7IJVhoumI4DgKGZy3pfKZvA==
X-Google-Smtp-Source: ABdhPJwhEDFly1fbvEsLfwucsieaFokl6flnpNxscTtGovY1um4BT6FLnHc/ai0ZyZEnW43uVjhFvw==
X-Received: by 2002:a63:3e4f:: with SMTP id l76mr3196183pga.275.1621314813599; 
 Mon, 17 May 2021 22:13:33 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id g8sm873491pju.6.2021.05.17.22.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 22:13:33 -0700 (PDT)
Message-ID: <3e3ebf5b-0adc-974e-4a3c-3c76bcc2ce37@ozlabs.ru>
Date: Tue, 18 May 2021 15:13:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
 <dbdc9e7-b179-6c5e-61ef-297e72e086b5@eik.bme.hu>
 <64a2bb6f-85f-d029-1846-be4d693f7ab2@eik.bme.hu>
 <0ab637d9-d54c-add1-ebdc-1c5c1bdcfdf8@ozlabs.ru>
 <80a6ff6f-c6f8-cefe-b59d-df9cf5fdd342@eik.bme.hu>
 <f9a45179-4c72-66eb-90f8-689e3969f4@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <f9a45179-4c72-66eb-90f8-689e3969f4@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x431.google.com
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18/05/2021 04:44, BALATON Zoltan wrote:
> On Mon, 17 May 2021, BALATON Zoltan wrote:
>> On Mon, 17 May 2021, Alexey Kardashevskiy wrote:
>>> On 5/17/21 09:34, BALATON Zoltan wrote:
>>>> On Sat, 15 May 2021, BALATON Zoltan wrote:
>>>>> On Sat, 15 May 2021, BALATON Zoltan wrote:
>>>>>> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
>>>
>>> [snip]


> invalid/unsupported opcode: 3e - 08 - 1e - 01 (f821ff91) 00000120 0
> ----------------
> IN:
> 0x00000118:  3c400000  lis      r2, 0
> 0x0000011c:  60428b00  ori      r2, r2, 0x8b00
> 0x00000120:  f821ff91  stdu     r1, -0x70(r1)
> 
> Raise exception at 00000120 => 00000060 (21)
> invalid/unsupported opcode: 00 - 00 - 00 - 00 (00000000) fff00700 0
> ----------------
> IN:
> 0xfff00700:  00000000  .byte    0x00, 0x00, 0x00, 0x00
> 
> Raise exception at fff00700 => 00000060 (21)
> 
> The last part jumping to program exception vector is because we don't 
> have any handler installed at that address yet but the first exception 
> is the real problem which looks like vof has another opcode not 
> supported on a G4 CPU. Could it be compiled with some options to only 
> use PPC 32 opcodes or where does this stdu come from?

Agrh. It is "stdu" from pc-bios/vof/entry.S, looks like yet another bug 
since I enforce MSR to 32bit and whole firmware is 32bit too, I need to 
avoid those double word instructions. Also might need -mcpu=power4, 
juuuuuust in case.


-- 
Alexey

