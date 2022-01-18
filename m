Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0449226C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:18:29 +0100 (CET)
Received: from localhost ([::1]:44516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kdI-0005yk-3a
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9kWE-0006sw-7T
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:11:10 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:57963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9kWA-0004G4-KA
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:11:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1FE1A218E4;
 Tue, 18 Jan 2022 09:11:03 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 10:11:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e71b51f6-0a1d-46bb-8808-818ec0d17d76,
 78124C4340FA50D00486B2609A05927D7A7C6ABE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <07126f9a-c42e-8b25-9d9e-dff148377f3b@kaod.org>
Date: Tue, 18 Jan 2022 10:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: ppc pbr403 vmstate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>
References: <YeB0zGRC/ct8DAzM@work-vm> <YeC4xYrYhdAKKwTx@yekko.fritz.box>
 <a2b11256-5afe-42de-ffb3-dad07c8165b3@kaod.org>
 <YeUEB0lb7mhuoP6G@yekko.fritz.box>
 <CAFEAcA9fcjH7Om8rDMdQ+=cvjaJjWEg2j=CvjE3Lk3kZ0d_y7g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9fcjH7Om8rDMdQ+=cvjaJjWEg2j=CvjE3Lk3kZ0d_y7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 24623064-f9e8-4995-81b2-783233693428
X-Ovh-Tracer-Id: 9522579939508521836
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 danielhb413@gmail.com, groug@kaod.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 21:40, Peter Maydell wrote:
> On Mon, 17 Jan 2022 at 05:52, David Gibson <david@gibson.dropbear.id.au> wrote:
>> It is also touched in the *super* old cpu_load_old.  I suspect we
>> could probably just drop that completely, since I don't think we
>> realistically support migration from a version that old anyway.
> 
> This would be a nice thing to do, because the PPC CPU is the
> only remaining in-tree user of the .load_state_old migration
> hook, so if we declared that we don't support migrating from
> those old versions of QEMU (1.5 and earlier, I think) then we
> could delete the .load_state_old and .minimum_version_id_old
> handling completely.

yes. It should be fine for PPC.

Thanks,

C.

