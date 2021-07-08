Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12AA3C16DC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:07:28 +0200 (CEST)
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WYh-0000tU-Tv
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1VuU-0003Bp-1c
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:54 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1VuO-00021t-2z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:53 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McZfZ-1lTH5T1grN-00d1N4; Thu, 08 Jul 2021 17:25:38 +0200
Subject: Re: [PATCH v2 7/8] linux-user/syscall: Introduce errno_exists()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-8-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bd77a6e1-f804-711f-6a4f-267423162d54@vivier.eu>
Date: Thu, 8 Jul 2021 17:25:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:deG3L8Suoj+U9A06Lzke1dv2hmtwdIfV7YAzfUG0piW3nhZjr0b
 XKkoZA5gksmlpPygOVhrYwc4+eTzqOG3v9Yahnz+wLFwCDX8+1uQsSeqIS0NacBtSiRNrBQ
 4RAWT6BtFMdrBpkv27NIXPyW2MiTTQKOczKcxbv5CIr8D0RxIOfOVdNhn5YsSeDYFr9uR7f
 diqM0s1NAz3DjbogN6qfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8t7xAJP03+k=:7NsXXfa7pK5iK1r2e4Nq+g
 uSUsxjGCFxKVrfsDjrROgJGjhk7dTD4LPJougRZH6j8JR8CbuOUHhqQ4TKQze3Ph/0uVGmAkQ
 ZIoi18J0XzGPBUa/pavfoCUWhYgotfXvXVRmsglyXrA2XjLuUZwLUmUmEHbombDl6L4rhGDv3
 1cLi6i1KDJ0SCw03V6SXPI6fAdBLFWsH8qtr5XumloXGALUXNAbR/pYEHAnX8RRgCJy6DiSHB
 Sxr3pm8gU5DR8kdvUapN9n6DNuDWhtLNEq42MyOVk8z1TCXAVtFxt7RPYxQVOghGhzm1HkhfV
 uBJcnM53AVRhxK3qeUGy3kc9ceZJMKEWXPmJ/TKTzBew7esM3w0pgnfEj0aD9T8EWuiEuQS6L
 1VjS3ed9FdzXR4BeGTchPeSwhA5FyDDpxrGSVeBhPAX7YqDES1O8hfjI/JsVTdsyD1Ja4PNtD
 rb1f25Lnk7UJ7norjVbuFfXkIew36orl4pQfLk845idPBu7yXYzWmRspqppjUEGpUG0ImcmTQ
 8QSOXDT8W+h03X2FF59rdAZnH1EIkTRHWEZIa7aWO81i24lLSpzQIYjyss5v3O4JU1xWEDkYm
 O+IQo8b2WsAnDbUTZVCvtxVjQ40Mt2Tir+CEfTxHraD2ZWS3afB2Rug8bHO/4pITWWqSgAMst
 YgiisiggI9Z5DkZayOXQUmZIt/lcQTFpngKOFHdXzAn8ub4eU5A7bOCJxuEDygb6zEY+zBTgm
 mcWlmssKXZ5QDajmAZ7nk5J1WUhXDWA+Y+1lg13FRFjv6XFcZWTshn7eXEhh/sk/aMQg5LWZS
 Ep7l38HtzbTxLfzeOkvN++XYK1kMjXINUsDUE1sdd3tBFZAOENEg0SMdfDdt93sxaWvlfh7
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 4842a1987b7..56682b06cbd 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -509,6 +509,11 @@ static inline int next_free_host_timer(void)
>  
>  #define ERRNO_TABLE_SIZE 1200
>  
> +static inline bool errno_exists(int err)
> +{
> +    return err >= 0 && err < ERRNO_TABLE_SIZE;
> +}
> +
>  /* target_to_host_errno_table[] is initialized from
>   * host_to_target_errno_table[] in syscall_init(). */
>  static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
> @@ -672,7 +677,7 @@ const char *target_strerror(int err)
>          return "Successful exit from sigreturn";
>      }
>  
> -    if ((err >= ERRNO_TABLE_SIZE) || (err < 0)) {
> +    if (!errno_exists(err)) {
>          return NULL;
>      }
>      return strerror(target_to_host_errno(err));
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

