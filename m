Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191694C1A7F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:02:21 +0100 (CET)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMvxz-0007YX-Pd
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:02:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nMvwM-0006K5-Kr
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:00:38 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:60755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nMvwK-00012l-Ci
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:00:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0340423CA8;
 Wed, 23 Feb 2022 18:00:23 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 19:00:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00100310ca7-9ec1-402b-aaac-cfe6068dea7a,
 B99DB1D1B0B873888386AAA9583771E84E582508) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.58.215.209
Message-ID: <47a30c46-a3ef-72b0-0834-79f1547c6e45@kaod.org>
Date: Wed, 23 Feb 2022 19:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org>
 <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
 <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 51562f3d-fc7e-42ec-958c-1273ba1dcf91
X-Ovh-Tracer-Id: 8518277220518235128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeejuedutdetteeljeekudeiffehgeekhffffeejffegheefheefieduudeuheevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 14:06, Peter Maydell wrote:
> On Tue, 22 Feb 2022 at 12:56, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>> On 22/2/22 13:02, Markus Armbruster wrote:
>>> Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
>>> the RTC supports the event).  What if there's more than one RTC?
>>
>> w.r.t. RTC, a machine having multiple RTC devices is silly...
> 
> I don't think we have any examples in the tree currently, but
> I bet real hardware like that does exist: the most plausible
> thing would be a board where there's an RTC built into the SoC
> but the board designers put an external RTC on the board (perhaps
> because it was better/more accurate/easier to make battery-backed).

Yes. like Aspeed machines.

C.


> 
> In fact, here's an old bug report from a user trying to get
> their Debian system to use the battery-backed RTC as the
> "real" one rather than the non-battery-backed RTC device
> that's also part of the arm board they're using:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=785445
> 
> -- PMM


