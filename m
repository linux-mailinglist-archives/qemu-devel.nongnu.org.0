Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6563333119
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:40:33 +0100 (CET)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJk5g-0001Wj-UO
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJk2p-0007hf-Fo; Tue, 09 Mar 2021 16:37:35 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:48243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJk2n-0006by-PT; Tue, 09 Mar 2021 16:37:35 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLi0U-1l24fF0wt6-00HdyI; Tue, 09 Mar 2021 22:37:17 +0100
Subject: Re: [PATCH v2 3/3] hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20210221225626.2589247-1-f4bug@amsat.org>
 <20210221225626.2589247-4-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <64001fe1-ee40-739b-23b7-b076884ea27e@vivier.eu>
Date: Tue, 9 Mar 2021 22:37:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210221225626.2589247-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HK/yuwPhGH0moDzRu5BKKIph2y9kqlqkVVxuz7mGws+X5bk4gs2
 NwKpQU5q7OMVBRv1mszpG43J8sgoAZO2/8PKXMTEdmGnRwstmfNh6vP+YjzqUn+CC4fYadZ
 PLnPthjEcaDpUyDIRPcJGL5g26CnpJ3XZOZLUG+XPp1d2aroxgUYgUUlm/CNClrz45vmHrb
 mMEc0afrUVq2h2R0rSvng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9QhjvfWftQY=:4ufjZXc+hoa35wOCBJDenE
 kTLzdqDCv401MQ4fh1T256JHyGPOuWtXQMhkxwypLsRsaI+hGJLbkHDVII/oGkaAl163xheQU
 lt3ONyjmFUgbn82xVLm0myvmHWtcY658+ux8LEGvWXjZKxD0KJXkEYWSQnvzgrPvAYhl7whNq
 Waf2pDsRLdk28NaiuNrpL2mhcEHZdyRL9LC4Wp7vjpemEA/h3tdn3nrb0hy76SgeloVPGG6RN
 nyz9hAnFm1p5jnHOtNeH5zB3LEIv63cFNF9DyOljTqLuG8sc3F7P1flDY0VZS0X7KtbnXmVWz
 u1TJAK0S4FkZhtyw9S4yRBj9PCPyyXLdXV8R9HfYpaPZgtyh0l/dmMlk+rATpYr/kmvMnCuo2
 39TIeMf7ebdoh3ejoMwDferfR3IiNLcDEd40yS+X7aPnL6ehA0z4GdlZIfzPU
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/02/2021 à 23:56, Philippe Mathieu-Daudé a écrit :
> The Milkymist board requires more than the PTIMER. Directly
> select the LM32_DEVICES. This fixes:
> 
>   /usr/bin/ld:
>   libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cpu_gdb_read_register':
>   target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
>   target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_im':
>   target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_ip':
>   target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jtx':
>   target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jrx':
>   target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
>   libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_cpu_dump_state':
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
>   target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/lm32/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
> index 518c84ed508..8ac94205d71 100644
> --- a/hw/lm32/Kconfig
> +++ b/hw/lm32/Kconfig
> @@ -6,11 +6,11 @@ config MILKYMIST
>      bool
>      # FIXME: disabling it results in compile-time errors
>      select MILKYMIST_TMU2 if OPENGL && X11
> -    select PTIMER
>      select PFLASH_CFI01
>      select FRAMEBUFFER
>      select SD
>      select USB_OHCI
> +    select LM32_DEVICES
>  
>  config LM32_EVR
>      bool
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


