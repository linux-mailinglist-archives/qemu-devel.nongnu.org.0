Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1EC3983
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 17:51:43 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFKRC-0004q9-83
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 11:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iFK7Z-0002NV-QS
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iFK7X-0000sU-JC
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:31:25 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39069)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iFK7V-0000mU-P8
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:31:23 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MCbZL-1iNGSe3yYF-009kJJ; Tue, 01 Oct 2019 17:31:08 +0200
Subject: Re: [PATCH v2 1/3] tests/migration: mem leak fix
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
 <9b8662b94d89030b1f33193246c645baac2eedd7.1568170994.git.maozhongyi@cmss.chinamobile.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2731f5b5-f43d-cf97-0a1a-30f3cbd21ae0@vivier.eu>
Date: Tue, 1 Oct 2019 17:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <9b8662b94d89030b1f33193246c645baac2eedd7.1568170994.git.maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RmP/nbUz+5w8lFam1xOAX9weTGwLej1RIGftrzjurqTYt23lN7r
 KVQC+mNhhgybNTQzo/G08YmQA4LZD0ojgrEBzi13ie7sv1aQO6VT4LW3H/4rVA3ZhmzXUgF
 MI6/UHIPXvq/ZkJiNgHSEoQJI3edcTdcPJfXEJGVSzwkQSAZ31OUht8hA/XNnMlg0TvAdQm
 e31JP56tMyapzP9i3WYnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Rg8QKNa5lw=:x7eaegzvua55BYO3iuCXbl
 FU85fs9/5Li044yXJasmBewcQC5SaqRuH7XlJGXNB/qkUyGtjzPfPSlPOmdGYMwiv/wldQ8gI
 ocxHDedOL9eSdsDBDEsTiJa8hMlUnWWH8145S5d0pKpicg5UsVgV1m1pK8KBlDopPo6u+Z8Lh
 dyBc2Ubeli9VgFm2MUjPYwSEwyOuKCmlezCEJ4lmmC/3TQ/IS+RZlVbddgIorvhI6K9WJIoRh
 54LVdutYkko66tp0OZpwTlFcREiRyB8Ic8EIE4TV7w/3/OovrdU/TIyuqYdc0a/BJ6mEtDKJQ
 Fixb4QvL5xETfX53I8geEFvgiV9Ezb4HbclmM7rxkASH+RBDgP5CNZjIc0omMp0kaUNr1wm6Y
 uSJKP84cOw3oKgA4tYDHUJAeqqRCtjz07CC1JzNMQ1cuTp4Pp4z43qPAZNJmTHGMdM7Q3Skez
 L+KSm0rtYtx6MCwE0YtYRl32OrbNKLXDwoOU7czjyKlo66AHZtbE4tQZBaCA64XWAgYCjXpLe
 0j90mKvPFYjOANypeZt4aSyhooJ4voMMqOg4+qJZEkyply4WWNDOlreQDFoW+UX9nGmRuZg0z
 6KgBgtpK3XV/513NNz5f6k5zWXG7HSTfd7HweekE+t0MPG9qXg5kRiQInx52SZekUWC6dyDXo
 vj8iN3nfjBKWaQgesTP14IJxYzFkG8HVLA35UftqXZyV3SAjxM/dBgSxRMf8W3lOFT8tys+cj
 lkuzKwJEbQUyLNHMRjD1yZPE4+xpSQvHDd4HqOCsSbN8tJL66fkSYaC3kDefzstV8E73+tV5j
 iEEA4JUFuLNabnpff/Shnj+qmgvFs9ZnO/27qUHxi2cK1Jh7fHVhGdqXXuKNO4M/u2g9I1kYJ
 E36a6246+C0285bb+2mfXdOzKtPMlph86jzQywxA4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
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
Cc: tony.nguyen@bt.com, alex.bennee@linaro.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/09/2019 à 05:31, Mao Zhongyi a écrit :
> ‘data’ has the possibility of memory leaks， so use the
> glic macros g_autofree recommended by CODING_STYLE.rst
> to automatically release the memory that returned from
> g_malloc().
> 
> Cc: armbru@redhat.com
> Cc: laurent@vivier.eu
> Cc: tony.nguyen@bt.com
> Cc: alex.bennee@linaro.org
> 
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> ---
>  tests/migration/stress.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/migration/stress.c b/tests/migration/stress.c
> index d9aa4afe92..6cbb2d49d3 100644
> --- a/tests/migration/stress.c
> +++ b/tests/migration/stress.c
> @@ -170,10 +170,10 @@ static unsigned long long now(void)
>  static int stressone(unsigned long long ramsizeMB)
>  {
>      size_t pagesPerMB = 1024 * 1024 / PAGE_SIZE;
> -    char *ram = malloc(ramsizeMB * 1024 * 1024);
> +    g_autofree char *ram = malloc(ramsizeMB * 1024 * 1024);
>      char *ramptr;
>      size_t i, j, k;
> -    char *data = malloc(PAGE_SIZE);
> +    g_autofree char *data = malloc(PAGE_SIZE);

So perhaps g_malloc() could be a better choice as it will exit on
allocation failure?

Thanks,
Laurent


