Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3F6168E3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:30:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGcf-0007P1-AK; Wed, 02 Nov 2022 12:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGcc-0007NX-Nw
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:29:46 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGcb-00051l-1b
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:29:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MFbiK-1oocyw26HO-00HApx; Wed, 02 Nov 2022 17:29:40 +0100
Message-ID: <222a342f-220a-108e-80c2-e099a7ee0a08@vivier.eu>
Date: Wed, 2 Nov 2022 17:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: always translate cmsg when recvmsg
Content-Language: fr
To: Icenowy Zheng <uwu@icenowy.me>
Cc: qemu-devel@nongnu.org
References: <20221028081220.1604244-1-uwu@icenowy.me>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221028081220.1604244-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a01ludZ+9jFE3+HC23XifpwHgpbSAiE+clMPh32HrDCdZyOCbM5
 SOnQzt+gOrpb2d4GIsqr/pnSaRoFrMU7ITCuWXC14ml2Z+o1eL9Y4yzARb1YjKzxI57F7vQ
 IE/jRAldZm46ejWYV0cpBsuG2JaVCUXQk3GzN+iMmXqn5b9TlbZjEk7U9LojVCVkdz2WmDB
 q7+mZHXBgCtClKqx9zoww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9m67KUjzEio=:qpQL5jATPp35+AactDjgQH
 GW9WHrjxroFGv71fIzFHwm3+rppL6t/TYIpPuM9s61O90vssSJUoVMpDaV9cHEoaKJzTWzI3w
 yketMsQh73nCypXBj5ofwR3rprDUIWFt6AwdC8+ZZwKhNOt8nhhb8Wy4cCwm9bjo2bDq/x5A3
 7JvEQsqsNLIi9/0NzrNdbOttJ4Qa18DItLFumTSQ8Nn9EG5UCcEghhqYi8zSpmcvVL5HUSIWO
 m1HV8VAOS438HohZIaY753PDvAUvr14dxUuz6GPQUF/fB7W9Kfkqe4zmpj7Qb1HYRg1qdVQs9
 OnS7gjtiko2Y/SVMUGe5BMctVEHaaT5v3llDNcNxsSQpxz6stFYi47DM4fD+yE/0XZlmdvQnY
 sty326A8WsGpjS41r+3lhDZt0rsIAlJVKJ878OXolPnAQl3QH+FfCYYA2SsCgu6ej/oFyx7eW
 0wfqKHc7hUpBNBHN/H27vhNWltdz0WWCg9PRRU0lmqMMInnkt5QUNXAi8yZ1vP6KZTbLs/Otq
 ZCzhhuXOxx+Jh6PHmSjFsOzpquKCrZdvEhbfHgcQR5YAIWFMLdnHaaFDTGnINTB86SbcJtCng
 8RXWE+i3rTGK9YygzZldSod9meys4iF3AISM3ecUtzk7idb2Bfz+O/YkYcsMKSoPBoDi6i2Ep
 AUNxsx0pjdYuiGx5D4dksiFvhXg2ABATHA4IAV8WhMdazqGw00XueHuwxeD7cedYRNEzNveJR
 ZlXXFAba8YSgxbeQ0fB23QejyaMp5WZwVimWP5wfPzFaXxeUlXkXeJzlFS+unJpTSr8+u/5KF
 O22Ah7t
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 28/10/2022 à 10:12, Icenowy Zheng a écrit :
> It's possible that a message contains both normal payload and ancillary
> data in the same message, and even if no ancillary data is available
> this information should be passed to the target, otherwise the target
> cmsghdr will be left uninitialized and the target is going to access
> uninitialized memory if it expects cmsg.
> 
> Always call the function that translate cmsg when recvmsg, because that
> function should be empty-cmsg-safe (it creates an empty cmsg in the
> target).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>   linux-user/syscall.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8402c1399d..029a4e8b42 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3346,7 +3346,8 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
>               if (fd_trans_host_to_target_data(fd)) {
>                   ret = fd_trans_host_to_target_data(fd)(msg.msg_iov->iov_base,
>                                                  MIN(msg.msg_iov->iov_len, len));
> -            } else {
> +            }
> +            if (!is_error(ret)) {
>                   ret = host_to_target_cmsg(msgp, &msg);
>               }
>               if (!is_error(ret)) {

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


