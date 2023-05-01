Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCE6F32AA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:13:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVD6-0008TR-Gu; Mon, 01 May 2023 11:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVD3-0008Sf-TD
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:13:01 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVD1-0002Ka-Gt
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:13:00 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQ67s-1pgDVp0Do0-00M3Qm; Mon, 01 May 2023 17:12:57 +0200
Message-ID: <4c19cf5e-f838-7c37-5a03-ea93bd597624@vivier.eu>
Date: Mon, 1 May 2023 17:12:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] linux-user: Add move_mount() syscall
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230424153429.276788-1-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230424153429.276788-1-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nCdpH4TDguvByFzyjqTlYHXMLco5WR9QtNpZ8Zr/D5YzufkduE8
 Pw7/SYkASeF18H+89jYtOA7BzdvveBoMHCCAQAw4wgTA256k/v7iQZ7rZnJsW1thiLpHjlD
 sOA+3qc3DtVEcdhbdKkGsNfdynGCZWuQhMRLENvhQVtsZOXeXs/9LMtTXqOiTlWUpUGGjSR
 u5xREbCjk4U6/+rj7wkbw==
UI-OutboundReport: notjunk:1;M01:P0:3ewFUHoEDGQ=;L7qz9i7/LGUpAGMxuPHlx3M07dP
 LJ80/DYS4oH7Xg59krj/v14MdVVkVM311YVo4Y+lWEYE06cK4tSA0P7/Xy8GWNy7330ACpVyV
 UpGbAw591Gy1l15w7ZN0XI04N/1JQjvoxfQfBb+62cakf+ralbNfJN9e8B/SA50Yu9rexLndf
 VUmeINk7xnvwWzIsPLZDCzZn3gglm9VWxaZBWEp7Oggu4RgOswLJatNSxlSwE6EIFJxc9Hyem
 D8kwcBME3g+Um0I5NkoTDmgYEH5ZaYtEoDpagThae8r+wcI+nxqpl40XCJaVr2V6k91hB8NNF
 es4WHeIbj+1DDFdZ9tj1AsmJJFnbe6sjlbAS2ZK+3gj7PzmzCT/mAo3aWWaBaShllWmezAijm
 dM5uzyodjyvhmtdNQUWdpNHNu51AXnl2hny6P1sUp9fbtHf0IcaB3WwBMCgFU0WUuPUd8qVkX
 LWIkFsIlQl5adprXYW5mtw1J9LgTFqPGsKE/GIZ7aOYeiDAvIQabBqDlfwJ7KfCZQ+M691pWC
 FGo53QcFZKI6wOtT/HnTTAxoUulMP9XZsPiLJgQyNI6srzLPktCe3VbypziHwFWd5Iw4lnGZw
 /0FuOSvihcbGGOZn/gxYzPBfWia4syur1uwXuLnIG4xnudMpzh2BvBIaEXuKZzMk41Cm43Gsx
 gW4aKtMIsj8BvNUaCgx499r9imjC8UwQJ7fl+WTtpQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 24/04/2023 à 17:34, Thomas Weißschuh a écrit :
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/syscall.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98c8..95e370130cee 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9139,6 +9139,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           unlock_user(p, arg1, 0);
>           return ret;
>   #endif
> +#ifdef TARGET_NR_move_mount
> +    case TARGET_NR_move_mount:
> +        {
> +            void *p2, *p4;
> +
> +            if (!arg2 || !arg4) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            p2 = lock_user_string(arg2);
> +            if (!p2) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            p4 = lock_user_string(arg4);
> +            if (!p4) {
> +                unlock_user(p2, arg2, 0);
> +                return -TARGET_EFAULT;
> +            }
> +            ret = get_errno(move_mount(arg1, p2, arg3, p4, arg5));
> +
> +            unlock_user(p2, arg2, 0);
> +            unlock_user(p4, arg4, 0);
> +
> +            return ret;
> +        }
> +#endif
>   #ifdef TARGET_NR_stime /* not on alpha */
>       case TARGET_NR_stime:
>           {
> 
> base-commit: 81072abf1575b11226b3779af76dc71dfa85ee5d

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


