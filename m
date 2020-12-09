Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DA2D4696
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:18:32 +0100 (CET)
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2Ah-0007gk-Gd
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn270-0006F4-Lk
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:14:42 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn26y-0000vy-EG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:14:42 -0500
Received: by mail-wr1-x443.google.com with SMTP id c1so2344195wrq.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 08:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DGAmtdceXQKb0E+73nCz65S1HEaDi8IGTYQFnXZItos=;
 b=vUG1HYp3ssCtsTa0X8Clj54I82aDQzJBExJCGNhGUPZ+4cGyhsjJEjBAbyzuDcXS6M
 1DlIyPJwtGKIV3tlqaxdfQFLlYajmpJWv8aYeTcff4W1TaPzZ/1GVqLpVo+/B1u++pKP
 oxMdApQfHyX+/hRgnFZSFidG/otzdpzoQRLvxPoLplFzy/EXSaOzTIAanv4seGyz/YbB
 cbx09m12jnzQTsdUhNoax5thZPWEHKlmg9w0IuumG44kZ9E3iOn6TNR7GL1kb/6D4/Qf
 YoKCDArhjwbMMjsck4DY/gb7aX5JQMahKoq5KUZLr66mYJ/5YjoDzH5Ff31jUshy/MSo
 GVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DGAmtdceXQKb0E+73nCz65S1HEaDi8IGTYQFnXZItos=;
 b=GJQwgsIb2qHmFwUnwwi61U3Z3FbRFx1Ha0BRRFw+J2ukbc4rlJlxT9qorZXFoAFHzV
 3dqCba2xmriEF2wozry6DIl2UDSZg/9tr1ofIpXEBRQm3stzM8pz2Y9/f5hDvn0RDspZ
 7V0lp6Gm8fdYnH1bGQAlzCZ4QdwzooM72Bn0Yb9PxTIsNS7Q26lZAZhN4vvLvXRQ8No+
 iG6q3VBL/d47j+ikCXZONDnddcp97RSLuqiFIk0z8KKj4Czmc+H2058LQyvJVDjVt4ty
 rAkqAdR5cr3IxQHhUVdzfUyjqF/8N/Yhuq7WRdT8ybiO8hdb96husI2/kiqErbUeQPms
 ummg==
X-Gm-Message-State: AOAM530lUEXenDj6KA33v79oxih6IMo/BmSx73tgi1nPuM/Pwob4DDKY
 cHqMoO77mnp10RIOL0mjv+9RQA==
X-Google-Smtp-Source: ABdhPJwb5YOnGczcUozrJRD0xWe0fAZf+brA2S1OzbaEQqLcMzh/LY8sb+yTwv/EguNU8pARjuQYMg==
X-Received: by 2002:adf:dbc6:: with SMTP id e6mr3540978wrj.37.1607530478554;
 Wed, 09 Dec 2020 08:14:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z13sm4594878wmz.3.2020.12.09.08.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:14:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D7FD1FF7E;
 Wed,  9 Dec 2020 16:14:36 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-21-cfontana@suse.de> <87czzjdxsx.fsf@linaro.org>
 <ff41bd99-c5e8-c517-f7b0-5ab26a9a0e73@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 20/32] cpu: Move tlb_fill to tcg_ops
Date: Wed, 09 Dec 2020 16:12:40 +0000
In-reply-to: <ff41bd99-c5e8-c517-f7b0-5ab26a9a0e73@suse.de>
Message-ID: <87k0trc5xv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 12/9/20 12:26 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> [claudio: wrapped in CONFIG_TCG]
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>  accel/tcg/cputlb.c              |  6 +++---
>>>  accel/tcg/user-exec.c           |  6 +++---
>>>  include/hw/core/cpu.h           |  9 ---------
>>>  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
>>>  target/alpha/cpu.c              |  2 +-
>>>  target/arm/cpu.c                |  2 +-
>>>  target/avr/cpu.c                |  2 +-
>>>  target/cris/cpu.c               |  2 +-
>>>  target/hppa/cpu.c               |  2 +-
>>>  target/i386/tcg-cpu.c           |  2 +-
>>>  target/lm32/cpu.c               |  2 +-
>>>  target/m68k/cpu.c               |  2 +-
>>>  target/microblaze/cpu.c         |  2 +-
>>>  target/mips/cpu.c               |  2 +-
>>>  target/moxie/cpu.c              |  2 +-
>>>  target/nios2/cpu.c              |  2 +-
>>>  target/openrisc/cpu.c           |  2 +-
>>>  target/ppc/translate_init.c.inc |  2 +-
>>>  target/riscv/cpu.c              |  2 +-
>>>  target/rx/cpu.c                 |  2 +-
>>>  target/s390x/cpu.c              |  2 +-
>>>  target/sh4/cpu.c                |  2 +-
>>>  target/sparc/cpu.c              |  2 +-
>>>  target/tilegx/cpu.c             |  2 +-
>>>  target/tricore/cpu.c            |  2 +-
>>>  target/unicore32/cpu.c          |  2 +-
>>>  target/xtensa/cpu.c             |  2 +-
>>>  27 files changed, 41 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>>> index 42ab79c1a5..2dc71b5528 100644
>>> --- a/accel/tcg/cputlb.c
>>> +++ b/accel/tcg/cputlb.c
>>> @@ -1286,7 +1286,7 @@ static void tlb_fill(CPUState *cpu, target_ulong =
addr, int size,
>>>       * This is not a probe, so only valid return is success; failure
>>>       * should result in exception + longjmp to the cpu loop.
>>>       */
>>> -    ok =3D cc->tlb_fill(cpu, addr, size, access_type, mmu_idx, false, =
retaddr);
>>> +    ok =3D cc->tcg_ops.tlb_fill(cpu, addr, size, access_type, mmu_idx,=
 false, retaddr);
>>>      assert(ok);
>>>  }
>>>=20=20
>>> @@ -1557,8 +1557,8 @@ static int probe_access_internal(CPUArchState *en=
v, target_ulong addr,
>>>              CPUState *cs =3D env_cpu(env);
>>>              CPUClass *cc =3D CPU_GET_CLASS(cs);
>>>=20=20
>>> -            if (!cc->tlb_fill(cs, addr, fault_size, access_type,
>>> -                              mmu_idx, nonfault, retaddr)) {
>>> +            if (!cc->tcg_ops.tlb_fill(cs, addr, fault_size, access_typ=
e,
>>> +                                      mmu_idx, nonfault, retaddr)) {
>>>                  /* Non-faulting page table read failed.  */
>>>                  *phost =3D NULL;
>>>                  return TLB_INVALID_MASK;
>>> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>>> index 4ebe25461a..7f53992251 100644
>>> --- a/accel/tcg/user-exec.c
>>> +++ b/accel/tcg/user-exec.c
>>> @@ -186,7 +186,7 @@ static inline int handle_cpu_signal(uintptr_t pc, s=
iginfo_t *info,
>>>      clear_helper_retaddr();
>>>=20=20
>>>      cc =3D CPU_GET_CLASS(cpu);
>>> -    cc->tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, false, pc=
);
>>> +    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, f=
alse, pc);
>>>      g_assert_not_reached();
>>>  }
>>>=20=20
>>> @@ -216,8 +216,8 @@ static int probe_access_internal(CPUArchState *env,=
 target_ulong addr,
>>>          } else {
>>>              CPUState *cpu =3D env_cpu(env);
>>>              CPUClass *cc =3D CPU_GET_CLASS(cpu);
>>> -            cc->tlb_fill(cpu, addr, fault_size, access_type,
>>> -                         MMU_USER_IDX, false, ra);
>>> +            cc->tcg_ops.tlb_fill(cpu, addr, fault_size, access_type,
>>> +                                 MMU_USER_IDX, false, ra);
>>>              g_assert_not_reached();
>>>          }
>>>      }
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 52142e9094..c82ef261c6 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -110,12 +110,6 @@ struct TranslationBlock;
>>>   *       If the target behaviour here is anything other than "set
>>>   *       the PC register to the value passed in" then the target must
>>>   *       also implement the synchronize_from_tb hook.
>>> - * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
>>> - *       address fault.  For system mode, if the access is valid, call
>>> - *       tlb_set_page and return true; if the access is invalid, and
>>> - *       probe is true, return false; otherwise raise an exception and
>>> - *       do not return.  For user-only mode, always raise an exception
>>> - *       and do not return.
>>>   * @get_phys_page_debug: Callback for obtaining a physical address.
>>>   * @get_phys_page_attrs_debug: Callback for obtaining a physical addre=
ss and the
>>>   *       associated memory transaction attributes to use for the acces=
s.
>>> @@ -183,9 +177,6 @@ struct CPUClass {
>>>      void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
>>>                                 Error **errp);
>>>      void (*set_pc)(CPUState *cpu, vaddr value);
>>> -    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>>> -                     MMUAccessType access_type, int mmu_idx,
>>> -                     bool probe, uintptr_t retaddr);
>>>      hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
>>>      hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
>>>                                          MemTxAttrs *attrs);
>>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-op=
s.h
>>> index e12f32919b..2ea94acca0 100644
>>> --- a/include/hw/core/tcg-cpu-ops.h
>>> +++ b/include/hw/core/tcg-cpu-ops.h
>>> @@ -37,6 +37,18 @@ typedef struct TcgCpuOperations {
>>>      void (*cpu_exec_exit)(CPUState *cpu);
>>>      /** @cpu_exec_interrupt: Callback for processing interrupts in cpu=
_exec */
>>>      bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>>> +    /**
>>> +     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
>>> +     *
>>> +     * For system mode, if the access is valid, call tlb_set_page
>>> +     * and return true; if the access is invalid, and probe is
>>> +     * true, return false; otherwise raise an exception and do
>>> +     * not return.  For user-only mode, always raise an exception
>>> +     * and do not return.
>>> +     */
>>> +    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>>> +                     MMUAccessType access_type, int mmu_idx,
>>> +                     bool probe, uintptr_t retaddr);
>>=20
>> As per previous patch, here is a chance to clean-up the comment.
>
>
> Could you provide the text? I think you understand this better than I
> do...

As Eduardo pointed out the kernel-doc pass won't work with in-line
functions unless they are extracted and typedefed which seems excessive
considering we don't currently generate docs from these headers. Ignore
the request.

>
>
>>=20
>> Otherwise:
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>
> Thanks!
>
> Claudio


--=20
Alex Benn=C3=A9e

