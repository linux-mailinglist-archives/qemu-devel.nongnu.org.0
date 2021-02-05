Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96918310AB7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:56:53 +0100 (CET)
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zjI-00080Y-NY
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7ziK-0007Yo-Em
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:55:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7ziI-0002U8-4H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:55:52 -0500
Received: by mail-wm1-x336.google.com with SMTP id y187so5700042wmd.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 03:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4dJpZxQc8ajouJAspbfRxTsIjf1yrkpiIzIKQ60S1H4=;
 b=IT5ICvy0tWH+jAs3XSUSlB3ZLKRTFHuZSsJgo+2jzZQFmxVBaRq+ZgLfU95pMRQH17
 Xw7Ns4+IxpSagFSLKlx7jnHUIb2rpKG/Te6GMO1pFGk6EbmVUDw5nJwtUgSr7cZ+N1Gb
 Loccx5T5/ViUtKsiQ0G7PG69D5sKnE4bKDsd/gCR7vZaiacnCbzvTa1neoeMpP6rCScG
 CMaTCx8J+AzbXk/6WQls1VXpfl82MynKT6dmmksIhF1Z7RwO8Pu2rYJn1p9ZCgimfEKo
 2QACkGANBAcKBfN8+q/fqkvFxSAP/uqn8WRlR6eIxBukmhNUcpzAk+9DErcp73EzKEzE
 Urlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4dJpZxQc8ajouJAspbfRxTsIjf1yrkpiIzIKQ60S1H4=;
 b=PFIoLhu6KGh/ObiFrDOyRhn3EVZk6XIQI/sZz3quoiiOosgVGI913v/qnqLM7r0KWd
 r5x1WXXu/L4tmnXZN2/dL+y8ScYUcxWTZEIs/E3t3Xf1/QxIIKCFuli5Ch5T+ADAZ/WL
 siaL7SyA6tZ2CnqVmKEvehmZEH21/KF508u9prj0b/Anm5uEC8XIdsNsuAQxFq2XQ09p
 19bF/yejoMJ12J06P3rRMvGXZ2ZxMJQZMkBUu8hjjkl/UZpr5/q6U50x/TLeda+k0RXV
 UG3a5XhXzIvKE6FGP0aDEz//gIiBhW3XrtKx4pTbqlIOGNzTPAkwEAulLLasjRkh/r1d
 rasg==
X-Gm-Message-State: AOAM5312qV987SMxHrYZTFnLryNaGe1HgSm0Z9n2g8uoCbYCXpgpLVm/
 6Y6IsXOjOlgL3ERtqVt26PixnQ==
X-Google-Smtp-Source: ABdhPJzFCN5gSm5xPdxRH5GLALs/vPrNN8yvSdemV9DgeRBqBrBX01dg3dufS7xVqZ80rDvssMt58Q==
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr3307874wmd.105.1612526148195; 
 Fri, 05 Feb 2021 03:55:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm11130733wre.78.2021.02.05.03.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 03:55:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 398DB1FF7E;
 Fri,  5 Feb 2021 11:55:46 +0000 (GMT)
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Detecting Faulting Instructions From Plugins
Date: Fri, 05 Feb 2021 11:19:44 +0000
In-reply-to: <YBxnlZFkp7YA9PXL@strawberry.localdomain>
Message-ID: <871rdupw3h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> On Jan 29 22:23, Aaron Lindsay wrote:
>> I appear to be seeing that if I register a callback for an instruction
>> via `qemu_plugin_register_vcpu_insn_exec_cb` I receive a callback even
>> if the instruction faults.
>
> I was wrong about what I was seeing - I made some false assumptions
> based on incomplete information. After adding some additional
> instrumentation, I do not believe what I am seeing is explained by
> translation faults, and think it might even be a bug.

Hmm it's possibly a corner case we don't handle for plugins. Currently
we put instruction callbacks before the actual instruction because we
know a) it has to execute and b) we might not execute any code after -
for example if we do a jump. We do actually put placeholders before and
after each instruction because we do need them for memory
instrumentation.

> For the below output, I've got a plugin which registers a callback via
> `qemu_plugin_register_vcpu_insn_exec_cb` for each instruction executed.
> I've enabled `-d in_asm` and added prints in my instruction execution
> callback when it sees the opcode for the `ldr` instruction in question.
> I'm running a local source build of the v5.2.0 release.
>
> Note in the output below the instruction at 0xffffdd2f1d4102c0 is
> getting re-translated for some reason, and that two callbacks are made
> to my function registered with qemu_plugin_register_vcpu_insn_exec_cb
> (the "*** saw encoding"... output) for what should be one instruction
> execution.

I wonder is that load accessing a HW location? I suspect what is
happening is we detect a io_readx/io_writex when ->can_do_io is not
true. As HW access can only happen at the end of a block (because it may
change system state) we trigger a recompile of that instruction and try aga=
in.

> Do you have any tips for debugging this further or ideas for ensuring the
> callback is called only once for this instruction?

If you also plant a memory callback you should only see one load
happening for that instruction. Could you verify that?

> ----------------
> IN:
> 0xffffdd2f1d410250:  aa1e03e9  mov      x9, x30
> 0xffffdd2f1d410254:  d503201f  nop
> 0xffffdd2f1d410258:  a9bc7bfd  stp      x29, x30, [sp, #-0x40]!
> 0xffffdd2f1d41025c:  910003fd  mov      x29, sp
> 0xffffdd2f1d410260:  a90153f3  stp      x19, x20, [sp, #0x10]
> 0xffffdd2f1d410264:  b000f2d3  adrp     x19, #0xffffdd2f1f269000
> 0xffffdd2f1d410268:  911c4273  add      x19, x19, #0x710
> 0xffffdd2f1d41026c:  a9025bf5  stp      x21, x22, [sp, #0x20]
> 0xffffdd2f1d410270:  f000cad6  adrp     x22, #0xffffdd2f1ed6b000
> 0xffffdd2f1d410274:  aa0003f5  mov      x21, x0
> 0xffffdd2f1d410278:  f9409674  ldr      x20, [x19, #0x128]
> 0xffffdd2f1d41027c:  913d42d6  add      x22, x22, #0xf50
> 0xffffdd2f1d410280:  f9001bf7  str      x23, [sp, #0x30]
> 0xffffdd2f1d410284:  91003297  add      x23, x20, #0xc
> 0xffffdd2f1d410288:  91004294  add      x20, x20, #0x10
> 0xffffdd2f1d41028c:  1400000d  b        #0xffffdd2f1d4102c0
>
> ----------------
> IN:
> 0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]
> 0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
> 0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
> 0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290
>
> *** saw encoding 0xb94002e2 (@ 504107673 instructions)
> ----------------
> IN:
> 0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]
>
> *** saw encoding 0xb94002e2 (@ 504107674 instructions)
> ----------------
> IN:
> 0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
> 0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
> 0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290

I think you can work around this in your callback by looking for a
double execution but that exposes rather more of the knowledge of what
is going on behind the scenes than we intended for the plugin interface.
The point is you shouldn't need to know the details of the translator to
write your instruments.

My initial thought is that maybe when we install the callbacks we should
place them after translation if we know there is a guest load/store
happening. However my concern is having such heuristics might miss other
cases - could you see a load from HW indirect jump instruction for
example? It also has the potential to get confusing when we add the
ability to access register values.

I'll see if I can document the limitation for now though while we think
about the best way forward.

--=20
Alex Benn=C3=A9e

