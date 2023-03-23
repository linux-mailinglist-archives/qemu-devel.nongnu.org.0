Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED06C609B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 08:24:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfFIT-0006mQ-Tr; Thu, 23 Mar 2023 03:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfFIR-0006mD-Eh
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:23:39 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfFIP-0002Ko-Fk
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:23:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0C49D2BBE4;
 Thu, 23 Mar 2023 07:23:24 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 23 Mar
 2023 08:23:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003eb4a46cb-e09e-4884-9b70-c3bfb8bad99c,
 176673217AFB8255045F9FD15030271BA63368C6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e82fa6a5-1e78-d546-a2f8-08dbb3e030c4@kaod.org>
Date: Thu, 23 Mar 2023 08:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/3] Add support for TPM devices over I2C bus
To: Ninad Palsule <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <joel@jms.id.au>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230323030119.2113570-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 581e7cfd-bd66-4a90-8cf6-8cdb721c8c70
X-Ovh-Tracer-Id: 18332746708606618531
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeejteffveeigedutdevudehkeekveffhfetvddukeehheduffevleevhfeiudeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Ninad,

On 3/23/23 04:01, Ninad Palsule wrote:
> This drop adds support for the TPM devices attached to the I2C bus. It
> only supports the TPM2 protocol. You need to run it with the external
> TPM emulator like swtpm. I have tested it with swtpm.
> 
> I have refered to the work done by zhdaniel@meta.com but at the core
> level out implementation is different.
> https://github.com/theopolis/qemu/commit/2e2e57cde9e419c36af8071bb85392ad1ed70966
> 
> Based-on: $MESSAGE_ID
> ---
> V2:
>   Incorporated Stephan's comments.

Please add a version to the patchsets you send :

   git format-patch -v 2 --cover-letter ....

it is better practice and easier to track in our mailboxes. The automated
tools patchew, patchwork, also track them.

> 
> Ninad Palsule (3):
>    docs: Add support for TPM devices over I2C bus

Generally we add the docs after support. No big deal.


>    TPM TIS: Add support for TPM devices over I2C bus
>    New I2C: Add support for TPM devices over I2C bus

Have you looked at adding tests ? qtest or avocado ?

We discussed offline about it with Stefan and the I2C qos framework in
qtest is a bit of a challenge for the TPM purpose. See the thread here :

   https://lore.kernel.org/qemu-devel/dd43ec84-51e4-11f7-e067-2fb57a567f09@linux.ibm.com/T/#u

Thanks,

C.


> 
>   docs/specs/tpm.rst      |  20 +-
>   hw/arm/Kconfig          |   1 +
>   hw/tpm/Kconfig          |   7 +
>   hw/tpm/meson.build      |   1 +
>   hw/tpm/tpm_tis.h        |   3 +
>   hw/tpm/tpm_tis_common.c |  32 +++
>   hw/tpm/tpm_tis_i2c.c    | 440 ++++++++++++++++++++++++++++++++++++++++
>   include/sysemu/tpm.h    |   3 +
>   8 files changed, 506 insertions(+), 1 deletion(-)
>   create mode 100644 hw/tpm/tpm_tis_i2c.c
> 


