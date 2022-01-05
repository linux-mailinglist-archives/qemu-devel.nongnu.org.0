Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F96485120
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:29:21 +0100 (CET)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53Xk-0003qq-F8
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:29:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53OQ-0004al-Ur
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:19:45 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:42263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53OP-0006fa-AD
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:19:42 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsIbU-1mH5P347S6-00tmJ0; Wed, 05 Jan 2022 11:19:36 +0100
Message-ID: <fb5ae783-c406-3d19-f019-764e02dfcd7b@vivier.eu>
Date: Wed, 5 Jan 2022 11:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user/syscall.c: fix missed flag for shared memory
 in open_self_maps
Content-Language: fr
To: Andrey Kazmin <a.kazmin@partner.samsung.com>, qemu-devel@nongnu.org
References: <CGME20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2@eucas1p1.samsung.com>
 <20211227125048.22610-1-a.kazmin@partner.samsung.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227125048.22610-1-a.kazmin@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Hqr/WXmnceHLXBg8RpjODUZLDAku5+G5QqOsduV8nFdjFR0PGof
 Th0NSTDlftGb4EhgtyI6rsQXMrf95N1RqzWNa6nfRJDoDa2rG4eE98JiNUBn8eD+eiJ2ho8
 ruT6aM7b5vKAAlydfSUsMIWzEcKNvRjbUzX9wmJrLpQyzI1c4UHoOB4h4j8NGefb8R9gI3h
 j2uriuNzku3+gk6k5vPeQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3mIWu1/+FWI=:97bXU4DYljc8dGK+QFXYAx
 vyN0mBpEbMHbUItTQ3UG+Z6/SERoQ1ZdiJ94UUN4hictkmYSL1ckbrbK19BERljkIM9R9B4ne
 aAv/Sx5IkpPeWsrXCsm53SuxqqFk2OXgEGaI0zEFk8oi+zUgVk1WvbFOmSDQTRNc5RQCFEoWJ
 eKAm9uPBd3HGqLo2zoMj4TgVH/ph2P9WNqCxUGvedqAoFPKMipR2KnV4dri395FTdGGer8Ldl
 9lHLSsIQoagjz0ciHTSYAx+xp/3+JTq7YqdIuaWlhwZ8NzjcBEFQLboOJPSlJngUtmffAgwYB
 Z2Hfo3dtR+uNpnQnOIrSiIYtpnZabLmkAUqlh/RMIZa5xDv3ypIeTRtlElS2MLc6gFNOkLcXM
 2wlAxQduJRlVEAqFrJadb6PPEIsK1TjQSwEX+uwBgbPM4SAb7WtEhuVxJFEgbgfBq6W5+AQ75
 GzSN2XgRikngMy39pYReMfEo2o3k86PMM3j4azC0Lf091GnEs0Odiw+Zj5EQcWIlVTr3l9CZ5
 n6PVn1+YQs86vr3sAw/5LBHo0XStV1uEbTs4efkBpiPynv4yY8BIrKWxCbVGDtaW8OjqY/sGg
 +skY4S4ZvyQ9W8JVwBZmM4JChDAUwxA/w8o2lu2JzdV+iVeDlvRMOwgzLfoM1eJyLdAHmEUoR
 LSVBvKz6IP02x5NZT4RZ3fYHvFRn1tvemndGEijVtLcVwUCRtfdXiyxKLC29Qs2gooE8=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

