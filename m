Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D852556EE4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 18:35:57 +0200 (CEST)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgAto-0006nD-JO
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 12:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57194)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hgAlv-0001ip-SD
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 12:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hgAlu-0004iH-UZ
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 12:27:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:49405)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hgAls-0004bR-7B; Wed, 26 Jun 2019 12:27:44 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N95mR-1ibafG2V2F-016B4C; Wed, 26 Jun 2019 18:27:29 +0200
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20190617114114.24897-1-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <00c575f3-34f9-6d11-89a2-ab7e42a9ee69@vivier.eu>
Date: Wed, 26 Jun 2019 18:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617114114.24897-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qRJmMBgfwM1KBgnS+C8vq2odjB83UQTLBfSDEZyVlmMlGLXpbEG
 +2ToaOcB9AyBz7U4HDHmsyrqVvX7fqWhNohBhAceilm7Sky0N8UirBVM6CGOHA38cgPZC0f
 PK4wtSB1E2n9zhuKQUiGcq1C24eBjwHSnXay/xPywDMjXa35pV4Mqosp9DhwtP/oXh6FQrc
 TEdvHzUZuUwAYBhHI80vA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4aSflQ+ZWaI=:/wJjU7EWfe6dOg/mkQ50MW
 tnhrH8oWdAbUCiTPv/YZ5cIsmCdNeMtnJ0HLlAzaV+ft5AFosv1mMdHUQksV7OlMAlsxvCcuy
 0q79atrJwHMJQJTvdupYPWaUBR04Eka6RdwMOL6LcpCauoDe1MmjzrcdENafP8wRv7cZTWKla
 HSfN+dtCnL6f77DwGhK6fZp4v382oUjnGiFw9YKIdqlqR8A29LVo9ML+Pn5ZZ+1+blnLoXuOI
 pULE0FHS/1h8ChHvBNbvg6+dT67xQSQfyBkMyThHKcY6WB9waM28TSdezQIzOUxKnoyPj3/P4
 ZACffNdEuXaNCRgJ1zX3hFD+XJkZxnK3HN0EI05QXf+kCePYfrUfEaADUlzSgxlGKmaLP9Fo1
 jRJWdnDBmkELg8Bi/9LtQbIeLHoevcP2Nq72PI3L7MKCJzOnZToYt4m1+sdsEm2DqTc5kHDbd
 iONif1zT4N7xP/wisoD/P4BD8lkVhbU603bwkL0iYS//x+g82cbt4NBF7ck9w81mLN0quuRbe
 /1s5dCA5msK6nJA2z8m7lyUiBsVjkshFxfbftWnBNnGp28aSwY0Wi1JSIG6IwoB3wwkUbBlz+
 idMyObZXIv6Zc99RqlfZpnrcucEKRyUsthfJh1lpbL4iHgjamC5xwP+l21KQhH0YjGgzNHta2
 3glGskE+PCzzEaeowf8NNONP8+hc3kOrA4qKLJvsbvdM+UPN004Ig/ZJQqu6H3gLPdJJgsaVL
 fESgHhZrCAY3WZYqzz7msPeon2QvTprXnAvrDCLH9Q1z/GNICcVGM1svxAM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] configure: use valid args
 testing sem_timedwait
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/06/2019 à 13:41, Daniel P. Berrangé a écrit :
> The sem_timedwait function has been annotated as requiring
> non-null args in latest header files from GCC snapshot
> representing the future 2.30 release.
> 
> This causes configure to fail when -Werror is used:
> 
> config-temp/qemu-conf.c: In function ‘main’:
> config-temp/qemu-conf.c:2:25: error: null argument where non-null required (argument 1) [-Werror=nonnull]
>     2 | int main(void) { return sem_timedwait(0, 0); }
>       |                         ^~~~~~~~~~~~~
> config-temp/qemu-conf.c:2:25: error: null argument where non-null required (argument 2) [-Werror=nonnull]
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index b091b82cb3..6632d05fc7 100755
> --- a/configure
> +++ b/configure
> @@ -5139,7 +5139,7 @@ fi
>  sem_timedwait=no
>  cat > $TMPC << EOF
>  #include <semaphore.h>
> -int main(void) { return sem_timedwait(0, 0); }
> +int main(void) { sem_t s; struct timespec t = {0}; return sem_timedwait(&s, &t); }
>  EOF
>  if compile_prog "" "" ; then
>      sem_timedwait=yes
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

