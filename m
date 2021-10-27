Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29BA43C7DC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:44:05 +0200 (CEST)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfgPc-00088W-Qb
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mfgOK-0007K9-Ky; Wed, 27 Oct 2021 06:42:44 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:53671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mfgOI-00030G-59; Wed, 27 Oct 2021 06:42:44 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HfQHx6y0sz9sSx;
 Wed, 27 Oct 2021 12:42:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KWMTzrCuI4H4; Wed, 27 Oct 2021 12:42:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HfQHx5PQyz9sSt;
 Wed, 27 Oct 2021 12:42:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A00658B776;
 Wed, 27 Oct 2021 12:42:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lFq8MWp_-sDV; Wed, 27 Oct 2021 12:42:37 +0200 (CEST)
Received: from [192.168.232.182] (unknown [192.168.232.182])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D31088B763;
 Wed, 27 Oct 2021 12:42:36 +0200 (CEST)
Message-ID: <543407cd-c077-a670-da21-5a4d57d7f35f@csgroup.eu>
Date: Wed, 27 Oct 2021 12:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: fr-FR
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <YVwRfETMFxFKuXO1@redhat.com>
 <268ffea6-9a3e-fcba-6722-7d1f24cf5794@amsat.org>
 <YVx7YGqUENP83vNF@redhat.com>
 <125ddbae-7855-d42d-9156-e8bbe7e21e56@amsat.org>
 <3d8f2a41-a52f-db25-fdc9-c631952369a3@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3d8f2a41-a52f-db25-fdc9-c631952369a3@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=93.17.235.10;
 envelope-from=christophe.leroy@csgroup.eu; helo=pegase2.c-s.fr
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.847,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cédric,

Le 27/10/2021 à 10:40, Cédric Le Goater a écrit :
>>>> I am raising this because the nanoMIPS support is in deprecated state
>>>> since more than 2 releases, but it is still in-tree and I try to keep
>>>> it functional. However, since no toolchain reached mainstream GCC/LLVM
>>>> it is not easy to maintain. By keeping it in that state we give some
>>>> time to other communities to have their toolchain upstreamed / merged.
>>>
>>> If you're trying to keep it functional and aren't going to remove
>>> it, then it shouldn't be marked deprecated.
>>
>> OK, I'll move it back to Odd-fixes.
> 
> The ppc405 boards are still in pretty bad shape. We need a patched u-boot,
> a patched QEMU and a patched Linux and still, we do not reach user space
> without some sort of crash.
> 

I guess Philippe was talking about the nanoMIPS here.

By the way, ppc405 is not on an optimal shape yet for sure, but we are 
getting better and better, and I'm aiming at getting it back to work, 
just because I need it.

By the way, were you able to re-test with CONFIG_MATH_EMULATION enabled 
after your last oops report which shows that you're trying to execute 
floating points instruction ?

Thanks
Christophe

