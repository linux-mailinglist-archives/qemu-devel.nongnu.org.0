Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC46332C86
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:48:22 +0100 (CET)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfWv-0004rp-Fx
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lJen6-0005Kr-Fs; Tue, 09 Mar 2021 11:01:00 -0500
Received: from mailex.trusted-objects.com ([149.202.244.204]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lJen4-0004RH-FA; Tue, 09 Mar 2021 11:01:00 -0500
Received: from [192.170.0.219] (88.127.245.42) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2176.2; Tue, 9 Mar
 2021 17:00:56 +0100
Subject: Re: Malfunctionning qemu-system-arm ?
To: Alistair Francis <alistair23@gmail.com>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
 <CAKmqyKP=XGPYFag1kkGhXcmpM0JTuyOHrMRCfyVQVB1RuSewrg@mail.gmail.com>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <9a51ba35-f01a-ebcd-efe5-bf1e0a94743c@trusted-objects.com>
Date: Tue, 9 Mar 2021 17:00:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP=XGPYFag1kkGhXcmpM0JTuyOHrMRCfyVQVB1RuSewrg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
Received-SPF: none client-ip=149.202.244.204;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alistair,

I am pretty sure that stepping-in somehow solves the issue, I did want 
to see where the problem appeared and this behaviour was making it very 
difficult to spot :/

Regards,

Vincent.

Le 09/03/2021 à 15:19, Alistair Francis a écrit :
> On Mon, Feb 15, 2021 at 11:37 AM vincent Dupaquis
> <v.dupaquis@trusted-objects.com> wrote:
>>      Hello,
>>
>>      I am using qemu-system-arm with a netduino2 target, supposingly
>> integrating a STM32F2xx chip.
>>
>>      I tested using the STM HAL in order to make a simple program run,
>> and I just failed to have it running correctly, it satyed stuck on the
>> starting HAL_init() call.
>>
>>      Debugging the code, it appeared that stepping-in was making the code
>> work while when running it it failed (stayed stuck in an infinite loop,
>> but no obvious arm violations).
>>
>>      Has anyone any idea of what could be the cause for this ? I am using
>> the latest STM32 HAL, with a qemu version 5.1.0 on a Ubuntu 20.04
>> machine. What is the level of support this type of target is supposed to
>> have, and posibly which limitations should I take into account ?
> Hey Vincent,
>
> The model was never tested with the HAL. HALs commonly have infinite
> loops inside them and it seems like you have hit one of them where the
> HAL is waiting on some bit to change. I'm surprised that single
> stepping fixes the problem though.
>
> You will probably need to figure out where the loop is occuring
> (either through GDB or prints/assembly/execution output), after which
> it should be possible to fix the hang.
>
> Alistair
>
>>      Best regards,
>>          Vincent.
>>
>>
>> --
>>
>> *Vincent Dupaquis*
>> Software security & Cryptography expert
>> 06 24 58 17 05
>> /Europarc de Pichaury Bâtiment B8 1330 rue Guillibert Gautier de la
>> Lauzière 13290 Aix-en-Provence/
>>
>> www.trusted-objects.com <http://www.trusted-objects.com>
>>
-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert Gautier de la 
Lauzière 13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>

