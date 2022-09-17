Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6F5BBA20
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 21:27:16 +0200 (CEST)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZdT8-0005xj-OZ
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 15:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZdS5-0004d5-E9
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 15:26:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZdS3-0001zn-1l
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 15:26:09 -0400
Received: by mail-pl1-x62e.google.com with SMTP id jm11so24410791plb.13
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=+BfU50uEsAjOnFkTbrVhXJRUdG9GiEC7JbqragNuuqw=;
 b=lkEgP4bDqYfUZsrqoAp8Yd3S5nZAX78JZ8LpyySE1o8B8be7g10uSvN7eU56nza51b
 JSlc6mrFyCU7ayp1+FFp65yMCXJoqoVDlysauXagpbCBVwJJNwN4MV7Om7UUE3hPbTAc
 uCFZkBzceREw9m9QFmJuOo0nc8Agwutf/3oCuhBz8CD8uoaAzExENiOzDFHoYly8d4w8
 NBkUFhEcUDbHNqgRwe7dfkCtnk1HRxPlsDqCrj6fFV45dbwcusqfpRwglJoO69kEJHSy
 okTkKhwy90OaCllVgLFCnIdZXHv9dBJzFH0tZAEaoYfIZRlwjvqfXUCILiP/kMF0XYVl
 nagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=+BfU50uEsAjOnFkTbrVhXJRUdG9GiEC7JbqragNuuqw=;
 b=Uvc4lxhd8k+lQJ+l7i7tDXfvyDGm46daX6guEhg3sXkHwZkCweyAXEbetcN+qEzBwU
 S0IqaqTMrkV9itmKuvKwr2LBpGMPRHjBVl2SDBf8z1QdatvdTqdpOwdAOtVXBfeuFe0Z
 jPumeXinfkml1Wy98yRLW0EcTmUU9BR/1jniQk7FKtS9+vxhHV5iqjGZ3bxxeweNxSWY
 RHX+sUdklLqaHaZRrrOlujEUQfHqZWIyxVi0em4nLEnh0FHj9feRQ9As1yluypmReEk5
 EGKgkYBbHDG1a8vYpMCo8jQeOSeOdkNEviUHgOBdj4PdPXkN2U0XTj1w29jvfVz+Ju5P
 9Sxg==
X-Gm-Message-State: ACrzQf3qSSQ53BVsfI1aHP6v+9v7FJq3dHlGOlChZbW6dBC4HFKF5Z+Y
 ao/6d9x+BxAOxM0TuURap1Q=
X-Google-Smtp-Source: AMsMyM7PVw0fEYDC64wKI4HGmKFRYjc08rJhivsIGL8bxZwmnbRi9beUM5n1ErJghmBhGa5Zz84jEQ==
X-Received: by 2002:a17:90a:4607:b0:202:d8b7:2c1b with SMTP id
 w7-20020a17090a460700b00202d8b72c1bmr11867161pjg.64.1663442751182; 
 Sat, 17 Sep 2022 12:25:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa79d90000000b005403b8f4bacsm16667630pfq.137.2022.09.17.12.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 12:25:50 -0700 (PDT)
Message-ID: <fb3517c5-8801-c5eb-1147-73189f7fa5d3@amsat.org>
Date: Sat, 17 Sep 2022 21:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2] hw/display: load the correct ROM file for isa-vga
 device
Content-Language: en-US
To: Liav Albani <liavalb@gmail.com>, kraxel@redhat.com,
 David Runge <dave@sleepmap.de>
Cc: qemu-devel@nongnu.org
References: <20220917143229.115580-1-liavalb@gmail.com>
 <e81d29db-a8b1-0835-9f52-53e1519d5b1f@gmail.com>
 <a54bbe37-c925-45f2-ce87-eb877c1fad6d@gmail.com>
In-Reply-To: <a54bbe37-c925-45f2-ce87-eb877c1fad6d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+David

On 17/9/22 17:06, Liav Albani wrote:
> On 9/17/22 17:40, Liav Albani wrote:
>> On 9/17/22 17:32, Liav Albani wrote:
>>
>>> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
>>> index 388e0db6e4..6af94a4a0a 100644
>>> --- a/pc-bios/meson.build
>>> +++ b/pc-bios/meson.build
>>> @@ -29,7 +29,7 @@ blobs = [
>>>     'bios-microvm.bin',
>>>     'qboot.rom',
>>>     'sgabios.bin',
>>> -  'vgabios.bin',
>>> +  'vgabios-isavga.bin',
>>>     'vgabios-cirrus.bin',
>> Well, it seems like this one doesn't want to be compiled now, so I'll 
>> need to dive deeper to figure out how to ensure it always produces the 
>> requested file.
> 
> So apparently the problem on my development machine is that for some odd 
> reason I don't have the "vgabios.bin" file, but I do have
> the "vgabios-isavga.bin" file. According to my package manager (pacman), 
> it is owned by the SeaBIOS package:
> 
>      usr/share/qemu/vgabios-isavga.bin is owned by extra/seabios 1.15.0-1
> 
> Other files in that directory are owned by the same package as well, for 
> example:
> 
>      usr/share/qemu/vgabios-stdvga.bin is owned by extra/seabios 1.15.0-1
>      usr/share/qemu/vgabios-virtio.bin is owned by extra/seabios 1.15.0-1
>      usr/share/qemu/vgabios-vmware.bin is owned by extra/seabios 1.15.0-1
> 
> So I'm not sure what is the best approach here to fix this. It is 
> definitely not a problem in QEMU because when I compile it from source I 
> do get a "vgabios.bin" file in the build directory, but I do think that 
> QEMU should try to use the "vgabios-isavga.bin" file when using the 
> isa-vga device, so in some way we could fix it in QEMU, which also makes 
> sense to ensure the filename is "vgabios-isavga.bin" for the isa-vga 
> device and not plain "vgabios.bin", which really doesn't say much about 
> the type of the graphics device.

This seems due to a recent Arch Linux change in SeaBIOS package:
https://github.com/archlinux/svntogit-packages/commit/ef2a5da4f1aa3fa45eea88c83eee01e89974145f
(so not related to mainstream QEMU project).

Regards,

Phil.

