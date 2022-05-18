Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1FB52BBA1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:57:29 +0200 (CEST)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKB6-000771-P4
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nrK54-0007To-B2; Wed, 18 May 2022 09:51:14 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nrK51-0006UV-JA; Wed, 18 May 2022 09:51:13 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 l9-20020a4abe09000000b0035eb3d4a2aeso424933oop.0; 
 Wed, 18 May 2022 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AsxaJ4FeoATSPrqZFveiPn0HB9/XzxmkAZdTs/PMrCg=;
 b=h6m1B2ZuWxof178Inm2RJSyb0tBmn27jElq6bY0qPCrdYIzGwir7PcKv4+wpbSsoxl
 3JTdR2QiQdoUYAUhdphokd0ILxqbJbGWWzKWxRYOBXU/hmsK3BPOrc+MDAuLgvn11/50
 tjAwAVcuf5kmSuoJG9XjcjwSYG9LjPaxRTQ00jaF3aOejGxNwT3eT1H8byOLrPSbZIup
 ctjjaQja1BfpTNIkkznQjGAAXQ9VvInQ6GskXOfJPCebTGi45KpTTKTftSL/YTEI8ZvH
 ZpvqVm9zoNIy5qz52OMhr1Ilts8uBXZDe1tbRRlzNao1DT3yIe7Div5mwJDEHzDS249N
 SUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AsxaJ4FeoATSPrqZFveiPn0HB9/XzxmkAZdTs/PMrCg=;
 b=x42XPw8jD3BqpWdEC2yyrld7T4XtWaMv/lIseKSlTUA5nHTyQ0CboErNv8ugrIQtnx
 NvTFzqSnWFraT4TfDKJZWfNmqmZ0mYUWLB1ZP53iFZpfC8v8CkEvwaEycl+vy9dcIMMA
 u60/7Kg/QW2jglUG2ia8JLv5MWAc2g97d517Gi6eBcZt3/rxgaSa7YBXkE5zE9YlEct7
 dFMHU+1l7qXuLFF30ZuLCvPIB7f0Nz2YOYYlkFgpkrRSAibIH3RBFTZdtIp5+YeixKg0
 uxh9WPupEV/QmzS2XMiUvY0wA+O3ZMPDT2jesm+94l4Mf9xSq2GSoSNK7ZjLOONa5k45
 +khg==
X-Gm-Message-State: AOAM530cfhrqLhvSw0yQGL25ztq3TEip+0Pa7bVMitHTfCyVqVJpWCUe
 JK09x88dJcc7EZvd0ulPowQ=
X-Google-Smtp-Source: ABdhPJyD6NdoqQnvpZVHRlMmAqMw+5L8FYThl59XlotVBmWiey/J1uyb4nuoZPxf1hnhSEkZ0Oh7/w==
X-Received: by 2002:a4a:2cd3:0:b0:35e:99e3:a497 with SMTP id
 o202-20020a4a2cd3000000b0035e99e3a497mr10164652ooo.86.1652881869735; 
 Wed, 18 May 2022 06:51:09 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:c5a3:c184:dee5:866b:a35f?
 ([2804:431:c7c7:c5a3:c184:dee5:866b:a35f])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a056870044300b000ead8b89484sm927046oak.5.2022.05.18.06.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 06:51:09 -0700 (PDT)
Message-ID: <6503fdd7-815a-05c1-3355-a005f4c592dc@gmail.com>
Date: Wed, 18 May 2022 10:51:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: TCG performance on PPC64
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-ppc <qemu-ppc@nongnu.org>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 leandro.lupori@eldorado.org.br,
 Victor Colombo <victor.colombo@eldorado.org.br>, matheus.ferst@gmail.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <ca23b319-8fbb-2fa2-cd98-7f8ad389d0fa@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <ca23b319-8fbb-2fa2-cd98-7f8ad389d0fa@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
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

I'm adding qemu-devel for extra visibility since you've also measure TCG
performance of x86 and s390x guests in x86/M1 hosts as well.


This is very interesting. Nice work collecting all this data.

As for ppc64 performance I'll say that I am surprised that, in the end,
the ppc64 TCG backend isn't that bad in comparison with x86. There's a good
chance that the pseries guests does a lot of instructions that benefits x86
more than ppc64. Otherwise we wouldn't see other guests perform better in
ppc64.

The aarch64 guest is booting too slow IMHO. I'd guess that there might be
some command line tuning to turn off some default stuff that the ARM guest
might be enabling by default.

I'll also mention that I had no idea that the Apple M1 was that fast. Apple
really meant business when developing this chip.


Thanks,


Daniel


On 5/18/22 10:16, Matheus K. Ferst wrote:
> Hi,
> 
> Since we started working with QEMU on PPC, we've noticed that
> emulating PPC64 VMs is faster in x86_64 than PPC64 itself, even when compared with x86 machines that are slower in other workloads (like building QEMU or the Linux kernel).
> 
> We thought it would be related to the TCG backend, which would be better optimized on x86. As a first approach to better understand the problem, I ran some boot tests with Fedora Cloud Base 35-1.2[1] on both platforms. Using the command line
> 
> ./qemu-system-ppc64 -name Fedora-Cloud-Base-35-1.2.ppc64le -smp 2 -m 2G -vga none -nographic -serial pipe:Fedora-Cloud-Base-35-1.2.ppc64le -monitor unix:Fedora-Cloud-Base-35-1.2.ppc64le.mon,server,nowait -device virtio-net,netdev=vmnic -netdev user,id=vmnic -cdrom fedora-cloud-init.iso -cpu POWER10 -accel tcg -device virtio-scsi-pci -drive file=Fedora-Cloud-Base-35-1.2.ppc64le.temp.qcow2,if=none,format=qcow2,id=hd0 -device scsi-hd,drive=hd0 -boot c
> 
> in a POWER9 DD2.2 and an Intel Xeon E5-2687W, a simple bash script reads the ".out" pipe until the "fedora login:" string is found and then issues a "system_powerdown" through QEMU monitor. The ."temp.qcow2" file is backed by the original Fedora image and deleted at the end of the test, so every boot is fresh. Running the test 10 times gave us 235.26 ± 6.27 s on PPC64 and 192.92 ± 4.53 s on x86_64, i.e., TCG is ~20% slower in the POWER9.
> 
> As a second step, I wondered if this gap would be the same when emulating other architectures on PPC64, so I used the same version of Fedora Cloud for aarch64[2] and s390x[3], using the following command lines:
> 
> ./qemu-system-aarch64 -name Fedora-Cloud-Base-35-1.2.aarch64 -smp 2 -m 2G -vga none -nographic -serial pipe:Fedora-Cloud-Base-35-1.2.aarch64 -monitor unix:Fedora-Cloud-Base-35-1.2.aarch64.mon,server,nowait -device virtio-net,netdev=vmnic -netdev user,id=vmnic -cdrom fedora-cloud-init.iso -machine virt -cpu max -accel tcg -device virtio-scsi-pci -drive file=Fedora-Cloud-Base-35-1.2.aarch64.temp.qcow2,if=none,format=qcow2,id=hd0 -device scsi-hd,drive=hd0 -boot c -bios ./pc-bios/edk2-aarch64-code.fd
> 
> and
> 
> ./qemu-system-s390x -name Fedora-Cloud-Base-35-1.2.s390x -smp 2 -m 2G -vga none -nographic -serial pipe:Fedora-Cloud-Base-35-1.2.s390x -monitor unix:Fedora-Cloud-Base-35-1.2.s390x.mon,server,nowait -device virtio-net,netdev=vmnic -netdev user,id=vmnic -cdrom fedora-cloud-init.iso -machine s390-ccw-virtio -cpu max -accel tcg -hda Fedora-Cloud-Base-35-1.2.s390x.temp.qcow2 -boot c
> 
> With 50 runs, we got:
> 
> +---------+---------------------------------+
> |         |               Host              |
> |  Guest  +----------------+----------------+
> |         |      PPC64     |     x86_64     |
> +---------+----------------+----------------+
> | PPC64   |  194.72 ± 7.28 |  162.75 ± 8.75 |
> | aarch64 |  501.89 ± 9.98 | 586.08 ± 10.55 |
> | s390x   | 294.10 ± 21.62 | 223.71 ± 85.30 |
> +---------+----------------+----------------+
> 
> The difference with an s390x guest is around ~30%, with a greater variability on x86_64 that I couldn't find the source. However, POWER9 emulates aarch64 faster than this Xeon.
> 
> The particular workload of the guest could distort this result since in the first boot Cloud-Init will create user accounts, generate SSH keys, etc. If the aarch64 guest uses many vector instructions for this initial setup, that might explain why an older Xeon would be slower here.
> 
> As a final test, I changed the images to have a normal user account already created and unlocked, disabled Cloud-Init, downloaded bc-1.07 sources[4][5], installed its build dependencies[6], and changed the test script to login, extract, configure, build, and shutdown the guest. I also added an aarch64 compatible machine (Apple M1 w/ 10 cores) to our test setup. Running 100 iterations gave us the following results:
> 
> +---------+----------------------------------------------------+
> |         |                        Host                        |
> |  Guest  +-----------------+-----------------+----------------+
> |         |      PPC64      |     x86_64      |     aarch64    |
> +---------+-----------------+-----------------+----------------+
> | PPC64   |  429.82 ± 11.57 |   352.34 ± 8.51 | 180.78 ± 42.02 |
> | aarch64 | 1029.78 ± 46.01 | 1207.98 ± 80.49 |  487.50 ± 7.54 |
> | s390x   |  589.97 ± 86.67 |  411.83 ± 41.88 | 221.86 ± 79.85 |
> +---------+-----------------+-----------------+----------------+
> 
> The pattern with PPC64 vs. x86_64 remains: PPC64/s390x guests are ~20%/~30% slower on POWER9, but the aarch64 VM is slower on this Xeon. If the PPC backend can perform better than the x86 when emulating some architectures, I guess that improving PPC64-on-PPC64 emulation isn't "just" TCG backend optimization but a more complex problem to tackle.
> 
> What would be different in aarch64 emulation that yields a better performance on our POWER9?
>   - I suppose that aarch64 has more instructions with GVec implementations than PPC64 and s390x, so maybe aarch64 guests can better use host-vector instructions?
>   - Looking at the flame graphs of each test (attached), I can see that tb_gen_code takes proportionally less time of aarch64 emulation than PPC64 and s390x, so it might be that decodetree is faster?
>   - There is more than TCG at play, so perhaps the differences can be better explained by VirtIO performance or something else?
> 
> Currently, Leandro Lupori is working to improve TLB invalidation[7], Victor Colombo is working to enable hardfpu in some scenarios, and I'm reviewing some older helpers that can use GVec or easily implemented inline. We're also planning to add some Power ISA v3.1 instructions to the TCG backend, but it's probably better to test on hardware if our changes are doing any good, and we don't have access to a POWER10 yet.
> 
> Are there any other known performance problems for TCG on PPC64 that we should investigate?
> 
> [1] https://download.fedoraproject.org/pub/fedora-secondary/releases/36/Cloud/ppc64le/images/Fedora-Cloud-Base-36-1.5.ppc64le.qcow2
> [2] https://download.fedoraproject.org/pub/fedora/linux/releases/36/Cloud/aarch64/images/Fedora-Cloud-Base-36-1.5.aarch64.qcow2
> [3] https://download.fedoraproject.org/pub/fedora-secondary/releases/36/Cloud/s390x/images/Fedora-Cloud-Base-36-1.5.s390x.qcow2
> [4] https://ftp.gnu.org/gnu/bc/bc-1.07.tar.gz
> [5] I'm using bc here because it's a reasonably sized project (not a hello word and not a defconfig Linux kernel), with few build dependencies.
> [6] "sudo dnf install gcc flex make bison ed texinfo"
> [7] https://gitlab.com/qemu-project/qemu/-/issues/767
> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

