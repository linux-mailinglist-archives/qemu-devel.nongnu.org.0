Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B004B741F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:37:58 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1m1-0004sD-04
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:37:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nK1il-0002cp-43; Tue, 15 Feb 2022 12:34:35 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:60317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nK1ii-0004Wu-4y; Tue, 15 Feb 2022 12:34:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.221])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A20E0E01AC26;
 Tue, 15 Feb 2022 18:34:24 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 18:34:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b9c6eb6b-41ce-4948-a076-45ad149065b6,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7e091698-d5db-689c-4c19-b5a7eede51f3@kaod.org>
Date: Tue, 15 Feb 2022 18:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 18/38] Remove unnecessary minimum_version_id_old fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Juan Quintela
 <quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
 <20220127150548.20595-19-quintela@redhat.com>
 <CAFEAcA8+ri-ndQv0b10yfUjSJZwH5Ec08S10_-2k5C8_OMYYDg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8+ri-ndQv0b10yfUjSJZwH5Ec08S10_-2k5C8_OMYYDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a0e9bd5f-8265-454b-ad3c-242cbf61b7ad
X-Ovh-Tracer-Id: 16438138642480139127
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <Laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 18:13, Peter Maydell wrote:
> On Thu, 27 Jan 2022 at 15:14, Juan Quintela <quintela@redhat.com> wrote:
>>
>> From: Peter Maydell <peter.maydell@linaro.org>
>>
>> The migration code will not look at a VMStateDescription's
>> minimum_version_id_old field unless that VMSD has set the
>> load_state_old field to something non-NULL.  (The purpose of
>> minimum_version_id_old is to specify what migration version is needed
>> for the code in the function pointed to by load_state_old to be able
>> to handle it on incoming migration.)
>>
>> We have exactly one VMSD which still has a load_state_old,
>> in the PPC CPU; every other VMSD which sets minimum_version_id_old
>> is doing so unnecessarily. Delete all the unnecessary ones.
>>
>> Commit created with:
>>    sed -i '/\.minimum_version_id_old/d' $(git grep -l '\.minimum_version_id_old')
>> with the one legitimate use then hand-edited back in.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>
>> ---
>>
>> It missed vmstate_ppc_cpu.
> 
> No, as the commit message notes, it deliberately did not change
> that one vmstate, because at the time of writing the patch
> that was the one vmstate that really was still using
> load_state_old. As it happens commit 8f91aca7ff0044b hit
> master first, removing that use of load_state_old (but
> forgetting to remove the minimum_version_id_old field along
> with it), 

If I remember well, at the time of this patch, we were both working
on the same part and I thought that removing all minimum_version_id_old
in one go was better. Anyhow,

> so this commit as it hit master is OK.

yes.

Thanks,

C.

