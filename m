Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C697B6D0571
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:56:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrod-00033b-HN; Thu, 30 Mar 2023 08:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1phroY-00032S-45
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:55:38 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1phroW-0005o8-9n
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:55:37 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MC2o9-1pZvr40Bvp-00COi6; Thu, 30 Mar 2023 14:54:51 +0200
Message-ID: <866cb850-8774-e46d-87dd-b96899658e88@vivier.eu>
Date: Thu, 30 Mar 2023 14:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0] linux-user/mips: Use P5600 as default CPU to run
 NaN2008 ELF binaries
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: YunQiang Su <yunqiang.su@cipunited.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jue Wang <jue.wang@oss.cipunited.com>
References: <20230327162444.388-1-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230327162444.388-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bAMdf1ZgrJZJGquemP8fcFv4Ff3KLS9q2+yHANALYWorNnyTLrF
 sYyWLafnwqnSECoCc/REnOzOfQAAOIWs990ziXswvPg9d35NZcSWPXx8WKXCoLftg64WllO
 IwQcBRHab1Z1EgNUhdQmVC8Ou4erZ7pmOrHB6pyyB2qNVsecdpCwKKpTNxWYNGzDaeXhFr+
 1Nfn72Tzz3SpFddt1r6Bw==
UI-OutboundReport: notjunk:1;M01:P0:yk6+5MvWBTE=;wfATaWxJ1JVxWsWl55Xo128BIHX
 /EWh2NO9xtV8ENICb5cNEW/00s3s0bBfmX0AP8qVxF4UfuYAQMEgXd3dI/eaOl+DM1/V19iCv
 Qt8BLploIWQdKhNZ/esM3/H1tvjptbKW3AdcJsJl4poKEvFW2DMQ2l4naZ1GAb5Ba/dPSTYBS
 2G0rG21UAFaGy4ZxW/pRVpvx44Ra/M1DSjQn3g+SQWXOQibkXBYtJJ7O/pd0L3trUJVyDlPNc
 cBMUce20KeYeRQCDbOnf/1PJnEh/aVBIbw7iT7872UX3lhW4YDm/A0K8k/JSqEwgL5mDG2hlu
 rguNXYzqqfIApl6YNos6lKvxJm9vmsOqlWOYb3mQHY7qjZ6C77rnrqBUNk2zmo/leVABtxGKg
 XwEuPTlZA6pnQDkAvSmibwkPTYxx5v7ztU1FB6i0Lil1jCpA6jeG26HazT7q5HXi2SfvfadgK
 P2Nm05WIlXTo/RFZN1UNWpQRX9hWTyyzO9zuX9njQp30bQ9iBBCrzlBDgPHrK0J7P/jbPG/PJ
 520t7Nu5NXJUn68vyGM/YprZpww4b3bCNv1KShV1rPE+BuTY2cjGtgwYU1VAaPR3BGWe23724
 38bVVPZsDZ5lVp4iPRelmrNW0nlHoBIERNd3xfovXP6H8UiJ4mL9fs0VIPnh+I+H9nTBWMZvv
 wJfcasZf+IvS0emdkpEmIc8ONHEWWKUKx9/sfjrmUg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 27/03/2023 à 18:24, Philippe Mathieu-Daudé a écrit :
> Per the release 6.06 revision history:
> 
>   5.03 August 21, 2013
> 
>   • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
>     Descriptions” were optional in release 3 and could be R/W,
>     but as of release 5 are required, read-only, and preset by
>     hardware.
> 
> The P5600 core implements the release 5, and has the ABS2008
> and NAN2008 bits set in CP1_fcr31. Therefore it is able to run
> ELF binaries compiled with EF_MIPS_NAN2008, such the CIP United
> Debian NaN2008 distribution:
> http://repo.oss.cipunited.com/mipsel-nan2008/README.txt
> 
> In order to run such compiled binaries, select by default the
> P5600 core when the ELF 'MIPS_NAN2008' flag is set.
> 
> Reported-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/mips/target_elf.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/mips/target_elf.h b/linux-user/mips/target_elf.h
> index a98c9bd6ad..b965e86b2b 100644
> --- a/linux-user/mips/target_elf.h
> +++ b/linux-user/mips/target_elf.h
> @@ -15,6 +15,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
>       if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
>           return "R5900";
>       }
> +    if (eflags & EF_MIPS_NAN2008) {
> +        return "P5600";
> +    }
>       return "24Kf";
>   }
>   #endif

Acked-by: Laurent Vivier <laurent@vivier.eu>

