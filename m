Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC82E3B57
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 20:52:41 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNiDw-0003EN-9v
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 14:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNhyC-0002ff-Lq
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 14:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNhyA-0007zr-Hd
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 14:36:24 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33809)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNhy1-0007tb-JT; Thu, 24 Oct 2019 14:36:13 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McH1Q-1hrezo0Xvw-00chCU; Thu, 24 Oct 2019 20:35:56 +0200
Subject: Re: [PATCH v2 14/14] hw/rtc/aspeed_rtc: Remove unused includes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191003230404.19384-1-philmd@redhat.com>
 <20191003230404.19384-15-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <a7021845-b79d-3d0d-3ea7-dd71835d7bda@vivier.eu>
Date: Thu, 24 Oct 2019 20:35:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191003230404.19384-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nAH21MJHPh7V8FPM+nfnRQV7aru0J7+sR40bLRVOn9lxeADLszR
 46fdNONTaxkFYX+dY8nl2EhvjUy3eHXeKtG2f68GnDHLtNgCI4wGFSnZjaIhq5cfzVdEV3I
 Wz6BP4OBqRSXW5FSr+i0/pRTNWFxozKlTguD5jJ2uLH1VWyQ6TCsl7LRha6Wp1QHEvcJbPm
 lLC7V354Kk4OSKD8ZtWqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zc9iOTM8Aps=:wDdb/DZ1n1Xa7/CPaO4gz/
 W5dXvv2bUqcvcCMpnxQ+ftvTeRYmaGjv9uA7GG/9Xj/aZZdJ/ZQnoBJ5olj4YD9PLpz/DMSyY
 dQqNSDhmzkRXrMFO4rtliuI0u1ki/jklf5UZtQqYcQg28B3V2Na4bue98mm93iqTpqeK/xioX
 qI8sbXz6Nv0fEEG8S2Ycjlj9WbcZmS3WlCdYdv95IuG8duH4d+OWZMHiPg+aj7oZX7q8me8RA
 elip8MvK00S9S3QOkvi59HMXKE8TIBz3NpxUzuS9wAHKlYl48UYIdSwwjt/E5T5/9wUrEWs2R
 i/cAkEaFBacv//S/+lvyNHNc6YpFbAS5AivnR9LJWy/vXkEnk55SikIz10QQFWaIHiw7kaGrk
 eIxJLey7xA3pEGZNfzrgix2xLzpePInW4hzIDpOvimNpbrUNvIbuWoMvX0d2CKWdWaiaRxCgx
 yHz/S5bmmwFL1PyQ2fVzBEgi7iX9oKJn6V+4aSW3/DWA06f/TxH2hfadH8Z5al2I5zvSBnCgP
 3r9kRVZlki69Kvjm1x7RFO/hJc3Fx/ej2S+tTUAq0PAkWrILTLT39mBytZ+8ja1fxRz6rQckZ
 Hj21WZ1uW0Xc4e8tW2IXmi8MqweLeGrl4ETozmJqsxA+1f+6nZxJWmoM4b8vTqdet5KmOmCuu
 +TrqCCLWGWWD1e40XLq2rK5SzWRGGqrRGsMCujMo7TL8N/KEVi11QGsH+ofE7gGmFUKwUyj3T
 xV/xE6AhyoIQIRdr2EAfbY4hSFUKbvZfihyWsOdwALduTBzVD0g4JQ7ZVqXxxHdq6E4nwkn5U
 v7JR69IiygTMoEDIztdfoc00Xm1UFTAaHDDsFsHgCE3vR7/nng5qQpZ2wUvFNpSbDMgK+uj/W
 PsRtjLqTkFMsEA0PiGc1MA2XbdO93SwaMT7lcOC18=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/10/2019 à 01:04, Philippe Mathieu-Daudé a écrit :
> The system <stdint.h> include is already provided by "osdep.h"
> (the scripts/clean-includes file clean such headers).
> 
> Commit 64552b6be47 suggests we don't need to include "hw/irq.h":
> 
>     Move the qemu_irq and qemu_irq_handler typedefs from hw/irq.h to
>     qemu/typedefs.h, and then include hw/irq.h only where it's still
>     needed.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/rtc/aspeed_rtc.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/hw/rtc/aspeed_rtc.h b/include/hw/rtc/aspeed_rtc.h
> index 3fde854ad9..b94a710268 100644
> --- a/include/hw/rtc/aspeed_rtc.h
> +++ b/include/hw/rtc/aspeed_rtc.h
> @@ -8,9 +8,6 @@
>  #ifndef HW_RTC_ASPEED_RTC_H
>  #define HW_RTC_ASPEED_RTC_H
>  
> -#include <stdint.h>
> -
> -#include "hw/irq.h"
>  #include "hw/sysbus.h"
>  
>  typedef struct AspeedRtcState {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

