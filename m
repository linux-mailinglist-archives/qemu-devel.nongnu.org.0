Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4F59010F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:50:01 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMARc-0007JE-Mm
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMAOm-0004sx-Av
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:47:06 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:32879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMAOi-0003Vh-6Y
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:47:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 62C7C21761;
 Thu, 11 Aug 2022 15:46:56 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 11 Aug
 2022 17:46:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0032a1b15f1-1be8-4b21-9664-bcd2f688e1c6,
 B18B381393FCCA734C2622819310E7EBE9D8D149) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <ada41672-b1dd-c988-c347-96a3355f2da8@kaod.org>
Date: Thu, 11 Aug 2022 17:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC] Testing 7.1.0-rc2, qemu-ppc does not give valid disassembly
Content-Language: en-US
To: Pierre Muller <pierre@freepascal.org>, "qemu-devel@nongnu.org Developers"
 <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Huth <thuth@redhat.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
References: <56c2f192-c897-85bf-9f1a-377eff8d575e@freepascal.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <56c2f192-c897-85bf-9f1a-377eff8d575e@freepascal.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 0b27b074-39c1-4909-bd0f-d5d7d79de175
X-Ovh-Tracer-Id: 2625598585974786921
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeggedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgffgleefledvkeejjeffgfejiedttddvledvlefhteffgedujeekteetheeuudfhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Pierre,

On 8/11/22 15:31, Pierre Muller wrote:
>    Hello,
> 
>    I don't know if this is the right place to submit this report,

Here is a good place :

    https://gitlab.com/qemu-project/qemu/-/issues/

> but I have a problem with my attempt to check the 7.1.0 release candidate
> for linux user powerpc CPU.
> 
>    I am testing a simple executable, compiled with Free Pacal compiler,
> but also linked to libc.
> 
> This is what I obtain with the new rc:
> 
> ~/gnu/qemu/build-qemu-7.1.0-rc1/qemu-ppc -L ~/sys-root/powerpc-linux -d in_asm tprintf
> ----------------
> IN: _start
> 0x3ffda784:
> OBJD-T: 7c230b78388000003821fff0908100004bfe756d
> 
> ----------------
> IN: _dl_start
> 0x3ffc1d00:
> OBJD-T: 9421fd407c0802a6429f0005
> 
> ----------------
> IN: _dl_start
> 0x3ffc1d0c:
> OBJD-T: 93c102b8938102b092e1029c930102a07fc802a6932102a4934102a8936102ac
> OBJD-T: 900102c493a102b493e102bc7c7c1b783fde00043bded2d07d4d42a67d2c42a6
> OBJD-T: 7d0d42a67c0a40004082fff0
> 
> ----------------
> IN: _dl_start
> 0x3ffc1d58:
> OBJD-T: 9141026838e00013f00004d7
> 
> With qemu-ppc version 7.0.0, I get this:
> ----------------
> IN: _start
> 0x3ffda784:  7c230b78  mr       r3, r1
> 0x3ffda788:  38800000  li       r4, 0
> 0x3ffda78c:  3821fff0  addi     r1, r1, -0x10
> 0x3ffda790:  90810000  stw      r4, 0(r1)
> 0x3ffda794:  4bfe756d  bl       0x3ffc1d00
> 
> ----------------
> IN: _dl_start
> 0x3ffc1d00:  9421fd40  stwu     r1, -0x2c0(r1)
> 0x3ffc1d04:  7c0802a6  mflr     r0
> 0x3ffc1d08:  429f0005  bdnzl    0x3ffc1d0c
> 
> Which is way better!
> 
>    I did find that this is related to the fact that
> upon configuration, meson finds no capstone library,
> while disassembly of powerpc CPU has been moved to use of
> capstone in this commit:
> 
> 
> commit 333f944c15e7a6f5503f92d80529a368519d6638
> Author: Thomas Huth <thuth@redhat.com>
> Date:   Thu May 5 19:36:19 2022 +0200
> 
>       disas: Remove old libopcode ppc disassembler
> 
>       Capstone should be superior to the old libopcode disassembler,
>       so we can drop the old file nowadays.
> 
>       Message-Id: <20220505173619.488350-1-thuth@redhat.com>
>       Reviewed-by: Cédric Le Goater <clg@kaod.org>
>       Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> 
> Even when trying to compile the git checkout,
> which contains capstone as a sub-module, in capstone sub-directory,
> I always get capstone support set to NO by meson configuration.
> 
> configure --help says:
> 
> 155:  capstone        Whether and how to find the capstone library
> 
>    Is there a way to tell configure to use the submodule?
> Why doesn't it use the sub-module if pkg-config says that there
> is not system capstone library installed?

Did you try --enable-capstone ?

See :

    https://lore.kernel.org/qemu-devel/4986d31e-00b3-bb94-654d-9659af8ae09f@linaro.org/

Thanks,

C.

