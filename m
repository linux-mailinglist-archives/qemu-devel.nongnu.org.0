Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F40536411
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:31:15 +0200 (CEST)
Received: from localhost ([::1]:53038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuazi-00079r-Eo
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuawy-00052l-Fu; Fri, 27 May 2022 10:28:30 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuaww-0006Xi-NC; Fri, 27 May 2022 10:28:24 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDyc8-1o4WZ52CjU-009u8v; Fri, 27 May 2022 16:28:11 +0200
Message-ID: <c59bdffe-9954-6a0e-a9e7-aec611faa8b0@vivier.eu>
Date: Fri, 27 May 2022 16:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 8/8] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Content-Language: fr
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220524140537.27451-1-lucas.araujo@eldorado.org.br>
 <20220524140537.27451-9-lucas.araujo@eldorado.org.br>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220524140537.27451-9-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aSzlDpvL088rkL42/hC3x8r4qjzaVNcFLMbWi0xnq7XD26dOX/9
 30Ke/exewNS5ujKpTx9qgJh+bVuERgUT1IozYx4xg2Bj+BQYlq+DcG+jX1K1X3+Z2NIBJGG
 TYQSyZtUPu75NXfdEPxv+0uQTGJL6KU6n7q8ZmFxjsaezDPaDJB9J7OS0QTaFSmjyId2g03
 Gj6gc5hqpGsR0b45eZ+Cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:97lxUoH2c/w=:0AeztmFIh5hQaBUbTBCkRv
 QdSXjibZ/t9chNY0qQc6O396XqvLZH8gnFvw9EDiCQVzx0/AG3F8ry5Eh7PFFph/3TCP8CjLf
 UV6hEmIjvHyoIou7ApPQ7yUgSOg6R9U6JMcoL4ShbrUK9XZbZDB4Qkumv5J+RHz/yH1NdmR6Z
 z+1wxESN77L5vnLBXFbsXiSaNwryHJWbTPrNGODgag8jbBCZ60Ggp1uS8r+dB4NNVfn2hS9lC
 RKZhlOt9UPffyVYX29D+kivxFa23+WImvOrkFFbWAea6xB49eZKVhzkLSFSvFUSlbqIbMHUgg
 hIIVVNQjfB2LL85Y8Ro529+MHkjYbbc5QU1gPr6uNjN3Sj2EQOWBa8C+XPWmJfvlDjme4Igfc
 Wy7fBxxpUlcqutUyRQEUnUZvzQrgwPgNE01sNmXR896EgfAssf1Zk+MikqAV6g3N2LO5iP5Yf
 v87VGbryJ0NM2F++xVknIPWHJb90Vy846JEDukSt42nVo4pXCcBQBw8Tq40BJcOGwiWJP3BJ3
 +uioOuxImsNNAEe/Rj9MuszqVF66UWAikcAuxomGkCw05kQPw1UMnCL5II+vAElVY+HOkESvb
 MNqDkCXMdK+n0VXQZqIPE13JShIIB42u0qTbbTqbY3gfEma0aoP+2rc/ef7YqASg64FL7NbwN
 61gKdXkU1oN2As3JrM1w8kNqbaogOaut3xDnlyoqhPmqFJE23KBmU58MNIuyoKGQlfWeoudI9
 UcP0iSzGdaqLeHRsnx0ckiRrtTecGDu9mmxwFw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/05/2022 à 16:05, Lucas Mateus Castro(alqotel) a écrit :
> From: Joel Stanley <joel@jms.id.au>
> 
> These are new hwcap bits added for power10.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 61063fd974..0908692e62 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -779,6 +779,8 @@ enum {
>       QEMU_PPC_FEATURE2_DARN = 0x00200000, /* darn random number insn */
>       QEMU_PPC_FEATURE2_SCV = 0x00100000, /* scv syscall */
>       QEMU_PPC_FEATURE2_HTM_NO_SUSPEND = 0x00080000, /* TM w/o suspended state */
> +    QEMU_PPC_FEATURE2_ARCH_3_1 = 0x00040000, /* ISA 3.1 */
> +    QEMU_PPC_FEATURE2_MMA = 0x00020000, /* Matrix-Multiply Assist */
>   };
>   
>   #define ELF_HWCAP get_elf_hwcap()
> @@ -836,6 +838,8 @@ static uint32_t get_elf_hwcap2(void)
>                     QEMU_PPC_FEATURE2_VEC_CRYPTO);
>       GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
>                    QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
> +    GET_FEATURE2(PPC2_ISA310, QEMU_PPC_FEATURE2_ARCH_3_1 |
> +                 QEMU_PPC_FEATURE2_MMA);
>   
>   #undef GET_FEATURE
>   #undef GET_FEATURE2

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

