Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80D37FC81
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:27:11 +0200 (CEST)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF78-0004QM-7u
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhF0U-0007xm-7N
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:20:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhF0Q-00074D-MZ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:20:17 -0400
Received: by mail-wr1-x436.google.com with SMTP id n2so27683507wrm.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=k4ItoMi1Ph8G0+lPF9nTDyRmK2emuBfG5YZL8kuYOrw=;
 b=i8RBdAoSrgGpm0KdCL/JMr5y5XvOViKibT+kR6YIOnKeMacRSBCFPT/JMLNAU4GcUl
 1ZfnuWPwt7K89C/3H+FTs/e2/EXZpUm0K3yL4ktSYF8FbwLSmqoyjaXlwSBVJlHOGA6H
 erhB+3bdWhAwia4LraOfKvIq8htb9WOuGJHIy63pqPOMZ6baIhe7UKTNrWTHIoQZ7p9m
 A8yS7Fev+fH9X4Ec9R4EM4YSF3ZUj1idA5HA29nJQ6YzMiA3PxWkP1ycBgkvHvWr0Sd7
 RIBiRO7ZPQEdgD5xZ01Zd0SfmSXds5Xf3ABbu+BOio6VVeySpqxxrWmzNhGqpvY5LkSy
 ctXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=k4ItoMi1Ph8G0+lPF9nTDyRmK2emuBfG5YZL8kuYOrw=;
 b=L+vk82nCUK8E7VsGLiBFmntSQMcoYVaw5IPsYgUSZMcElTYJCAjEuiL8xMaQfiNiQg
 14pxSM1yFsb3nGcFDn4r7GBf9n9UWKGhX+/qP+wf3OA3ynUowSwJlVkpal8FMlIrL3Ed
 RSFDpzPZ9OoTuVt75GU9qrYC+N+dvOZjVoGWd0FoG1ubrkTWYpT9L7gX0IgbYyOl8+7Q
 4uq1dnzysu4FvA+YwiE6uBOSawDhOwIzivgVMEwoUISaUbn84rGHphbyXEsiULiUxOmH
 KEGGPvtuAFvZjBHR6/YFj/VbuM9wJA8DfBKHAv3AySzlTCONMO8kL4M4xeWKbM86MZfN
 wPsA==
X-Gm-Message-State: AOAM531lWGPJiaQWWanWru7MZzx5CIh0FyEKJ5Bd5zrjPrq9nPn/A8XI
 gK9rIKXmq4dj7GlW3zYS+k4vqg==
X-Google-Smtp-Source: ABdhPJx6Kc41q3dvn2ScqiA6JZT7ktDzTZJC3aL2A/IWiNo/BJqRwMh+43E6lobpIWS+Z541jh2QoQ==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr53339981wrw.309.1620926411133; 
 Thu, 13 May 2021 10:20:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n10sm3367183wrw.37.2021.05.13.10.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:20:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2BF421FF7E;
 Thu, 13 May 2021 18:20:09 +0100 (BST)
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
 <87h7j8ez4t.fsf@linaro.org> <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Subject: Re: GICv3 for MTTCG
Date: Thu, 13 May 2021 18:19:28 +0100
In-reply-to: <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
Message-ID: <877dk2lfee.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>, "Cota@braap.org" <Cota@braap.org>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William, 
 FixNet\)" <chengen@huawei.com>, yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:

> Dear colleagues,
>
> Thank you all very much for your responses. Let me reply with one message.
>
> I configured QEMU for AARCH64 guest:
> $ ./configure --target-list=3Daarch64-softmmu
>
> When I start QEMU with GICv3 on an x86 host:
> qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3

Hmm are you sure you are running your built QEMU? For me the following
works fine:

  ./aarch64-softmmu/qemu-system-aarch64 -machine virt-6.0,gic-version=3D3,a=
ccel=3Dtcg -cpu max -serial mon:stdio -nic user,model=3Dvirtio-net-pci,host=
fwd=3Dtcp::2222-:22 -device virtio-scsi-pci -device scsi-hd,drive=3Dhd0 -bl=
ockdev driver=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_devi=
ce,file.filename=3D/dev/zvol/hackpool-0/debian-buster-arm64 -kernel
~/lsrc/linux.git/builds/arm64.nopreempt/arch/arm64/boot/Image -append "cons=
ole=3DttyAMA0 root=3D/dev/sda2" -display none -m 8G,maxmem=3D8G -smp 12


>
> QEMU reports this error from hw/pci/msix.c:
> error_setg(errp, "MSI-X is not supported by interrupt controller");
>
> Probably, the variable 'msi_nonbroken' would be initialized in
> hw/intc/arm_gicv3_its_common.c:
> gicv3_its_init_mmio(..)
>
> I guess that it works with KVM acceleration only rather than with TCG.
>
> The error persists after applying the series:
> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html
> "GICv3 LPI and ITS feature implementation"
> (special thanks for referring me to that)
>
> Please, make me clear and advise ideas how that error can be fixed?
> Should the MSI-X support be implemented with GICv3 extra?
>
> When successful, I would like to test QEMU for a maximum number of cores=
=20
> to get the best MTTCG performance.
> Probably, we will get just some percentage of performance enhancement=20
> with the BQL series applied, won't we? I will test it as well.
>
> Best regards,
> Andrey Shinkevich
>
>
> On 5/12/21 6:43 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:
>>=20
>>> Dear colleagues,
>>>
>>> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 h=
ost.
>>> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:
>>>
>>> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
>>>
>>> The version 3 of the Generic Interrupt Controller (GICv3) is not
>>> supported in QEMU for some reason unknown to me. It would allow to
>>> increase the limit of CPUs and accelerate the MTTCG performance on a
>>> multiple core hypervisor.
>>=20
>> It is supported, you just need to select it.
>>=20
>>> I have got an idea to implement the Interrupt Translation Service (ITS)
>>> for using by MTTCG for ARM architecture.
>>=20
>> There is some work to support ITS under TCG already posted:
>>=20
>>    Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
>>    Date: Thu, 29 Apr 2021 19:41:53 -0400
>>    Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>
>>=20
>> please do review and test.
>>=20
>>> Do you find that idea useful and feasible?
>>> If yes, how much time do you estimate for such a project to complete by
>>> one developer?
>>> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?
>>=20
>> As far as MTTCG performance is concerned there is a degree of
>> diminishing returns to be expected as the synchronisation cost between
>> threads will eventually outweigh the gains of additional threads.
>>=20
>> There are a number of parts that could improve this performance. The
>> first would be picking up the BQL reduction series from your FutureWei
>> colleges who worked on the problem when they were Linaro assignees:
>>=20
>>    Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from cpu_handle=
_interrupt/exception path
>>    Date: Wed, 19 Aug 2020 14:28:49 -0400
>>    Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>
>>=20
>> There was also a longer series moving towards per-CPU locks:
>>=20
>>    Subject: [PATCH v10 00/73] per-CPU locks
>>    Date: Wed, 17 Jun 2020 17:01:18 -0400
>>    Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>
>>=20
>> I believe the initial measurements showed that the BQL cost started to
>> edge up with GIC interactions. We did discuss approaches for this and I
>> think one idea was use non-BQL locking for the GIC. You would need to
>> revert:
>>=20
>>    Subject: [PATCH-for-5.2] exec: Remove MemoryRegion::global_locking fi=
eld
>>    Date: Thu,  6 Aug 2020 17:07:26 +0200
>>    Message-Id: <20200806150726.962-1-philmd@redhat.com>
>>=20
>> and then implement a more fine tuned locking in the GIC emulation
>> itself. However I think the BQL and per-CPU locks are lower hanging
>> fruit to tackle first.
>>=20
>>>
>>> Best regards,
>>> Andrey Shinkevich
>>=20
>>=20


--=20
Alex Benn=C3=A9e

