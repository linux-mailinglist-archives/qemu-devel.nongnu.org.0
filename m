Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6756F32B5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:19:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVIe-0001m5-Nz; Mon, 01 May 2023 11:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVIc-0001lv-Pn
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:18:46 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVIa-0003B4-Rt
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:18:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkpKR-1qXGyU1ziR-00mKY0; Mon, 01 May 2023 17:18:41 +0200
Message-ID: <7b4aa2ed-03bc-fa13-6502-c612010fbebd@vivier.eu>
Date: Mon, 1 May 2023 17:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] linux-user: Add open_tree() syscall
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230424153429.276788-1-thomas@t-8ch.de>
 <20230424153429.276788-2-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230424153429.276788-2-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:96fR6jLp8nrPJOLZnZ4J+FCP7jdAfHnUJwHFKcgCIwNpFLcmw33
 VYX8KTYEdixY0MnZva4AF10hoddP94M7Nz90OiBFgAnEEILIuiBxLOriU9tCpOb9MoS+ECq
 k/490zJrV3OtWZqAwhUK7kFwRJqSCllK63N2oBtbAJATL8Zbo+WUBJwezGhSMcv/asX9Fu0
 8fkES8yTmwan9MWM2uY7w==
UI-OutboundReport: notjunk:1;M01:P0:2+VlZ5/wY7k=;vfEUqPawqve6gXas/bvKzL9oFTl
 bUk981L1xTKAhY3T7ETorw6dCIXwa2Ek5QCO1F5xUj5Tf1j6M2IqdK1DSFp/zh5hleWG6Ym58
 j3pr998oB5Ma88j2m1eW6I2Isi8XBh5+2NDZE4piWDt7V6uI64jtGoPv2tvZusVJxzw12k4FQ
 t86fBGNkMWAjV3ODWAtZKSeBoFu8HI2qAs5D07x8lCb9Gk2uslBSNeuY5kdJytDcV8Enm9RP4
 lnPkDcqax3nKgotnQxEk+9s8Emssb/c2MXY7RfQdIQeInLFz8HADi6QLVuxgVb48aEBpctuyP
 g9ac/mWyRl9vO4nGMtjXBHWNQJzg8pIp4gksjPsD/3Fy2LO7iMTR3YT1xJk9PgpPl0LN5fryj
 EkeAsUGUQocEgwI6ynLfgHOQzRe4FOhYulacgkC/HHhV+A76Gn44QBBccE6k3bk2TULktqArw
 CSaVBsKLQYuoyCPNa4JHRtZVoF/OU+ibzhJxYyBY2rB5ZgI7GBNqg/PPjzVPXMUAXa5vyLdBt
 v8xGbw9f25EyPdm1FA3L3hVlwhcJ1qAcLgL51CDEosVrMsIgWwX4mvm1azURSgVDtAxQBKNfH
 OxqFlnlQC7qFTRhf55FAU8cIQNZQK8KNBERkSnwwTj6aJKscYBlz74OskxL3IHsDNJx/j8Kja
 z6kymrl3wRf8altlSY7iDSHXMvOVxoYlBOeyMkV7Dg==
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
>   linux-user/syscall.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95e370130cee..140bd2c36e0f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9166,6 +9166,32 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               return ret;
>           }
>   #endif
> +#ifdef TARGET_NR_open_tree
> +    case TARGET_NR_open_tree:
> +        {
> +            void *p2;
> +
> +            if (!arg2) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            p2 = lock_user_string(arg2);
> +            if (!p2) {
> +                return -TARGET_EFAULT;
> +            }
> +
> +            int host_flags = arg3 & ~TARGET_O_CLOEXEC;
> +            if (arg3 & TARGET_O_CLOEXEC) {
> +                host_flags |= O_CLOEXEC;
> +            }
> +
> +            ret = get_errno(open_tree(arg1, p2, host_flags));
> +
> +            unlock_user(p2, arg2, 0);
> +
> +            return ret;
> +        }
> +#endif
>   #ifdef TARGET_NR_stime /* not on alpha */
>       case TARGET_NR_stime:
>           {

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

