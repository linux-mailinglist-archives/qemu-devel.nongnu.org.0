Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A0680DE3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTPn-0006Tb-0U; Mon, 30 Jan 2023 07:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMTPk-0006SL-4R
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:37:36 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMTPi-0005gs-Fr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:37:35 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJEAV-1p6JCp1LGV-00KeI9; Mon, 30 Jan 2023 13:37:32 +0100
Message-ID: <aaf8b01b-6c63-0aa7-a6b7-91990bf13eb5@vivier.eu>
Date: Mon, 30 Jan 2023 13:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] linux-user: Show 4th argument of rt_sigprocmask() in
 strace
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20230125135749.4594-1-deller@gmx.de>
 <20230125135749.4594-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230125135749.4594-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6ELBs+dPSxC9uazgodT2XtxWdXnLJelQFB65FpHNeVyp30jysZA
 533MOy38A6SwXq0CiX+UDIVb0Gp9D/sfdMOXIfNDb16cIDcrxPn8FAYsE2BQuU1NuRMv899
 i/OvgNxH4JDapUO4ZhGsE98zX8z5WpCSzznL2uagU1a36bbYDo7DQ49FDfb3D5j/8sTJbIl
 lCDh2ILam1ckvfACiChTw==
UI-OutboundReport: notjunk:1;M01:P0:5pmy7axXw64=;ea5mRKroO77yRoJVoQ+3hW3xGu3
 f7VtOXUMZ+3wmIJHMkTGAtGyc6hfa1GdUkJPQQtX0BBPAxyt4GJUAOsQN9Vgtt6rbwdB4IgG/
 KH8llZxC0EwJ01YdbAYint11eMF9jfV4bSyy6e3wNxATbWznQOSAEfYxu0rEhXeItCQZ+LYFA
 vEzQfzDbNNuRR1ZJ0/A7QAiNdrNs/1nqu9dKFjGHLsrPlf/G1C9QbXCsDh7MV8mw3cc7hYEfZ
 clDPM0evQsihPbI2pQvYRP33tuwRVnODwL020qHG/VLPal1GJffIqBg/t3IbbEvUHErU5NPGz
 t5+3k08q6f7PM6SXj3xHMNlnlyuCOwx6TgF5welRPe53/Pr77a8lmrmCVhp1f3ecl9C9aX5uy
 llwHF7gSvos6k7KmCZw6fBMPcq9b8edGv3jNucAy8vBNsOhmDutYLzXY8s75bWh16R35B5GlY
 Dl94QM1hc6Yhdiv0u2H852Fy5URXX89LsS+4IHa+wanr3JMdDrJ28CBcKWonCgFIjmRDH8myA
 eC14LWSaAjSP00Zm2YgP8kp4D+NJf6ZT3rBD/QqfreAuYx8D4ZQXmRB96SyyV1nHFb6BcxR2A
 wecn0jyGxOmQYkmoSvZzaS8PTop8d7J8ZFg2O932vKsy/9oIw/0Ptn3VEnhRy9p9/BbumJ0Lb
 wW9RCwzGF6Bw+0soZ4TSWIBmFsemP/ceV3EwM+plcA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

Le 25/01/2023 à 14:57, Helge Deller a écrit :
> Add output for the missing 4th parameter (size_t sigsetsize).
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 3157e4b420..e3aa994678 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3146,7 +3146,8 @@ print_rt_sigprocmask(CPUArchState *cpu_env, const struct syscallname *name,
>       }
>       qemu_log("%s,", how);
>       print_pointer(arg1, 0);
> -    print_pointer(arg2, 1);
> +    print_pointer(arg2, 0);
> +    print_raw_param("%d", arg3, 1);

Better with "%u" as size_t is unsigned.

Thanks,
Laurent
>       print_syscall_epilogue(name);
>   }
>   #endif
> --
> 2.38.1
> 
> 


