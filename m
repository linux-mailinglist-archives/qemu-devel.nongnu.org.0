Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD0323F0C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:03:57 +0100 (CET)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEulb-00078k-1k
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lEudP-0008Q7-Ja; Wed, 24 Feb 2021 08:55:23 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:44773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lEudM-0005gp-0J; Wed, 24 Feb 2021 08:55:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 3E42D90F1267;
 Wed, 24 Feb 2021 14:55:13 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Feb
 2021 14:55:09 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00462ed1aa0-0a1f-47ec-8daa-abe9b36f25c1,
 AC927D453D6768141DE92FF53A40F340F9E27F5E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
To: Stefan Hajnoczi <stefanha@redhat.com>, Sai Pavan Boddu <saipava@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
 <BY5PR02MB6772EEE95845BAD093CAC972CA809@BY5PR02MB6772.namprd02.prod.outlook.com>
 <YDY7KKI1Xme29UlQ@stefanha-x1.localdomain>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5c7cd4cd-ffe0-fa5d-5a9f-96bc07d7b037@kaod.org>
Date: Wed, 24 Feb 2021 14:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YDY7KKI1Xme29UlQ@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 93b50e21-c6d5-4c86-98a4-22f590b84eff
X-Ovh-Tracer-Id: 6539226661084039949
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeejgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeglefgjeevheeifeffudeuhedvveeftdeliedukeejgeeviefgieefhfdtffeftdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshhtvghfrghnhhgrsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>, Luc Michel <luc.michel@greensocs.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 12:40 PM, Stefan Hajnoczi wrote:
> On Tue, Feb 23, 2021 at 05:35:20PM +0000, Sai Pavan Boddu wrote:
>> Hi Philippe,
>>
>>> -----Original Message-----
>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Sent: Monday, February 22, 2021 5:34 PM
>>> To: Sai Pavan Boddu <saipava@xilinx.com>; Markus Armbruster
>>> <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
>>> <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
>>> <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel Stanley
>>> <joel@jms.id.au>; Cédric Le Goater <clg@kaod.org>; Vincent Palatin
>>> <vpalatin@chromium.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>;
>>> Thomas Huth <thuth@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>;
>>> Peter Maydell <peter.maydell@linaro.org>; Alistair Francis
>>> <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>; Luc Michel
>>> <luc.michel@greensocs.com>; Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Sai Pavan Boddu <saipava@xilinx.com>; qemu-devel@nongnu.org; qemu-
>>> block@nongnu.org
>>> Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
>>>
>>> On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
>>>> From: Vincent Palatin <vpalatin@chromium.org>
>>>>
>>>> Add new block device type.
>>>>
>>>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>>>> [SPB: Rebased over 5.1 version]
>>>> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>>  include/sysemu/blockdev.h | 1 +
>>>>  blockdev.c                | 1 +
>>>>  2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
>>>> index 3b5fcda..eefae9f 100644
>>>> --- a/include/sysemu/blockdev.h
>>>> +++ b/include/sysemu/blockdev.h
>>>> @@ -24,6 +24,7 @@ typedef enum {
>>>>       */
>>>>      IF_NONE = 0,
>>>>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO,
>>>> IF_XEN,
>>>> +    IF_EMMC,
>>>>      IF_COUNT
>>>>  } BlockInterfaceType;
>>>>
>>>> diff --git a/blockdev.c b/blockdev.c
>>>> index cd438e6..390d43c 100644
>>>> --- a/blockdev.c
>>>> +++ b/blockdev.c
>>>> @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] = {
>>>>      [IF_SD] = "sd",
>>>>      [IF_VIRTIO] = "virtio",
>>>>      [IF_XEN] = "xen",
>>>> +    [IF_EMMC] = "emmc",
>>>>  };
>>>
>>> We don't need to introduce support for the legacy -drive magic.
>>>
>>> -device should be enough for this device, right?
>> [Sai Pavan Boddu] I was seeing to use -device for emmc. But I see we anyway need blockdev support for this, which would require us the use -drive.
>>
>> Can you give some pointers, how to approach this ?
> 
> It is probably not necessary to add a new IF_ constant. Would this work:
> 
>   -drive if=none,id=emmc0,file=test.img,format=raw
>   -device emmc,...,drive=emmc0
> 
> Or the more modern:
> 
>   -blockdev node-name=emmc0,driver=file,filename=test.img
>   -device emmc,...,drive=emmc0
> 
> ?
> 
> (The syntax might need small tweaks but is shows the general idea.)

Yes. This is better. 

We could have an "emmc" device inheriting from "sd-card". The "emmc" 
property would not be necessary anymore and may be, we could cleanup 
up some parts doing : 

    if (sd->emmc) { /* eMMC */
        ...
    } else {

    }

with SDCardClass handlers. the SWITCH_FUNCTION command is a good 
candidate, CMD8 also.

C.

