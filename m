Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC2319C0D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 10:47:15 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAV2g-0003Il-Cp
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 04:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAV0W-0002ij-4I
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:45:00 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAV0U-00066U-GE
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:44:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id n6so7124814wrv.8
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 01:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Md2FHNpDbalvGhjyLp3TW09GlrTsXNzCtTlATTqIILU=;
 b=RoVHPWlNkEC9S8eKZ2JBl2ElVJta1ylABx9XGP88M8TjMCZCZK8vSEYyVmmQ7Pyasu
 X7GL6vBrS0Q0qk/OEHiShzf/x8fj76viTRCdWc5hDfdyWwUq9m2QlhV7swKDbKWIhVyW
 qvo4auqym2oGoDJopXlinFyXadLBRt4+oWNZtZa04icKhCTmGg1kyziNvcabXOo8Kvfe
 zg9DEvMCCjf51fm4v6k1IMmXdTKE1SLkg1OiXhH7xhKnA6MgdgLVFR71M3PxXhVERhm5
 I7txWqAlbJPO3VJDk5QhctYrPGnywBlyDA12hKp1SPIsPAHoxjtCZRYqeygSWYncbuYU
 oC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Md2FHNpDbalvGhjyLp3TW09GlrTsXNzCtTlATTqIILU=;
 b=nhrz1Y1Udg6gBC4Xt53Fs1l7it8wqsuAnMQbV/S3V/rKm0NKPNZuU3rCQNJKdnQuOC
 E4GHHhv+o+wp1bSHY7/ITyok6g6QpbZvUNn6fKaG65NX81kM8I4cBXa/272zU7XJp4Z3
 3P/aH9Hns6fZvs910cB9MbHZVkWDIUxQDdmEyTolFYzD9FEbauQgIRFqs7TkAxCPvPKH
 N8TnflXuxmWsyWFpp8e8cRKjxWqCIHD1sccqzd/DtdyLlx6t6CM8JEk6tOa+2nI7B/vp
 dUNWXkLqLExF990WIELWPCEffkf2Q7J9brKmPqa7pq0BgZszESakzToKOTaRMno05pwa
 4CgQ==
X-Gm-Message-State: AOAM531O0dWhTy/NFtKsDEiCxvU2eOSkvMxohBGNlflvlXaNfougIiSU
 0FS1RouO02ET6TeO9oZGPutItcNDjKM=
X-Google-Smtp-Source: ABdhPJw6j/O5VRK+Utxn/P400G3nzQkAK0nUCU/IgIoCDzkwtafnq13ieIHsVyC8za17R1daCC0Img==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr2444346wru.304.1613123096695; 
 Fri, 12 Feb 2021 01:44:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 36sm10430335wrj.97.2021.02.12.01.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 01:44:56 -0800 (PST)
Subject: Re: RFC Qemu mipssim patches
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Reinoud Zandijk <reinoud@NetBSD.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20210211153746.GA25676@dropje.13thmonkey.org>
 <acf26892-c47c-7059-f3d1-8ef5bdcdcb8b@amsat.org>
Message-ID: <2951213f-7610-857d-c20c-12bc26877490@amsat.org>
Date: Fri, 12 Feb 2021 10:44:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <acf26892-c47c-7059-f3d1-8ef5bdcdcb8b@amsat.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 1:13 AM, Philippe Mathieu-Daudé wrote:
> Hi Reinoud,
> 
> On 2/11/21 4:37 PM, Reinoud Zandijk wrote:
>> Hi,
>>
>> i'd like to get the following simple patches to the MIPS/mipssim target adding
>> virtio-mmio devices to it.

Please submit your patches as a series so we can review them on
the list:
https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch

BTW you are ORing the IRQ pointer, so you are likely loosing
interrupts...

In case you want to keep using the MIPSsim, see this example
commit on how to use an OR gate:
https://gitlab.com/qemu-project/qemu/-/commit/a879306ca14

>> This makes the target a lot more usefull as microvm
>> for kernel developement. It currently lives in our qemu extensions patches and
>> we have a working kernel that supports all virtio devices for it.
>>
>> Thoughts?
> 
> Why not start a cleanly specified machine, as Laurent is doing on m68k?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg768802.html
> 
> This one doesn't even have an interrupt controller.
> 
> Cc'ing Aleksandar who maintains this machine.
> 
> Regards,
> 
> Phil.
> 

