Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638112D3241
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:36:30 +0100 (CET)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhqf-0002oS-Db
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmhPq-0005i8-0S
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:08:47 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmhPn-00078a-QT
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:08:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r7so5941473wrc.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=C+0a+19DL9hMQsJHYjPOIlyzYLRZWv2DXohL6MQ3Fp0=;
 b=sNFTBkxghxpKqV6YHGLKR1kwr5gCY+nFFdehkoF694ENPyvVOi7j1jOzk1Y343zcnO
 S4t2NEj0dqq+c99sF+/uCXgMG+Gwj4OorEPOeuUTJyvY1IEbV5DGF5l4M8hbdsGNFaKl
 nQBRaPwv5W2SJ8MXPHr7PuoW4IMj/M5kAzOTzz0vgv9hngrQescoCJJoagjOxPkEKWVc
 pV8s/QRnPnf4NNDFxsZ06J3XvTsplzyXvKzFWlT+ljUzSvxNUFEUVzpXMIWr9N87nVuI
 4gNVf8BT0QN7O4ye5nwS25I0dNL8x4HZrCf0NPJ8pD+yK3WRdYN258RYiK6WwIAbGedQ
 uGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=C+0a+19DL9hMQsJHYjPOIlyzYLRZWv2DXohL6MQ3Fp0=;
 b=Q77D3lOPXMVi7qGhEXNKDjjpo3CpoW82cB7BviKGFnE5rmiPbodNyE/Tcpk46rE5FC
 lFCU6DZqbVRHnc/8MPDdh65pzmrk1XcO2S2P4wRzVPjLjLXey0TAdKIYaqrBcizo1raR
 LDyDUHoBikYYJEqFvwBsFcZsy6BkdEBf0fcrd7T7s0Ckya1GDs0EQdbuiIqc2B0zIuz4
 SW5AMxzaGHSuHkfmlE69bcX2dG8FkfmQ0FpIzzhyWL1+aG4ib61jq8gYZNqwKm5GYLMs
 8ipyn8/9wg56WzHe78EqXEmvwOVT+Iffm7QK5D6wwUkKbD4MhQW3nLQz0raPX2t5Do2A
 8mGg==
X-Gm-Message-State: AOAM532nOgS+9GqFTLtoAX9Gn0xDdmUrboXvGz/iL9sx6yr4+SEXPWmn
 TdtHM7IoJs7TKFuYdLKsm6DdXA==
X-Google-Smtp-Source: ABdhPJxYx8uZC3t9ww8tpXR8w230dNYHn4HYBsEeSlIaWN3t5OmeEV/LSrYRH4mWIm82dAzzX4w01A==
X-Received: by 2002:adf:e944:: with SMTP id m4mr22274315wrn.21.1607450921850; 
 Tue, 08 Dec 2020 10:08:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n14sm4818176wmi.1.2020.12.08.10.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:08:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A79511FF7E;
 Tue,  8 Dec 2020 18:08:39 +0000 (GMT)
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org> <X8+R05CCriFWT6G+@strawberry.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugin Register Accesses
Date: Tue, 08 Dec 2020 17:56:33 +0000
In-reply-to: <X8+R05CCriFWT6G+@strawberry.localdomain>
Message-ID: <871rg0gogo.fsf@linaro.org>
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

> On Dec 08 12:17, Alex Benn=C3=A9e wrote:
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>>=20
>> > I'm trying to migrate to using the new plugin interface. I see the
>> > following in include/qemu/qemu-plugin.h:
>> >
>> >> enum qemu_plugin_cb_flags {
>> >>     QEMU_PLUGIN_CB_NO_REGS, /* callback does not access the CPU's reg=
s */
>> >>     QEMU_PLUGIN_CB_R_REGS,  /* callback reads the CPU's regs */
>> >>     QEMU_PLUGIN_CB_RW_REGS, /* callback reads and writes the CPU's re=
gs */
>> >> };
>> >
>> > But I don't see a way to access registers in callbacks. Am I missing
>> > something?
>>=20
>> No - while those symbols do inform the TCG to not try and optimise
>> the register file we don't yet have an API for the plugins for reading
>> (or writing) the CPU registers.
>>=20
>> There has been discussion about this before, I'll quote what I said
>> off-list to someone else who asked:
>>=20
>>   > Has there been any clarification or softening of the position that=20
>>   > exposing register and memory contents to the QEMU plugin would provi=
de a=20
>>   > way to circumvent the GPL of QEMU?
>>=20
>>   I don't think implementing read only access would be a problem and
>>   should probably be a first step anyway.
>
> That seems reasonable to me. For the time being, at least, I am most
> interested in read-only access.
>
>>   For registers I think there needs to be some re-factoring of QEMU's
>>   internals to do it cleanly. Currently we have each front-end providing
>>   hooks to the gdbstub as well as building up their own regid and xml to
>>   be consumed by it. We probably want a architectural neutral central
>>   repository that the front ends can register their registers (sic) and
>>   helpers with. This would then provide hooks for gdbstub to cleanly
>>   generate XML as well as an interface point for the plugin infrastructu=
re
>>   (and probably whatever the HMP uses as well).
>
> In a previous incarnation, I was proxying calls to the plugin API
> directly through to gdb_read_register() in gdbstub.c and therefore using
> gdb as the point of commonality. I'm not saying it's ideal but... it
> works? One downside is that you have to know 'out-of-band' which integer
> value corresponds to the register you want to query for your
> architecture, though it hasn't been a significant issue for me.

Certainly workable for a private branch but I don't want to merge
anything like that upstream. As far as I can see there are a number of
consumers of register information:

  - plugins
  - gdbstub
  - monitor (info registers)
  - -d LOG_CPU logging

so rather than have them all have their hooks into every front-end I can
see a case for consolidation.

For the plugin case providing an introspection helper to get a handle on
the register makes sense and would be less painful than teachning
plugins about gdb regids which can and do move around with new system
registers.

  qemu_plugin_reg_t *handle =3D qemu_plugin_find_register("x2")

if we document the handle as usable across calls this can be done on
start-up. Then it would be:

  uint64_t val =3D qemu_plugin_read_register(cpu_index, handle);

>>   Memory is a little trickier because you can't know at any point if a
>>   given virtual address is actually mapped to real memory. The safest way
>>   would be to extend the existing memory tracking code to save the values
>>   saved/loaded from a given address. However if you had register access
>>   you could probably achieve the same thing after the fact by examining
>>   the opcode and pulling the values from the registers.
>
> What if memory reads were requested by `qemu_plugin_hwaddr` instead of
> by virtual address? `qemu_plugin_get_hwaddr()` is already exposed, and I
> would expect being able to successfully get a `qemu_plugin_hwaddr` in a
> callback would mean it is currently mapped. Am I overlooking
> something?

We can't re-run the transaction - there may have been a change to the
memory layout that instruction caused (see tlb_plugin_lookup and the
interaction with io_writex). However I think we can expand the options
for memory instrumentation to cache the read or written value.

> I think I might actually prefer a plugin memory access interface be in
> the physical address space - it seems like it might allow you to get
> more mileage out of one interface without having to support accesses by
> virtual and physical address separately.
>
> Or, even if that won't work for whatever reason, it seems reasonable for
> a plugin call accessing memory by virtual address to fail in the case
> where it's not mapped. As long as that failure case is well-documented
> and easy to distinguish from others within a plugin, why not?

Hmmm I'm not sure - I don't want to expose internal implementation
details to the plugins because we don't want plugins to rely on them.

>
> -Aaron


--=20
Alex Benn=C3=A9e

