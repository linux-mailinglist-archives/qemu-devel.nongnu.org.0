Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD45651E780
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 15:44:43 +0200 (CEST)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnKji-0001BA-97
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 09:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnKhq-0000TZ-R3
 for qemu-devel@nongnu.org; Sat, 07 May 2022 09:42:46 -0400
Received: from mout.web.de ([212.227.15.3]:59233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnKho-0007qc-Qu
 for qemu-devel@nongnu.org; Sat, 07 May 2022 09:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1651930961;
 bh=v7unmsZEEVBLKwK4cFyVHP8L27lHbunq7D1AIubeOZI=;
 h=X-UI-Sender-Class:From:Subject:Date:To;
 b=CZGEf/WE9mITFKaOI8bODkhz0ip68n6/Dty3UYXejvJXbBAHgpIstgtMjspzuIDZT
 oRC6GvQ68ngmsejvUzCtv5tjdX+V40KXXmd34QlFJHWO5qZpQ3HQnlmRveojhrTrgO
 xRECYs2yuF7Qk2XKzQTFUYt/m6228kQtoAT+FniY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.29.0.96] ([217.239.164.58]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4eCB-1numiU2KRT-011MZ9 for
 <qemu-devel@nongnu.org>; Sat, 07 May 2022 15:42:41 +0200
From: Chris Howard <cvz185@web.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Possible bug in Aarch64 single-stepping
Message-Id: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
Date: Sat, 7 May 2022 15:42:40 +0200
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3445.104.21)
X-Provags-ID: V03:K1:IC10/4jbbbC5MiKURr+kpE7goeUY7Nzy2umk5frP+3CC/Gx9CN9
 3gDeSjxkJuroQ6nw5MoXEz9TDt2QfWEtbxbaB+0LMQ6raroOWCUex1St6QFozFUPIzF8EKE
 sKiXR1neAgqFmEa3H7XBxHTv6R9aHjO6MAQBw1O0q2PrziuRuv2pP7jHekBSbr0hxyJO1eT
 8otnobsOQQ47FffUhhh2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vlPMaFR8ock=:X9DLFiveafI6BMBUfQ4KmO
 N8WnLqRzngJz2b8Sjhzd2MSyMJwRHr1MpcMq5XU30gb50C0uxy67NcMkOon0qbdjyYvsw6qY/
 RaI2K9ASKDj41C7gJGCh2Xn5NHpt9JHnSM+ZNlSwysLdFJtUHavrMeo7BPKpZZWsCF90InJ87
 zBId2Pekpdnt4SGAxABF+47HYjktKYs9GjbQCaNxtLwLlLCN5Iny6MI6fdHUSPPXSbNEoJzEu
 1Dmx0cf8dcpj11X4cNtK+ct5YqLyfRDliWucCE/MSsmqE2KocGGkpVTbN0VpGWJOhKchYJZXR
 oNM7UcVt9X/iLAseAjUbN2yjhwgVra7HuxREzGBeR2DBDXxhnEtejGxyg6FrcVO7BbEPJFOEK
 R5QTCUFaMB+kJSIH7iRrevevuXn0uW2dqcauVO/t6N1u9CekW45IqzEp6Q3QCwnxKk/f83YYk
 XRKcXVT+vgzcrZjNUWrE0qQey+26jySXhlBStpmCOvnw5DaEoBFH8rNxmo6OrfvlfKdHxGmEM
 lzxI1VUNySG5Zb4ns3HPZolzi5rqSfp7Kmmb0ctBgX8HvJmewdoPBuwW49RuG/bL7MKnsfCzG
 dBaUbReu/o3Ds60OqSrX7mjetxoSz6F9+R7LZqOSB4akvBj661oD5fcIQeYi+AcA8B30iPeqf
 LvH9rRxonijcYVZQRfSku+omsAXr1N3MMGfPhFABoAx+UDf8CVCCtD46MjzpwJVZudoL4GSo2
 Iiy6g/Dqoh69v6em0PaLkrV8G6zuS7p8Pq3hUW9Mq5CTNlbFbFtz+d6KgqLe46a/9aofQ8hvr
 ypOMvJcQ5nJpUuLcgwFiB2nuZwZnRL/jXME/9pRmRSn67H1My721uN3oj6CIUjnLQJrGqefU1
 w9D8szqzk9o/Qp/tlHIaiaVTRQbOIHhJkcR/2nCs12G9o6AtcmDt/W8+oFWXbPs9MkXVfCtCc
 ts6jzbLX/EZ2km3ZG0oyA0h3OacEmfIQjASWlNKWdOBQ9+zcgUHNWjObxVAoPaj3jPkToV/Q2
 Y+ZvVTXpLR3x+hAuYxjVUBQWQrNTqAcLMLhagNelnupW1alIERy1GblzFGBXRoeBlXBQZLnt6
 oXq91RQw6o1V1U=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=cvz185@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi, I=E2=80=99m writing a simple debugger in assembly code for the =
Raspberry Pi 3B (in aarch64).

I=E2=80=99m using QEMU 7.0.0. Everything is running in EL1. (I have MDE =
and KDE set in MDSCR_EL1).

I=E2=80=99m coming across Unexpected Behaviour when playing with =
single-stepping:

It appears that single-stepping is enabled (ie. an exception is =
generated after every instruction) when the SS bit (bit-0) is set in =
MDSCR_EL1 and debug events are enabled in the CPSR (=E2=80=9CD=E2=80=9D =
bit clear) *** irrespective of whether the SS bit (bit-21) is set in =
CPSR or not ***.

I thought the SS bit (bit-21) needs to be set in CPSR for =
single-stepping to occur (and that it gets cleared whenever an exception =
is taken and needs to be reset if one wants to single-step again).

Have I misunderstood / misconfigured something, or is this a bug?

Attached is a minimal(ish) example:


Regards,

chris


/* =
**************************************************************************=
****************

**** built with ****

aarch64-elf-as -march=3Darmv8-a+crc+crypto -mcpu=3Dcortex-a53 --gstabs =
minimal.s -o minimal.o
aarch64-elf-ld minimal.o -T memmap -o minimal.elf
aarch64-elf-objcopy -O binary minimal.elf minimal.img
aarch64-elf-objdump -d -j .text minimal.elf > minimal.list

**** memmap is ****

MEMORY
{
    ram : ORIGIN =3D 0x80000, LENGTH =3D 0x80000000
}

SECTIONS
{
    .init : { *(.init*) } > ram
    .text : { *(.text*) } > ram
    .data : { *(.data*) } > ram
    .bss  : { *(.bss*)  } > ram
}

**** qemu cmd ****

qemu-7.0.0/build/qemu-system-aarch64 -M raspi3b -kernel minimal.img =
-serial null -serial stdio -s -S

**** gdb cmd ****

/opt/local/gnuaarch64/bin/aarch64-none-elf-gdb -x gdb.cmds minimal.elf

**** gdb.cmds is ****

target remote :1234
set $pc =3D 0x80000

=
**************************************************************************=
**************** */

.section .text

.global _start
_start:

    mrs     x0, mpidr_el1               // x0 =3D 00000000.8000.0000
    and     x0, x0, 0b11
    cbz     x0, 2f                      // branch fwd if core =3D=3D 0 =
...
1:
    wfe                                 // ...  else wait for exception =
(ie sleep)
    b       1b
2:
//  mrs     x0, scr_el3                 // Can't access this from EL2. =
But gdb says it's 0x0501
                                        // 0000.0101|0000.0001  10:RW=3D1 =
 8:HCE=3D1  0:NS=3D1

//  mrs     x0, hcr_el2                 // x0 -> 1<<31 (34:E2H=3D0  =
31:RW=3D1  27:TGE=3D0  2:C=3D0  1:M=3D0)

//  mrs     x0, sctlr_el1               // x0 -> 00c5.0838 =3D =
0000.0000|1100.0101|0000.1000|0011.1000
    mov     x0, 0x0800                  // -SA -SA0, -CP15BEN -nTWE =
-nTWI +20:RES1 +28:RES1 +29:RES1
    movk    x0, 0x30d0, lsl 16          // x0 -> 30d0.0800 =3D =
0011.0000|1101.0000|0000.1000|0000.0000
    msr     sctlr_el1, x0

    adr     x0, vectors
    msr     vbar_el1, x0

    adr     x0, _start                  // 0x0008.0000 =3D 512k
    msr     sp_el1, x0                  // set EL1's SP

    mov     x0, 0x3c5                   // NOTE: bit 21:SS is NOT set
    msr     spsr_el2, x0                // DAIF exceptions masked. A64 =
state. EL1. SP =3D SP_ELx

    adr     x0, init
    msr     elr_el2, x0

    eret                                // We're in EL2. Pretend we're =
"returning" to EL1 init:


init:
    msr     OSLAR_EL1, xzr              // unlock OS lock

    mov     x0, 0b101<<13               // 15:MDE (enable debugging) and =
13:KDE (and kernel debug events)
    orr     x0, x0, 0b1<<0              // enable SS debug exceptions
    msr     MDSCR_EL1, x0

    mov     w0, 0                       // these all execute ok
    mov     w0, 1
    b       1f
    mov     w0, -1
1:

    msr     daifclr, 0b1111             // enable all interrupts and =
debugging exceptions

    mov     w0, 3                       // this causes an exception =
ESR_EL1 =3D 0xce000022 (see ARMv8ARM D1-1801)
    mov     w0, 4                       // 0xce =3D 0b1100.1110|- >> 26 =
=3D 0b0011.0011 =3D 0x33 =3D exception class
                                        // ie. SS from same EL. ** even =
though CPSR was 0x00000005 **
    svc     124

    mov     w0, 5
    b       2f
    mov     w0, -2
2:
    mov     w0, 6


loop:
    b       loop


// =
**************************************************************************=
****************************

exc_svc:
    and     w0, w0, 0xffff
    cmp     w0, 123
    beq     svc_123
    cmp     w0, 124
    beq     svc_124
    b       exception_return            // undefined SVCs ignored


svc_123:
    mrs     x0, SPSR_EL1
    orr     x0, x0, 0b1<<21             // (re)enable SS in CPSR
    msr     SPSR_EL1, x0
    b       exception_return


svc_124:
    mrs     x0, SPSR_EL1
    bic     x0, x0, 0b1<<21             // disable SS in CPSR (not =
really necessary since SS gets
    msr     SPSR_EL1, x0                // cleared when an exception =
(eg. SVC) gets taken anyway)
    b       exception_return


exc_dbg:
    mrs     x0, elr_el1

    mrs     x0, SPSR_EL1
    bic     x0, x0, 0b1<<21             // (re)enable SS in CPSR
    msr     SPSR_EL1, x0

    b       exception_return


exception_return:
    ldp     x2, x3, [sp], 16
    ldp     x0, x1, [sp], 16
    eret


.align 11
vectors:
// ************************ from current EL using SP_EL0 =
***************************
v0:                                     // Synchronous
    b       v0
.align 7
v1:                                     // IRQ
    b       v1
.align 7
v2:                                     // FIQ
    b       v2
.align 7
v3:                                     // SError
    b       v3
// ************************ from current EL using SP_EL1+ =
**************************
.align 7
v10:                                    // Synchronous (SVC, MMU, DEBUG)
    stp     x0, x1, [sp, -16]!
    stp     x2, x3, [sp, -16]!

    mrs     x0, esr_el1                 // exception syndrome (ARMv8ARM =
p. D1-1801)
    mov     w1, w0, lsr 26              // w1 -> exception class

    cmp     w1, 0x15                    // SVC=20
    beq     exc_svc

    b       exc_dbg

.align 7
v11:                                    // IRQ
    b       v11
.align 7
v12:                                    // FIQ
    b       v12
.align 7
v13:                                    // SError
    b       v13
// ************************ from lower EL using A64 =
********************************
.align 7
v20:                                    // Synchronous
    b       v20
.align 7
v21:                                    // IRQ
    b       v21
.align 7
v22:                                    // FIQ
    b       v22
.align 7
v23:                                    // SError
    b       v23
// =
**************************************************************************=
*******

data:

