Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18CD402789
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:03:48 +0200 (CEST)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYtI-0004Cn-3S
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYrE-0002T9-2g
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:01:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYrB-0002zJ-B1
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:01:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id b6so13789665wrh.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRMXIbLaNYd4oqQWb1nWoA2AE8Mfyui/ubZLkGOdV0k=;
 b=HV2lwnCZ6w9u1PrLZNpUdEk+o+X3XpuJdE/LD/GH3McEB894d8Shq71WDmHhzodURi
 QhmWRVnN7ecpFw39iiS52bA4nRN5m6uLXFD2aludLv6lsCDqR/SbMFcwaC6Rx/nzORsZ
 9ST1gKIey3shyZnCUs62OqqQsqKkPFZJhkpnF+6t1J+v5+fBC8MIK9/APYV+aGYZUz1b
 t0jejr2v25NwyRdQeO3HVw7s4UV+mE6snsSVryfPLL4BTAVnTTvMVjvzelW4FvwANdDU
 oQgj/jFIpergLPSA3lbc/2WFDpVlc2297XPowfYqcZ3uoPYQxZiuFg90CUhDKjc6Juto
 pQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRMXIbLaNYd4oqQWb1nWoA2AE8Mfyui/ubZLkGOdV0k=;
 b=g4lA4QPNA4a+Oz0IdG8KUziWtusKVoC/ZOa/1U+AC54Fw+Wmj7kq0/+YBuhp12dGi2
 n1sYwUkN0E2SEv5YvRCgGDAetwMmwD/hO6bnvaOJYDeJ76yZqxZqANHSGBT0lPuB4oD4
 TLH/Ov5htTA1gM/JRppFgAm2uDrwszs+KQXnrvFdsjF/YwAv1O+Uc8ex3M7BLYArThUn
 413R0lL5oMmoH1kLILSDUOMAmqiSIRd2CyFT2J85FMZyreoNZgHe4Ldsx5m/8XxVl+W4
 s/qVYV3SjGEB9+BUYGhGYPcBLZf5AIeGpUz9ctKYWvJIe34HfwZXvasaCzoPMxN+ghp2
 /2zA==
X-Gm-Message-State: AOAM533yTr/Pm2NVIQqdKNGGbNwOULkzbX8uI6qL7dRurqgCz/by5tXf
 jAREvkGs3k5yoG6Qnj+guP5lDHesI0cLTROG4NF5/w==
X-Google-Smtp-Source: ABdhPJz2J7Ii4FA6bTHjiJMnX/pjAtMivW1XKmiRU4mdgsmRAGYOI9UWxLZGl+NTYUJGKB86xkbUmFBT49mlsWz7ATk=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr18529223wre.302.1631012494734; 
 Tue, 07 Sep 2021 04:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-5-git-send-email-chunming_li1234@163.com>
 <756203c3-76ec-62ea-beca-91a245059536@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B0114302BA7@SHASXM03.verisilicon.com>
 <4ba6223c-f239-ccd2-e4a8-eb912dd4fb58@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B011430A69F@SHASXM03.verisilicon.com>
 <19a5f05e-1984-095f-67de-a10f0acca947@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B011430A757@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B011430A757@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 12:00:45 +0100
Message-ID: <CAFEAcA8B2cDXqbEStyZfV1F_3cOSTj-y_jyZkjuG3uXYzTqpAg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] hw/arm/virt: Add PL330 DMA controller and connect
 with SMMU v3
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 chunming <chunming_li1234@163.com>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 09:23, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
> Eric Auger wrote:
>> On 9/2/21 8:46 AM, Li, Chunming wrote:
>>> Eric Auger wrote:

>>>> Then I think you need to bring a proper motivation behind adding the
>>>> PL330 in machvirt besides a testing purpose.

>>>> After this series you would get a single platform device connected to
>>>> the SMMU, the PL330. What is the actual use case?

>>> The actual use case is this:
>>> 1. We will have a SoC which has SMMUv3 connected with our owned platform
>>>    Video Encoder/Decoder and other IPs
>>> 2. We plan to use SMMUv3 stage 1 for continuous memory allocation
>>>    and stage 2 for memory protection
>>> 3. We are developing our own IP QEMU models now
>>> 4. These models will be connected with SMMUv3 in QEMU
>>> 5. We will use the QEMU board to development IP driver and ensure the driver
>>>    can work well with Linux SMMU and IOMMU framework

>> I see and I understand your use case for system modeling purpose.
>>
>> This raises few questions/comments though.
>> - supporting platform device protection from the vIOMMU/ARM makes sense
>> to me globally. But above use case does not justify (to me) the
>> introduction of PL330 in machvirt because it would be just for testing
>> purpose. Peter may validate/invalidate though. Instead I think you
>> should try to illustrate this feature with DMA capable platform devices
>> such virtio-net and virtio-block sysbus devices as a counterpart of
>> their PCIe flavour.
>
> Thanks for your suggestion. I will try virtio-net and virtio-block sysbus
> devices in next step.
> But I hope to keep PL330 because it's not just for testing purpose.
> It's a good example to show how to connect platform devices with SMMUv3 based
> on this patch.
> I assume other developer may have same requirement.

I agree with Eric here that the 'virt' board is not the right place
to put this PL330. The 'virt' board is not intended as a dumping
ground or experimental testbed for every possible arm device or
system configuration -- we try to keep it at least reasonably
targeted towards the "generic virtual platform or VM" usecase.

The "sbsa-ref" platform is intended to look more like "real hardware".
It's possible that "memory mapped hardware that sits behind an SMMU"
is something that you would see on the sort of system that sbsa-ref
is trying to model. I've cc'd Leif who would have a better idea about
that.

thanks
-- PMM

