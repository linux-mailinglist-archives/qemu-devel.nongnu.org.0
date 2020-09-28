Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3526227AB96
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 12:12:41 +0200 (CEST)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMq9A-00040c-9V
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 06:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kMq82-0003EN-WE; Mon, 28 Sep 2020 06:11:31 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:38481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kMq7z-0001OE-6f; Mon, 28 Sep 2020 06:11:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.141])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 03E416637571;
 Mon, 28 Sep 2020 12:11:20 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 28 Sep
 2020 12:11:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e0057010-35bf-41af-a805-4763e0bd85ff,
 9B5560306CAF984A1CB20844932014F06B941BD6) smtp.auth=clg@kaod.org
Subject: Re: [External] Re: [PATCH] aspeed: Add support for the g220a-bmc board
To: =?UTF-8?B?546L5b+X5by6?= <wangzhiqiang.bj@bytedance.com>
References: <20200928061201.1601-1-wangzhiqiang.bj@bytedance.com>
 <d6cf7464-a0bf-2748-7e4c-732208881711@kaod.org>
 <CAH0XSJtDEPnf8qLNuT_Ev3TkGQw_68cZ5KGgY_aLBThMQwU9sQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a4371d4f-0df1-fedb-4f1b-3a29dbeac465@kaod.org>
Date: Mon, 28 Sep 2020 12:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAH0XSJtDEPnf8qLNuT_Ev3TkGQw_68cZ5KGgY_aLBThMQwU9sQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 01b2f5e9-e9fe-42c8-838e-a22309ef828d
X-Ovh-Tracer-Id: 13170777113287428972
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdeigddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopeifrghnghiihhhiqhhirghnghdrsghjsegshihtvggurghntggvrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 06:11:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.011,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.462, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 yulei.sh@bytedance.com, "open
 list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 xuxiaohan@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> Isn't it possible to add some default I2C devices ? temperature sensors ?
> 
> hmm, G220A BMC uses emc1413 as the temperature sensor. I can not find
> it in qemu.

Could it be compatible with the tm105 or TM421 ? 

> I can't find an i2c chip that qemu has and that the g220a uses. :(

Try to model them ! :)

Thanks,

C. 

