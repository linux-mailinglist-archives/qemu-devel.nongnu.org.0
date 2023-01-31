Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E4682C93
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 13:29:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpkZ-0000y0-NZ; Tue, 31 Jan 2023 07:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpkX-0000wm-63
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:28:33 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1pMpkU-00047I-IR
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:28:32 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6lYs-1pHtn81N7O-008Hvd; Tue, 31 Jan 2023 13:28:04 +0100
Message-ID: <3517fbb1-e6eb-3495-d524-4a37ef46bd4e@vivier.eu>
Date: Tue, 31 Jan 2023 13:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20221212173416.90590-1-deller@gmx.de>
 <20221212173416.90590-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 2/2] linux-user: Allow sendmsg() without IOV
In-Reply-To: <20221212173416.90590-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GBYNgSXs7ThzXq4GRxzv7qcsT2+dI/KsCkdDz+oEM0Q5AHQ6uFR
 ULGOKfhxxynhaF8LeX2MOEcRq9ponMZeV2trBVJSMCfH1SrOpdbxqWfgxTm7RAtdJKjY53i
 bFjoNJ1TjfLs03Ihe73V+QH7aUVuFxiBfjEYU6rzmkFtu69VmEeT4qAzwn2MDyIRlzEi6h9
 7rDWZgTYGneQTpWL9t+NA==
UI-OutboundReport: notjunk:1;M01:P0:N1dQPLIkAJ0=;aavewBfwd6CInTXw0esnXz/5sq+
 QDCVLNLvNBv4smRU+5SNXmbJxav+b5NH0FbssrMewC172MpFadKLMtdiU41sEXCJWuo9rQfQE
 UXrhPuhbkKQ5T1FfllAjNKNMd9MXYf6CMSys9DejJc1cyFoYmvB1pIpcii56M4uBzjQdyHubS
 5z22Q2tDVRQhWyysCX59/H/QO72OEp3gWImCO/S3xZvvUgN+58lhZUvFoELHpmlrcdV+JF51n
 hq409AuQXZhM3/OqLe8xJqWnnDs7k+wUjFGv8Q6Ro3scJ/cXuddKVTCf2xOxTTMdH2cx6n8J6
 ZlAjvzrr54No9XHQHwq/IbmPgu4FPXqiP0C7tXMR/Cqtb9nkkB2mzkthPpt9ct99fI+37SMOV
 XX64+ESUX7AB4f8jWvufbA+zp9KwLji/OZ+VLU2JScAdMg3FIGbaipXR34HmzNNRPCoLfrQwU
 di4WqCh4vajFGi0Ss7LUh7/xfgTLuE4Ytg7VJFezekbr46/Xhf0ma11y5E1+n3W+OOpsRgV4u
 pp8RbEb8j81k0joEyBL3N+nDSaTrWBMZ8VhNP0sVb1X3l344e+McfSZcxDyB3MVQETZhZO8TI
 AJLoFr9xfCD13IZ1srCsiDy5OU12iYkEpvANhe5Y0s2DgNwE8+EvERVmyJAgcsLTPV24XK5ot
 C/EXH4c2y7y11111BFDN8slytWmWISn+fi8HkTlXvQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 12/12/2022 à 18:34, Helge Deller a écrit :
> Applications do call sendmsg() without any IOV, e.g.:
>   sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=NULL, msg_iovlen=0,
>              msg_control=[{cmsg_len=36, cmsg_level=SOL_ALG, cmsg_type=0x2}],
>              msg_controllen=40, msg_flags=0}, MSG_MORE) = 0
>   sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="The quick brown fox jumps over t"..., iov_len=183}],
>              msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_ALG, cmsg_type=0x3}],
>              msg_controllen=24, msg_flags=0}, 0) = 183
> 
> The function do_sendrecvmsg_locked() is used for sndmsg() and recvmsg()
> and calls lock_iovec() to lock the IOV into memory. For the first
> sendmsg() above it returns NULL and thus wrongly skips the call the host
> sendmsg() syscall, which will break the calling application.
> 
> Fix this issue by:
> - allowing sendmsg() even with empty IOV
> - skip recvmsg() if IOV is NULL
> - skip both if the return code of do_sendrecvmsg_locked() != 0, which
>    indicates some failure like EFAULT on the IOV
> 
> Tested with the debian "ell" package with hppa guest on x86_64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/syscall.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a365903a3a..9e2c0a18fc 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3330,7 +3330,10 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
>                        target_vec, count, send);
>       if (vec == NULL) {
>           ret = -host_to_target_errno(errno);
> -        goto out2;
> +        /* allow sending packet without any iov, e.g. with MSG_MORE flag */

why don't you check only for count is 0?
Somehing like:

if (vec == NULL && (count || !send)) {
...

Thanks,
Laurent

