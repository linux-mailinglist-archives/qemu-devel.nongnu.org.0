Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CCF4BEA4B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 19:57:31 +0100 (CET)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMDsI-0004tu-KS
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 13:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nMDnu-0001jR-OH; Mon, 21 Feb 2022 13:52:59 -0500
Received: from [2a00:1450:4864:20::333] (port=35711
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nMDns-0006Aw-TO; Mon, 21 Feb 2022 13:52:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so46987wml.0; 
 Mon, 21 Feb 2022 10:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CuESYNqkGjr/wuT2l1mgE3Du8U4H3JJxu1Ytln8tF7M=;
 b=NlxqDHCIQcrLSDjKFN4LbkG1TN5M6tFzuGyBg3KL0bN3tlKr3WgD4BDOjsnE+q2pRM
 w9QzXVSpqtv/vKeRzTa/Ash8Qx5QWtD5s9rbCdTt8KZALFnvMS5xYIaA1lK7Kx98Mo1j
 thuYCjWqWcZ9IOHMul+Boq4nbSnZUjhoQ/HOSVXaqRZrBa0pjvbWSd49YNPgHtoKrzTX
 M9KjhkSZLtGVfw2U/csuoTbwjbBvFaIWToEQDnqS+QJYrTq9XDc/kyyzgZ4nCDDPS1Xp
 e1HM1Asyplc451cP/LchbIF5/PF8JOc8T9SfAPDnuIP4U3MAsW6J4FyOiYjgg3eIUqus
 iFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CuESYNqkGjr/wuT2l1mgE3Du8U4H3JJxu1Ytln8tF7M=;
 b=QmngGaydUjzyoVvJBtJODWrrKX4PVxzRHhbWpeUTjnSRcQz1w6Iye4gcVGcIqhl8S/
 5EDKaEFB1WRWDaNGYlb8e4qr6pXP/D7k/cbBI9ajwHGo/XVKcYG5DpdFqgFgvV+5BCOV
 TkuppGt4inmS9O1tV3Pxx9HFDcAnjt66AFv0TyIp5/YEUWZkCHTQY+KWIAmNfkb3O3H/
 P0VJQncvXdl4mjdFuVuVUlHWLb9ejn+FMe7yVGk2b3sQGUUZIwmXgqD8JM+l1MXEdXQP
 R9qtkWn51a33IP8IyTczwT8XQjSRTpyg6pTvizqcShsewEuXAyTd6Z1oBV1/AODBciKa
 Omkw==
X-Gm-Message-State: AOAM532eMo+7v2Pq9/Bjp2lgAwKhgoVmznvLQrRl3AzYSKxcFF5K1YXV
 8gZmWG/x++m9MGjS4eF/C74=
X-Google-Smtp-Source: ABdhPJz1pw8r1R4t6M77gR5UVrvBY8EXi7LcxcU02sMOmpHGuUQ/SG54I1ClmW7autFJ9jADJSHXbA==
X-Received: by 2002:a1c:26c3:0:b0:37b:b566:4c46 with SMTP id
 m186-20020a1c26c3000000b0037bb5664c46mr317805wmm.42.1645469574940; 
 Mon, 21 Feb 2022 10:52:54 -0800 (PST)
Received: from ?IPV6:2a10:800a:bb8:1:6510:42ac:bb55:9590?
 ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b0037bbbc15ca7sm288977wmg.36.2022.02.21.10.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 10:52:54 -0800 (PST)
Message-ID: <704e9467-9fbd-9ba1-bff1-2fd0651071e2@gmail.com>
Date: Mon, 21 Feb 2022 20:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] hw/ide: add ich6 ide controller device emulation
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220218204155.236611-1-liavalb@gmail.com>
 <20220218204155.236611-3-liavalb@gmail.com>
 <68413ab-d14c-f5c6-4baf-12e3a18a6a5@eik.bme.hu>
 <e905a1d1-c7e8-bf10-22e8-cd5382b93c11@gmail.com>
 <d9733c34-b770-4717-cc8f-10cdf17640a8@eik.bme.hu>
 <20220221113358.3xxyoyg2bf64ln2x@sirius.home.kraxel.org>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220221113358.3xxyoyg2bf64ln2x@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/21/22 13:33, Gerd Hoffmann wrote:
>    Hi,
>
>>> ICH6 and ICH7 IDE controllers are quite the same as far as I know. I
>>> could change it, but then one could argue that the name ich6-ide seems
>>> like "ich9-ide", so not sure if we can really go on this path.
>> I think we don't actually have ich9-ide, we only have piix3, piix4 and ahci,
>> the latter is used by ich9. I just said that calling this new device
>> ich7-ide instead of ich6-ide would make it more clear it has nothing to do
>> with ich9.
> Well, there actually is ich9-ide in physical hardware.  And it's quite
> simliar for all ich6 -> ich9 (and possibly more) physical hardware.
I know, but I based it on Intel documentation and the ICH7 machine I 
have from 2009. Also, according to libata in Linux, the enum of 
piix_controller_ids include ich5, ich6 and ich8 (and much more, these 
are more relevant in the list for this reason), and by looking into what 
ich6_sata is being used for, I can see it matches the IDE controller PCI 
ID on the ICH7 machine I use, so that's another reason to choose this name.
> The hardware implements both ide and sata.  Typically the bios setup
> offers to pick ide or sata mode for the storage controller, and on boot
> the chipset is configured accordingly by the firmware.
Yes, and then the BIOS configures the MAP register to indicate the setup 
that it was decided by the user in the BIOS configuration.
However, setting the MAP register to zero is a valid value - it 
indicates you have only SATA connectors in use (at least that's what 
Linux thinks), according to the Intel ICH5 Serial ATA Controller RPM.
> qemu never bothered to implement ide mode for q35/ich9.  When a guest OS
> is so old that it doesn't come with a sata driver there is the option to
> just use the 'pc' machine type.  And usually that's the better choice
> anyway because these old guests tend to have problems with other q35
> components too.
That's true if you care about giving emulation only for the benefits of 
the guest (so you only care about supporting what the guest OS can 
expect from standard IDE controller, not edge cases), but my approach is 
looking at a very different goal.
> So I'm wondering why you implement ich{6,7,9}-ide in the first place?
> What is the use case / benefit?

I talked about it in the last patch about this topic I've sent (v1 to be 
precise), but let me describe it again :)
I'm a SerenityOS developer, as you might remember or not, I've talked to 
you (Gerd) in the past about SeaBIOS topics related to the OS off-list.
As I said before in this mail, I tend to test the SerenityOS kernel on 
the ICH7 machine I have from 2009. That machine has 4 SATA ports and you 
can connect 2 PATA devices (as one parallel cable can be used to connect 
two devices at once, to one connector on the mainboard).

I've seen that the kernel struggled to use the IDE controller - the main 
problem we have is long timeouts because of some problematic pattern in 
our code. However, on regular QEMU PC and Q35 machines everything boots 
fine. When I wrote this emulation component, I saw the same problem I 
had on the bare metal machine, so it is a convenient feature for me to 
debug this problem without having to use the bare metal machine - it 
helps saving lots of time for me by avoiding the need to compile a 
kernel, put it on the SATA harddrive and try to boot it in the rapid 
compile-boot-test cycle I have here.

I thought it might be beneficial for other OS developers and hobbyists 
like me to have such component. For now, it's an IDE 
ICH5/6/7/9-compatible controller, supporting only PCI IDE native mode - 
which means you can relocate the resources to anything you want on the 
IO space, so it's a legacy-free device in the sense of PCI bus resource 
management, but still a legacy device that to use it on bare metal you 
need a machine from late 2000s.

Also, I do see a point in expanding this controller with more features. 
For example, some ICH6 IDE controllers had AHCI mode within them, so you 
could actually enable the AHCI mode and disable IDE mode if you know 
what you're doing - you will probably need to assign the IDE PCI BARs 
correctly first if you want IDE mode in such controller, or ignore it 
and go with AHCI mode instead. Also, this emulation component is only 
about PCI IDE native mode currently, but we can easily put it that you 
can switch channels between compatibility mode and native mode if wanted 
to. My ICH7 test machine has such controller - it allows you to switch 
between the two modes, so the OS can decide what to do with the IDE 
controller according to its needs.

> take care,
>    Gerd
>
Best regards,
Liav


