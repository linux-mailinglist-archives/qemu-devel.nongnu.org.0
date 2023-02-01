Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F48686087
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN7RE-0000Yr-QQ; Wed, 01 Feb 2023 02:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pN7RC-0000Ql-9h
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:21:46 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pN7R8-0002AL-KS
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:21:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0C60220A4E;
 Wed,  1 Feb 2023 07:21:28 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 1 Feb
 2023 08:21:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0063181a673-2cef-47bf-846c-e7b23b4c877e,
 F0C8195E27B16437EDCB3A2BE992E155E5E23C80) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <37b1ca9c-2938-c611-5d99-8306f12a11ae@kaod.org>
Date: Wed, 1 Feb 2023 08:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: bamboo machine
Content-Language: en-US
To: Mobin Shaikh <m1shaikh@eng.ucsd.edu>
References: <CA+dQ7UYWpQZa=Y8joQsyO5LdBKEzJ-Q9A61oYeJ+1n1Zfy1YxA@mail.gmail.com>
CC: qemu Developers <qemu-devel@nongnu.org>, "list@suse.de:PowerPC"
 <qemu-ppc@nongnu.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CA+dQ7UYWpQZa=Y8joQsyO5LdBKEzJ-Q9A61oYeJ+1n1Zfy1YxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 00d7c6fb-cc1f-4d05-b03e-90956d198bc2
X-Ovh-Tracer-Id: 1366842490238766045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfvefhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfeuleetgedtiedtjeetgeefgfdthfdufeegleeifffhjefhiefhgedutefhffefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhdushhhrghikhhhsegvnhhgrdhutghsugdrvgguuhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hello Mobin,

On 1/31/23 20:24, Mobin Shaikh wrote:
> Hello Cédric ,
> 
> I found your contact information from GitHub. I am a new QEMU enthusiast and learning about QEMU. I emulated PPC bamboo machine using QEMU but I couldn't completely bootup the OS. Would you be able to share the example image file and QEMU command line you use to test QEMU emulation? I want to run the test to make sure I am not missing anything in configuring/building QEMU. I'll really appreciate your help and pointers.

I simply run the command :

   qemu-system-ppc -M bamboo -kernel /path/to/vmlinux -net nic,model=virtio-net-pci -net user -serial mon:stdio -nodefaults -nographic

Here is a kernel/buildroot image :

  https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot/qemu_ppc_bamboo-2022.02-4-geae5011c83-20220309

and the associated defconfig :

   https://github.com/legoater/buildroot/blob/qemu-ppc/configs/qemu_ppc_bamboo_defconfig

Thanks,

C.

