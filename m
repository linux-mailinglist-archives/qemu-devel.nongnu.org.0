Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC87534428
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:24:59 +0200 (CEST)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwcs-00028A-Dz
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwbC-0001P8-Ni
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:23:14 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:53961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwbB-0002ud-2S
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:23:14 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8xwu-1nwiHS0V6c-0067N4; Wed, 25 May 2022 21:23:08 +0200
Message-ID: <951d95f0-4338-4517-77a8-d45f83fc5aa7@vivier.eu>
Date: Wed, 25 May 2022 21:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 15/17] linux-user/strace: Fix print_syscall_err
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-16-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vnpgOMPbWh/cYjuOTsoW3VRLvoXzwuGOYHdVf2xGeqi8k6Nhtns
 DeTv2HSVVjW8uAeXSdj8Mu7pldidmSEBzy7x60rhcDQISFAFnTIhWe4aO8cSZ9cd/Gm3pzn
 8sr2w9/N98/uQFuK13J3kIMy34X7kA55sr8DysLvV+VJ2jktVQ2E/ugisO5VVlI5Gjmlzyf
 irayWbQC/06nM/pV02Kzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A2W5IBjLv6o=:WuFS38HuH5qrQPbr2CSV4N
 Jt6LLE9380dEL5m4hl2BGMvv8Uol/qANiDzV1DK5/XFoCf0YKI/S2qvNNiO6lqcqQHkiy0y5l
 2g2beIBaNtqe7/RAW4kz7Bk8LCor1ByT31lEGZx+p9o1w/728sakqLrGNa5n3U8RiRgKONeBN
 yT2e4DJg/SlfbVYz1hRo+GJec1OE32QVm2aJIsCcWRoD63Hty/IND8dMQ1wBMOC0tJ8AGo3KY
 727gbqxuS7qHZsxYOdcO23Wc7SdKBQWlg06OUnG9ZMa9UulL5wCNumx5+w2edddFnB6EgdXzA
 Gw8hIryehz6lsfkPgBMrBTCFnabvOq5olvdY+XQRw3wmUJqalfycMNjxc60BtBbJmKR55B+Q2
 GSjNALoCcs1mrg17Bcm9RDO359unf5bwy4nAwk41OCLO2ldjtaftHCI8l37r+foTh8qsZZO5b
 htMi1wzgqEEoHbWB/zrA7O/x3BPvoUjrBaVYK+zYKYB3dmRYU9XRTBTwQ7tJwBDD4sC7h0DwM
 y0wDKDMaxxBK6Sb7yobtqAZxvEtYgDLPuCen0Nbo4W3XP4LUnaDeMEZvZVDBkC0HH76xyG07s
 DH6tGq3/FyDH7N5yXWEKTLlzhGyJ8TUwbJCst4t6WHDcaXzS+hZrWfnZHfjsZemJpuYYLmdoX
 jNaICla4b/Vv/4TsBfbLbzkrBrMWJKms2nKhoI4kBDbRFcTLhzzJTLlNQMUEnpnLowarSJkbs
 REArI4UVjs88i+VS38bgyFNDI+iCS2JV2BQ26Q==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> Errors are not all negative numbers, but only the top 4k.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 2cdbf030ba..dc4f810bd3 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -684,12 +684,12 @@ print_ipc(void *cpu_env, const struct syscallname *name,
>    */
>   
>   static bool
> -print_syscall_err(abi_long ret)
> +print_syscall_err(abi_ulong ret)
>   {
>       const char *errstr;
>   
>       qemu_log(" = ");
> -    if (ret < 0) {
> +    if (ret > (abi_ulong)-4096) {
>           errstr = target_strerror(-ret);
>           if (errstr) {
>               qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);

Perhaps we can use is_error() here?

Thanks,
Laurent


