Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0420A58897C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:33:01 +0200 (CEST)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAkO-0000Wv-30
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJAUY-0004Bz-Dd
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:16:38 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:41139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJAUW-0000W3-59
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:16:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AB88523A6E;
 Wed,  3 Aug 2022 09:16:32 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 11:16:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006c5f3a659-0245-4bc5-96b4-19b969239c67,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <25524ab9-baa8-eb9c-665a-f4f9e588f071@kaod.org>
Date: Wed, 3 Aug 2022 11:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/19] ppc/ppc405: QOM'ify CPC
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-8-clg@kaod.org>
 <3ebf2ccd-7b06-dfea-c48f-bee921f8f828@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3ebf2ccd-7b06-dfea-c48f-bee921f8f828@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a5d1a0b9-e64c-4d07-a4f2-f4de64fbce56
X-Ovh-Tracer-Id: 4391009637558160352
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 11:14, Daniel Henrique Barboza wrote:
>>       ppc_dcr_init(env, NULL, NULL);
>>       /* CPU control */
>> -    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
>> +    object_property_set_link(OBJECT(&s->cpc), "cpu", OBJECT(&s->cpu),
>> +                             &error_abort);
>> +      if (!qdev_realize(DEVICE(&s->cpc), NULL, errp)) {
>> +        return;
>> +    }
> 
> This if seems misaligned. Otherwise LGTM.

Indeed.
  
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Thanks,

C.


