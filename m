Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F4475E36
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:08:57 +0100 (CET)
Received: from localhost ([::1]:53020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXlw-0001Om-Je
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXYN-0004Ar-Br
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:54:56 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:35705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXYL-0002pq-Et
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:54:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 912F921253;
 Wed, 15 Dec 2021 16:54:51 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:54:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a3b1a9ec-9dfb-44c0-a9c6-b323281a1c15,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <687eb5f0-3232-7c8f-e3c6-877bbb214656@kaod.org>
Date: Wed, 15 Dec 2021 17:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 00/10] PMU-EBB support for PPC64 TCG
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211201151734.654994-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e7c54300-53fc-4d18-b67d-cf00238c06fb
X-Ovh-Tracer-Id: 2151313248829868963
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetveeludeuffffleevleehkeeutdevheekudetffffhfekuddthefgtdejhfdtffenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 16:17, Daniel Henrique Barboza wrote:
> Hi,
> 
> In this new version the most significant change is in patch 6,
> where a new hflag allows us to not call the instruction helper
> inside translate.c unless we're absolutely certain that there
> is an instruction count event being sampled and active in the
> PMU. This change turned out to be a big boost in performance
> in the PMU emulation overall, most notably when dealing with
> cycle events that were calling the helper needlessly.
> 
> This and all other changes were suggested by David in his review
> of the previous version.
> 
> 
> Changes from v8:
> - patch 5:
>    * overflow timer of PMC5 is now marked as NULL instead of absent
> - patch 6:
>    * new hflags HFLAGS_INSN_CNT added to track instruction count state
>    * previous HFLAGS_MMCR0FC flag removed
>    * pmu_count_insns() now works partially with user mode
> - patch 9:
>    * fixed interrupt comment
> - v8 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg05160.html
Applied patches 1-8 to ppc-next.


Thanks,

C.

