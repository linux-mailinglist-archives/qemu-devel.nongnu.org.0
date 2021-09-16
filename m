Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F440D7E9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:53:39 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQp1O-0005zi-Gn
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQozm-0003YB-Qx; Thu, 16 Sep 2021 06:51:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40550
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQozk-0007Xa-3h; Thu, 16 Sep 2021 06:51:58 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQoza-0000I0-M1; Thu, 16 Sep 2021 11:51:50 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210916084002.1918445-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <d7b78e5f-f283-fcb5-964d-306420bf1088@ilande.co.uk>
Date: Thu, 16 Sep 2021 11:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210916084002.1918445-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] target/sparc: Make sparc_cpu_dump_state() static
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
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
Cc: qemu-trivial@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/2021 09:40, Philippe Mathieu-Daudé wrote:

> The sparc_cpu_dump_state() function is only called within
> the same file. Make it static.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/sparc/cpu.h | 1 -
>   target/sparc/cpu.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index ff8ae73002a..1f40d768d8b 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -571,7 +571,6 @@ extern const VMStateDescription vmstate_sparc_cpu;
>   #endif
>   
>   void sparc_cpu_do_interrupt(CPUState *cpu);
> -void sparc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>   hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>   int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>   int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 5a8a4ce7506..21dd27796d0 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -612,7 +612,7 @@ static void cpu_print_cc(FILE *f, uint32_t cc)
>   #define REGS_PER_LINE 8
>   #endif
>   
> -void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +static void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   {
>       SPARCCPU *cpu = SPARC_CPU(cs);
>       CPUSPARCState *env = &cpu->env;

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

