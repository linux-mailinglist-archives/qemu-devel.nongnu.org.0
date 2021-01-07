Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192382ED53C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:14:37 +0100 (CET)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxYrr-0000K3-O3
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxYpv-0007mf-SA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:12:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxYpq-0001Fy-IM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:12:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r7so6372254wrc.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xbiopbwoNt7EQA82ndqnCl/9Xss6K6UhWlnljqVlhas=;
 b=wucu9Cs5r3CbOUEC2RY0rcY/6eTDIya+cp7HnaxjOmFTWJJ4kVObSUBSyEWV3+f6Sd
 QuYGLf493+PkjxW8nRhcEsq7f1eGKsVObt4830Chh4NhFmCRVeQU6aTaBUcHJYp5iTTm
 Y6e7C/e8tczd98+BMV9rTO39l7T6hiQtj5y0bS9+lG0dOK6Rjt5zEHQrsZojfTWVNII3
 tYvdSFbb3+F9nYIMQ1RlP45ZjpNKEC4NIma7wmfyrPLZ2mmpdhIe9TKIKn76ZJcuuzX2
 tJr1RpjxEbJsTGfxlMKLZF6W98+XXD1ejaZjeqEJgtgW2DZkZ81mSgmJMPjI5zS7dKrm
 /CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xbiopbwoNt7EQA82ndqnCl/9Xss6K6UhWlnljqVlhas=;
 b=ULSldfqRDQ1X/Ql9yZzfEl6sS9GGOazSaFqMGzOdbTBkgJsFPS6eFVGC5+IYTx2NNs
 WaEoIhMIuvHA3izIGpBVFO9aAHX+1OB9CJ2Hr0gY7RrV7N3mDyRhOeXmr2H3HnaE6IMV
 cHhpwDv0t+hL1Hbgj03ZE/ieCQpHJbriChmXkGaQQ8VcNk3Z+jLKKPwJBIJRFQutRIY6
 88DuULqcxNj9NC2m3QZU7FkwEjd4iZEzXntWnbkkT5sMiw5A7FXgXaaR8Pro67FMMWEJ
 l8BD7K+1t4EMAXAuPIgv+7hzMUnkKpezK6IJ0AXAkZ+KCBFXpUzBUa33OVzlAu7q3G0T
 p2Gw==
X-Gm-Message-State: AOAM531kXOlfkW54hwitx6nYQKiUVAFggnOke4YVnKqntfSMiyzFhE6L
 AGTN34/wFP2e54QvN6xltNwhjg==
X-Google-Smtp-Source: ABdhPJz9QBYt8FQjxbkMQk/FxTNB3hMpwBX4u6jvsRXe93Chkaz4+WBbdWoMUV9I3iogAEr0otJRcQ==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr9964500wrx.76.1610039548939; 
 Thu, 07 Jan 2021 09:12:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm8533197wrc.93.2021.01.07.09.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:12:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 374DE1FF7E;
 Thu,  7 Jan 2021 17:12:27 +0000 (GMT)
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org> <X8+R05CCriFWT6G+@strawberry.localdomain>
 <871rg0gogo.fsf@linaro.org> <X8/XiLMe/a+L2v6p@strawberry.localdomain>
 <X+ztKGCrhUb5Rc3C@strawberry.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugin Register Accesses
Date: Thu, 07 Jan 2021 16:49:51 +0000
In-reply-to: <X+ztKGCrhUb5Rc3C@strawberry.localdomain>
Message-ID: <87ble01xj8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

> On Dec 08 14:44, Aaron Lindsay wrote:
>> On Dec 08 17:56, Alex Benn=C3=A9e wrote:
>> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > > On Dec 08 12:17, Alex Benn=C3=A9e wrote:
>> > >> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > >>   Memory is a little trickier because you can't know at any point i=
f a
>> > >>   given virtual address is actually mapped to real memory. The safe=
st way
>> > >>   would be to extend the existing memory tracking code to save the =
values
>> > >>   saved/loaded from a given address. However if you had register ac=
cess
>> > >>   you could probably achieve the same thing after the fact by exami=
ning
>> > >>   the opcode and pulling the values from the registers.
>> > >
>> > > What if memory reads were requested by `qemu_plugin_hwaddr` instead =
of
>> > > by virtual address? `qemu_plugin_get_hwaddr()` is already exposed, a=
nd I
>> > > would expect being able to successfully get a `qemu_plugin_hwaddr` i=
n a
>> > > callback would mean it is currently mapped. Am I overlooking
>> > > something?
>> >=20
>> > We can't re-run the transaction - there may have been a change to the
>> > memory layout that instruction caused (see tlb_plugin_lookup and the
>> > interaction with io_writex).
>>=20
>> To make sure I understand, your concern is that such a memory access
>> would be made against the state from *after* the instruction's execution
>> rather than before (and that my `qemu_plugin_hwaddr` would be a
>> reference to before)?
>>=20
>> > However I think we can expand the options for memory instrumentation
>> > to cache the read or written value.
>>=20
>> Would this include any non-software accesses as well (i.e. page table
>> reads made by hardware on architectures which support doing so)? I
>> suspect you're going to tell me that this is hard to do without exposing
>> QEMU/TCG internals, but I'll ask anyway!
>>=20
>> > > I think I might actually prefer a plugin memory access interface be =
in
>> > > the physical address space - it seems like it might allow you to get
>> > > more mileage out of one interface without having to support accesses=
 by
>> > > virtual and physical address separately.
>> > >
>> > > Or, even if that won't work for whatever reason, it seems reasonable=
 for
>> > > a plugin call accessing memory by virtual address to fail in the case
>> > > where it's not mapped. As long as that failure case is well-document=
ed
>> > > and easy to distinguish from others within a plugin, why not?
>> >=20
>> > Hmmm I'm not sure - I don't want to expose internal implementation
>> > details to the plugins because we don't want plugins to rely on them.
>>=20
>> Ohhh, was your "you can't know [...] mapped to real memory" discussing
>> whether it was currently mapped on the *host*?
>>=20
>> I assumed you were discussing whether it was mapped from the guest's
>> point of view, and therefore expected that whether a guest VA was mapped
>> was a function of the guest code being executed, and not of the TCG
>> implementation. I confess I'm not that familiar with how QEMU handles
>> memory internally.
>
> I'm trying to understand the issue here a little more... does calling
> `cpu_memory_rw_debug()` not work because it's not safe to call in a
> plugin instruction-execution callback? Is there any way to make that
> sort of arbitrary access to memory safely?

It would be safe on a halted system. However you might not get the same
data back as the load/store instruction just executed if the execution
of the instruction caused a change in the page table mappings. For
example on ARM M-profile writing to the mmio MPU control registers will
flush the current address mappings. For example:

  1. access page X
  2. update architecture page tables for page X -> Y
  3. write to MPU control register, trigger tlb_flush
  4. access page X from plugin -> get Y results

IOW accessing cpu_memory_rw_debug from a instrumented load/store helper
for the address just accessed would be fine for that particular address
because nothing will replace the TLB entry while in the helper. However
as a generalised access to memory things may have changed.

I think we can store enough data for a helper like:

  qemu_plugin_hwaddr_get_value(const struct qemu_plugin_hwaddr *haddr)

but we would certainly want to cache the values io_readx and io_writex
use as they will otherwise be lost into the depths of the emulation.

>
> -Aaron


--=20
Alex Benn=C3=A9e

