Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8634347940
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:08:14 +0100 (CET)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3F7-0002b6-HQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lP3DD-0001og-G1; Wed, 24 Mar 2021 09:06:15 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lP3DB-0007Ml-A4; Wed, 24 Mar 2021 09:06:15 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mn1iT-1m7Qpm3dH5-00k574; Wed, 24 Mar 2021 14:06:06 +0100
To: Andreas Krebbel <krebbel@linux.ibm.com>
References: <20210324085129.29684-1-krebbel@linux.ibm.com>
 <5070a253-cd95-59b0-dbdb-2eb549e9f61c@redhat.com>
 <b48b73ee-b27b-1e3d-3387-ce818e7b0c15@vivier.eu>
 <3d64f14f-58a4-7cc3-a069-f7ed1172d038@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 1/1] linux-user/s390x: Apply h2g to address of sigreturn
 stub
Message-ID: <dfdad0d0-4b1c-d2e8-04c5-e6a2dbebe5b2@vivier.eu>
Date: Wed, 24 Mar 2021 14:06:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <3d64f14f-58a4-7cc3-a069-f7ed1172d038@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:deFrMg6EhT/2Ks2XVAkpkKppsd9kgPChHO+bOB/PHl8xq8uUuJT
 iFqkh/m0VfHswiRlZRrlHHrHryyY2t4o8KXyQPDZ7lMsJq96N6ugSRx7/3bz77F4xzFYWNC
 Ji/ghIMA8+6ekajxH31XfnBab49X89c4y8S+8aRX7zQggIN/8RX0lFrsKYSrwKPYxhwET9/
 HlGOg+NUpCrV/loHQS8eQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EGPv8KUgCwI=:0FWK4ly3tDDMwS8/w7IoXf
 aIZUlk7UdZuE7R/xM3JHQe1TQdKdOptZvUUl+AUwCiR0jxLufvnv0Hoe6NcAHf/xXonob+JZ3
 XWMxy4Y3+DLGqfeafkQDohjEBj19i4XWsDZi+lDut2ptqnfIoneQ1D37l6TofOveqXYb59Y7c
 Kd7NxEbpLEQJJQUcfVns7fNn1OeT7w3ilq/V7LD0Z63MsHDOyRwCU/mbWDDsH9j+QBRH891I5
 mAJ/a0lRQC1v0dnzqGOzXOb8XETYKKmyecPJx6s+rexbIGGUepRYrJzB3yAgxjbWfUGtTy5A6
 Sj9awypn07DsHW1m4Y17YSkwAuiWRHDYHdYlSuDESPD9jStznlQwbMkwvjlmahehUY8O1L3gK
 QEO9Oo3NVSkQK+ItsqrqdDx7XmIUs4ppAfj7X2FszjnEL5nhtyvaoYx728xY3
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2021 à 12:26, Andreas Krebbel a écrit :
> On 3/24/21 11:28 AM, Laurent Vivier wrote:
>> Le 24/03/2021 à 10:17, David Hildenbrand a écrit :
>>> On 24.03.21 09:51, Andreas Krebbel wrote:
>>>> The sigreturn SVC is put onto the stack by the emulation code.  Hence
>>>> the address of it should not be subject to guest_base transformation
>>>> when fetching it.
>>>>
>>>> The fix applies h2g to the address when writing it into the return
>>>> address register to nullify the transformation applied to it later.
>>>>
>>>> Note: This only caused problems if Qemu has been built with
>>>> --disable-pie (as it is in distros nowadays). Otherwise guest_base
>>>> defaults to 0 hiding the actual problem.
>>>>
>>>> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>>>> ---
>>>>   linux-user/s390x/signal.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
>>>> index ecfa2a14a9..1412376958 100644
>>>> --- a/linux-user/s390x/signal.c
>>>> +++ b/linux-user/s390x/signal.c
>>>> @@ -152,7 +152,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>>>>           env->regs[14] = (unsigned long)
>>>>                   ka->sa_restorer | PSW_ADDR_AMODE;
>>>>       } else {
>>>> -        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
>>>> +        env->regs[14] = h2g(frame_addr + offsetof(sigframe, retcode))
>>>>                           | PSW_ADDR_AMODE;
>>
>> Well, it really doesn't sound good as frame_addr is a guest address (and sa_restorer is too)
> 
> I would expect the sa_restorer address to actually point into the guest code section.

yes, it does. like frame_addr. The host address is frame, see:

    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
        goto give_sigsegv;
    }

So frame = g2h(frame_addr)

This line put the address of the next instruction to execute (guest address space):

env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
                        | PSW_ADDR_AMODE;

This line put at this address the NR_sigreturn syscall (but __put_user() uses host address):

        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
                   (uint16_t *)(frame->retcode));

In theory:

    frame_addr + offsetof(sigframe, retcode) == h2g(frame->retcode)

So the next instruction executed after this function is the sigreturn() syscall.

I think the problem is elsewhere.

But I don't see what is the problem you are trying to solve.

> 
>>
>> Where is the code that does the g2h() you want to nullify?
> 
> That's on the code path which usually fetches instructions from memory. In cpu_lduw_code called via:
> 
> s390x_tr_translate_insn->translate_one->extract_insn->ld_code2->cpu_lduw_code

cpu_lduw_code() takes a guest a address and needs to translate it to host address. We need the g2h()
here because we have a guest address.

> 
> 
> Btw. Power also uses h2g while setting up the trampoline address:
> 
> ...
>     save_user_regs(env, mctx);
>     encode_trampoline(TARGET_NR_rt_sigreturn, trampptr);
> 
>     /* The kernel checks for the presence of a VDSO here.  We don't
>        emulate a vdso, so use a sigreturn system call.  */
>     env->lr = (target_ulong) h2g(trampptr);
> ...

But here, it's correct because trampptr is an host address:

    trampptr = &rt_sf->trampoline[0];

Thanks,
Laurent

