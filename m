Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32AC45391A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 19:01:20 +0100 (CET)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2lj-0003Ra-RJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 13:01:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mn2k1-0002KH-AG
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:59:33 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:51515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mn2jz-0000DX-AL
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:59:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.10])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DA19520240;
 Tue, 16 Nov 2021 17:59:28 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 18:59:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0023fe5e44c-16cc-4d10-aaba-57d48b2ad727,
 310E1383184C0BED186E98051F63AF21DB481FBB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <4ecf1d1e-e19f-498f-8f7b-8ae5f04551cc@kaod.org>
Date: Tue, 16 Nov 2021 18:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Alexey Kardashevskiy
 <aik@ozlabs.ru>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
 <ae41e917-8b22-07dc-31dd-902dbc5d5c0d@kaod.org>
 <fa0555bc-cabc-ccea-4f03-eeada196cfb5@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fa0555bc-cabc-ccea-4f03-eeada196cfb5@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 276b55a9-02f2-4d8e-8d7b-1bcb18bd5c5c
X-Ovh-Tracer-Id: 17401908960850643875
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>>> Queued for 7.0.
>>>>
>>>> I am not sure this is a good idea, as this will make bisection
>>>> painful over the release tag.
>>>
>>> It is my understanding that Cedric will rebase for the mainline PR.
>>> At least that's how David was handling subsystem pulls.
>>
>> Yes. I don't plan to send a PR on tree without rebasing. I am just
>> collecting now.
> 
> Oh this is not a signed subsystem pull request, so you can rebase, OK.

I didn't know that. I understand your concern now.

Thanks,

C.


