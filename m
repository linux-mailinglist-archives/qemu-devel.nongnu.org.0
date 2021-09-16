Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD1A40D789
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:37:27 +0200 (CEST)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoli-0006J4-Be
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQogW-0005lc-9v; Thu, 16 Sep 2021 06:32:04 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:58941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQogT-00079m-TG; Thu, 16 Sep 2021 06:32:03 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1Yl9-1mSBll2pQ3-00388I; Thu, 16 Sep 2021 11:43:18 +0200
Subject: Re: [PATCH] target/sparc: Make sparc_cpu_dump_state() static
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210916084002.1918445-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <508042dd-6cb6-0cc0-54eb-4a8b5411ddc9@vivier.eu>
Date: Thu, 16 Sep 2021 11:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916084002.1918445-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KQUkL+h96Nnb8A0t3XmupWpQkzV6KCqN+e+oDlvV8DYz+Fq6VRw
 8ibvAmzui3eyOQZupbIi7yr6vst4U3ODUt2MCdd1TH0k0nGb+ETAZ9jgsc0nxD4trfc7XCU
 T+N/BTBnCXw63v7D/PWW8V0SQllTmVgtLR9keh0VBgtgWLdu+EsLfSahUtvOwo0LJ4zFoVd
 Sml+xR2SRoftuNgxZS9iA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uMqxoJ0Arao=:+M7apHmANSjev7OhJTL1uD
 xu+fKOGUWMREQZY3wncznVXz7DxFEhWtlxGghl+EVnpvRnbfluZqwoFJT9BtqIw09UesMz1Lm
 6TTnurSYLBsIKamMDCCCbDA7U7Ny4TA235hyWmbds+TEVRCR36Zooi/gfZCriKU6asq2wwB6n
 r2UbgGSFU8Co0zFDRdeCNdxzoCEBKFlr2DByT4vy0A6bujC3qcnQzhM7MD8VmWyiBufWxZUKM
 vUGES0YR1n2Uv/H4dLJtQPV2kYYoGLsvSQsvYEFqaok4LjzGfBs0d2cTXjULOjiN1p1d3Stgb
 4/QkHAXVFhOCgKnJXNZ7MFwvJgaNKys5j2KOCLxrPaslHDeEMWyEGG/xSHOFq2cmG4bxajhpj
 2bH8HCnHYB9pKXrSrLx5AkPFuF12MRZFjcOPA5quSh4I9jscKZibCyAYZ5TUZeig9fwrk8YoI
 8Lffm1VcrouzwsR4ZoejjPIWRC2hfSfkXTXErexwchFKnemXwfAxam1Nh+y6UvY6AaxN8td5T
 lfMSsGUEh4vBS17B/aNMqlLlIODFyteGN+A2t23GReb/al50t8R2wOo7bYC57KiIjDlnCHACh
 a5pyqJUhBv2+CNQrkEO7ehP+SYLEx1X5AnhWwjF+PNti1m3xpzsAxNNvEK3wirBSmYvGXjbqr
 Y6sKZxU3kY5rztcEtMrQrzm3dFjmh5wX9ml4qzdlMr66tUtbxjz96ZOGpumwINwxWma5f+ip6
 a5TlJC4loX+YsteOHtpupPkB3K45oTTB/6r7sMFV+xpQh2CcoNU0nNC0O8C172LbJ27ilpQUM
 eo4nAef
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

