Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0883E561D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 11:00:05 +0200 (CEST)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNcC-0007HL-Fs
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 05:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDNbG-0006LV-Hl
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:59:06 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:52063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDNbE-00014g-Vw
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:59:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.221])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 0F56213B177;
 Tue, 10 Aug 2021 08:59:01 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 10 Aug
 2021 10:58:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005888fbf0a-8584-4f93-8f54-992b5f218a57,
 8F36BE46FB8773C29BD4C9A30C998E4B5B7B2B54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 00/26] ppc/pnv: Extend the powernv10 machine
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809134547.689560-1-clg@kaod.org> <YRHumlzjG+ymyF3Y@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8f7cfd3b-0db5-b824-c700-cedf898cf2e1@kaod.org>
Date: Tue, 10 Aug 2021 10:58:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRHumlzjG+ymyF3Y@yekko>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: df6dbe75-d690-4003-857b-1e0a673757e5
X-Ovh-Tracer-Id: 4599582597814586336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeglefgjeevheeifeffudeuhedvveeftdeliedukeejgeeviefgieefhfdtffeftdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 5:12 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 03:45:21PM +0200, Cédric Le Goater wrote:
>> Hi,
>>
>> This series adds the minimum set of models (XIVE2, PHB5) to boot a
>> baremetal POWER10 machine using the OpenPOWER firmware images.
>>
>> The major change is the support for the interrupt controller of the
>> POWER10 processor. XIVE2 is very much like XIVE but the register
>> interface, the different MMIO regions, the XIVE internal descriptors
>> have gone through a major cleanup. It was easier to duplicate the
>> models then to try to adapt the current models. XIVE2 adds some new
>> set of features. Not all are modeled here but we add the
>> "Address-based trigger" mode which is activated by default on the
>> PHB5. When using ABT, the PHB5 offloads all interrupt management on
>> the IC, this to improve latency.
> 
> 5..8/26 applied to ppc-for-6.2, continuing to look at the rest.

The XIVE2 part is somewhat tedious ... :/ 

I sent the acceptance patch for the P8 and P9 machines. It also works 
for P10 with the newer skiboot which activates all the newer features
for HW.

C.
 


