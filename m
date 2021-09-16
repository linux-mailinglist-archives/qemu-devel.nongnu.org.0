Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A78840DA69
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:55:57 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqvk-0003GO-CO
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQqt7-0000tz-C8; Thu, 16 Sep 2021 08:53:13 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQqt5-0007Xq-OS; Thu, 16 Sep 2021 08:53:13 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M8yU2-1mVmIs2pgk-0066gn; Thu, 16 Sep 2021 14:53:00 +0200
Subject: Re: [PATCH] target/sparc: Make sparc_cpu_dump_state() static
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210916084002.1918445-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <83656abd-bff6-e9c0-baf5-b8e6a3d9c5c0@vivier.eu>
Date: Thu, 16 Sep 2021 14:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916084002.1918445-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4sD3o8cNoAYjNTwfnVMHfiZPuzSwLky62d5uI2UgLUV6UK1gVVA
 kNqiof50tmA+jTqu4Hr+baN3FkFAZgYiQhYIo8Pv2lS0cESXYa9M1jKb0///OB0IC0ya8KX
 ISFepcFHgV1Xq0lqa+IAmwi7x32c0FRozmjqcgoAqLiQyFF9CUtDQywSDQSbWMVk2LSSLbs
 DFc30/Za5JfC1byj4/5Cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2WEJI/GwwUE=:Ue8UhIKNuHGQ0Y/OsAjmt8
 6JGgTbbCf89uodWdss4RGsA5j4fcTdxl/i1a3XPwDEFZJfuOc4/rmeXJiE3soysgYNl53zs61
 vhodRm3oJCkgvnnA2rBOanTnCAA+p+0WfDuufqqgBE0N9HR1yeBG8eE1niMgqobhgGebyGd1I
 qbVrQXnG5uDq2SmUNz7XbbqTZoXumaOelodKHurFtQB90arNa+Eq3Hg9yUg1q7sUWqbdL2T4A
 5N17ef2vdJmcIOb9hKO+EX/wqaKN1+vJPxEvNb2Fg/2tZmyu0VeUZfVdfc1AfKYJERdtu8xUd
 IS+Jl/igqw0XgQkV3NF/cFlixEsbIncm5wwsVxsI8hnqHLUkrpQROoQFyr+E4sdMn5+UBdUv6
 ltZlwxu566sJYd6ywuds8Ij05OfZyhe+MJIigpl7LLry3HjO4lQLxE2N2tkieFx7ksXxwA6Hy
 nnTWvKA8E3mzLAhj9HMpT6u5A/iM1YE/cVw7PCNVCdsS66lcMSy9VCab70fS59z0bWa/WPkzw
 XI4q1nJXrXd70Blzx5XNqMjgR6KKKFO38jqvquh2iwWvMvCQ09j/Aryi3Ysj291J9/XUqOuh8
 2oB3ns0Y6zGLjhYLKnV5e+CpTdivtJnnQBAz/NpIXhof8HfyhldSk59ouNOJ4IkNZ3uhiktg+
 kP+CeGYf8BzK1F1UMVRqgMk3wwzmlHz4BUYPq5k7Jinr7U/cUBGEGOuNrkhXRyJtoo3Wwu1AJ
 rjXsbNE9w/VIrQwCESvz0YwDDQiimEC4t6RhYw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/09/2021 à 10:40, Philippe Mathieu-Daudé a écrit :
> The sparc_cpu_dump_state() function is only called within
> the same file. Make it static.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sparc/cpu.h | 1 -
>  target/sparc/cpu.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index ff8ae73002a..1f40d768d8b 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -571,7 +571,6 @@ extern const VMStateDescription vmstate_sparc_cpu;
>  #endif
>  
>  void sparc_cpu_do_interrupt(CPUState *cpu);
> -void sparc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 5a8a4ce7506..21dd27796d0 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -612,7 +612,7 @@ static void cpu_print_cc(FILE *f, uint32_t cc)
>  #define REGS_PER_LINE 8
>  #endif
>  
> -void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +static void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  {
>      SPARCCPU *cpu = SPARC_CPU(cs);
>      CPUSPARCState *env = &cpu->env;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

