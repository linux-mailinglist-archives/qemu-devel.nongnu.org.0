Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F2177077
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 08:51:27 +0100 (CET)
Received: from localhost ([::1]:43316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j92Ks-0006Uh-Lf
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 02:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j92K4-0005uo-CS
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 02:50:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j92K3-0004AU-Aw
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 02:50:36 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:57413)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j92K0-00048v-U2; Tue, 03 Mar 2020 02:50:33 -0500
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N79dk-1jRyrb1HRs-017SB0; Tue, 03 Mar 2020 08:50:23 +0100
Subject: Re: [PATCH v2] linux-user: Add AT_EXECFN auxval
To: Lirong Yuan <yuanzi@google.com>, qemu-devel@nongnu.org
References: <20200302193153.66415-1-yuanzi@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7458ac82-2dee-7fcb-d6c1-2c84e0ed972b@vivier.eu>
Date: Tue, 3 Mar 2020 08:50:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302193153.66415-1-yuanzi@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n5WfMXkGoFlSGOAr2flKbfBq0nijklFn0h3QpoNvcAQfuhSxmgM
 Ufnuuwanm8PjmHAfl0IoOD+mBWRXdVuaVgRI1TRHRSY6uVw+svkc92XfS1OCF5Gs+YGnoxS
 BmSeXuofa7/it44UhvF4ndOG2fk77WYcwGYBXgakGYQ6EqcHERiYzF2izZhnnQbkaJqmXMb
 6LCl3bCCnR12ebBAxWW3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LvWPwrJYS6c=:sOrkasBlcpCGWDRwITRBrd
 qyrjpr+gFRHYksGLla1Sp5vW0CQx6OTXPkGoSzjST+1yc8sMuBvDjT2G6VhwLXDVbNDThqGI7
 uLJCxgwDqhL3nNKYDH7TWKyxOcDp9wMeMLv6WnhRn9dWR+PKMNdenEMv/W9f09f3K2WpgRBam
 rTiUoEWUgCi7T9Fq3/ZMgoUE/rZGjTbW0iNBckKlhg0pomGzCYpssw8XyGEhAvihz0l+p9anO
 IxkMVUzG40v0LLbEGwDTvn7zGvT0VDfDGj5CChdLCpKndRnIlbNhkQoGb2e3ttIhY72btJFkL
 humEEEnW0yUgPCuLB/Kti/hNSOuEDULcYi4UmdQ1BFCqS9+vL6Ftg7UwAYjeY5aWeWthhLF+H
 g2zGieXv10zb3hTQe5FFWXKG2DpNGEQJPoxtPLDpvwn7Q3g2Wg7kIutu6geyTwa9t8Yb8G7Yg
 jjp04gSORcdKDAEkLGv0SI3ZY4JFfdxuw+aWhg10JINsNBiQnVc2DpYH0/G99hPA91+uur6mq
 dQtSgS8L6m7cutEkBTjH+s/+Br3RXwJ6tt3DVM9IgwWQgEwUgH0eS4MST+uU3PS8dKe3mK+uP
 u4IbamRJLbW4oMIga/1vYAsJWGeFHXlUVAbZrcR5/HAiaspQGfVjGxHpxOB4qxuHDyVpqDC09
 TiETwS7M+ut17+QYeCe4F3/wIzMAfzoL1lfwiMwGwY3eads8xJoUHK4GMd5TLsQsh/RMuBW1z
 UsyY/VyIgreMO32K4KoUnhm7aEcVRwoEAQM1PsxRJ/oegvPTX+vD/EmDQTg9G0sm8PF9bYsED
 C/h9EdoxFSoRt5RCtvx0m2+FxkX7ShBZ4TghOzU+DESmUA0XT1J0No7ocWlBnPmi9fhiBmK
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
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
Cc: qemu-trivial@nongnu.org, jkz@google.com, Riku Voipio <riku.voipio@iki.fi>,
 scw@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/03/2020 à 20:31, Lirong Yuan a écrit :
> This change adds the support for AT_EXECFN auxval.
> 
> Signed-off-by: Lirong Yuan <yuanzi@google.com>
> ---
> Changelog since v1:
> - remove implementation for AT_EXECFD auxval.
> 
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index db748c5877..8198be0446 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1573,7 +1573,7 @@ struct exec
>                                   ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
>  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
>  
> -#define DLINFO_ITEMS 15
> +#define DLINFO_ITEMS 16
>  
>  static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
>  {
> @@ -2037,6 +2037,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
>      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
>      NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
> +    NEW_AUX_ENT(AT_EXECFN, info->file_string);
>  
>  #ifdef ELF_HWCAP2
>      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

