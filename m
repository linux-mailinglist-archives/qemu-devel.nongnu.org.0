Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F441EE45
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:11:23 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIJu-0007lv-Fa
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mWIDM-0000Kq-Ft; Fri, 01 Oct 2021 09:04:36 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:39355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mWIDI-0002uw-U9; Fri, 01 Oct 2021 09:04:36 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HLVgd4Hvqz9sV9;
 Fri,  1 Oct 2021 15:04:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zNHoL1jQrBJ; Fri,  1 Oct 2021 15:04:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HLVgd3DR7z9sSp;
 Fri,  1 Oct 2021 15:04:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5690E8B8BB;
 Fri,  1 Oct 2021 15:04:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8Z-05pCDT3P7; Fri,  1 Oct 2021 15:04:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.170])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C3FC8B87D;
 Fri,  1 Oct 2021 15:04:28 +0200 (CEST)
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
Date: Fri, 1 Oct 2021 15:04:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=93.17.235.10;
 envelope-from=christophe.leroy@csgroup.eu; helo=pegase2.c-s.fr
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.127,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 01 Oct 2021 09:08:27 -0400
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 01/10/2021 à 14:04, Thomas Huth a écrit :
> On 01/10/2021 13.12, Peter Maydell wrote:
>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>> Nevertheless, as long as nobody has a hint where to find that
>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as 
>>> far as I
>>> can see, they do not work without the bios at all, so it's also not 
>>> possible
>>> to use a Linux image with the "-kernel" CLI option directly).
>>
>> It is at least in theory possible to run bare-metal code on
>> either board, by passing either a pflash or a bios argument.
> 
> True. I did some more research, and seems like there was once support 
> for those boards in u-boot, but it got removed there a couple of years 
> ago already:
> 
> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
> 
> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
> 
> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
> 
>> But I agree that there seem to be no signs of anybody actually
>> successfully using these boards for anything, so we should
>> deprecate-and-delete them.
> 
> Yes, let's mark them as deprecated now ... if someone still uses them 
> and speaks up, we can still revert the deprecation again.
> 


I really would like to be able to use them to validate Linux Kernel 
changes, hence looking for that missing BIOS.

If we remove ppc405 from QEMU, we won't be able to do any regression 
tests of Linux Kernel on those processors.

Christophe

