Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B76A7E9D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfYb-00042d-T5; Thu, 02 Mar 2023 04:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pXfYZ-00042T-BB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pXfYX-0008ND-RI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677750537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBqbPQxHUH8v0JA0XyEf+R4894nFczfus3XSMlKB0YI=;
 b=bD0HTd9bfvSm4Jx6AfY6fxcqvu/SnZWB20H/uo1hKoUfp3eV3fwr/VX9D+yHngG4iawgYp
 Zlo5KKML+pPZTb4SsDyzxVDk4/aK09D4CiOVr0bs2au+MNbP1KJayIjaqZIAvASrvsqY/W
 xwQAIyiwPcUiVu4qR62o+chfx+yrDrI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-X2NEKe5-PTOO2Yf1-S6K2Q-1; Thu, 02 Mar 2023 04:48:55 -0500
X-MC-Unique: X2NEKe5-PTOO2Yf1-S6K2Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so1044965wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BBqbPQxHUH8v0JA0XyEf+R4894nFczfus3XSMlKB0YI=;
 b=SaMa+ZwKurmU9HheDfTn4JKa6f5zaS6ixAyvMgD7ltH4bxxT/99HGUqnbOrM0CpFs3
 5+L4T8VNcpaBB/nBJApt/qjqlnRa8rP5mvpFB9uWFFmKB5X0Hwcygm7XirwCx8WnESBd
 1wqEwWYJ05qxkV/TFRBEH9ZEAkDs2R85OI4N6w+D/jJ/65UAHOWa/9sNcPq3im7oQMGc
 lxag996PMTpcHvm0CG63CamcQ5BNpgnAdDNCEiL9Y/aUL21VWOMlTc2md/cI1SKoI9uE
 fi0UVPvOAg5RRk5LL3tvlaPGVRGe/27fjC3cAoJw4fpkQeARg77taUu3GxVe7QtJfGvj
 wOvg==
X-Gm-Message-State: AO0yUKW+pchyAX6nXhLgkWHcCpLwCmrVAQErGNipDmOcrQTmrkcy6HbZ
 YU3L9Rp6AFraC8l7bDPClkWFCcUNC2oHzCkANUtbSkm5o/FBKyWFoamDXt5rMzzX7+q/jhq1uY+
 CjVaz3rXZmKUQeCjY+KC1
X-Received: by 2002:a05:600c:92a:b0:3ea:c100:e974 with SMTP id
 m42-20020a05600c092a00b003eac100e974mr7932145wmp.26.1677750534143; 
 Thu, 02 Mar 2023 01:48:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9gV9sL5ZhdK7rZYxFa0BsSh6Ex24etzeoSRxF0nGp9PIh8wz6BVslJfVdU6l9r7BwkY7677Q==
X-Received: by 2002:a05:600c:92a:b0:3ea:c100:e974 with SMTP id
 m42-20020a05600c092a00b003eac100e974mr7932133wmp.26.1677750533867; 
 Thu, 02 Mar 2023 01:48:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c4f4a00b003db06224953sm2576545wmq.41.2023.03.02.01.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 01:48:53 -0800 (PST)
Message-ID: <ef101296-fc49-aa65-bc88-ce12fee8aeea@redhat.com>
Date: Thu, 2 Mar 2023 10:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Bug in master branch:
 IbmPrep40pMachine.test_factory_firmware_and_netbsd broken
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/2/23 08:47, Thomas Huth wrote:
> 
>   Hi all,
> 
> seems like we've got another bug that sneaked in during the CI minutes blackout: The avocado test IbmPrep40pMachine.test_factory_firmware_and_netbsd is now broken reliably, see:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/3858833617#L300
>   https://gitlab.com/thuth/qemu/-/jobs/3858727901#L300
>   https://gitlab.com/thuth/qemu/-/jobs/3857804517#L300
> 
> Is anybody already looking into this?
> 
>   Thomas

I tried manually and QEMU reached :
       >> (builds@wb29, Tue Oct  7 23:59:44 PDT 2008)
     
     Boot:
     Loading in()
     3558080+232036 [197696+188133]=0x3fbbf0
     start=0x100000
     
     Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
         2006, 2007
         The NetBSD Foundation, Inc.  All rights reserved.
     Copyright (c) 1982, 1986, 1989, 1991, 1993
         The Regents of the University of California.  All rights reserved.
     
     NetBSD 4.0.1 (GENERIC) #0: Wed Oct  8 00:46:56 PDT 2008
     	builds@wb29:/home/builds/ab/netbsd-4-0-1-RELEASE/prep/200810080053Z-obj/home/builds/ab/netbsd-4-0-1-RELEASE/src/sys/arch/prep/compile/GENERIC
     Model: IBM PPS Model 6015
     total memory = 128 MB
     avail memory = 119 MB
     trap: kernel read DSI trap @ 0x7c3042a6 by 0x3e4cf8 (DSISR 0x40000000, err=14), lr 0x377eac
     panic: trap
     Stopped in pid 0.1 () at        netbsd:cpu_Debugger+0x10:       lwz     r0, r1, 0
     x14

     
I tried debian with openbios also and it still works.

     >> =============================================================
     >> OpenBIOS 1.1 [Mar 7 2022 23:07]
     >> Configuration device id QEMU version 1 machine id 0
     >> CPUs: 0
     >> Memory: 128M
     >> UUID: 00000000-0000-0000-0000-000000000000
     >> CPU type PowerPC,604
     milliseconds isn't unique.
     Welcome to OpenBIOS v1.1 built on Mar 7 2022 23:07
     Trying hd:,\\:tbxi...
     >> Not a bootable ELF image
     >> switching to new context:
     loaded at:     04000400 04015218
     relocated to:  00800000 00814E18
     board data at: 07C9E870 07CA527C
     relocated to:  0080B130 00811B3C
     zimage at:     0400B400 0411DC98
     avail ram:     00400000 00800000
     
     Linux/PPC load: console=/dev/ttyS0,9600 console=tty0 ether=5,0x210,eth0 ether=11,0x300,eth1 ramdisk_size=8192 root=/dev/sda3
     Uncompressing Linux................................................done.
     Now booting the kernel
     
     Debian GNU/Linux 3.0 6015 ttyS0
     
     6015 login:

the logs are empty. Curious

C.
     


