Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985B34C8688
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:32:50 +0100 (CET)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOxw9-0006nx-Af
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOxse-0004H4-SN
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:29:13 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:51941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOxsc-0005o5-Mw
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:29:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5135723CDD;
 Tue,  1 Mar 2022 08:29:08 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Mar
 2022 09:29:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00562b26e1d-2bcd-4841-8cd0-b90ebca844ef,
 24806437EA66095D5A0A0E3C988328111B43E697) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9c991b68-4ade-ec94-004c-e1fa86f71171@kaod.org>
Date: Tue, 1 Mar 2022 09:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v14 0/4] PMU-EBB support for PPC64 TCG
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220225101140.1054160-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220225101140.1054160-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 711dbfe1-47d8-4dc8-ae83-d2741ec2ac29
X-Ovh-Tracer-Id: 15660141806971685856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtuddguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetveeludeuffffleevleehkeeutdevheekudetffffhfekuddthefgtdejhfdtffenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:11, Daniel Henrique Barboza wrote:
> Hi,
> 
> This new version contains a change suggested by Richard in patch 4. No
> function change was made.
> 
> Changes from v13:
> - patch 1:
>    * added Richard's r-b
> - patch 4:
>    * renamed helper_ebb_perfm_excp() to raise_ebb_perfm_exception(). The
>      function is no longer declared as translation helper
> - v13 link: https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05414.html
> 
> Daniel Henrique Barboza (4):
>    target/ppc: make power8-pmu.c CONFIG_TCG only
>    target/ppc: finalize pre-EBB PMU logic
>    target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
>    target/ppc: trigger PERFM EBBs from power8-pmu.c
> 
>   target/ppc/cpu.h         | 10 ++++-
>   target/ppc/cpu_init.c    | 20 +++++-----
>   target/ppc/excp_helper.c | 81 ++++++++++++++++++++++++++++++++++++++++
>   target/ppc/machine.c     |  6 ++-
>   target/ppc/meson.build   |  2 +-
>   target/ppc/power8-pmu.c  | 39 +++++++++++++++++--
>   target/ppc/power8-pmu.h  |  4 +-
>   7 files changed, 144 insertions(+), 18 deletions(-)
> 


Applied to ppc-7.0.

Thanks,

C.

