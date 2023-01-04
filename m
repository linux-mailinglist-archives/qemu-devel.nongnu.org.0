Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E1E65CD9F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 08:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCyDn-00054I-LX; Wed, 04 Jan 2023 02:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCyDk-00053R-BW
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:29:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCyDi-00066X-LY
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:29:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so413921wml.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 23:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DqMgMa4L+Hq0ubeoFOYsW8cQuUZxcdArbPdddD804dQ=;
 b=qYKDOeC8d7TQf3rHUq4X63yUqZQv5LHxqijMBzBES0HGBsUCEoRQBg90gr2WRW+CK4
 BzOVYyE1m+/SszdYJk5C/+rgDoE8mbAvARr94rTcX3+km5ijl+J27Lh1xuXTmgmc5onA
 YrjmpaLkkvMr92f9uI5R5264+k+G5W0LWsDKHjP4JETihpLE3SAlKx24Ct8THxXYDAq5
 zW461wcw8hWcU7MbbP+mlGTbg0ecszIT9GJiFkG103+NYZ2cDXFKr+fhPVBsvrj8XnEc
 agWpKFw4W/YcLu8QytzujbZOb7ss5Go8GE/pYf8gSpnVFY9MwiITjGe0BelLxni43zqR
 G5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DqMgMa4L+Hq0ubeoFOYsW8cQuUZxcdArbPdddD804dQ=;
 b=HZ/c2WZyoFoHX/NsU3iFMfTBk7WFYG7zxKe7JRl9ziUgC9VmPCgFJruaiWiYVIc3qu
 UTsrqD6mcOArc85EhXAEbHEgfuUtcGh0PxYJOYaTnJQaddq4j7aUzq9GXx9tonOmjrUu
 3KLZiPEoTbFKEFaqIjnLnmggeb+U7kYpX1BL/Pjx8moDAyy0nhYQNKj09gIjpwVBtC6J
 zmKbPPFkaBlls0/2NddSlO5Pw/oiH3jaLm/7wS/WEt23q8mRc39EHO64+TF/kmxAPxju
 0jvF2VfX6bhBPF4eiNlDEWVQVLcGe/OA5PYNQpi2N5feMb/Nx2r/vAU7rOvWA0khSRkn
 hnVw==
X-Gm-Message-State: AFqh2kocwSuXVvHLA6tTzFvEYb8TZ9uLMI6m2l50Ttev0NhI1U9EokWH
 cyoAE/IdHzyl7aqNpkQ3BlGnzw==
X-Google-Smtp-Source: AMrXdXunwz7GvKtbO/+2CdFYE/XIKPMcClGJagVmsxlC6bD7M/C9N5NC89VvqaUESqai9xdx856haw==
X-Received: by 2002:a05:600c:34d3:b0:3c6:e61e:ae74 with SMTP id
 d19-20020a05600c34d300b003c6e61eae74mr41114607wmq.4.1672817392816; 
 Tue, 03 Jan 2023 23:29:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003cfa3a12660sm1146020wmb.1.2023.01.03.23.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 23:29:52 -0800 (PST)
Message-ID: <9cf47256-2c46-d6d2-6c14-4f3a5eb8ba91@linaro.org>
Date: Wed, 4 Jan 2023 08:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/pci: Display correct size for unmapped BARs in HMP
 'info pci'
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230103164825.95329-1-philmd@linaro.org>
 <6bb76a1c-475e-1fe4-a7b6-8317a4388afd@eik.bme.hu>
 <59dd266e-3884-e3b5-f003-9bc55a33b7f8@linaro.org>
 <3d9d574b-7682-d06d-c8ad-27c6ec2cf6c4@linaro.org>
In-Reply-To: <3d9d574b-7682-d06d-c8ad-27c6ec2cf6c4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 3/1/23 20:45, Philippe Mathieu-Daudé wrote:
> On 3/1/23 20:39, Philippe Mathieu-Daudé wrote:
>> On 3/1/23 18:39, BALATON Zoltan wrote:
>>> On Tue, 3 Jan 2023, Philippe Mathieu-Daudé wrote:
>>>> When a BAR is not mapped, the displayed size is shifted by 1 byte:
>>>>
>>>>  (qemu) info pci
>>>>    ...
>>>>    Bus  0, device  11, function 0:
>>>>      Ethernet controller: PCI device 1022:2000
>>>>        PCI subsystem 0000:0000
>>>>        IRQ 10, pin A
>>>>        BAR0: I/O at 0xffffffffffffffff [0x001e].
>>>>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001e].   <===
>>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].   <===
>>>>        id ""
>>>>    Bus  0, device  18, function 0:
>>>>      VGA controller: PCI device 1013:00b8
>>>>        PCI subsystem 1af4:1100
>>>>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
>>>>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].   <===
>>>>        id ""
>>>>
>>>> Only substract this byte when the BAR is mapped to display
>>>> the correct size:
>>>>
>>>>  (qemu) info pci
>>>>    ...
>>>>    Bus  0, device  11, function 0:
>>>>      Ethernet controller: PCI device 1022:2000
>>>>        PCI subsystem 0000:0000
>>>>        IRQ 10, pin A
>>>>        BAR0: I/O at 0xffffffffffffffff [0x001f].
>>>>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001f].   <===
>>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003ffff].   <===
>>>>        id ""
>>>>    Bus  0, device  18, function 0:
>>>>      VGA controller: PCI device 1013:00b8
>>>>        PCI subsystem 1af4:1100
>>>>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
> 
> Hmm actually here 0x11ffffff isn't the size but the higher address,
> 
>>>>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000ffff].   <===
> 
> while here this is the size. Confusing. Wouldn't it be simpler to only
> display the size?
Or range and size:

   Bus  0, device  18, function 0:
     VGA controller: PCI device 1013:00b8
       PCI subsystem 1af4:1100
       BAR0: 32 bit prefetchable memory at 0x10000000-0x12000000 
[0x02000000]
       BAR1: 32 bit memory at 0x12050000-0x12051000 [0x00001000]
       BAR6: 32 bit memory at 0xffffffffffffffff-0xffffffffffffffff 
[0x00010000]



