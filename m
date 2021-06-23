Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD83B16B1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:17:51 +0200 (CEST)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvz14-00072w-BT
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvyzr-0005aD-Gl
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:16:35 -0400
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:52287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvyzo-0003OA-Ef
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:16:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 7E48D281365;
 Wed, 23 Jun 2021 11:16:28 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 23 Jun
 2021 11:16:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d8f70cb7-5b88-45fb-98fd-f8f477755dc4,
 B7AA0C2FA2B81B44B633B8B15AC1C2D9682E7D4C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 92.184.105.222
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210623083004.245894-1-clg@kaod.org>
 <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
 <1d9dcb0c-e2f3-455f-fb35-1ea6b7db1d50@kaod.org>
 <CAEUhbmXNRZLQxsy_AgSg2Lr2TMXw+W2tMyV80q0yBwdTB2ArHw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <21d43055-5db1-b891-f86f-7555e2718b4d@kaod.org>
Date: Wed, 23 Jun 2021 11:16:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXNRZLQxsy_AgSg2Lr2TMXw+W2tMyV80q0yBwdTB2ArHw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dfe67243-142d-4d27-8611-78f0aa7ca654
X-Ovh-Tracer-Id: 18152884201126857635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeegfedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepsghmvghnghdrtghnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 11:12 AM, Bin Meng wrote:
> On Wed, Jun 23, 2021 at 4:55 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 6/23/21 10:39 AM, Bin Meng wrote:
>>> On Wed, Jun 23, 2021 at 4:30 PM Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> The number of blocks is defined in the lower bits [15:0]
>>>
>>> I checked the physical spec v8.00 and it says bits [31:0] for CMD23 argument.
>>
>> May be that's an eMMC thing. That's what I read from the specs :
>>
>>  [31] Reliable Write Request
>>  [30:16] set to 0
>>  [15:0] number of blocks
> 
> I don't think we ever claimed eMMC support in QEMU. Did we?

Is that a question ? 

C.  
 


