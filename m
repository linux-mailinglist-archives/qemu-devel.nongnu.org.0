Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE834A3AE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:08:08 +0100 (CET)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPiRr-0001B2-U5
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lPiR8-0000kv-6g
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:07:22 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lPiR6-0007qS-Ct
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:07:21 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOAJt-1l1L000Z3J-00OY6O; Fri, 26 Mar 2021 10:07:17 +0100
Subject: Re: [PATCH] linux-user: allow NULL msg in recvfrom
To: Zach Reizner <zachr@google.com>, qemu-devel@nongnu.org
References: <CAFNex=Ddc_9Sta2W+_a90Qg7hCidMhxuqmGuggygfWWCzZdBhQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c5c10a87-41d9-7af4-5cb4-4d28c32b6699@vivier.eu>
Date: Fri, 26 Mar 2021 10:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFNex=Ddc_9Sta2W+_a90Qg7hCidMhxuqmGuggygfWWCzZdBhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dudq2NyyfEww8145RVbAMvxa6Z5TV3l02jTmw3E2LkJ8uhVINru
 1mcg4NKNQyYtpRCQYCLB1wzIczOA243e3eoDyykjL1h0oB9SrvoG3heh3OAtnVYXUTiZF+Q
 zpktc8YMYq+8H4eh1C2E6YITNoJd6WJ62K9lKLO66aH/cQfLznVDGycOHDrwhdOkJ0/LdWJ
 FrPx03n821LehEuNkZivg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kyH7Fn3jFuQ=:F6VZX5vX/k0KOUm0w5ahQu
 pPPlawzJJ5LDoJTZE97QUDRqn4zvVnj1k1nF2WFRbzxjI5UF4y6iM+Fa60f2t/sThuf50vJpj
 itMB+4TDjANcTIFZopl83HBOPd/vUg2wcrP9gtnUSwIPBF++mGlLTRmNdz0ZhX9FkDZ70dFaZ
 dslkGnU8nP33yxW5yBIt1OJzTMiFwpqlWKqfPXPy91yNWKpnLnpwFp0WfGe61eDp60iHDsxpW
 93Qh4a+CeM8lFyFx7y4GCJrYI25PWyXFYhzb+ZwHVHVB2td4bjmoOgxF1RRSJjE0vZ4rTazo/
 9P4PALBHCa293eYe1+Z+FdbABVqeljYDau6+vr0QA2cEfeueRi2z3rfwZq1ORm5aeXUHPcjcD
 CepbsED21D0l6A/I+NdNm9zxsrO8v00cdgQYK1TtlXnrxYyNXkSXnXszjOvmOzi+z7Inat9vB
 /SXamX5pBCJ7DwHrVhmX0OybaZ8JuZ2Za9rUCuibFuVCUi30HqMS
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/03/2021 à 05:05, Zach Reizner a écrit :
> The kernel allows a NULL msg in recvfrom so that he size of the next
> message may be queried before allocating a correctly sized buffer. This
> change allows the syscall translator to pass along the NULL msg pointer
> instead of returning early with EFAULT.
> 
> Signed-off-by: Zach Reizner <zachr@google.com>
> ---
>  linux-user/syscall.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1e508576c7..332544b43c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3680,8 +3680,6 @@ static abi_long do_recvfrom(int fd, abi_ulong
> msg, size_t len, int flags,
>      abi_long ret;
> 
>      host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
> -    if (!host_msg)
> -        return -TARGET_EFAULT;
>      if (target_addr) {
>          if (get_user_u32(addrlen, target_addrlen)) {
>              ret = -TARGET_EFAULT;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

