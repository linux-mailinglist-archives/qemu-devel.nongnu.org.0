Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4A4E62D0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:56:16 +0100 (CET)
Received: from localhost ([::1]:40484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXM4d-0004du-Nd
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:56:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXM11-0000XS-8k
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:52:31 -0400
Received: from [2607:f8b0:4864:20::b32] (port=38515
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXM0z-0006cD-Jv
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:52:30 -0400
Received: by mail-yb1-xb32.google.com with SMTP id x20so7866101ybi.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eJhsTQe8P2eeU4B8Z/55Bgfo8Y2lVoNalAMF6mPudeE=;
 b=tflwB+rOs4HlbuoTLW9q6KXf/+i9WwOHAqRx2TBWZ3BMRmk4+x3bmbcJF8QpM/N6Q4
 wbjIzJJBcVnlOafs7egP3aCKdBWwwqLVA3omGpgSWPuYnyCcuDTXRDqg2rUD/lrAcHSj
 vWyLpMZsw15tLxm4idy1//4MUGjs0UD71idKs5VaPKZuP8jizuQtOQnJ33JXSdxUc4Ks
 FO6SLGsJqkP1Rj2n6wNg3o+xYaFLHfjeXQKduKgQ5ThTzhkevNw0JZvf+6RUhgwupqKS
 Cd4Fi79HskcbvSm7/QFL5iHsbdSeG3pb0RzkS9QwR7q2m0/peSYjMxz6yuGsqn3MkEH7
 UOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eJhsTQe8P2eeU4B8Z/55Bgfo8Y2lVoNalAMF6mPudeE=;
 b=Tke9mc1fjgh6f8WyLU4YNwSsK5FBcjGXbO8NxMSa5ijQ3gD+CgPLCz32R5caMJBsTx
 VwsOGrHz8unu0iiXJT0UH690woa/Ou9MrbOFztpuPVZ6cCIRUUcbsJHxChsXlFYPFI+c
 s7YBtzA/xEqjYSIlwW3GOdscF5Q3OXCQ4dUyx6sRlG4jbndxphlt2/wI7RcLeqqZfdHC
 jcgfl/jKxgMPwVOZy052HRwgGo/gAi/cTYvS1rdT9I0BP9PfrM+sZ23oeQ8AaBDyAoVu
 jyr/n9cRs/6zSxLk3el9A5Un+tVMekGUz9duCJGfzpdLhaw9AXm//Ps77SKINc8rBq7n
 2vlA==
X-Gm-Message-State: AOAM530Xee4ZwLR9tlFgNGggPBDD9sXhNKiuxii1Qm1OpBC5/c0k0EZe
 ym9M9M4WiYrE1eg0xfDiBX03FLUDaaZycshpMQ+s9w==
X-Google-Smtp-Source: ABdhPJzkTDhHFyKjF8q4WOprld5zsZJXqLKUlj8+qxso5n4q7FJ3Sg9g/q9oi+qXLxvWlIMVwvc2nZBqhWfY1EZZdGo=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr3336054ybc.39.1648122748561; Thu, 24
 Mar 2022 04:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
 <87wngj3aj2.fsf@linaro.org>
In-Reply-To: <87wngj3aj2.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 11:52:15 +0000
Message-ID: <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 10:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> I think we need to not use cpu_physical_memory_write (which is
> explicitly the system address space) but have a function that takes cpu
> so it can work out the correct address space to you
> address_space_read/write. If null we could probably reasonably use
> first_cpu as an approximation.

It's not sufficient to use address_space_read/write, because the
devices in question are written to figure out the accessing CPU
using current_cpu, not by having different MemoryRegions in the
different per-CPU AddressSpaces. (You can see this because the bug
is present in the common "gdb gives us a virtual address" case which
goes via cpu_memory_rw_debug() and does thus use address_space_read(),
not only in the oddball 'treat addresses from gdb as physaddrs' case.)

If we want to fix this without setting current_cpu, then we need to
rewrite these devices not to be accessing it, which we could do
in one of two ways:
 * have the devices arrange to put different MRs in the ASes
   for each CPU (this is possible today but a massive pain as
   it would likely involve restructuring a lot of board and
   SoC level code)
 * have the MemTxAttrs tell the device what the accessing CPU is
   (probably by extending the requester_id field); this is
   somewhat analogous to how it happens in some cases on real
   hardware, where the AXI bus signals include an ID field
   indicating what initiated the transaction. This feels neater,
   but it's still quite a bit of work for such an unimportant
   corner case.

Or we could work around things, by requiring that devices that
access current_cpu cope with it being NULL in some vaguely
plausible way. This means that even when you tell gdb or the
monitor "access this address using this CPU" you'll get CPU0's
view, of course. Some devices like hw/intc/openpic.c do this already.

Or we could continue to ignore the bug, like we've done for the
past six years, on the basis that you only hit it if you've
done something slightly silly in gdb or the monitor in
the first place :-)

-- PMM

