Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EAB3FEA2E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:45:49 +0200 (CEST)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhPw-0001y6-Bi
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhO8-0001HI-Ac
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:43:56 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhO5-00023a-F6
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:43:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso675878wmi.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ti53vDqHGPS+29MFIGHvZXypEzL7Wm3lRCIZ+JwtstU=;
 b=Qj4joxm+duqElWIVj9ZNcNwpaPL4BBKUpqk8AwIWuK9hD8b7swE1k39JS9GsfLMrEI
 olRyVMEMdK6k/dRaoQsWF3H2IDRvfA2NaTo+KmR0GODKIgUE8/r0jZrN84tsRFTN65/+
 8dgKXchuItj4F4PSKNyR/07cNnsV+4RLwui488lzdWNuUc6wLi6aOkWejVAbe09ZwBX0
 MX1wG6+Cd0TbSxWaVpNuJip4p1vRoR4AyAKeQ8HMO6RRLwMXy23dMt+NXaDrY9a/moEj
 UnNOazB2suMDmlRRNnlJrQ+usxVP0/sgBNSAZXE8PtNsLNc1172O4devA4tIEv6EuJos
 8ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ti53vDqHGPS+29MFIGHvZXypEzL7Wm3lRCIZ+JwtstU=;
 b=oxYsumEMYup/PEpJtZlrFU12wdpI6dhjjFuw/qbaLmjlngbv1cLbe3tCstzBZPEtQy
 soAlne0rJza+HIGA8HdfX8rRw4AP+D5+YzNdsehIitVYhbOToUZHuxeuYVYFMpOgWffu
 46+1m1vrbE+tLPjHQHeuL7re46xDNN5O3PHPUTU9Lg6NXZdZlTn3xmFjrf2VcOC3SmHK
 v5cwFIYKwv/L4CP7IVhW5At1tNjXIfs7JIItfSNyHkxXGi44Ug4VriVp+gMgbGAtd/au
 s4Ey7/x5/Lz7hPOQe7ViDBfMgRObqeIDVeiTp5qfYUGcuZCfKX1Jqjjy1BNIMrtDmonp
 hJ3w==
X-Gm-Message-State: AOAM533dIYWiMXU4ZSgvYeqICQP2pARem/8a/DETuQ+Bpc9OrUQja53F
 W7M7PgbvuKaT43Yy7ilLpht4MH18pAeOUvOcbYGvvA==
X-Google-Smtp-Source: ABdhPJw7vfziDVKJTdNE4w9M7dkKhK3ti7S/iOjCLO6dbhatjLUgAGVoV3Y+2NBRj/i3afrlwC9polYZUFoYbIlAnFY=
X-Received: by 2002:a05:600c:4106:: with SMTP id
 j6mr1775830wmi.102.1630568631546; 
 Thu, 02 Sep 2021 00:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
 <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
In-Reply-To: <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 08:43:02 +0100
Message-ID: <CAFEAcA_Zvw1V5=8OxUXerb3zg=C6AGLfQgZ5k1kCY5NGT-CdHw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 03:18, Duo jia <jiaduo19920301@gmail.com> wrote:
>
>   Hi,
>    thank you for your response.
>    As you say
>>
>>  "End of interrupt handling is entirely dependent on what the
>> guest hardware being emulated is. Usually the guest software
>> will indicate "interrupt handled" back to the interrupt
>> controller (perhaps by writing a register; depends on the
>> interrupt controller), and the interrupt controller will
>> then look at what the next highest priority pending interrupt
>> is and signal that back to the CPU, or do nothing if there's
>> no new interrupt. So the second interrupt will automatically
>> be taken and handled once the first one has finished,
>> as a result of this interrupt controller and guest OS
>> interaction."
>
> I agree with that. I has try some method, But Still have some problems.
>
> Q1:
> My guest(target) cpu seem don't have a   "interrupt handled" , And I don't know How/When to program the  " interrupt controller"   to check the second interrupt when the first over.

There is always some way for the CPU to tell the system
that an interrupt has been dealt with. You don't say what
architecture you're working on, so it's impossible to
be more specific. But I think it is very likely that you
have misunderstood how the hardware works. Typically
you don't need to program the interrupt controller to
check for a second interrupt -- the hw specification
says that it does that automatically.

> Also I found the new problem(maybe bug) , when first interrupt
> not over, the second interrupt may occur

Whether this is permitted or not depends upon the
specification of the hardware. Some interrupt controllers
never allow preemption of interrupts like this. Some
do. Some allow it but only if the guest has programmed
it to permit it (eg by setting priority registers).
As always, you need to look at what the hardware
specification says each component in the system must do
(and at how they interact with each other).

thanks
-- PMM

