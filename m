Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B5241EE44
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:11:23 +0200 (CEST)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIJu-0007lr-Gi
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mWEcu-0001nQ-SB; Fri, 01 Oct 2021 05:14:44 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:59091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mWEcs-0007if-UA; Fri, 01 Oct 2021 05:14:44 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HLPZQ65Pkz9sWX;
 Fri,  1 Oct 2021 11:14:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bivhiOkB7601; Fri,  1 Oct 2021 11:14:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HLPZQ4zMYz9sS1;
 Fri,  1 Oct 2021 11:14:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FCAB8B77D;
 Fri,  1 Oct 2021 11:14:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YQa8VPbam3Qg; Fri,  1 Oct 2021 11:14:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.170])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57DE98B763;
 Fri,  1 Oct 2021 11:14:37 +0200 (CEST)
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: Thomas Huth <thuth@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
Date: Fri, 1 Oct 2021 11:14:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, peter.maydell@linaro.org,
 dbarboza@redhat.com, aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk,
 groug@kaod.org, wainersm@redhat.com, Alexander Graf <agraf@csgraf.de>,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 01/10/2021 à 10:35, Thomas Huth a écrit :
> On 27/09/2021 06.48, David Gibson wrote:
>> There are a nunber of old embedded ppc machine types which have been 
>> little
>> changed and in "Odd Fixes" state for a long time.  With both myself and
>> Greg Kurz moving toward other areas, we no longer have the capacity to
>> keep reviewing and maintaining even the rare patches that come in for 
>> those
>> platforms.
>>
>> Therefore, remove our names as reviewers and mark these platforms as
>> orphaned.
>>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   MAINTAINERS | 19 +++++--------------
>>   1 file changed, 5 insertions(+), 14 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f2060b46f9..1ecb5716c8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1236,24 +1236,18 @@ F: hw/openrisc/openrisc_sim.c
>>   PowerPC Machines
>>   ----------------
>>   405
>> -M: David Gibson <david@gibson.dropbear.id.au>
>> -M: Greg Kurz <groug@kaod.org>
>>   L: qemu-ppc@nongnu.org
>> -S: Odd Fixes
>> +S: Orphan
>>   F: hw/ppc/ppc405_boards.c
> 
> Related question: Does *anybody* know how to still use the ref405ep or 
> taihu board in QEMU? We just got another ticket asking for the related 
> firmware image:
> 
>   https://gitlab.com/qemu-project/qemu/-/issues/651
> 
> And if you google for 'ppc405_rom.bin', I only find pages where people 
> are asking basically the same question, e.g.:
> 
>   https://lists.nongnu.org/archive/html/qemu-devel/2007-08/msg00252.html 
> (in 2007 already! And no answer)
> 
>   https://github.com/Xilinx/qemu/issues/36 (in 2019, no answer)
> 
>   https://lists.libreplanet.org/archive/html/qemu-ppc/2019-12/msg00263.html (in 2019, no answer about bios location)
> 
>   https://lkml.org/lkml/2020/4/25/61 (in 2020, no answer)
> 
> 
> Seems like the Linux kernel removed support for the 405ep board here:
> 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=548f5244f1064c9facb19c5e9 
> 

The EP405 board was removed because it was apparently based on the buggy 
405GP processor (It was selecting option CONFIG_405GP).

AFAIU the EP405 board is different from the ref405ep. The ref405ep has a 
405EP processor which is still supported, see 
https://elixir.bootlin.com/linux/v5.15-rc3/source/arch/powerpc/kernel/cputable.c#L1300

Christophe


> 
> ... to me this all sounds like these 405 boards are pretty dead code in 
> QEMU right now, so if nobody has a clue how to use them, I'd suggest to 
> mark them as deprecated and remove them in a couple of releases?
> 

