Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACC3E416C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:15:03 +0200 (CEST)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0R3-0004bh-Nb
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mD0QG-0003mM-1M
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:14:12 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mD0QD-0002ol-Nf
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:14:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A4B83201D0;
 Mon,  9 Aug 2021 08:14:06 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 9 Aug
 2021 10:14:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0021089c8a9-aa8a-44b9-aa6b-d6a0a4b80498,
 12D865CA04D90D97A6A977E4DA2B50F9FD60493E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210806180040.156999-1-clg@kaod.org>
 <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
 <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
 <4e7b51b8-8b77-3634-eab5-eccc2e01b7c7@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <95c51605-a1dd-5e20-5f8c-8dbcc9de9100@kaod.org>
Date: Mon, 9 Aug 2021 10:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4e7b51b8-8b77-3634-eab5-eccc2e01b7c7@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 67783cb3-977b-4556-a7dc-5029decc4930
X-Ovh-Tracer-Id: 16415057692689927075
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 10:06 AM, Philippe Mathieu-Daudé wrote:
> On 8/9/21 9:55 AM, Cédric Le Goater wrote:
>> Hello Phil,
>>
>> On 8/9/21 9:06 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Cédric,
>>>
>>> On 8/6/21 8:00 PM, Cédric Le Goater wrote:
>>>> It includes support for the POWER10 processor and the QEMU platform.
>>>
>>> 1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?
>>
>> OK. See attachement.
> 
> By "here" I meant in the commit description ;)

yeah I know but David queued the patch already.

> 
>>>>
>>>> Built from submodule.
>>>
>>> 2/ Could we have a CI job building this, during 6.2 cycle?
>>>    (See .gitlab-ci.d/edk2.yml and .gitlab-ci.d/opensbi.yml)
>>
>> Sure. It doesn't look too complex. 
>>
>> I plan to add acceptance tests for the QEMU powernv machines also 
>> once the OpenPOWER files (zImage.epapr and rootfs.cpio.xz) are 
>> published on GH.
>>  
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>  pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
>>>>  roms/skiboot        |   2 +-
>>>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/pc-bios/skiboot.lid b/pc-bios/skiboot.lid
>>>> index 504b95e8b6611aff3a934ff10f789934680591f9..8a3c278512a428a034ed5b1ddbed017ae8c0a9d0 100644
>>>> GIT binary patch
>>>> literal 2528128
>>>
>>> Consider using 'git-format-patch --no-binary' and a reference
>>> to your repository to fetch a such big binary patch.
>>
>> David would pull from my tree then ? So that's like doing a PR. 
>> We can do that next time I send an update if David is OK with 
>> that. I should send an update for v7.0 tag. 
> 
> As you wish. Big patches gave us troubles, i.e. they make crash
> the 'patches' instance. 2.5MiB is probably borderline and I'm
> being nit-picky.
> 

If we can do a PR next time, all should be fine.

Thanks,

C.

