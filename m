Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005C4AA59
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 20:52:21 +0200 (CEST)
Received: from localhost ([::1]:32874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdJDP-0006Hj-GJ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 14:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hdJBu-0005hH-H2
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 14:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hdJBt-0000g6-Ek
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 14:50:46 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45939)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hdJBt-0000cf-5u
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 14:50:45 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N9MlG-1iiYwA2Ztc-015H31; Tue, 18 Jun 2019 20:44:58 +0200
To: Lucien Murray-Pitts <lucienmp_antispam@yahoo.com>, qemu-devel@nongnu.org
References: <20190526075056.33865-1-lucienmp_antispam@yahoo.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ab1edfe7-8498-eee6-096c-d66d6122d133@vivier.eu>
Date: Tue, 18 Jun 2019 20:44:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190526075056.33865-1-lucienmp_antispam@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X/vrb1+Xjog3zPZBeqiyKAgGQTxqjf5PeGD9CA+SGT0/AcL7r0c
 Ywt5jbOaR8vrlnh7lnSsgnK6xiW/HbCRq0CmOIBi+owOycnMK2q4xwUbivpXOpqOW0CH+JG
 IkR7VTvbNnj19DF/S/+/XVuzhW4PM8/9TrKhNhoDjHWMS3wlj1SMbG7btt/gkZGKiJb3fNM
 EEkHj1yXWDc8AqSf60W/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dl9s3Tq6AC0=:R8/HfhFtZ1cWpRfkFrPzJ5
 mhIO2E6tmwk4pI+41JopDJaKvAo+P3kNopo1dI1XvHEFkAKdKNxMaTIP58nRHiYArygRv0f5t
 jyT6haAcnC2Op5Lyu8zOJ7Cb+sTsITJ8FM051W14n731H+Ooj+cxjOyeQlNOMa3UEi8hUqN54
 mRxumL2jLoTh54KnJSmJZ2QSVvpDWwCvC09D3MF9vn3tEUq+ybXXWwD+bQYtLMQjh9HV93AH9
 qzRZ8EhC5UJhiV4RshjcIvcb1dEMmhArvl5+xhmOTJUmpzCxiNJhPTkyKyTUU71zafWis+DYe
 KtHjvHjYB92MxizVIL6sRh/v92RqEJA8DDeYkjylD6HPfGcnPSFZe8Y3hY8xenPH70Blb5h1I
 zn5KxczcH6L1NU4o2AY+4kp3tIP/Rjh58AgEwFWgSeaHy2gWACA78xCEaP/M6KvlNb8DJoAqH
 RxPlsZouFvFOeTAFU6DuX88WE25rO4q0JkvknmgTn7SXpGaHopNp4H3NC6w0uSqUtiDKyq3vu
 iEZxgHeP3eE/5amkrpTbXBYV5yu44dTMRJkO9HUVPnm7pJCMXvqQk00KvgWno4vZcOnftz+QA
 lrGlK2NM67wv99S5y18ek5xwGOkYL9qsVra8QsvyWEW7dYRI0F1d4f/9e0xs/fEAGhB+mbtRH
 ku99pUqXCLVaJP1M8/x1ghKN3eqbD3fkRMF2oOg3mcpnEqsnks0j/Fzf61hD8vUl3Em3boiD6
 YPXymTU49vXnrt8Hjm0uO6EmhijA+mJtQZg9qqIFZLADeadSu8jtNsSCuO4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-devel] [PATCH] Regression for m68k causing Single-Step
 via GDB/RSP to not single step
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/05/2019 à 09:50, Lucien Murray-Pitts a écrit :
> A regression that was introduced, with the refactor to TranslatorOps,
> drops two lines that update the PC when single-stepping is being performed.
> ( short commit 11ab74b )
> 
> This patch resolves that issue.

Fixes: 11ab74b01e0a ("target/m68k: Convert to TranslatorOps")

> Signed-off-by: Lucien Murray-Pitts <lucienmp_antispam@yahoo.com>
> ---
>  target/m68k/translate.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index f0534a4ba0..2922ea79c3 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -6130,6 +6130,8 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>          return;
>      }
>      if (dc->base.singlestep_enabled) {
> +        update_cc_op(dc);
> +        tcg_gen_movi_i32(QREG_PC, dc->pc);
>          gen_helper_raise_exception(cpu_env, tcg_const_i32(EXCP_DEBUG));
>          return;
>      }
> 

I've tested this fix single-stepping on a kernel, these two lines are 
not enough to fix the problem. In fact four lines have been dropped and 
we must re-add them all:

iff --git a/target/m68k/translate.c b/target/m68k/translate.c
index d0f6d1f5cc..6c78001501 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6200,6 +6200,10 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
     if (dc->base.singlestep_enabled) {
+        if (dc->base.is_jmp != DISAS_JUMP) {
+            update_cc_op(dc);
+            tcg_gen_movi_i32(QREG_PC, dc->pc);
+        }
         gen_helper_raise_exception(cpu_env, tcg_const_i32(EXCP_DEBUG));
         return;
     }

The problem happens when we single-step over an "rts" instruction, 
instead of returning to the caller the PC points to the following 
instruction (PC + 2):

0x00002e26 in arch_cpu_idle ()
1: x/i $pc  0x2e26 <arch_cpu_idle+4>:	rts
(gdb) si
0x00002e28 in machine_restart ()
1: x/i $pc  0x2e28 <machine_restart>:	moveal 0x438ae4 <mach_reset>,%a0

The good instruction stream is:

0x00002e26 in arch_cpu_idle ()
1: x/i $pc  0x2e26 <arch_cpu_idle+4>:	rts
(gdb) si
0x0002be6a in do_idle ()
1: x/i $pc  0x2be6a <do_idle+114>:	movew %sr,%d0

Thanks,
Laurent

