Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BA6AE1FE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:16:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZY79-0002nU-CK; Tue, 07 Mar 2023 09:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZY6x-0002XY-CW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:16:22 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZY6u-0004EV-4s
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:16:15 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M3loZ-1pYilO0Wpf-000wbA; Tue, 07 Mar 2023 15:16:09 +0100
Message-ID: <3ace5d96-0784-f2ad-4e0f-892c3984331a@vivier.eu>
Date: Tue, 7 Mar 2023 15:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: fill out task state in /proc/self/stat
Content-Language: fr
To: Andreas Schwab <schwab@suse.de>
Cc: qemu-devel@nongnu.org
References: <mvmedq2kxoe.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <mvmedq2kxoe.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MnJPtCkP8vYH1AA/YgHrqgkY5/fPYt00ejduxBCBTpm1pABileE
 qHLx/+DHBq6GOsnqc5VQPGm/Fz1tKxVhH81o6FDDiDU43vYR1J9enVzk7AfIqAOWzadckk0
 lIfe5G/NZm5SBLDXAw9s4kwObVCuOMTXEsk5GB1NkT7Tq1Cr9nrBd7IoihIgSUVLH1NuwuV
 mcd01PZUx0LEqnzkvPy2g==
UI-OutboundReport: notjunk:1;M01:P0:HZ9P+FmGicA=;2aM7Be2h3TkADimS0Jzp2qOC0eQ
 XFwPdRsoyM2qcxIhbz7qyJSI2cO6caAJyxh4HAj/qpDvV3TyejarZ6XwZOmAPjY0Fk7v0XZtE
 2BD3vP3wZV/RuJdakpeqt3GkSHc6VunpFLKW9a8h4OU2UDHX/Bg9rRtErxezVtuupcEXJegVm
 A+ObOKGd/6VF8Ze1So+Gi50Cd0kVZXAQZk6sXtC8b9QT9CqtZgnt6CcRpcya+Q9W0evNn8gii
 VUkLhifqLDH4W6RuXtJiwMTdX7GaIbLCyGcaoPO2dWv2wW8ea0+aHG24pXWRxVNlaWSH+1gfx
 Em5YDOApbcF31fVyqi5xd9oIgjO833TYuro5Vo+WsHrhVqlIQ2cvL2Jn+Or9e+jyAFyxL6Z++
 EQxyq62iwBdl7YmhMIfcVx7MCFUnrjwoP6DxCb+tBIKwBm6dV2OhQhkwT9xc4J01YEWSB4Nob
 bRbLAEOwkGK3ZiiSpV09AD91D77rn6ikw7BxzvB7NuWGaZY7KAOSTYr/7hJn98NXblvtW9Ac7
 AdUV+qoZYSVb3z12K4LzaZGmTpREn7jgXkdl1kiCGX+RfV9pflAz3DSUhPYztrRKiAEO97/NV
 V4Um83EL3MljsH4hf4Em+k0EfycuEajcxWktSZlffOilBmnGeLWiFc+4jX9gsR/+ux/NIbQM6
 A8zrnXr7qDMBSNAfyqZdmmPvKAaNLag5GCfRh1Crzg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 06/03/2023 à 10:59, Andreas Schwab a écrit :
> Some programs want to match an actual task state character.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   linux-user/syscall.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 36fffd36ca..eb4c2c3162 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8127,6 +8127,9 @@ static int open_self_stat(CPUArchState *cpu_env, int fd)
>               gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
>               bin = bin ? bin + 1 : ts->bprm->argv[0];
>               g_string_printf(buf, "(%.15s) ", bin);
> +        } else if (i == 2) {
> +            /* task state */
> +            g_string_assign(buf, "R "); /* we are running right now */
>           } else if (i == 3) {
>               /* ppid */
>               g_string_printf(buf, FMT_pid " ", getppid());

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


