Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD331B91A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:24:19 +0100 (CET)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcvK-0001ir-2J
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBcrR-0007Yq-GO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:20:17 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBcrL-0006vy-CB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:20:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g6so8567906wrs.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 04:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2Tv8HatlnySoXoFUILaftAFbDXlubu9LsAEr/m6lsUQ=;
 b=hEQ6qeDHqODdyw4KmmmEtg9hZ0Sr7uE7oYzDYH0IAIkweL4JPbtjC33XZPsJtGu4Bk
 8O11bVoZM4o2/N8Jt/ZxfEdR/+jhyfwBLD6PeCecDSEdO0LoGbSzY8ar/klY6wXkmodJ
 foRdnuHBaalo57yv5oHF2ymknzelIdGYq6uucHqY9J5Lzm5nB/AYCWK8S94293eghdFV
 dx5z7AjXhhYH5Q2AbtXAsiCYaycLrt9tpVLUtkxt8xur6CCk5ZtTRzCJ8ZeeurEopLjI
 lzoJ+KGFvAIg+TGYhGNPsyUaPrcaMyjRvsZr8dhdVIWb76u40ULSoMKVeIV2TsnqXM6S
 hdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2Tv8HatlnySoXoFUILaftAFbDXlubu9LsAEr/m6lsUQ=;
 b=YuuzS7YvXoAlD9zelatn3SqIy++oOr/vmv36t3+uep/gNb0yhmLxOPeEp1MoQeHlQF
 /TdAStsbR6HZ4+YGFMpFtiWTX8S5BC9HvBmo8SEC7oI8552uViooANxn/ozXEI57KCYB
 85xKIhpOzLPpq27gJtYPKBjrbZnUKL9c5AVuVE+GaZYXyv8H1IT3JVv8wsoA/6ZMZ/We
 eU4yhmURYzY/8iBsUPH4GXh5j6oSnJAA2ossya7bfezg6v2tL0uFs56O8W6SNjIvPAfr
 HdayW5l4RAoz8faMgnAnG8wBsaA+WzVIZIfrhAnDlOUCJ8soa/mUg7ANUt8Nt6G77AFB
 rubQ==
X-Gm-Message-State: AOAM530WRtZsuQ7nOJFWrQ/ijN/LaLKgesvzJZTqRtUKcPwbucJEtt7Y
 4bluVaGvvl0od79GiizjPD3VlA==
X-Google-Smtp-Source: ABdhPJwluY5Z58x59qYXDW96sQrptqYr4CbctUA5yDm+s4YQ3IbbuMR7zDytmmsUUYPeH0qLO8Nx1w==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr18376471wrv.182.1613391609604; 
 Mon, 15 Feb 2021 04:20:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm23013001wrv.51.2021.02.15.04.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 04:20:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F9F81FF7E;
 Mon, 15 Feb 2021 12:20:08 +0000 (GMT)
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-7-f4bug@amsat.org>
 <56d3c4ca-8963-b1c3-8635-58f20fcb8e37@suse.de>
 <40633db0-62ac-4a17-cc20-0cab61bb5df6@amsat.org>
 <e4defdd6-a9f9-94bd-1139-a5c6b949b2e4@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC PATCH 6/6] softmmu: Restrict watchpoint handlers to TCG
 accelerator
Date: Mon, 15 Feb 2021 12:05:09 +0000
In-reply-to: <e4defdd6-a9f9-94bd-1139-a5c6b949b2e4@suse.de>
Message-ID: <871rdhv7yf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 1/18/21 10:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/18/21 10:10 AM, Claudio Fontana wrote:
>>> On 1/17/21 5:48 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Watchpoint funtions use cpu_restore_state() which is only
>>>> available when TCG accelerator is built. Restrict them
>>>> to TCG.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>
>>> I am doing some of this in my series, and I did not notice that
>>> cpu_watchpoint_insert was also TCG only.
>>>
>>> Probably we should merge this somehow.
>>>
>>> I thought it was used by gdbstub.c as well, passing flags BP_GDB .
>>=20
>> BP_MEM_ACCESS for watchpoint.
>>=20
>>> I noticed that gdbstub does something else entirely for kvm_enabled(), =
ie, kvm_insert_breakpoint,
>>> but what about the other accels, it seems that the code flows to the
>>cpu_breakpoint_insert and watchpoint_insert..?

For KVM (and I guess other accelerators) the kvm_insert_breakpoint is
really the entry point for all debug. SW breakpoints are dealt with
separately from HW breakpoints and watchpoints which involve more than
just planting code in the guests RAM.=20

>>>
>>> should cpu_breakpoint_insert have the same fate then?
>>>
>>> And is this really all TCG specific?
>>>
>>> From gdbstub.c:1020:
>>>
>>> static int gdb_breakpoint_insert(int type, target_ulong addr, target_ul=
ong len)
>>> {
>>>     CPUState *cpu;
>>>     int err =3D 0;
>>>
>>>     if (kvm_enabled()) {
>>>         return kvm_insert_breakpoint(gdbserver_state.c_cpu, addr, len, =
type);
>>=20
>> Doh I missed that. I remember Peter and Richard explained it once
>> but I forgot and couldn't find on the list, maybe it was on IRC.
>>=20
>> See i.e. in target/arm/kvm64.c:
>>=20
>>  312 int kvm_arch_insert_hw_breakpoint(target_ulong addr,
>>  313                                   target_ulong len, int type)
>>  314 {
>>  315     switch (type) {
>>  316     case GDB_BREAKPOINT_HW:
>>  317         return insert_hw_breakpoint(addr);
>>  318         break;
>>  319     case GDB_WATCHPOINT_READ:
>>  320     case GDB_WATCHPOINT_WRITE:
>>  321     case GDB_WATCHPOINT_ACCESS:
>>  322         return insert_hw_watchpoint(addr, len, type);
>>  323     default:
>>  324         return -ENOSYS;
>>  325     }
>>  326 }
>>=20
>>>
>>>> ---
>>>> RFC because we could keep that code by adding an empty
>>>>     stub for cpu_restore_state(), but it is unclear as
>>>>     the function is named generically.
>>>> ---
>>>>  include/hw/core/cpu.h | 4 ++--
>>>>  softmmu/physmem.c     | 4 ++++
>>>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>=20
>
> Hello Philippe,
>
> I have reached this issue again when working on the ARM part of the clean=
up,
> did we reach a conclusion on whether cpu_watchpoint_insert is TCG-specifi=
c or not,
>
> and more in general about breakpoints and watchpoints?
>
> The way I encountered this issue now is during the KVM/TCG split in targe=
t/arm.
>
> there are calls in target/arm/cpu.c and machine.c of the kind:
>
> hw_breakpoint_update_all()
> hw_watchpoint_update_all()

This is the third case, using the TCG's internal breakpoint/watchpoint
structures to simulate the hardwares HW breakpoint/watchpoint support
under emulation.

> is this all TCG-specific,
>
> including also hw_watchpoint_update(), hw_breakpoint_update() ?
>
> kvm64.c seems to have its own handling of breakpoints, including arrays:
>
> GArray *hw_breakpoints, *hw_watchpoints;

Correct. KVM and other HW accelerators are really just ensuring that
accounting is done in some arch specific way to ensure registers are
setup and traps properly interpreted.

>
> while the TCG stuff relies on cpu->watchpoints in softmmu/physmem.c:

Because we need core TCG support to detect cases for both gdbstub and
emulating real HW.

>
> $ gid watchpoints
> include/hw/core/cpu.h:139: * address before attempting to match it agains=
t watchpoints.
> include/hw/core/cpu.h:388:    QTAILQ_HEAD(, CPUWatchpoint) watchpoints;
> linux-user/main.c:210:    /* Clone all break/watchpoints.
> linux-user/main.c:212:       BP_CPU break/watchpoints are handled correct=
ly on clone. */
> linux-user/main.c:214:    QTAILQ_INIT(&new_cpu->watchpoints);
> linux-user/main.c:218:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> softmmu/physmem.c:791:    /* keep all GDB-injected watchpoints in front */
> softmmu/physmem.c:793:        QTAILQ_INSERT_HEAD(&cpu->watchpoints, wp, e=
ntry);
> softmmu/physmem.c:795:        QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, e=
ntry);
> softmmu/physmem.c:816:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> softmmu/physmem.c:829:    QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, en=
try);
> softmmu/physmem.c:836:/* Remove all matching watchpoints.  */
> softmmu/physmem.c:841:    QTAILQ_FOREACH_SAFE(wp, &cpu->watchpoints, entr=
y, next) {
> softmmu/physmem.c:868:/* Return flags for watchpoints that match addr + p=
rot.  */
> softmmu/physmem.c:874:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> softmmu/physmem.c:906:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> softmmu/physmem.c:911:                 * Don't process the watchpoints wh=
en we are
> accel/tcg/cpu-exec.c:511:        QTAILQ_FOREACH(wp, &cpu->watchpoints, en=
try) {
> accel/tcg/cpu-exec.c:822:               after-access watchpoints.  Since =
this request should never
> hw/core/cpu.c:361:    QTAILQ_INIT(&cpu->watchpoints);

Also we need softmmu for watchpoints - because otherwise there is no way
to mark memory to trigger on access. One day we might solve this with
the oft talked about softmmu for user-mode combination.

> Even in i386 there is a bit of confusion still, and I think sorting out t=
his could improve the code on i386 as well..
>
> Thanks for any comment,
>
> Ciao,
>
> CLaudio


--=20
Alex Benn=C3=A9e

