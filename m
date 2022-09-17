Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA805BB8F8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 17:09:33 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZZRk-0001Gr-2l
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 11:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZZOu-00085x-Gy
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 11:06:36 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZZOs-0007ic-Lr
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 11:06:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so1536248wms.4
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ImllMbRenHcyE4TdZi0qeeJXIz0SFhrRMBF9piDjhOQ=;
 b=PSjuuIOA84KsM0FfTJDW3Gp2iNY+FGqaytRzOqzgEEW0uVZVrcbG5rqwp1j3l9wiO+
 QOyVwHq3WSwM1+Fvx8i+TNSPT4261UByNO2VVBiJ/CG7lB2kgO+gmb/ZBZo3gX7PWU+1
 +8h+3kiGVMZhas0gPlF6KJKqywR3rkshylBp5l6Mp2dyYaHUItN2rs9OhuY2wKGpzYKX
 /OWGroslRtvuvO9S32lBoZCzWwDIQf/H+z99RyBdZxxzHVRrp0Rh760yvICy9xaS6ZH6
 K4BTzl/ZcyQ3Psi0c0lA6TIX2kM2ZDNAkMNmjPQPWpaP9trutbNFrlk9N4szfXNxghVx
 EB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ImllMbRenHcyE4TdZi0qeeJXIz0SFhrRMBF9piDjhOQ=;
 b=5rBcW4mBveBq+TX17U+dQ1dqsJNWrCkR2iV2FGo7Ez+8AFyIz3hVMtEH52UiWSKU+5
 U9ExxxybMtmQHAxqN2vGTuR4boxs/jcPF7xPT0NUnCGYvYryX+I+LwMTpPviyAJX1/PG
 l/bpBOVBY+IfVrrk+MEixKpWF0UwuQpDx+23GH0RzI2wdJDwJbCWjuFzHYwwG5j4iGOG
 m+Gyk2smqdhAThGco54NOPIonsOY0Gg7dYNOICu5U7dqs255LKJjT3HDo2k3eU5XXrK2
 NRcphFBX7VjnU79IyCQRHuWFU7g3qpUe9/93+wcS/HbXK74X2NgaM20VOppK7Yi7KZ1F
 RkKA==
X-Gm-Message-State: ACrzQf1bwwVl51qPvGz/4H1Xa7xXQrJh2FaaNhTDgLEWF2bwi1DoSkw9
 ctVXV8lDVn7rThhI9bXVcrw=
X-Google-Smtp-Source: AMsMyM6gSf/s/vYf+AGK4zuBueIFYSQg8n6tEbRWwRwFawjCw6T6+204qHfQC2ur8gGZ5zB++qxXcg==
X-Received: by 2002:a05:600c:4e44:b0:3b4:bed2:4f5e with SMTP id
 e4-20020a05600c4e4400b003b4bed24f5emr5252882wmq.193.1663427192821; 
 Sat, 17 Sep 2022 08:06:32 -0700 (PDT)
Received: from [192.168.33.3] ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056000124d00b00228dc37ce2asm7826793wrx.57.2022.09.17.08.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 08:06:32 -0700 (PDT)
Message-ID: <a54bbe37-c925-45f2-ce87-eb877c1fad6d@gmail.com>
Date: Sat, 17 Sep 2022 18:06:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] hw/display: load the correct ROM file for isa-vga
 device
Content-Language: en-US
From: Liav Albani <liavalb@gmail.com>
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org
References: <20220917143229.115580-1-liavalb@gmail.com>
 <e81d29db-a8b1-0835-9f52-53e1519d5b1f@gmail.com>
In-Reply-To: <e81d29db-a8b1-0835-9f52-53e1519d5b1f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.529, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 9/17/22 17:40, Liav Albani wrote:
> On 9/17/22 17:32, Liav Albani wrote:
>
>> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
>> index 388e0db6e4..6af94a4a0a 100644
>> --- a/pc-bios/meson.build
>> +++ b/pc-bios/meson.build
>> @@ -29,7 +29,7 @@ blobs = [
>>     'bios-microvm.bin',
>>     'qboot.rom',
>>     'sgabios.bin',
>> -  'vgabios.bin',
>> +  'vgabios-isavga.bin',
>>     'vgabios-cirrus.bin',
> Well, it seems like this one doesn't want to be compiled now, so I'll 
> need to dive deeper to figure out how to ensure it always produces the 
> requested file.

So apparently the problem on my development machine is that for some odd 
reason I don't have the "vgabios.bin" file, but I do have
the "vgabios-isavga.bin" file. According to my package manager (pacman), 
it is owned by the SeaBIOS package:

     usr/share/qemu/vgabios-isavga.bin is owned by extra/seabios 1.15.0-1

Other files in that directory are owned by the same package as well, for 
example:

     usr/share/qemu/vgabios-stdvga.bin is owned by extra/seabios 1.15.0-1
     usr/share/qemu/vgabios-virtio.bin is owned by extra/seabios 1.15.0-1
     usr/share/qemu/vgabios-vmware.bin is owned by extra/seabios 1.15.0-1

So I'm not sure what is the best approach here to fix this. It is 
definitely not a problem in QEMU because when I compile it from source I 
do get a "vgabios.bin" file in the build directory, but I do think that 
QEMU should try to use the "vgabios-isavga.bin" file when using the 
isa-vga device, so in some way we could fix it in QEMU, which also makes 
sense to ensure the filename is "vgabios-isavga.bin" for the isa-vga 
device and not plain "vgabios.bin", which really doesn't say much about 
the type of the graphics device.

>>     'vgabios-stdvga.bin',
>>     'vgabios-vmware.bin',

