Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614E3C1939
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:34:36 +0200 (CEST)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Yr4-00070R-LZ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Xui-00063P-Qn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:34:16 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Xuh-00088m-3k
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:34:16 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MFsdD-1lxN3V0r9z-00HOLN; Thu, 08 Jul 2021 19:34:10 +0200
Subject: Re: [PATCH v3 8/8] linux-user/syscall: Remove ERRNO_TABLE_SIZE check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708170550.1846343-1-f4bug@amsat.org>
 <20210708170550.1846343-9-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6c8a3ca1-ee7e-6b3d-ba93-799f1636fa87@vivier.eu>
Date: Thu, 8 Jul 2021 19:34:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708170550.1846343-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dy1KqfGMJbZZBZ96vXwsvH2+Le3M0aEVO6AwTjUWGiEh4u1lqVs
 X4AEy329XYkBet31XIqT6cW4ybv5Pjn2eYTJdYIuEp3hm/L5TVS33SOC1bbgosG0uTq/Ux6
 1WMjWsKpHa5AbQza71LIm4Hl/0swQ2C6/PUZeI+ul1NnxFIY42b614HLiseLqkssAfuSCHg
 FkKoShez7XLVixA679xvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EBsvnbOLY70=:9q40PTTcD+07itJz26IoT5
 5zQ+LYothmnbcaTZ35BLic1qOaZ1e2GlMqmXSFMr2a43DnXSGv5Y5+E6aXvFakDFKZA0rzCoG
 YUxhw+w6gVzhSb8wPxwIO2aSnC4sAbl22GBj5BRL94MjzvRwNgawFevZGseKWbrXIAEDjIG8y
 XT9DOdgEc82dIFg/rkR6pmlmLdZcPpkn476sSLncJ1SZ1Toi57EvILOgln0Q7Ytt9s7ijOgJg
 IOLL9fjVx3c3rGoqLxMspiohS89BwEdyPJ7Zs7M0TU8dRXpJjOwHevjGNitU77oCaloDopERc
 z7U9rKWz3TzvqB5t8qP6Wp/dFRHPmcuO/sT9aQhtune6je1DQSCdTEbZqNkesFbp9uV2wt9uJ
 8dJQQrZ46WcQNsseNTn+ARburnVV3dehNRMfwRFA6zUmZmikY2OlNpFwct1ilHbWj6T/cdej2
 noXLNcD44jomK/NwO2Xo8xVM7hWtysWG7ZdgLThTVwPu7Bn2fffBagfT89H+gTqaV1lioPAJI
 7UWX8RYPpi83dpCQdwooMEEURy2FyoBLK1pfU7fje2F8Lz0Ac+W0Zo8wRmvWqi13+uWiDhR9g
 43qpfXpc8Kb7bGxHM9z5lhH2mBnfii9XirqDjX+eU0lSK2pYsTtn9Ts4MpiKc33V7fGgQ2f3t
 O9k0GB/+PVrTuwE8/qzfDuX9gy2oovl9wG+/QYwiWIXzuNVqreoSDptnK5I18tP7ANUOy3Y7P
 gMLsMe6wdMZWN71G1931ubUrCT7ZKQT25NsRZBWvT0ELaUSNVJCiVyghYvfjGBge04XXswsAQ
 nhzofa7l0fhuMthO26rku6qi0jbxy0Ea8OjMY+mSsZamdHJD7/tE5qnuLq/33g7zAfwovQP
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 19:05, Philippe Mathieu-Daudé a écrit :
> Now than target_to_host_errno() always return an errno, we can
> remove the unused and arbitrary ERRNO_TABLE_SIZE definition.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 94ec6f730b3..376629c6891 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -507,8 +507,6 @@ static inline int next_free_host_timer(void)
>  }
>  #endif
>  
> -#define ERRNO_TABLE_SIZE 1200
> -
>  static inline int host_to_target_errno(int host_errno)
>  {
>      switch (host_errno) {
> @@ -548,9 +546,6 @@ const char *target_strerror(int err)
>          return "Successful exit from sigreturn";
>      }
>  
> -    if ((err >= ERRNO_TABLE_SIZE) || (err < 0)) {
> -        return NULL;
> -    }
>      return strerror(target_to_host_errno(err));
>  }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

