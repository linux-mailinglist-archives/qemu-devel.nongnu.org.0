Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FBE538707
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:06:04 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjmF-00048g-6s
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvieH-00034B-CZ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:53:45 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:45742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvieF-0006MW-0c
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:53:44 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-300628e76f3so115165567b3.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iZtq+w0K3cfwsLvEZf+lI+/QO9Scu3dGh1FQK6/h3q4=;
 b=JS1pox9JDUrTxaEreazOAXBXAgtt7Ck5lewlyEyMvGlspbW0WndZ1vwFMuhUITHhSx
 CEQuGF61zWVgbOee5dHYn6XIXGPwyO4NGy+5Ew64lP2eA7jRIM1V/hUJx16RfNUuuidx
 D3PkoYSRCi62/M0R9G9Ff13VwoxGn1ZYCpTJ4wnfrhghB1AfhSliFvZfd49fBHoItzOu
 9anWnSIX+1S8RrRsCELe/WLJo7+hNDMTvRQ/Ti45DN44Hm6eX4Y9Hb8hGeOF6cENNBbF
 +zl8ux05hVv9UWeZOul2nzYpA97vyzZu2C/1Dt4ahP014w3MuieZLGPwspAm+C3cOvv8
 FqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iZtq+w0K3cfwsLvEZf+lI+/QO9Scu3dGh1FQK6/h3q4=;
 b=V1VtxyJcorO2kdNdyTFaVQ5fjsVLM5DIY+luUXTwgSQsPjb9cd4wFn72CyBpx0D85j
 0z+tnWy2w0RhkXVjIVxPy606mQzBfGwfw1TWMBeH5VUbQ9PvTLKzL08zDza/NbrfJ3D+
 VeZj0sc3bkXFxmRcGQF6XrTbBEWqGdWeWP5HjJ17PUbE9D0v4qfmHhPT0tr8AB62gIrz
 zRCcB7nvyVPLP57NFNUXv0Dn/B9QzgJsp8AnDLDZgfvhHjKsvmWr0Nx7tgLxWpLafT8P
 j8QhbpdIpEVbH9msI5MK2YcAXqh2sdme0Ke+5M1wBCVYE02xtKKUHi9YW8X+QWjwz9ub
 iMBg==
X-Gm-Message-State: AOAM531gZKgU/ydoEbdTj79wrPXc9Cvy3kkRd688LrCkQG0RWqe/N0AD
 VXGDXuqV5zuM50PqpEZshSnpB1edLXhqcyWL3eHBNQ==
X-Google-Smtp-Source: ABdhPJz6RR2ZuLgDa7tCrrA63NCRstQvZTLMDVyPu+XQJHojf8C1vFkuejUMzeDNFEJl48nIBn98RqCWpHw00kfrFCA=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr42511016ywb.10.1653929620739; Mon, 30
 May 2022 09:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
In-Reply-To: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 17:53:29 +0100
Message-ID: <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
Subject: Re: Help: How do I make a machine with 2 separate ARM SoC's?
To: Peter Delevoryas <pdel@fb.com>
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 26 May 2022 at 23:14, Peter Delevoryas <pdel@fb.com> wrote:
> Hey QEMU developers,
>
> Cedric mentioned here[1] that QEMU can support emulating a
> more complete board, e.g. a machine with an AST2600 *and* an AST1030.

This is true, as long as all the CPUs are the same
architecture family, e.g. all Arm CPUs. (Mixing A- and
R- or A- and M-profile is OK, they just all have to be
available in the same qemu-system-whatever binary.)

> I read through the memory API docs[2] and it mostly makes sense to me,
> but what I don=E2=80=99t understand is, what does system_memory represent=
?

So, system_memory is something of a legacy from when QEMU was
much older. Before the MemoryRegion and AddressSpace APIs were
added to QEMU, everything that could initiate a memory transaction
(CPUs, DMA-capable devices, etc) always saw the same view of
memory. The functions to do memory accesses just operated on
that view implicitly. (We still have some of them, for instance
cpu_physical_memory_read() and cpu_physical_memory_write().) The
MemoryRegion/AddressSpace APIs are much more flexible and allow
different memory transaction initiators to see different views, as
real hardware does. But for backwards compatibility we still have
the old assumes-one-view APIs. The view those APIs use is the
"system memory". We also have some device models which have been
converted to use an AddressSpace to do their DMA operations, but
which assume they want to use address_space_memory (which is the AS
corresponding to the system_memory MR) instead of taking a
MemoryRegion as a QOM pointer and creating an AddressSpace for it.

In the modern view of the world, you can build up a system with
a set of MemoryRegions. Typically you can start with an empty
container, and the board code fills it with board-level devices,
then passes it to the SoC code, which fills it with SoC devices,
and passes it again to the CPU object, which creates an AddressSpace
so it can initiate transactions into it. By making that initial
"empty container" be the global system_memory MemoryRegion, this
makes the legacy APIs and devices that still use it basically work.

> Or, what should the layout be for a situation like I=E2=80=99m interested=
 in,
> where you have an AST2600 and an AST1030 (and actually, maybe even
> an x86 CPU too? idk if that would be possible).

Cross-architecture heterogenous board models can't be done today:
the qemu-system-foo binaries compile-time build in some assumptions
about specifics of the guest architecture. (This is something it would
be nice to fix, but the amount of work is pretty big and hairy, and
thus far nobody's had a pressing enough need for it to try to tackle it.)

> I need to make sure each SoC runs in a different address space, right?
> But, how do I actually do that? Do I model it as two containers inside
> the large system_memory container, or as two different containers
> that get swapped in for system_memory when executing their associated
> CPU?

The best way to think about QEMU's AddressSpace type is that it is
the interface you use to initiate memory transactions. You create
one from a MemoryRegion. When SoC and board code is building up its
view of the world, what it is really creating and passing around is
a hierarchy of MemoryRegions. It's only when the SoC code hands a
MemoryRegion to a CPU or a DMA-capable device that that device says
"I will need to make transactions to this, let me create the
corresponding AddressSpace".

> I was having trouble figuring out what the Xilinx boards are actually
> doing in this case. Does each CPU share peripherals, or are the
> A + R cpu=E2=80=99s actually in separate address spaces? I=E2=80=99m very=
 confused lol.

xlnx-versal-virt is a virtual board, so ignore that one: it's
probably more confusing than helpful. The xlnx-zcu102 board
uses the xlnx-zynqmp SoC, and that SoC has both R and A profile
CPUs in it, but they both see basically the same view of the
world because they're in the same SoC.

Another device that does some moderately complicated things with
MemoryRegions is the hw/arm/armsse.c SoC, which has several CPUs
and has some per-CPU devices.

I think we have not thus far had a model of a board where different
CPUs see radically different things (only ones where they can see
minor differences), so you'll probably run into places where the
APIs are a bit clunky (and we can perhaps have a go at making
them a bit less so). What I would do is make the system_memory
container be used by whatever is the "main" application processor
SoC in your board. If the two SoCs really see absolutely different
worlds with no shared devices at all, then you'll want to create
a new empty container for the second SoC. If they do have some
board-level shared devices, then you'll want to do something a little
more complicated with aliases.

If you find the SoC device models you're using hardcode use of
system_memory or address_space_memory you should treat those as
bugs to be fixed. Other loose ends (like monitor commands that
assume the system address space) can be ignored: having those
operate on the 'application processor' SoC is fine, I think.

Overall, this is definitely doable but will involve a fair
about of slogging through territory where nobody has yet
broken a trail for you :-)

-- PMM

