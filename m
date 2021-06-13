Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B7C3A58EF
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 16:04:51 +0200 (CEST)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsQjJ-0000x9-SI
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 10:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsQhl-0000GY-9J
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 10:03:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41106
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsQhf-0003Qe-By
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 10:03:13 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsQhQ-0005FC-9X; Sun, 13 Jun 2021 15:02:56 +0100
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org> <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com> <87sg1ogsvj.fsf@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
Date: Sun, 13 Jun 2021 15:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87sg1ogsvj.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: tb_flush() calls causing long Windows XP boot times
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.144,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/2021 19:22, Alex Bennée wrote:

(added Gitlab on CC)

> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 11/06/21 17:01, Programmingkid wrote:
>>> Hello Alex,
>>> The good news is the source code to Windows XP is available
>>> online:https://github.com/cryptoAlgorithm/nt5src
>>
>> It's leaked, so I doubt anybody who's paid to work on Linux or QEMU
>> would touch that with a ten-foot pole.
> 
> Indeed.
> 
> Anyway what the OP could do is run QEMU with gdb and -d nochain and
> stick a breakpoint (sic) in breakpoint_invalidate. Then each time it
> hits you can examine the backtrace to cpu_loop_exec_tb and collect the
> data from tb->pc. Then you will have a bunch of addresses in Windows
> that keep triggering the behaviour. You can then re-run with -dfilter
> and -d in_asm,cpu to get some sort of idea of what Windows is up to.

I have been able to recreate this locally using my WinXP and it looks like during 
boot WinXP goes into a tight loop where it writes and clears a set of breakpoints via 
writes to DB7 which is what causes the very slow boot time.

Once boot proceeds further into the login screen, the same code seems to called 
periodically once every second or so which has less of a performance impact.

For testing I applied the following diff:

diff --git a/cpu.c b/cpu.c
index 164fefeaa3..3155d935f1 100644
--- a/cpu.c
+++ b/cpu.c
@@ -252,13 +252,7 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, 
MemTxAttrs attrs)

  static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
  {
-    /*
-     * There may not be a virtual to physical translation for the pc
-     * right now, but there may exist cached TB for this pc.
-     * Flush the whole TB cache to force re-translation of such TBs.
-     * This is heavyweight, but we're debugging anyway.
-     */
-    tb_flush(cpu);
+    fprintf(stderr, "##### bpi @ 0x%lx\n", pc);
  }
  #endif

diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
index 9bdf7e170b..37ee49fd56 100644
--- a/target/i386/tcg/sysemu/bpt_helper.c
+++ b/target/i386/tcg/sysemu/bpt_helper.c
@@ -61,6 +61,7 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
      switch (hw_breakpoint_type(dr7, index)) {
      case DR7_TYPE_BP_INST:
          if (hw_breakpoint_enabled(dr7, index)) {
+            fprintf(stderr, "### dp7 add bp inst @ 0x%lx, index %d\n", env->eip, index);
              err = cpu_breakpoint_insert(cs, drN, BP_CPU,
                                          &env->cpu_breakpoint[index]);
          }
@@ -102,6 +103,7 @@ static void hw_breakpoint_remove(CPUX86State *env, int index)
      switch (hw_breakpoint_type(env->dr[7], index)) {
      case DR7_TYPE_BP_INST:
          if (env->cpu_breakpoint[index]) {
+            fprintf(stderr, "### dp7 remove bp inst @ 0x%lx, index %d\n", env->eip, 
index);
              cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
              env->cpu_breakpoint[index] = NULL;
          }


This gives a repeated set of outputs like this:

##### bpi @ 0x90
### dp7 add bp inst @ 0x8053cab8, index 1
##### bpi @ 0xa4
### dp7 add bp inst @ 0x8053cab8, index 2
##### bpi @ 0xff
### dp7 add bp inst @ 0x8053cab8, index 3
##### bpi @ 0xf
### dp7 remove bp inst @ 0x8053f58a, index 0
##### bpi @ 0x90
### dp7 remove bp inst @ 0x8053f58a, index 1
##### bpi @ 0xa4
### dp7 remove bp inst @ 0x8053f58a, index 2
##### bpi @ 0xff
### dp7 remove bp inst @ 0x8053f58a, index 3
...
...
### dp7 add bp inst @ 0x8053c960, index 0
##### bpi @ 0x90
### dp7 add bp inst @ 0x8053c960, index 1
##### bpi @ 0xa4
### dp7 add bp inst @ 0x8053c960, index 2
##### bpi @ 0xff
### dp7 add bp inst @ 0x8053c960, index 3
##### bpi @ 0xf
### dp7 remove bp inst @ 0x8053c730, index 0
##### bpi @ 0x90
### dp7 remove bp inst @ 0x8053c730, index 1
##### bpi @ 0xa4
### dp7 remove bp inst @ 0x8053c730, index 2
##### bpi @ 0xff
### dp7 remove bp inst @ 0x8053c730, index 3
...
...

 From a vanilla XP install the 2 main sections of code which alter the breakpoint 
registers are at 0x8053cab8 (enable) and 0x8053f58a (disable):


-d in_asm output when enabling breakpoints
==========================================

----------------
IN:
0x8053ca92:  33 db                    xorl     %ebx, %ebx
0x8053ca94:  8b 75 18                 movl     0x18(%ebp), %esi
0x8053ca97:  8b 7d 1c                 movl     0x1c(%ebp), %edi
0x8053ca9a:  0f 23 fb                 movl     %ebx, %dr7

----------------
IN:
0x8053ca9d:  0f 23 c6                 movl     %esi, %dr0

----------------
IN:
0x8053caa0:  8b 5d 20                 movl     0x20(%ebp), %ebx
0x8053caa3:  0f 23 cf                 movl     %edi, %dr1

----------------
IN:
0x8053caa6:  0f 23 d3                 movl     %ebx, %dr2

----------------
IN:
0x8053caa9:  8b 75 24                 movl     0x24(%ebp), %esi
0x8053caac:  8b 7d 28                 movl     0x28(%ebp), %edi
0x8053caaf:  8b 5d 2c                 movl     0x2c(%ebp), %ebx
0x8053cab2:  0f 23 de                 movl     %esi, %dr3

----------------
IN:
0x8053cab5:  0f 23 f7                 movl     %edi, %dr6

----------------
IN:
0x8053cab8:  0f 23 fb                 movl     %ebx, %dr7

### dp7 add bp inst @ 0x8053cab8, index 0
##### bpi @ 0x90
### dp7 add bp inst @ 0x8053cab8, index 1
##### bpi @ 0xa4
### dp7 add bp inst @ 0x8053cab8, index 2
##### bpi @ 0xff
### dp7 add bp inst @ 0x8053cab8, index 3
##### bpi @ 0xf
----------------
IN:
0x8053cabb:  e9 6f ff ff ff           jmp      0x8053ca2f


-d in_asm output when disabling breakpoints
===========================================

IN:
0x8053f58a:  0f 21 c3                 movl     %dr0, %ebx
0x8053f58d:  0f 21 c9                 movl     %dr1, %ecx
0x8053f590:  0f 21 d7                 movl     %dr2, %edi
0x8053f593:  89 5d 18                 movl     %ebx, 0x18(%ebp)
0x8053f596:  89 4d 1c                 movl     %ecx, 0x1c(%ebp)
0x8053f599:  89 7d 20                 movl     %edi, 0x20(%ebp)
0x8053f59c:  0f 21 db                 movl     %dr3, %ebx
0x8053f59f:  0f 21 f1                 movl     %dr6, %ecx
0x8053f5a2:  0f 21 ff                 movl     %dr7, %edi
0x8053f5a5:  89 5d 24                 movl     %ebx, 0x24(%ebp)
0x8053f5a8:  89 4d 28                 movl     %ecx, 0x28(%ebp)
0x8053f5ab:  33 db                    xorl     %ebx, %ebx
0x8053f5ad:  89 7d 2c                 movl     %edi, 0x2c(%ebp)
0x8053f5b0:  0f 23 fb                 movl     %ebx, %dr7

### dp7 remove bp inst @ 0x8053f58a, index 0
##### bpi @ 0x90
### dp7 remove bp inst @ 0x8053f58a, index 1
##### bpi @ 0xa4
### dp7 remove bp inst @ 0x8053f58a, index 2
##### bpi @ 0xff
### dp7 remove bp inst @ 0x8053f58a, index 3
##### bpi @ 0xf
----------------
IN:
0x8053f5b3:  64 8b 3d 20 00 00 00     movl     %fs:0x20, %edi
0x8053f5ba:  8b 9f f8 02 00 00        movl     0x2f8(%edi), %ebx
0x8053f5c0:  8b 8f fc 02 00 00        movl     0x2fc(%edi), %ecx
0x8053f5c6:  0f 23 c3                 movl     %ebx, %dr0

----------------
IN:
0x8053f5c9:  0f 23 c9                 movl     %ecx, %dr1

----------------
IN:
0x8053f5cc:  8b 9f 00 03 00 00        movl     0x300(%edi), %ebx
0x8053f5d2:  8b 8f 04 03 00 00        movl     0x304(%edi), %ecx
0x8053f5d8:  0f 23 d3                 movl     %ebx, %dr2

----------------
IN:
0x8053f5db:  0f 23 d9                 movl     %ecx, %dr3

----------------
IN:
0x8053f5de:  8b 9f 08 03 00 00        movl     0x308(%edi), %ebx
0x8053f5e4:  8b 8f 0c 03 00 00        movl     0x30c(%edi), %ecx
0x8053f5ea:  0f 23 f3                 movl     %ebx, %dr6

----------------
IN:
0x8053f5ed:  0f 23 f9                 movl     %ecx, %dr7

----------------
IN:
0x8053f5f0:  e9 8f 00 00 00           jmp      0x8053f684



ATB,

Mark.

