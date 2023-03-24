Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0E6C81FC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:58:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfcNv-00043k-B1; Fri, 24 Mar 2023 04:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfcNU-00041K-1B
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:02:29 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfcNE-0005pl-Ij
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:02:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EF19F21D69;
 Fri, 24 Mar 2023 08:01:10 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 24 Mar
 2023 09:01:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00130a59fd7-fa5e-4371-80c2-c816f0636f61,
 B643924C3F00DACC24514BA3944A1F2687FE8C81) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <be542d13-ed97-39f6-7386-b83941563216@kaod.org>
Date: Fri, 24 Mar 2023 09:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] docs: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.vnet.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <joel@jms.id.au>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <20230323030119.2113570-2-ninad@linux.ibm.com>
 <ae61d505-b656-a362-8a80-35f266296e2a@kaod.org>
 <efde764d-d675-07e7-ba60-f4406d083ceb@linux.vnet.ibm.com>
 <026d8d44-c698-189e-155d-ac9c23c4361b@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <026d8d44-c698-189e-155d-ac9c23c4361b@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6a5f21e4-8244-445c-b720-9f7c0cb2ed96
X-Ovh-Tracer-Id: 6396800324939582246
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeghedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehnihhnrggusehlihhnuhigrdhvnhgvthdrihgsmhdrtghomhdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdhsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 3/24/23 06:11, Ninad Palsule wrote:
> Hello Cedric,
> 
> Joel helped me to configure the device and we are able to configure tpm device on ast2600-evb.
> 
> I will include this example in the documentation.
> 
> # uname -a
> Linux ast2600-evb 6.1.15 #1 SMP Thu Mar 23 20:48:29 CDT 2023 armv7l GNU/Linux
> # cat /etc/os-release
> NAME=Buildroot
> VERSION=2023.02-dirty
> ID=buildroot
> VERSION_ID=2023.02
> PRETTY_NAME="Buildroot 2023.02"
> 
> # echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
> [   59.681684] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
> [   59.703190] tpm tpm0: A TPM error (256) occurred attempting the self test
> [   59.705215] tpm tpm0: starting up the TPM manually
> [   59.892917] i2c i2c-12: new_device: Instantiated device tpm_tis_i2c at 0x2e
> # cd /sys/class/tpm/tpm0
> # ls
> dev                pcr-sha256         power              uevent
> device             pcr-sha384         subsystem
> pcr-sha1           pcr-sha512         tpm_version_major


Nice. Did you need any special support in the kernel ?

I could update this image for avocado tests :

   https://github.com/legoater/qemu-aspeed-boot/tree/master/images/ast2600-evb/buildroot-2023.02

Thanks,

C.

