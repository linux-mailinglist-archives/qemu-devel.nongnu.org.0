Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE0310D1A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:21:52 +0100 (CET)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82vf-0000ez-Bg
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l82of-0000Sg-7s
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:14:37 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l82oc-0007CU-6V
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:14:36 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a1so8076991wrq.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CXsVVmtHvwNUmLTv/DGXL+P8xIOLS9K0fBrRmIbjviE=;
 b=p6tpCKbmBqPUZuZv1Lq+G0N7i6BeXPr7MCPCL1Z7ZbJyDPsP+ZI06/rkbdli963V5Y
 TfDFT3R8K+guuoeplnu8JaFnRMReVNWu8IWGOkFXU+PVafllGg1caegqQG6MEYmeNhpW
 JVL//dlxKK18rKtEmZdlluBQbJdjuoq7EYy1AOhrNV5lA18kgE5W5T2IIjauJvSIWwdY
 DIIv4DsABESW+MzqPQF4FohmHcr5GJ/fmGocrv70AUKs2ee5x3es22zHKZKoUD/s4Urm
 mENWaRlVnOoxT+pEd4WK0UHXQYCLVoPoGbK4LJ6wuDkXB97F5UaK5psWLE7aCmjgvpml
 5NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CXsVVmtHvwNUmLTv/DGXL+P8xIOLS9K0fBrRmIbjviE=;
 b=YUI1Mk7iCbRk66YOYH4dgLMyDGPpEwazyKbVWz2IPYDk0wap5k/7xgv/h5HfLseJ/3
 SfXUJRmAzCVvHrgT117tGexqZFiHq9gGSi2TBj84DzuwcJm4bvbWUKzuHbhnp4cES8yM
 fccsrRWXKNN9h2GfcIK+JrRkUxX99UvNK598e4k4bwRKRpugGeqTp57wjbk7kjRqss9i
 mpTE60Sp3lck940klT/+gspV9caeI6ees9hW32cq33MgZdXpGXXJUucm9PmXUWM92wN+
 W1bHaVwAM5eZoKbGEjoJPnkVC7FwrjR+YrMAMrLAn3N+0WYJA5nOJB/Ae9gHL8kvB6Yc
 XIlA==
X-Gm-Message-State: AOAM530UQWTWgeXePw4wMYv3Hfny+20G6Gs06przgqSdfUegfynBfO2g
 7l0+5OYotx+x/7EW7Kp8papfOg==
X-Google-Smtp-Source: ABdhPJwKyDiROBbmEM5Y6aLEq2M6jJVbgHIyLQMJYfnRxU7azHxMXPZ7zu45314/GY+jE3WL6gRf9A==
X-Received: by 2002:adf:e3c2:: with SMTP id k2mr5506159wrm.337.1612538071235; 
 Fri, 05 Feb 2021 07:14:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m22sm13881829wrh.66.2021.02.05.07.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:14:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39E181FF7E;
 Fri,  5 Feb 2021 15:14:29 +0000 (GMT)
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain> <871rdupw3h.fsf@linaro.org>
 <YB1VljlPQPRRZUvc@strawberry.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Detecting Faulting Instructions From Plugins
Date: Fri, 05 Feb 2021 15:03:27 +0000
In-reply-to: <YB1VljlPQPRRZUvc@strawberry.localdomain>
Message-ID: <87v9b6o8bu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 05 11:19, Alex Benn=C3=A9e wrote:
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>>=20
>> > For the below output, I've got a plugin which registers a callback via
>> > `qemu_plugin_register_vcpu_insn_exec_cb` for each instruction executed.
>> > I've enabled `-d in_asm` and added prints in my instruction execution
>> > callback when it sees the opcode for the `ldr` instruction in question.
>> > I'm running a local source build of the v5.2.0 release.
>> >
>> > Note in the output below the instruction at 0xffffdd2f1d4102c0 is
>> > getting re-translated for some reason, and that two callbacks are made
>> > to my function registered with qemu_plugin_register_vcpu_insn_exec_cb
>> > (the "*** saw encoding"... output) for what should be one instruction
>> > execution.
>>=20
>> I wonder is that load accessing a HW location? I suspect what is
>> happening is we detect a io_readx/io_writex when ->can_do_io is not
>> true. As HW access can only happen at the end of a block (because it may
>> change system state) we trigger a recompile of that instruction and try =
again.
>
> I just added additional instrumentation, and
> `qemu_plugin_hwaddr_is_io(hwaddr)` returns true in the mem_cb for this
> access.
>
>> > Do you have any tips for debugging this further or ideas for ensuring =
the
>> > callback is called only once for this instruction?
>>=20
>> If you also plant a memory callback you should only see one load
>> happening for that instruction. Could you verify that?
>
> Yes, I've verified there is only one load happening for the instruction,
> and that the ordering of callbacks for this instruction is 1) first
> insn_exec_cb, 2) second insn_exec_cb, 3) mem_cb.
>
> Is there anything else you'd like me to check to validate your theory?

No I think that pretty much confirms the theory.

>> > ----------------
>> > IN:
>> > 0xffffdd2f1d410250:  aa1e03e9  mov      x9, x30
>> > 0xffffdd2f1d410254:  d503201f  nop
>> > 0xffffdd2f1d410258:  a9bc7bfd  stp      x29, x30, [sp, #-0x40]!
>> > 0xffffdd2f1d41025c:  910003fd  mov      x29, sp
>> > 0xffffdd2f1d410260:  a90153f3  stp      x19, x20, [sp, #0x10]
>> > 0xffffdd2f1d410264:  b000f2d3  adrp     x19, #0xffffdd2f1f269000
>> > 0xffffdd2f1d410268:  911c4273  add      x19, x19, #0x710
>> > 0xffffdd2f1d41026c:  a9025bf5  stp      x21, x22, [sp, #0x20]
>> > 0xffffdd2f1d410270:  f000cad6  adrp     x22, #0xffffdd2f1ed6b000
>> > 0xffffdd2f1d410274:  aa0003f5  mov      x21, x0
>> > 0xffffdd2f1d410278:  f9409674  ldr      x20, [x19, #0x128]
>> > 0xffffdd2f1d41027c:  913d42d6  add      x22, x22, #0xf50
>> > 0xffffdd2f1d410280:  f9001bf7  str      x23, [sp, #0x30]
>> > 0xffffdd2f1d410284:  91003297  add      x23, x20, #0xc
>> > 0xffffdd2f1d410288:  91004294  add      x20, x20, #0x10
>> > 0xffffdd2f1d41028c:  1400000d  b        #0xffffdd2f1d4102c0
>> >
>> > ----------------
>> > IN:
>> > 0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]
>> > 0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
>> > 0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
>> > 0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290
>> >
>> > *** saw encoding 0xb94002e2 (@ 504107673 instructions)
>> > ----------------
>> > IN:
>> > 0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]
>> >
>> > *** saw encoding 0xb94002e2 (@ 504107674 instructions)
>> > ----------------
>> > IN:
>> > 0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
>> > 0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
>> > 0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290
>>=20
>> I think you can work around this in your callback by looking for a
>> double execution but that exposes rather more of the knowledge of what
>> is going on behind the scenes than we intended for the plugin interface.
>> The point is you shouldn't need to know the details of the translator to
>> write your instruments.
>
> Yes, working around it in that way was initial my thought as well. I
> think there may be a few (albeit unlikely) corner cases this wouldn't
> work correctly for - like self-branches. I don't think that's a major
> roadblock for now, but I'd love to help work towards a cleaner solution
> in the long-term.

A perhaps lighter weight mechanism is to detect load/store insns and
install a memory callback for those instructions instead of an
instruction callback. That way you only have one callback and it will
always be one that will execute once. Plugins are certainly allowed to
make decisions based on the guest instructions - hence we give access to
that data at translation time.

>
>> My initial thought is that maybe when we install the callbacks we should
>> place them after translation if we know there is a guest load/store
>> happening. However my concern is having such heuristics might miss other
>> cases - could you see a load from HW indirect jump instruction for
>> example? It also has the potential to get confusing when we add the
>> ability to access register values.
>
> Assuming you're right that TCG is detecting "a io_readx/io_writex when
> ->can_do_io is not true", could we detect this case when it occurs and
> omit the instruction callbacks for the re-translation of the single
> instruction (allow the initial callback to stand instead of trying to
> turn back time, in a way, to prevent it)? Maybe there would have be some
> bookkeeping in the plugin infrastructure side rather than entirely
> omitting the callbacks when re-translating, in case that translation got
> re-used in a case which didn't hit the same behavior and shouldn't be
> skipped?

They are happening in two separate phases. The translation phase has no
idea what the runtime condition will be. Once we get to runtime it's too
late - and we trigger a new translation phase.

I'll see what Richard thinks. I must admit I thought can_do_io was only
an issue for -icount modes but I think the real picture is slightly more
confused than that.

>
> I admit I don't understand all the intricacies here, so what I suggest
> may not be reasonable...
>
> -Aaron


--=20
Alex Benn=C3=A9e

