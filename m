Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F23225A2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 07:02:21 +0100 (CET)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEQm4-0000fV-Km
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 01:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lEQl9-00008K-DN; Tue, 23 Feb 2021 01:01:23 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lEQl6-00006c-9j; Tue, 23 Feb 2021 01:01:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id AB2A4904D9D2;
 Tue, 23 Feb 2021 07:01:14 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 23 Feb
 2021 07:01:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006a65ccc9a-b97d-4597-a40a-c08b0f7b37af,
 CBA13FE44A10A83F0ADE5239B29E01AA5BD00F0D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] docs/system: Extend PPC section
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210222133956.156001-1-clg@kaod.org>
 <20210222150441.50bc423a@bahia.lan> <YDRMJ2CjTb+3L20p@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <97fa2f84-3e34-a05a-26cc-893abfcd08af@kaod.org>
Date: Tue, 23 Feb 2021 07:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YDRMJ2CjTb+3L20p@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5437a4f1-0f91-4a76-b00b-861f30ff51bf
X-Ovh-Tracer-Id: 11108691431569591087
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeeggdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeglefgjeevheeifeffudeuhedvveeftdeliedukeejgeeviefgieefhfdtffeftdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 programmingkidx@gmail.com, qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 lagarcia@br.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 1:28 AM, David Gibson wrote:
> On Mon, Feb 22, 2021 at 03:04:41PM +0100, Greg Kurz wrote:
>> On Mon, 22 Feb 2021 14:39:56 +0100
>> Cédric Le Goater <clg@kaod.org> wrote:
>>
>>> This moves the current documentation in files specific to each
>>> platform family. PowerNV machine is updated, the other machines need
>>> to be done.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>
>> Looks pretty good to me. Just one small nit in docs/system/target-ppc.rst.
>>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Applied to ppc-for-6.0...
> 
> [snip]
> 
>>> -QEMU emulates the following PowerMac peripherals:
>>> +you can get a complete list by running ``qemu-system-ppc64 --machine
>>
>> Usual capitalization rules call for s/you/You .
> 
> .. and I corrected that inline.
> 

Thanks,

C.

