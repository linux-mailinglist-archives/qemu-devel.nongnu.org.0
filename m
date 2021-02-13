Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82DD31AE84
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:34:30 +0100 (CET)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB4Qn-00031Z-LM
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB4Pg-0002Rx-3q; Sat, 13 Feb 2021 18:33:20 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB4Pd-0003XC-Uh; Sat, 13 Feb 2021 18:33:19 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MZTyo-1lPq7w0Xf4-00WTwl; Sun, 14 Feb 2021 00:33:06 +0100
Subject: Re: [PATCH] target/avr/cpu: Use device_class_set_parent_realize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210201080348.438095-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fcdf4265-0c39-6d19-1ebf-3515d073f39a@vivier.eu>
Date: Sun, 14 Feb 2021 00:33:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201080348.438095-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OPWls6lARMR0RDv03b/E5MF4L7ZQw+9yAAYNzcYqfnw8Wg9sdQW
 Jpv3kYcZk+XyjDansT4ji6/VgkLTk1Yw4ZGdGmM/MCausbKcsDFEpEjAEEn+mwmn/F0a0eo
 cJdQvDP0a/zWJjeeWkLaHv0JwYIVcUpmziJ3JWzUl4aNnoE8e0cSuWTjGbVwUAqDGJIBIYu
 D1WZeaRQwPQbKP0setajA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WguI94uBaA4=:KBOMvi5t12kIYoOJjbQwH6
 lLuNY09cQzNsK7/58ibZKG7a022zdH29IDkMoKqrBgz56/9me2YWIYG6KdNExL+Q6Iu0AlnNA
 YhkaRbyhmLTKSZQZBvpTWYCJk4vzMRm0D4PYxmu5+VhH3F3c1vCx6rE+sOmAW0OUG8QRSYiFX
 FnqIelqCYpv1uzPBt4A+EPcZtrCXFQq68SE6nwouHFxdioG18lhS5UEy9+HWKCytST1URtORa
 2vFBiFDroQLbAaIkc+uSxarCkbBF4yEB9+kraRkUo7zHVIlhXg+hX129w0pPZZ384J8img/nM
 zXEeJuKQJd2gs8g2RiSmYHsbAkPT+kUNxdNZfcHEUEnQbZE0tqaCeYcgDiETO3yA160J9pIkb
 ikSVfZ+LKxBXoebmH2ZGBfHgZM0uNvJaSomxj2OqknIJKHZTBtob5rKjgN+A3XCQ4LTGz4veM
 nGmqT4/yEQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/02/2021 à 09:03, Philippe Mathieu-Daudé a écrit :
> Change generated automatically using the Coccinelle
> patch included in commit bf853881690 ("qdev: use
> device_class_set_parent_realize/unrealize/reset()")
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/avr/cpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 6f3d5a9e4a7..e60036e41ef 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -190,9 +190,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
>      CPUClass *cc = CPU_CLASS(oc);
>      AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
>  
> -    mcc->parent_realize = dc->realize;
> -    dc->realize = avr_cpu_realizefn;
> -
> +    device_class_set_parent_realize(dc, avr_cpu_realizefn, &mcc->parent_realize);
>      device_class_set_parent_reset(dc, avr_cpu_reset, &mcc->parent_reset);
>  
>      cc->class_by_name = avr_cpu_class_by_name;
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

