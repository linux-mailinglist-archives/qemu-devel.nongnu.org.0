Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F13296BC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:01:48 +0100 (CET)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzyV-0004Il-AF
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gcf1129@gmail.com>) id 1lGzwO-00037S-0a
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:59:37 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gcf1129@gmail.com>) id 1lGzwK-0000VW-MG
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:59:35 -0500
Received: by mail-pl1-x62a.google.com with SMTP id c16so2077534ply.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 23:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mi+1rBtYLOe8Du754n+RilR69v3XH+BxoIQk1rlkcWE=;
 b=uMipNeE9qwtPzpXhWLhoOztEA5nZHOoDxCuo7dimcZdWI+LlvP9GLb1BamwLgrk44Q
 WIBaVzgAzJJlgrh9tgezVWnD9A4nbhbjqCcMLAAUrOZLjJ19ceN7pIxgq0mNjBvVIze2
 V1GJKohF+Rwr6kO/k+ofeOi1JRwUOsunJngjyrNjSH3CGAiWAbIQqtLBr79FOv7S6PX0
 d6I1CARfWL9FkyAi7xnvCq3fxmnWqzEWud4ruY05gMsFtolWtn8xTwUU/dWAqEmV1szo
 30jF0/m8tGZvNhkkuMWI00gt69TqkitpHWHLu5P9PVk6l+6ZPifM0yGik/6PiLLYusab
 EqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mi+1rBtYLOe8Du754n+RilR69v3XH+BxoIQk1rlkcWE=;
 b=BurGZaRxtkRWoy1PyZnvE23xAlNqSvYsEb8QME+dPSqzxKFtQK9UvxpvfBLJ5PGrNn
 Ij2wZfZhpf7IE+EGpKqEu6cOWkc5PtcUHfUQq6w/vLurZBNYdaq0gPukCeFHYCN4Sxdn
 z/lPJncizZ2b4xRKgkB98njuDCOMISqovQzgjMqPckQiUNJcSvrO9UPRRwV6BHuT4b+x
 tNZPgywqWhEnBbBpfNxjjUFw+cyVfTRaE6D9RLsGFUsMPrr6VLvpFh493NY4VUH3iSBG
 GFtabkvb/mLmob1pg8uaB2c8njb+l9sT7blYmhvE6usYhXiQvA9uDl5DRhpRe5L+uCYb
 ol9g==
X-Gm-Message-State: AOAM533JupnKlhbFmB26XmBmpn8eXMn3WqCJY8myS+GjljBvdp/ztO4n
 zz0VP8EZcN6W8mAATnxMEVA71HhJwuO7/SKzOMQ=
X-Google-Smtp-Source: ABdhPJwud/9tO0LfcNhVArZ2PUBDijP9DofftMBLItdymntHdzuX+uMU5koedi7UruLK0BbTe5uz1f0pPIJzN8Kmq2Y=
X-Received: by 2002:a17:902:968e:b029:e3:a9b8:60b4 with SMTP id
 n14-20020a170902968eb02900e3a9b860b4mr2464743plp.61.1614671970856; Mon, 01
 Mar 2021 23:59:30 -0800 (PST)
MIME-Version: 1.0
References: <161465544550.24578.14846009621606228644.malonedeb@wampee.canonical.com>
 <2021030215305283912052@chinatelecom.cn>
In-Reply-To: <2021030215305283912052@chinatelecom.cn>
From: Sean Kuo <gcf1129@gmail.com>
Date: Tue, 2 Mar 2021 15:59:18 +0800
Message-ID: <CAFkVRJKbRqjEnF_K2RXYTb+ZF0KnFO+J05f1ETEaumxc=CVvaA@mail.gmail.com>
Subject: Re: [Bug 1917394] [NEW] command lspci does not show the IVSHMEM device
To: ChangLimin <changlm@chinatelecom.cn>
Content-Type: multipart/alternative; boundary="00000000000040724405bc891d1f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=gcf1129@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
Cc: Bug 1917394 <1917394@bugs.launchpad.net>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000040724405bc891d1f
Content-Type: text/plain; charset="UTF-8"

Hi ChangLimin,

Thanks for your reply. I checked again to find the device... I thought the
name was ivshmem.
I don't find any driver code for IVSHMEM in the linux and qemu repo. Can
you give me some help?

00:10.0 RAM memory: Red Hat, Inc. Inter-VM shared memory (rev 01)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Flags: fast devsel
Memory at fcc1c000 (32-bit, non-prefetchable) [size=256]
Memory at fdc00000 (64-bit, prefetchable) [size=4M]

Thanks,
Sean






On Tue, Mar 2, 2021 at 3:31 PM ChangLimin <changlm@chinatelecom.cn> wrote:

> Can you give the lspci messages? The below is my output.  There is a RAM
> memory device.
>
> $ lspci
> 00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev
> 02)
> 00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
> 00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton
> II]
> 00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton
> II] (rev 01)
> 00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
> 00:02.0 VGA compatible controller: Device 1234:1111 (rev 02)
> 00:03.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge
> 00:04.0 Ethernet controller: Red Hat, Inc. Virtio network device
> 00:05.0 SCSI storage controller: Red Hat, Inc. Virtio SCSI
> 00:06.0 Communication controller: Red Hat, Inc. Virtio console
> 00:10.0 RAM memory: Red Hat, Inc. Inter-VM shared memory (rev 01)
> 01:07.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge
>
>
> *From:* sean kuo <1917394@bugs.launchpad.net>
> *Date:* 2021-03-02 11:24
> *To:* qemu-devel <qemu-devel@nongnu.org>
> *Subject:* [Bug 1917394] [NEW] command lspci does not show the IVSHMEM
> device
> Public bug reported:
>
> qeum version:
> QEMU emulator version 4.2.1
>
> I met a problem when I tried to use IVSHMEM. Command lspci does not show
> the IVSHMEM device.
> Below is the configuration from my side:
>
> 1.  guest vm xml configuration.
>   <shmem name='ivshmem'>
>       <model type='ivshmem-plain'/>
>       <size unit='M'>2</size>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x10'
> function='0x0'/>
>     </shmem>
>
> 2. after the booting up and I found the qemu commandline ideedly  have the
> device option:
> ps aux | grep ivshmem
> /usr/bin/qemu-system-x86_64
>       .......(ignore other options)
> -object
> memory-backend-file,id=shmmem-shmem0,mem-path=/dev/shm/hostmem,size=4194304,share=yes
> -device ivshmem-plain,id=shmem0,memdev=shmmem-shmem0,bus=pcie.0,addr=0x10
>
> 3. lspci command  not shown the device.
>
> 4. lshw command indeedly show the device:
>
> *-memory UNCLAIMED
>              description: RAM memory
>              product: Inter-VM shared memory
>              vendor: Red Hat, Inc.
>              physical id: 10
>              bus info: pci@0000:00:10.0
>              version: 01
>              width: 64 bits
>              clock: 33MHz (30.3ns)
>              configuration: latency=0
>              resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff
>
> My host and vm os is ubuntu 20.04 and version is:
> #49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64
> GNU/Linux
>
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1917394
>
> Title:
>   command lspci does not show the IVSHMEM device
>
> Status in QEMU:
>   New
>
> Bug description:
>   qeum version:
>   QEMU emulator version 4.2.1
>
>   I met a problem when I tried to use IVSHMEM. Command lspci does not show
> the IVSHMEM device.
>   Below is the configuration from my side:
>
>   1.  guest vm xml configuration.
>     <shmem name='ivshmem'>
>         <model type='ivshmem-plain'/>
>         <size unit='M'>2</size>
>         <address type='pci' domain='0x0000' bus='0x00' slot='0x10'
> function='0x0'/>
>       </shmem>
>
>   2. after the booting up and I found the qemu commandline ideedly  have
> the device option:
>   ps aux | grep ivshmem
>    /usr/bin/qemu-system-x86_64
>         .......(ignore other options)
>   -object
> memory-backend-file,id=shmmem-shmem0,mem-path=/dev/shm/hostmem,size=4194304,share=yes
> -device ivshmem-plain,id=shmem0,memdev=shmmem-shmem0,bus=pcie.0,addr=0x10
>
>   3. lspci command  not shown the device.
>
>   4. lshw command indeedly show the device:
>
>   *-memory UNCLAIMED
>                description: RAM memory
>                product: Inter-VM shared memory
>                vendor: Red Hat, Inc.
>                physical id: 10
>                bus info: pci@0000:00:10.0
>                version: 01
>                width: 64 bits
>                clock: 33MHz (30.3ns)
>                configuration: latency=0
>                resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff
>
>   My host and vm os is ubuntu 20.04 and version is:
>   #49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64
> GNU/Linux
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1917394/+subscriptions
>
>
>

--00000000000040724405bc891d1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0ChangLimin,<div><br></div><div>Thanks for your rep=
ly. I checked again to find the device... I thought the name was ivshmem.</=
div><div>I don&#39;t find any driver code for IVSHMEM in the linux and qemu=
 repo. Can you give me some help?=C2=A0</div><div><br></div><div>00:10.0 RA=
M memory: Red Hat, Inc. Inter-VM shared memory (rev 01)<br>	Subsystem: Red =
Hat, Inc. QEMU Virtual Machine<br>	Flags: fast devsel<br>	Memory at fcc1c00=
0 (32-bit, non-prefetchable) [size=3D256]<br>	Memory at fdc00000 (64-bit, p=
refetchable) [size=3D4M]</div><div><br></div><div>Thanks,</div><div>Sean</d=
iv><div><br></div><div><br><div><br></div><div><br></div></div></div><div d=
ir=3D"ltr"><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 3:31 PM ChangLimin &lt;<a =
href=3D"mailto:changlm@chinatelecom.cn" target=3D"_blank">changlm@chinatele=
com.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>
<div><span></span><div><span style=3D"line-height:1.5;background-color:tran=
sparent">Can you give the lspci messages? The below is my output.=C2=A0 The=
re is a RAM memory device.</span></div><div><span style=3D"line-height:1.5;=
background-color:transparent"><br></span></div><div><span style=3D"line-hei=
ght:1.5;background-color:transparent">$ lspci</span></div><div>00:00.0 Host=
 bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)</div><div>=
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]<=
/div><div>00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natom=
a/Triton II]</div><div>00:01.2 USB controller: Intel Corporation 82371SB PI=
IX3 USB [Natoma/Triton II] (rev 01)</div><div>00:01.3 Bridge: Intel Corpora=
tion 82371AB/EB/MB PIIX4 ACPI (rev 03)</div><div>00:02.0 VGA compatible con=
troller: Device 1234:1111 (rev 02)</div><div>00:03.0 PCI bridge: Red Hat, I=
nc. QEMU PCI-PCI bridge</div><div>00:04.0 Ethernet controller: Red Hat, Inc=
. Virtio network device</div><div>00:05.0 SCSI storage controller: Red Hat,=
 Inc. Virtio SCSI</div><div>00:06.0 Communication controller: Red Hat, Inc.=
 Virtio console</div><div>00:10.0 RAM memory: Red Hat, Inc. Inter-VM shared=
 memory (rev 01)</div><div>01:07.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI b=
ridge</div></div>
<div><br></div>
<blockquote style=3D"margin-top:0px;margin-bottom:0px;margin-left:0.5em;mar=
gin-right:inherit"><div>=C2=A0</div><div style=3D"border-right:none;border-=
bottom:none;border-left:none;border-top:1pt solid rgb(181,196,223);padding:=
3pt 0cm 0cm"><div style=3D"padding:8px;font-size:12px;font-family:tahoma;co=
lor:rgb(0,0,0);background:rgb(239,239,239)"><div><b>From:</b>=C2=A0<a href=
=3D"mailto:1917394@bugs.launchpad.net" target=3D"_blank">sean kuo</a></div>=
<div><b>Date:</b>=C2=A02021-03-02=C2=A011:24</div><div><b>To:</b>=C2=A0<a h=
ref=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel</a></div>=
<div><b>Subject:</b>=C2=A0[Bug 1917394] [NEW] command lspci does not show t=
he IVSHMEM device</div></div></div><div><div>Public bug reported:</div>
<div>=C2=A0</div>
<div>qeum version:</div>
<div>QEMU emulator version 4.2.1</div>
<div>=C2=A0</div>
<div>I met a problem when I tried to use IVSHMEM. Command lspci does not sh=
ow the IVSHMEM device.</div>
<div>Below is the configuration from my side:</div>
<div>=C2=A0</div>
<div>1.=C2=A0 guest vm xml configuration.</div>
<div>=C2=A0 &lt;shmem name=3D&#39;ivshmem&#39;&gt;</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;model type=3D&#39;ivshmem-plain&#39=
;/&gt;</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;size unit=3D&#39;M&#39;&gt;2&lt;/si=
ze&gt;</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;address type=3D&#39;pci&#39; domain=
=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x10&#39; function=3D&=
#39;0x0&#39;/&gt;</div>
<div>=C2=A0=C2=A0=C2=A0 &lt;/shmem&gt;</div>
<div>=C2=A0</div>
<div>2. after the booting up and I found the qemu commandline ideedly=C2=A0=
 have the device option:</div>
<div>ps aux | grep ivshmem</div>
<div> /usr/bin/qemu-system-x86_64 </div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .......(ignore other options)</div>
<div>-object memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hos=
tmem,size=3D4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,memdev=3D=
shmmem-shmem0,bus=3Dpcie.0,addr=3D0x10</div>
<div>=C2=A0</div>
<div>3. lspci command=C2=A0 not shown the device.</div>
<div>=C2=A0</div>
<div>4. lshw command indeedly show the device:</div>
<div>=C2=A0</div>
<div>*-memory UNCLAIMED</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 description: RAM memory</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 product: Inter-VM shared memory</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vendor: Red Hat, Inc.</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 physical id: 10</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bus info: pci@0000:00:10.0</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 version: 01</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 width: 64 bits</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 clock: 33MHz (30.3ns)</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 configuration: latency=3D0</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff</div>
<div>=C2=A0</div>
<div>My host and vm os is ubuntu 20.04 and version is:</div>
<div>#49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_6=
4 GNU/Linux</div>
<div>=C2=A0</div>
<div>** Affects: qemu</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0 Importance: Undecided</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: New</div>
<div>=C2=A0</div>
<div>-- </div>
<div>You received this bug notification because you are a member of qemu-</=
div>
<div>devel-ml, which is subscribed to QEMU.</div>
<div><a href=3D"https://bugs.launchpad.net/bugs/1917394" target=3D"_blank">=
https://bugs.launchpad.net/bugs/1917394</a></div>
<div>=C2=A0</div>
<div>Title:</div>
<div>=C2=A0 command lspci does not show the IVSHMEM device</div>
<div>=C2=A0</div>
<div>Status in QEMU:</div>
<div>=C2=A0 New</div>
<div>=C2=A0</div>
<div>Bug description:</div>
<div>=C2=A0 qeum version:</div>
<div>=C2=A0 QEMU emulator version 4.2.1</div>
<div>=C2=A0</div>
<div>=C2=A0 I met a problem when I tried to use IVSHMEM. Command lspci does=
 not show the IVSHMEM device.</div>
<div>=C2=A0 Below is the configuration from my side:</div>
<div>=C2=A0</div>
<div>=C2=A0 1.=C2=A0 guest vm xml configuration.</div>
<div>=C2=A0=C2=A0=C2=A0 &lt;shmem name=3D&#39;ivshmem&#39;&gt;</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;model type=3D&#39;ivshm=
em-plain&#39;/&gt;</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;size unit=3D&#39;M&#39;=
&gt;2&lt;/size&gt;</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;address type=3D&#39;pci=
&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x10&#39; =
function=3D&#39;0x0&#39;/&gt;</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;/shmem&gt;</div>
<div>=C2=A0</div>
<div>=C2=A0 2. after the booting up and I found the qemu commandline ideedl=
y=C2=A0 have the device option:</div>
<div>=C2=A0 ps aux | grep ivshmem</div>
<div>=C2=A0=C2=A0 /usr/bin/qemu-system-x86_64 </div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .......(ignore other option=
s)</div>
<div>=C2=A0 -object memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/=
shm/hostmem,size=3D4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,me=
mdev=3Dshmmem-shmem0,bus=3Dpcie.0,addr=3D0x10</div>
<div>=C2=A0</div>
<div>=C2=A0 3. lspci command=C2=A0 not shown the device.</div>
<div>=C2=A0</div>
<div>=C2=A0 4. lshw command indeedly show the device:</div>
<div>=C2=A0</div>
<div>=C2=A0 *-memory UNCLAIMED</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 description: RAM memory</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 product: Inter-VM shared memory</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vendor: Red Hat, Inc.</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 physical id: 10</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bus info: pci@0000:00:10.0</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 version: 01</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 width: 64 bits</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 clock: 33MHz (30.3ns)</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 configuration: latency=3D0</div>
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdfffff=
f</div>
<div>=C2=A0</div>
<div>=C2=A0 My host and vm os is ubuntu 20.04 and version is:</div>
<div>=C2=A0 #49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_6=
4 x86_64 GNU/Linux</div>
<div>=C2=A0</div>
<div>To manage notifications about this bug go to:</div>
<div><a href=3D"https://bugs.launchpad.net/qemu/+bug/1917394/+subscriptions=
" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1917394/+subscript=
ions</a></div>
<div>=C2=A0</div>
</div></blockquote>
</div></blockquote></div>

--00000000000040724405bc891d1f--

