Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C04AEE01
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 10:27:31 +0100 (CET)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjG6-00059i-EI
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 04:27:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhfn-0003Yr-Ad
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:46:09 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:47629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhfe-00067Q-Q1
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:45:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2FFC92404B;
 Wed,  9 Feb 2022 07:45:43 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 08:45:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b2ea4253-2fd6-4b1b-a808-070484ba41e4,
 D657DFC387B0B0E2C5DD546C0716E11BBFCF4DEE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.223.183
Message-ID: <27e33a50-3e7b-6e7b-9da6-ff831d666035@kaod.org>
Date: Wed, 9 Feb 2022 08:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] docs: rstfy confidential guest documentation
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>
References: <20220204161251.241877-1-cohuck@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220204161251.241877-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c06966e9-cc60-4d45-8062-a9b7bff99005
X-Ovh-Tracer-Id: 8153485653296974700
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 17:12, Cornelia Huck wrote:
> Also rstfy the documentation for AMD SEV, and link it.
> 
> The documentation for PEF had been merged into the pseries doc,
> fix the reference.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>


Applied to ppc-7.0.

Thanks,

C.


