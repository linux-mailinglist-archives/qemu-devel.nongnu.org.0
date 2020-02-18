Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC228163523
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 22:35:20 +0100 (CET)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4AWV-0007kB-Tm
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 16:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4AUq-0006ZR-R4
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 16:33:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4AUo-0003x4-Sd
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 16:33:36 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:55971)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j4AUo-0003sE-JZ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 16:33:34 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mc1hn-1jb1o52Kx5-00dUi2; Tue, 18 Feb 2020 22:33:22 +0100
Subject: Re: [Qemu-devel] [PATCH] linux-user: implement getsockopt SO_RCVTIMEO
 and SO_SNDTIMEO
To: Andreas Schwab <schwab@suse.de>, qemu-devel@nongnu.org
References: <mvmlfzaoh9p.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <14acaf61-e1e6-81ec-8851-aa29e9b2021b@vivier.eu>
Date: Tue, 18 Feb 2020 22:33:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <mvmlfzaoh9p.fsf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:on+6+G308PPhGLbDcWoUX1UtNN9Ey65J7jTfbf2iUYXOAQydZha
 8Hx+Jig5BZTJArIvE7VqmO9To4wbl/61eFAv+fPiOREte5A/Fc1Uvnar3F6fACXyOcWd1Xi
 T/pBtpwq3KIcj+TbB1+XEE6ZusxvXJ+t7Liay4B38ojNdK+h4g5Q2qj2UhTiHP632bA2E5S
 IUPE+D7c5oPsiUpfc+89Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kjviCKv1zYI=:3PtJnQEVaBI99681bHhaWU
 o4unNjiIIMRFX5ha9ioQQOqZWlkf9QdGiZHxkBSQTEF+outIeFigVlnke2pVHzNw/WZdwHoFi
 k1CVkrZ2RxtR0QNkx4IwXWDtN/Y8XyUO+7eN5TYey2GUAMorxPMRIQtpk7QK7JYm5g/VcrxLd
 VkQYhAapTK30JLsauJzit0QVKZXZyQYLCUXgV12cNDlwsCNW9l35pWVdmYrDtX54hwQrkhmoQ
 dqnu0cjWDRLnRnoJ5+86a0KaPYxiPHeVhuYcYsWOXggXUgwy5zAkfdusAAjq9tk86ui++0B/s
 r57Wp6Hi2Gy+52n94BLhvt8kCEQFPVxhosDgG+D4spy/eqpgvUgvGQ31L5Zd5R+/zHVon101t
 pUG/JsRxViU7O/8MPmfKgII9GRv8kaYdTIp428qQmV3cwdz4nv4pcb89JPCBfNQ/No0zvEY8m
 YHWJESToFDIMl6yT2gEFFPBuSTXrt219nvdusLy7vUA+NHF6O1TuL1vJgsw3Iax2dji2Yw/Pa
 y9bR+AkIa51Wr/IVUkQ9ZbgIHVcARRbAohvQVqQqw5/vTwRWWR2r8zjv3GRHDJ97J9Hp7k5h9
 Qf5yfkWE+FaSvjjceKHsHnUUgXxhmN3757nAo01C6L5stRIaqNXESdJkl9pFmKseTE1JpWH/Q
 FLxYej8IzrT4bRwajV4k1ECS6URLQ2ImTWf6kDU7Aaex9UagbZI/ZpknPRHO1yLNVyW9390Et
 6oWeEPY3m2ViZHcXoVuaW0qXqtdmmJZvjLCeryXm+TbL7DhbK6mBNrv6wtZWfuCwUvgkkUevm
 7GRfeJ52eqGRg8KzTVE9TDv3R+QSK8SVN6VPiAQrQ3vDzGs71WXBux2f7xeFaRDuhxTQ6jN
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/05/2019 à 11:06, Andreas Schwab a écrit :
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index d113a65831..ba5775a94e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2171,10 +2171,42 @@ static abi_long do_getsockopt(int sockfd, int level, int optname,
>          level = SOL_SOCKET;
>          switch (optname) {
>          /* These don't just return a single integer */
> -        case TARGET_SO_RCVTIMEO:
> -        case TARGET_SO_SNDTIMEO:
>          case TARGET_SO_PEERNAME:
>              goto unimplemented;
> +        case TARGET_SO_RCVTIMEO: {
> +            struct timeval tv;
> +            socklen_t tvlen;
> +
> +            optname = SO_RCVTIMEO;
> +
> +get_timeout:
> +            if (get_user_u32(len, optlen)) {
> +                return -TARGET_EFAULT;
> +            }
> +            if (len < 0) {
> +                return -TARGET_EINVAL;
> +            }
> +
> +            tvlen = sizeof(tv);
> +            ret = get_errno(getsockopt(sockfd, level, optname,
> +                                       &tv, &tvlen));
> +            if (ret < 0) {
> +                return ret;
> +            }
> +            if (len > sizeof(struct target_timeval)) {
> +                len = sizeof(struct target_timeval);
> +            }
> +            if (copy_to_user_timeval(optval_addr, &tv)) {
> +                return -TARGET_EFAULT;
> +            }
> +            if (put_user_u32(len, optlen)) {
> +                return -TARGET_EFAULT;
> +            }
> +            break;
> +        }
> +        case TARGET_SO_SNDTIMEO:
> +            optname = SO_SNDTIMEO;
> +            goto get_timeout;
>          case TARGET_SO_PEERCRED: {
>              struct ucred cr;
>              socklen_t crlen;
> 

Applied to my linux-user branch.

Thanks,
Laurent


