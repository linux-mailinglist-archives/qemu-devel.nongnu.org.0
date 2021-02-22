Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E732133B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:39:29 +0100 (CET)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7ge-0005et-27
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lE7ff-00059r-4n; Mon, 22 Feb 2021 04:38:27 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lE7fd-0005FS-BF; Mon, 22 Feb 2021 04:38:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7FA818956558;
 Mon, 22 Feb 2021 10:38:20 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Feb
 2021 10:38:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0042e9ca779-e63c-430d-a00e-b796ffaf3387,
 22411CCD660FC3FC09311B18737C076FF65DC705) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [RFC PATCH 11/15] sd: emmc: Add Extended CSD register definitions
To: Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel
 <luc.michel@greensocs.com>, Markus Armbruster <armbru@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Eric Blake
 <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent Palatin
 <vpalatin@chromium.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Edgar Iglesias <edgari@xilinx.com>, Paolo Bonzini
 <pbonzini@redhat.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-12-git-send-email-sai.pavan.boddu@xilinx.com>
 <916b1684-bed1-9eda-6362-9844910703a8@greensocs.com>
 <BY5PR02MB677236F86FABBBEF0E3862D7CA879@BY5PR02MB6772.namprd02.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <af20e7b2-cd42-c909-4bbf-eca73abd63ec@kaod.org>
Date: Mon, 22 Feb 2021 10:38:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB677236F86FABBBEF0E3862D7CA879@BY5PR02MB6772.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 831c35b7-dade-4a82-9f45-98c353182501
X-Ovh-Tracer-Id: 8902490566368136138
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshgrihhprghvrgesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_RP_RNBL=1.31,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 12:11 PM, Sai Pavan Boddu wrote:
> Hi Luc,
>> -----Original Message-----
>> From: Luc Michel <luc.michel@greensocs.com>
>> Sent: Saturday, February 13, 2021 6:26 PM
>> To: Sai Pavan Boddu <saipava@xilinx.com>; Markus Armbruster
>> <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
>> <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
>> <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel Stanley
>> <joel@jms.id.au>; Cédric Le Goater <clg@kaod.org>; Vincent Palatin
>> <vpalatin@chromium.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>;
>> Thomas Huth <thuth@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>;
>> Peter Maydell <peter.maydell@linaro.org>; Alistair Francis
>> <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>; Paolo Bonzini
>> <pbonzini@redhat.com>
>> Cc: qemu-block@nongnu.org; qemu-devel@nongnu.org; Sai Pavan Boddu
>> <saipava@xilinx.com>
>> Subject: Re: [RFC PATCH 11/15] sd: emmc: Add Extended CSD register
>> definitions
>>
>> On 2/11/21 9:17 AM, Sai Pavan Boddu wrote:
>>> From: Cédric Le Goater <clg@kaod.org>
>>>
>>> Add user friendly macros for EXT_CSD register. >
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> [spb: Rebased over versal emmc series,
>>>        updated commit message]
>>> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>>
>> Hi,
>>
>> If Cédric agrees, maybe you can squash this commit into patch 2, and add the
>> missing register definitions?
> [Sai Pavan Boddu] Yeah, that would be nice. I will leave @Cédric Le Goater comment here.

Sure. I hope you did in v2. Sorry I was out.

Thanks,

C. 

