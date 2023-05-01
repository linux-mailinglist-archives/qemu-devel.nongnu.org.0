Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F96F327F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:08:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptV7X-00068i-9e; Mon, 01 May 2023 11:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptV7V-00068F-3D
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:07:17 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptV7T-0001Lq-Bk
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:07:16 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N9dkD-1qMjHc47nR-015Z2Q; Mon, 01 May 2023 17:07:10 +0200
Message-ID: <425c0b80-19c4-2fae-5f08-2fd1ee5caf1b@vivier.eu>
Date: Mon, 1 May 2023 17:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user: report ENOTTY for unknown ioctls
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230426070659.80649-1-thomas@t-8ch.de>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230426070659.80649-1-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HBsppumK3PzHO8tpQ7h+Cs1qTpSj3ZDPuV4dZNBo8VVxQa6atUa
 +v56+r0+mmS7g8g0hFZtN0/NcGDiRr33cbb/yn8X3V2FI0zB0CCZQDgcQYIIsq4NuzymQX+
 ryzBtiCym++m8cuM8r94Sn73zcaSP009p4fsb0yAaUntxcWZep7QHNVkKRhk0kcoADo0MXF
 u4wGS/1/hqyF6gjrG/Meg==
UI-OutboundReport: notjunk:1;M01:P0:vnfmVnLW8P4=;PtVAaSD5q7Wq3yaSFyGqdYti/rf
 2YyF0B4MW29Y/FxX+wdTAWxSp3TIWSd1hR2tB395iuxm6RM7uTyzWBohZRt+0fSvmU5lQFMQd
 5ZbIKK1//2DHqhHNLWPw3CfZMX0yS8NoNl8ezoG2Y/v6bF7axrCwx5rH2Dqx0BzrpTX3ehYsD
 yysEsCP9sJGFRoAQS50goV/UtahFBIlXKYTWHMmmitZHv0ecy7QjtcSDd2ACTq3GWyf+Cc3IC
 nIKdr+KULnbIPhnoHE6WLWH3R0ifY/J3FCsaOUM9E9TkhBnAtKVUXADfRNLSA4Jg1cKEoTowu
 10JJBIXvThkpujKoSW05bhSYPQfRDlPjKOs8j9UrNcXpomrJLVjevexcR0kxMq7bq0G/sYnlJ
 pD5NyQ2oTTeixxrTKwPUWLCjEDFHyONUacAFVRvYGW3nG1zSR4g00QY+jCYNs2X38WJm1ocwq
 LPtAH6zcE3pnAc76NlTHOmG5zloyKWDqKR0AyyySuVHrWd2JntRQ6PJEONdx+VJlmdNb7Qi7u
 bCQgR+uBs7RQb/Kh//0maTxVUB+sov1q/miq3oi8DHjnxxASBiT3BPMdco+2qbfdSlHrGUJ0y
 +alyLa3tA6KpaBY95j3Sl/o6Xw/ckSOU5flolJAk/5SQlRGIFe1x2DrXWioExhm0F5KCs76Yq
 9hOrJ9FiPqNqQqnX3dCkxT9gLRiPo6NwmPVAIRASHQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 26/04/2023 à 09:06, Thomas Weißschuh a écrit :
> The correct error number for unknown ioctls is ENOTTY.
> 
> ENOSYS would mean that the ioctl() syscall itself is not implemented,
> which is very improbable and unexpected for userspace.
> 
> ENOTTY means "Inappropriate ioctl for device". This is what the kernel
> returns on unknown ioctls, what qemu is trying to express and what
> userspace is prepared to handle.
> 
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/syscall.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98c8..c5955313a063 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5747,7 +5747,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
>           if (ie->target_cmd == 0) {
>               qemu_log_mask(
>                   LOG_UNIMP, "Unsupported ioctl: cmd=0x%04lx\n", (long)cmd);
> -            return -TARGET_ENOSYS;
> +            return -TARGET_ENOTTY;
>           }
>           if (ie->target_cmd == cmd)
>               break;
> @@ -5759,7 +5759,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
>       } else if (!ie->host_cmd) {
>           /* Some architectures define BSD ioctls in their headers
>              that are not implemented in Linux.  */
> -        return -TARGET_ENOSYS;
> +        return -TARGET_ENOTTY;
>       }
>   
>       switch(arg_type[0]) {
> @@ -5817,7 +5817,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
>           qemu_log_mask(LOG_UNIMP,
>                         "Unsupported ioctl type: cmd=0x%04lx type=%d\n",
>                         (long)cmd, arg_type[0]);
> -        ret = -TARGET_ENOSYS;
> +        ret = -TARGET_ENOTTY;
>           break;
>       }
>       return ret;
> 
> base-commit: a14b8206c5edcbbad1c71256ea9b44c3b382a9f5

Applied to my linux-user-for-8.1 branch.

Thanks,
Laurent


