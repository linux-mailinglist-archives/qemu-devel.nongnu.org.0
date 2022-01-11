Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7279D48AA5D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:22:50 +0100 (CET)
Received: from localhost ([::1]:51982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DMa-0002zW-Vd
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:22:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7DLF-0000rK-Sw
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:21:21 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:39515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7DLD-0001rC-FR
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:21:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.170])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4EFD9D6ECF92
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 10:21:14 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 10:21:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005035dfd52-1858-448b-89f4-0a8a505f1c12,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cc1cf7c9-5b66-41e2-f4bc-860f93270ca3@kaod.org>
Date: Tue, 11 Jan 2022 10:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 0/2] Aspeed I3C device model
Content-Language: en-US
To: <qemu-devel@nongnu.org>
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 15a8103d-b760-4721-b4c4-20bfdf0c4eb1
X-Ovh-Tracer-Id: 5479191900606597911
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekheffheelffeigfefhfetjeduvdejkeejiedvieehudeltdfhlefhhfegtedtkeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 09:45, Troy Lee wrote:
> This series of patch introduce a dummy implemenation of aspeed i3c
> model, and it provide just enough information for guest machine.
> However, the driver probing is still failed, but it will not cause
> kernel panic.
> 
> v3:
> - Remove unused AspeedI3CClass
> - Refine memory region
> - Refine register reset
> - Remove unrelated changes to SPI2 address
> - Remove i3c controller irq line
> 
> v2:
> - Split i3c model into i3c and i3c_device
> - Create 6x i3c devices
> - Using register fields macro
> - Rebase to mainline QEMU
> 
> Troy Lee (2):
>    Introduce a dummy AST2600 I3C model.
>    This patch includes i3c instance in ast2600 soc.

It's nice to add a "hw/arm/aspeed: " prefix to the Subject, or "aspeed: "
at least. In case you resend, keep my "Reviewed-by".

You can grab the patches on :

   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=280442

with :

   pwclient get 1578334 1578335

Thanks,

C.

