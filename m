Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364034E9C31
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:26:19 +0200 (CEST)
Received: from localhost ([::1]:38054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYsCA-0002eB-Be
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:26:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYsAX-0001jk-Sm
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:24:37 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:58815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYsAW-0002Nx-4p
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:24:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id F1F2D2051F;
 Mon, 28 Mar 2022 16:24:32 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 18:24:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0016727eba8-8f11-45e4-a862-0f3032dde468,
 CFE7A3AAE61928554BF17059C30BCFB3D76DD066) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <65840437-430b-01cc-71c5-5ba30785a35f@kaod.org>
Date: Mon, 28 Mar 2022 18:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/6] Port PPC64/PowerNV MMU tests to QEMU
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <b232c4e6-61ba-0dc9-e2d0-53b4ad7cc93a@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b232c4e6-61ba-0dc9-e2d0-53b4ad7cc93a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e9650834-f438-41c7-807b-d33ad95e5e6e
X-Ovh-Tracer-Id: 16230973058391313199
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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
Cc: pbonzini@redhat.com, danielhb413@gmail.com, alex.bennee@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/22 14:13, Richard Henderson wrote:
> On 3/24/22 13:08, Leandro Lupori wrote:
>> To be able to finish the test and return an exit code to the
>> calling process, the Processor Attention instruction is used.
>> As its behavior is implementation dependent, in QEMU PowerNV
>> it just calls exit with GPR[3] value, truncated to an uint8_t.
> 
> I think you're simply thinking too small here, and should consider using the attn instruction to implement a full -semihosting interface.  You might as well join arm and riscv with CONFIG_ARM_COMPATIBLE_SEMIHOSTING.

yes. This looks like a good interface. We need an instruction
to generate the semihosting calls.

Thanks,

C.

