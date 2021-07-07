Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE8B3BF03D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:26:41 +0200 (CEST)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DBw-0002KB-Rk
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DB5-0001Yz-Eq
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:25:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:48809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DB3-0006OR-TS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:25:47 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MgwBv-1lX4MC2Exh-00hQMO; Wed, 07 Jul 2021 21:25:25 +0200
Subject: Re: [PATCH 01/12] linux-user/alpha: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a2b006f3-43cc-80da-5e91-3ba62373340b@vivier.eu>
Date: Wed, 7 Jul 2021 21:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i6Q/DcVaA7E/soDs89WfJysIDem4nxK7nG67tvW5An/gKI9hxiF
 ticQu1T7SM+rjFyKcw/9OEruvge2Y8SzfBOtBchN/IDKBj7neBSbaGbiotKeMNSAHsbtaOK
 CuNyCv0EcEO6QksSusHb9se9hpSzjWzqp7es/C1l4cLa9kKgQZwZ8pW6a3uT0LTQEdOFgQR
 lAa+al3wxbeODb93XnIgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xh4wfEhWZmo=:TRBChHOL3TBRwcbOOgx7Wq
 luQ1F13GSycgah91nFhBt5CkT+xL0Sp0wlIdVnhl7GL1QHvGfj+1wOm3DxLUfMJn+2F/v7x4p
 PePpPmsmSZdqz4jqbIbgZHqZoqzO+0z8IRD9vAsbzXhLAftGh1JJr79doOGw+qP4mjmjwSNBZ
 /RT9oJHIvd6qoyAArSudeoktRihqrZUYHJRXheDEnr58BmEhnNXVPF7588448HRD5ZUzmxpQ+
 fmOA4q32RRZmB3Gsdf2z5xGYBUs4DOasww9o3rrWZjnVbGCwDP6QH4c+BP07K2w+SzG/2mCt5
 xjZJ/5t01uceAfK1rRJ09opN4M8t9g/FTs0xD4LmnP7h2nY+/pQyFbrmaazaTqVO+8n0eoqY6
 PJKk7LTQjROzk60r0zW4HVYVu+n4CMVZt5iTxbDosnK7I+4jPIMK/cHlZE+KwhXIVOO5Q5XuR
 xVywNSjVstHErkzUg9mUfc/RwBqwVOn1RzFqZTXFOhRw8h6Xi3BfoIjxnvE0Yoi0Qmh2c7BPI
 X+p+Fb+AXY/+jKnGRtKqS0LgQnsr6kt6TkDWRonPhibuHk8tNdfooVhHBhNXI47unkxUeZDlY
 bI+mQI0Rsx7vQ0ocNGJupyZi8q+35ay0UymJDdgPIZ2cuWB0gNtz3Gj8UOqMB2FuaSyIadg0r
 Z2vAcbPLmR5CkPKIZ0ou/Dm2uOUxOuGrqfMvnhTUFW15piBwwb9TnTyxWlgo44XV4dnO9C/JM
 GwIigyMbGJs8affvYGtxY0ZBd3HUjniBf2sdj/JIHb9munqNR7RwTv8kjJQCaJBfka55vT98k
 utWwdp0GzL4T2h65/pZaaFCI0tVWEhLXbAAdS2EwO5fkzwH7ur+O6MnsQnTSdN21e9cXmF6
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/07/2021 à 20:37, Philippe Mathieu-Daudé a écrit :
> Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/alpha/target_syscall.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
> index fd389422e31..4e6f9360566 100644
> --- a/linux-user/alpha/target_syscall.h
> +++ b/linux-user/alpha/target_syscall.h
> @@ -44,6 +44,8 @@ struct target_pt_regs {
>  #define UNAME_MACHINE "alpha"
>  #define UNAME_MINIMUM_RELEASE "2.6.32"
>  
> +#undef TARGET_EWOULDBLOCK
> +#define TARGET_EWOULDBLOCK      TARGET_EAGAIN /* Operation would block */
>  #undef TARGET_EDEADLK
>  #define TARGET_EDEADLK		11
>  #undef TARGET_EAGAIN
> 


Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

