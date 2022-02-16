Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD84B8457
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:34:29 +0100 (CET)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGhg-0003nN-BW
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:34:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKFdO-0006jP-HE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:25:59 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:46111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKFdK-0004vv-Kf
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:25:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5571221755;
 Wed, 16 Feb 2022 08:25:46 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 09:25:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001cc2d8183-a237-4d77-8bc7-38e05f47c0d5,
 CB3E44AF90526EF3DA3218D7163352937EBBBEE5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <00276090-2633-7184-16d7-0d36498f76a5@kaod.org>
Date: Wed, 16 Feb 2022 09:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <Ygr9eYymaFJb0nEI@yekko> <1644976024.xj3xgh76qi.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1644976024.xj3xgh76qi.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 371f05d0-45eb-4fb9-a385-0a4f18d78c64
X-Ovh-Tracer-Id: 13045239274112519075
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeehgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> If we do, we should probably change the
>> default value for this cap based on cpu model in
>> default_caps_with_cpu().
> 
> We allegedly still support POWER7 KVM in Linux. I've never tested it
> and I don't know how much it's used at all. Probably should keep it
> working here if possible. I'll look into default_caps_with_cpu().

AFAICT, KVM has been very much broken on these sytems for a while.

We still have an OPAL POWER7 system running a debian11 in the labs
if you want to check. But, honestly, I wouldn't worry too much about
it. POWER8 and above should be the focus. Anything below: POWER7,
POWER5+, 970 work well enough under TCG.


Thanks,

C.

