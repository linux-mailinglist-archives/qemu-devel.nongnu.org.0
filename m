Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40A9683142
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsQS-0007Fn-M0; Tue, 31 Jan 2023 10:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsQP-0007Et-SA
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:19:58 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsQO-0005pK-8U
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:19:57 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQgtC-1p2aPn2qyE-00NjvO; Tue, 31 Jan 2023 16:19:53 +0100
Message-ID: <725a0f8c-d0f1-e9de-b2eb-95573a838e6b@vivier.eu>
Date: Tue, 31 Jan 2023 16:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] linux-user: Allow sendmsg() without IOV
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221212173416.90590-1-deller@gmx.de>
 <20221212173416.90590-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221212173416.90590-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mAjoTFtu4nWSRbVxh44AyFRzw77msXO7lW0Vk5KHGbrxZ+/2uxi
 8r8Mtqo9PPVTsOB7BgcsBY+VC8Mt4SgfAjeUEUENX4oqTUh2jDkSUEc+/uoYlnj0PqXDrGp
 e/aOmssYP9jGyawFynR07UfaowqR20kXric63qtQy7Hp9hhPgXfYoXMo3dtI+BPHSUBJbhn
 uRfCjCJRJVjyt66Pr4tNw==
UI-OutboundReport: notjunk:1;M01:P0:3KGzBt+1Uf4=;PgB8p3wOmSdNwPlYxKbtOUB0b/Z
 E32FxON/q4DMeuupq+GZFkv6iiNAy9rJ1osyG2OTeFfejwe7xYrNMBG2nrPPgjh0VQjB1pSrm
 xNFX8e+Lp/N5PdYhtBvlMZOzTOKOjCeUJLnpusLVWEG0NNBRpv8dP/yFJYdNDSrFTCdzfSlTh
 QejJqc5tHPoddoP9ncUZXUqFbzbYQIcLFdeYk+AOQ8AtSsdFpJXzXcfe/JOPdhpc0BLWD7xWp
 sALugEXqh9ozJkc9RQJB/TnkHIWDut78OMTpV/eHVB/AessuEPYemnmWlgblf4oaMgNMdJNJC
 y2NjJf5SP4kOLHbBKs2nz+XML57f4sJXcSbNnmeK8NdeKouMGUN/6WgTig/MNPZh4sBepaJ9b
 6wgztt2yU5yG81IWd923KIHJXR7YVCLIe4X/8fE+EfTsPebHlqGodA7xcz0kRr+736Gsvj7hD
 qU+DidvZEQT+8AJbRHcit0aHarU6/Tz6jXVtp1zJX20rK30bQnXXJz1BXMUxGGIQe6seBTYLR
 Zu69Z957nwamQeRp7POAI0zudXlcGQMTLjiuRcCXwKCJYbhR/LKXhVvZ9pXVKWNti9OlK/I3f
 RCP1DcvqBJRuE0NGK2iuOLo1x/VclDZu7fC67nmJOZTF6aYP+My2CcuBHf4q3PxH9NdgoJyQ5
 kghY/k657qC92QPPhrYWs9wu0b0RQguEfIP4Y8wzkA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
> +        if (!send || ret) {
> +            goto out2;
> +        }
>       }
>       msg.msg_iovlen = count;
>       msg.msg_iov = vec;
> @@ -3382,7 +3385,9 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
>       }
> 
>   out:
> -    unlock_iovec(vec, target_vec, count, !send);
> +    if (vec) {
> +        unlock_iovec(vec, target_vec, count, !send);
> +    }
>   out2:
>       return ret;
>   }
> --
> 2.38.1
> 
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


