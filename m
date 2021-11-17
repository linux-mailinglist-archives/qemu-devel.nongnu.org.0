Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376E6454513
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:37:06 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIJN-00078q-5Q
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:37:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnIHN-00061H-16
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:35:01 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:58497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnIHI-0002X1-Cl
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:35:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 65BE7218AC;
 Wed, 17 Nov 2021 10:34:53 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 11:34:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0056f123be8-0222-4de7-b188-00a1d2d72523,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a25473d6-9bff-db32-c6e2-e19ef0b33ecc@kaod.org>
Date: Wed, 17 Nov 2021 11:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: New Defects reported by Coverity Scan for QEMU
Content-Language: en-US
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>, Matheus Kowalczuk
 Ferst <matheus.ferst@eldorado.org.br>, QEMU Developers
 <qemu-devel@nongnu.org>, QEMU PowerPC <qemu-ppc@nongnu.org>
References: <618af1a42c458_27197b2b2515bd79b8920c6@prd-scan-dashboard-0.mail>
 <9db2efb6-5161-6c17-f7aa-4d8b7e1aba98@kaod.org>
 <92434193-3727-8994-9ebd-b823665aa90a@eldorado.org.br>
 <CPXPR80MB5224B99CDBDD24B81FF4CC58DA999@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CPXPR80MB5224B99CDBDD24B81FF4CC58DA999@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dd567e58-e27d-441b-b7e8-ecdc189bf813
X-Ovh-Tracer-Id: 15766257873656712160
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 21:21, Luis Fernando Fujita Pires wrote:
> From: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
>> Hi Cédric,
>>
>> The only change was the helper name that is now uppercase, so nothing new
>> here. The underlying cause is that dfp_finalize_decimal64 only sets
>> dfp->vt.VsrD(1) and set_dfp64 receives a pointer to the complete struct.
>>
>> But since set_dfp64 also only access VsrD(1), it shouldn't be a real
>> problem AFAICT. The same applies to CID 1465776~1465786 and
>> 1465788~1465790.
> 
> Right. Coverity is probably reporting these as new just because the helper macros were re-written as part of the move to decodetree.
> I believe these should be marked as false positives.
> 
> We *could* also wrap set_dfp{64,128} in new macros that would then reference only the appropriate parts of dfp, but, in this case, I don't think it's worth the trouble.

Thanks for the help on this,

C.

