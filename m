Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D086F3A4FBD
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 18:18:09 +0200 (CEST)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls6Km-0006E2-KC
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 12:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ls6Ip-0004rp-PK; Sat, 12 Jun 2021 12:16:08 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ls6Ik-0007jm-Lq; Sat, 12 Jun 2021 12:16:07 -0400
Received: from [192.168.100.1] ([82.142.6.178]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0qmr-1l4eL70UxJ-00wlAu; Sat, 12 Jun 2021 18:15:52 +0200
Subject: Re: [PATCH] fuzz: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210612150004.1489198-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <47090f87-9925-058e-a699-f290c80addd7@vivier.eu>
Date: Sat, 12 Jun 2021 18:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210612150004.1489198-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4EqH+iVLaVO04NpnI1zj/7juydeHh0n/jykztfuVqt/+LAvPf8u
 bYU+Yz/FRayP1IIw7JRNDVUWIoZef/jwIKLv56LHqPFrJgyDSc1/y1sLGtVYhVeMumQPGnF
 nP+1as+maLhoJP7tbeOckP97osBYcp6e0jHGbVAJ7Qhn+7CKo8SMZmJR2ZF35Wy0VtjfhKs
 Zhlh4GHg0jfmwG/+k7DWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kv25bLgGtnk=:inVlX6nh9dDGDQVtrL+JSK
 Frcx8+jFbUzDggRTkng/qFb440z3pOgpry3KaVJuR1JN7LCQZ5AWoH9dWgoOJX3/Sqv1qhDus
 +5G8dpTlKW76zGaJ+YOo6o2sg5Pd1LIkNS3c5xyF1ON1ResOq1jwXqBkdOFYS5+SiQhUg+cn+
 kz+NXcsrggr7OOvQndOkbOW5C5ZxVBDtS+NULJggBH5L/p/0wd/ESHZnbxDolC96tfPvHtXm2
 L2/pOA7oUJWtkf2zmZnGk6VGylNdwxfIfZ79nLT/xcyGcihA/pUvJNkGZdGXZEEm0V789/lO7
 Rd06HsJ5uG0uP15rB/BPfAZpPouglmpXoVJ2cOkar8tSD28En0ITCDSpr/KbyQVyvxvEgRIDZ
 6s4BKBrv/wPZWthm9LxsPiNx2FiUVTrMS+L0iWqxlOX8/2/NtoXYQEE50krRdZoYRZ5LxYLTn
 SfZaU5roMkBKrpgo9d39NLro5WiXQl5EhftZSs5MYcfODEA/tu++cCKxSaKU+40uhAdamYp49
 D20CE+RX+ldCiL7zQb/Yno=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/06/2021 à 17:00, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/qtest/fuzz/generic_fuzz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index cea7d4058e8..1307299df52 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -841,7 +841,7 @@ static void generic_pre_fuzz(QTestState *s)
>  
>      g_hash_table_iter_init(&iter, fuzzable_memoryregions);
>      while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
> -        printf("  * %s (size %lx)\n",
> +        printf("  * %s (size 0x%lx)\n",
>                 object_get_canonical_path_component(&(mr->parent_obj)),
>                 (uint64_t)mr->size);
>      }
> 

What about a "0x%"PRIx64 ?

Thanks,
Laurent

