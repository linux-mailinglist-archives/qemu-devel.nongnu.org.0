Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A8333148
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:51:44 +0100 (CET)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJkGV-0000rI-T1
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJkFB-0008Fs-6P
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:50:21 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:54053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJkF5-00045E-0j
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:50:20 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mzhf5-1lfHIf1nw9-00vfUJ; Tue, 09 Mar 2021 22:49:52 +0100
Subject: Re: [PATCH v2] linux-user: Adjust pgd_find_hole_fallback result with
 guest_loaddr
To: "Ivan A. Melnikov" <iv@altlinux.org>, qemu-devel@nongnu.org
References: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
 <20210306093300.ymbogset7fi6p2cr@titan.localdomain>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6f0dd1dd-3348-8e78-44b3-11bc0550167b@vivier.eu>
Date: Tue, 9 Mar 2021 22:49:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210306093300.ymbogset7fi6p2cr@titan.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0e3g7vH/sB1J3T3S+BvCOtnQGYdI3lrIiCdqAUu/Izsg+MJxsB4
 bh7RupeJkxC7SDUsK/703m8zL0gCFjIhwIU/RYWAQB9JSNXQ6QqpoRCvyWKCDFv9mFdN+Ht
 TtfsYCefly52oyRfJzJdbhyNchtweSDC2FyI624eRKlp02k4MUFUqWoowuD1OxnLHvwa6uL
 jDqD4fYgFO1S7Q3gabLkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n3RBwkup11s=:iB4aXw6H90tl/eM1i32hTf
 U7rmLAA4Bbz0f77ngqmOHBbMK1vDu1B5Dn64q4l7q4NUkvZCXl2/631WGRHbvedaR7yZ0HX75
 zFxJYABYvLJlP2gOVo17Q4aXcp2s6BcadXFn8SmdKIJ0KNBx6IciZBpsD9b31Gssq1eR0foxe
 tTSk6leHU/OXkQ1hckmVpgaDUd9gdwKVkGSdG2PGe/GX69yP1qxXG/gkQ/uRwB9jnt4z4EVWk
 gj+DRhDXkb/dOxkP6Pyl1kREnZchcPWhlIe5VvnJ/AkBLfSgSmrBTu4fcM61CYdYq6ZzSrMe7
 fVNaAtHOwrn+LOmn7bADQzYkHsa7P6576xRnDtZckCaqKQd1I195I05K0Y2JPZuZKRM6XdVrb
 ISF6gtP2Wz7285zBPa0xrtf7Sn6keMuMxZaju1pWVaMEF7AZqwgbAsAR3Ey1ZPJJCtrQMLQxd
 8+z4U1wsLw==
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vincent Fazio <vfazio@xes-inc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/03/2021 à 10:33, Ivan A. Melnikov a écrit :
> While pgd_find_hole_fallback returns the beginning of the
> hole found, pgb_find_hole returns guest_base, which
> is somewhat different as the binary qemu-user is loading
> usually have non-zero load address.
> 
> Failing to take that into account leads to random crashes
> if the hole is "just big enough", but not bigger:
> in that case, important mappings (e.g. parts of qemu-user
> itself) may be replaced with the binary we are loading
> (e.g. guest elf interpreter).
> 
> Downstream issue (in Russian): https://bugzilla.altlinux.org/39141
> Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> ---
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index bab4237e90..58281e00f8 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2259,7 +2259,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
>      brk = (uintptr_t)sbrk(0);
>  
>      if (!maps) {
> -        return pgd_find_hole_fallback(guest_size, brk, align, offset);
> +        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
> +        return (ret == (uintptr_t) -1) ? -1 : (ret - guest_loaddr);

You don't want the uintptr_t as ret is intptr_t

>      }
>  
>      /* The first hole is before the first map entry. */
> 

I've already added the patch from Vincent Fazio to fix the problem.

https://github.com/vivier/qemu/commit/5112f50d6e889a2a1098fb2a67a0851641c350f4

It will be in my next pull request.

Thanks,
Laurent

