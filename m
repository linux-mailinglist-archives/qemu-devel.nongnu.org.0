Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03A4804C0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 22:10:37 +0100 (CET)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1xGN-0003QA-Qu
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 16:10:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1xFC-0002l7-Ka
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:09:22 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:38489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1xFA-0000n6-SN
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:09:22 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmD6U-1mbexy0Y4W-00iAhJ; Mon, 27 Dec 2021 22:09:18 +0100
Message-ID: <18882253-9e57-0654-1eb2-870a451a50ce@vivier.eu>
Date: Mon, 27 Dec 2021 22:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: qemu-devel@nongnu.org
References: <CGME20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2@eucas1p1.samsung.com>
 <20211227125048.22610-1-a.kazmin@partner.samsung.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/syscall.c: fix missed flag for shared memory
 in open_self_maps
In-Reply-To: <20211227125048.22610-1-a.kazmin@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mfKtAY9l4vzBgcd6CxCHlNBkK37EQp6xpFO7quxKhXvKMkPdrgM
 h6dY/aCBkh8xUr2rPqpwyISxvqhxtUtjukrNA3MiUnY4ePi5I1wb4noFnbDAEmG0aatMoym
 z59JmnNHge6adHPsl0ZlBRQEorzir/2iz7oQAgXQ3tI0UhE60G7zArzInw3Qea1o1Emndka
 q/vfv0r6eBdpJkLS76xAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IiMc6Mb5yB8=:P801uVDdHmim5W7VVpxpO4
 giqUIxoX8oGPhqy0ttAVyiergX+Aw+xcqSIdAlfZD2jxSCLBawCWtER4CzTK7DUeaxbzY81BD
 D+V/lt29nfKSZVN7qjjOmBit+Zc6Km5LO1W+dRn0dXsdqS3M7sz8FtVfxeGrcGDnCwvohCBbc
 hdEeHHzjjJF8OresOqbOHoinT0rBNJq3CdAAv7/yVT3eltYla7di4ZQFdGVpFxF6KX44p3lDP
 7DJNc6uCTZ7BuxVk0Innhi1dhia8BWd5JutJTG9+OrOcykaew1viLsItPEY/2i52860TBMNZb
 FAMJCoAR2GyCiSLVy5wi1zqMhQdOG6RnetksuxXGVaStPVYK2daNBBN/BKck7ed07HUHQm+8q
 2VEf3w4q1nXRfHVbXJ2/iHRp2Cg3Z5wbxcp7VTl/wyz/9ybvCJMavbn40ojd5SqIdy5de9HjZ
 erDShe3nhkMORDcFq+W9ACNZk0ZBVq/noQQnLY+9ddBfXAIxQ5anYWRM8ZhypDM8+p8IxhjEW
 B0hGeHbWT5EUr1OUlZu8TdGBtFYhkLqIsk1700LLJTbpS8dtZygfLwwm0ynGzAv4OZIOHn9/c
 dPMe1DJPGr17JTV9uMVS2FAFT8p2Ru3UDGRkY3AfqRVh28XpGYQUskwMHx2nzFFQnDJWBwirQ
 pdjgaFij3CMueIg/5uCYTLp0kCb9+prS4yhL8n4EgH7L6rqPMizrXYXm3gGkrJo9GgRc=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.363,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/12/2021 à 13:50, Andrey Kazmin a écrit :
> The possible variants for region type in /proc/self/maps are either
> private "p" or shared "s". In the current implementation,
> we mark shared regions as "-". It could break memory mapping parsers
> such as included into ASan/HWASan sanitizers.
> 
> Signed-off-by: Andrey Kazmin <a.kazmin@partner.samsung.com>
> ---
>   linux-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 56a3e17183..2199a98725 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7790,7 +7790,7 @@ static int open_self_maps(void *cpu_env, int fd)
>                               (flags & PAGE_READ) ? 'r' : '-',
>                               (flags & PAGE_WRITE_ORG) ? 'w' : '-',
>                               (flags & PAGE_EXEC) ? 'x' : '-',
> -                            e->is_priv ? 'p' : '-',
> +                            e->is_priv ? 'p' : 's',
>                               (uint64_t) e->offset, e->dev, e->inode);
>               if (path) {
>                   dprintf(fd, "%*s%s\n", 73 - count, "", path);

Fixes: 01ef6b9e4e4e ("linux-user: factor out reading of /proc/self/maps")
Cc: alex.bennee@linaro.org
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

