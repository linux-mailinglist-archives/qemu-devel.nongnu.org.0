Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D543E417B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:20:59 +0200 (CEST)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0Wo-0001KW-Ab
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD0Vy-0000WD-Ol; Mon, 09 Aug 2021 04:20:06 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:38247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD0Vx-0006nG-7V; Mon, 09 Aug 2021 04:20:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 3942C13B1F1;
 Mon,  9 Aug 2021 08:20:02 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 9 Aug
 2021 10:20:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0066463993d-6449-43c2-b4d0-dbb5fae1a830,
 12D865CA04D90D97A6A977E4DA2B50F9FD60493E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210806180040.156999-1-clg@kaod.org>
 <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
 <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
 <4e7b51b8-8b77-3634-eab5-eccc2e01b7c7@redhat.com>
 <95c51605-a1dd-5e20-5f8c-8dbcc9de9100@kaod.org>
 <14ee6281-b805-48ba-29e4-495e8c337f57@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5efa795a-7afc-6faf-2a6d-dab91df284fa@kaod.org>
Date: Mon, 9 Aug 2021 10:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <14ee6281-b805-48ba-29e4-495e8c337f57@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 826e7eec-22cc-42c5-9de0-5f40997d37e6
X-Ovh-Tracer-Id: 16514981312452070307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
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

On 8/9/21 10:18 AM, Philippe Mathieu-Daudé wrote:
> On 8/9/21 10:14 AM, Cédric Le Goater wrote:
>> On 8/9/21 10:06 AM, Philippe Mathieu-Daudé wrote:
>>> On 8/9/21 9:55 AM, Cédric Le Goater wrote:
>>>> Hello Phil,
>>>>
>>>> On 8/9/21 9:06 AM, Philippe Mathieu-Daudé wrote:
>>>>> Hi Cédric,
>>>>>
>>>>> On 8/6/21 8:00 PM, Cédric Le Goater wrote:
>>>>>> It includes support for the POWER10 processor and the QEMU platform.
>>>>>
>>>>> 1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?
>>>>
>>>> OK. See attachement.
>>>
>>> By "here" I meant in the commit description ;)
>>
>> yeah I know but David queued the patch already.
> 
> Queued for 6.2 ;) David doesn't have problem to update an
> unmerged queue. So are you expecting him to amend the attachment
> to your commit?

skiboot history is available on GH. We can improve the process next
time.

C.  


