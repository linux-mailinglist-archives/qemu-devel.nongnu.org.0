Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ECB64B7A8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:45:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56Vx-0006Rs-Nm; Tue, 13 Dec 2022 09:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p56Vv-0006Rj-Tk
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:44:11 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p56Vt-0000sV-Uq
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:44:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.68])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4972314B5DE54;
 Tue, 13 Dec 2022 15:44:01 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 15:43:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0017730a6c4-90aa-4dfc-85f2-008f7f21c724,
 70F1EFD4CFA2BAC2768C5AFE190B601EEBA8C420) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3a86be0b-1621-2a10-c5f5-080f6b8c98ea@kaod.org>
Date: Tue, 13 Dec 2022 15:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
CC: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, John Snow
 <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Bernhard Beschow <shentey@gmail.com>, Brian
 Cain <bcain@quicinc.com>, Warner Losh <imp@bsdimp.com>, Luc Michel
 <luc@lmichel.fr>, Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di
 Federico <ale@rev.ng>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu
 <jim.shu@sifive.com>, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>, Michal Privoznik
 <mprivozn@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa
 <cleber@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, qemu-devel
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Dominik Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jagannathan Raman
 <jag.raman@oracle.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, John G
 Johnson <john.g.johnson@oracle.com>, Dongli Zhang <dongli.zhang@oracle.com>,
 <afaerber@suse.de>, <andrea.arcangeli@redhat.com>, <bazulay@redhat.com>,
 <bbauman@redhat.com>, <cjia@nvidia.com>, <cw@f00f.org>,
 <digitaleric@google.com>, <dustin.kirkland@canonical.com>, Eric Blake
 <eblake@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 <felipe@nutanix.com>, <iggy@theiggy.com>, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>, <jidong.xiao@gmail.com>,
 <jjherne@linux.vnet.ibm.com>, Joao Martins <joao.m.martins@oracle.com>,
 <mburton@qti.qualcom.com>, <mdean@redhat.com>, <mimu@linux.vnet.ibm.com>,
 <z.huo@139.com>, <zwu.kernel@gmail.com>, Laurent Vivier <lvivier@redhat.com>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 463d96ae-c7e4-4047-acaa-83db3082a773
X-Ovh-Tracer-Id: 10354057020792408852
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteeugeejgeevveetieetteevkeffuddtudekgeffleejhfevtdfgtedvhfejhffhnecuffhomhgrihhnpehophgvnhguvghvrdhorhhgpdgslhhuvghjvggrnhhsrdgtohhmpdhmihgtrhhoshhofhhtrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhtvghfrghnhhgrsehgmhgrihhlrdgtohhmpdhkrhgrgigvlhesrhgvughhrghtrdgtohhmpdhktghhrghmrghrthesrhgvughhrghtrdgtohhmpdhmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhkpdhjrghgrdhrrghmrghnsehorhgrtghlvgdrtghomhdpvghlvghnrgdruhhfihhmthhsvghvrgesohhrrggtlhgvrdgtohhmpd
 hjohhhnhdrghdrjhhohhhnshhonhesohhrrggtlhgvrdgtohhmpdguohhnghhlihdriihhrghnghesohhrrggtlhgvrdgtohhmpdgrfhgrvghrsggvrhesshhushgvrdguvgdprghnughrvggrrdgrrhgtrghnghgvlhhisehrvgguhhgrthdrtghomhdpsggriihulhgrhiesrhgvughhrghtrdgtohhmpdgssggruhhmrghnsehrvgguhhgrthdrtghomhdptghjihgrsehnvhhiughirgdrtghomhdptgifsehftddtfhdrohhrghdpughinhgvtghhihhnsehrvgguhhgrthdrtghomhdpughighhithgrlhgvrhhitgesghhoohhglhgvrdgtohhmpdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdgvrhhitgdrrghughgvrhesrhgvughhrghtrdgtohhmpdhfvghlihhpvgesnhhuthgrnhhigidrtghomhdpihhgghihsehthhgvihhgghihrdgtohhmpdhjrghnrdhkihhsiihkrgesfigvsgdruggvpdhjghhgsehnvhhiughirgdrtghomhdpjhhiughonhhgrdigihgrohesghhmrghilhdrtghomhdpjhhjhhgvrhhnvgeslhhinhhugidrvhhnvghtrdhisghmrdgtohhmpdhjohgrohdrmhdrmhgrrhhtihhnshesohhrrggtlhgvrdgtohhmpdhmsghurhhtohhnsehqthhirdhquhgrlhgtohhmrdgtohhmpdhmuggvrghnsehrvgguhhgrthdrtghomhdpmhhimhhusehlihhnuhigrdhvnhgvthdrihgsmhdrtghomhdpiidrhhhuohesudefledrtghomhdpughushhtihhnrdhkihhrkhhlrghnugestggrnhhonhhitggrlhdrtghomhdpugd
 rtghsrghprghksehprhhogihmohigrdgtohhmpdhmrghrtggrnhgurhgvrdhluhhrvggruhesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdhjshhnohifsehrvgguhhgrthdrtghomhdpmhgsuhhrthhonhesqhhtihdrqhhurghltghomhhmrdgtohhmpdgughhilhgsvghrthesrhgvughhrghtrdgtohhmpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdgvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhshhgvnhhtvgihsehgmhgrihhlrdgtohhmpdgstggrihhnsehquhhitghinhgtrdgtohhmpdhimhhpsegsshguihhmphdrtghomhdplhhutgeslhhmihgthhgvlhdrfhhrpdhprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprghlvgesrhgvvhdrnhhgpdiihhhifigvihgplhhiuheslhhinhhugidrrghlihgsrggsrgdrtghomhdpjhhimhdrshhhuhesshhifhhivhgvrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdprghlihhsthgrihhrrdhfrhgrnhgtihhsseifuggtrdgtohhmpdgrlhgvgidr
 sggvnhhnvggvsehlihhnrghrohdrohhrghdprghnjhhosehrvghvrdhnghdpmhhprhhivhhoiihnsehrvgguhhgrthdrtghomhdpkhifohhlfhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpuggvnhesvhhirhhtuhhoiiiiohdrtghomhdptghlvggsvghrsehrvgguhhgrthdrtghomhdpvghhrggskhhoshhtsehrvgguhhgrthdrtghomhdpiiifuhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/13/22 15:17, Stefan Hajnoczi wrote:
> On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 12/12/22 00:41, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> In the last years we had few discussions on "simplifying" QEMU (system
>>> emulation / virtualization), in particular for the "management layer".
>>>
>>> Some of us are interested in having QEMU able to dynamically create
>>> machine models. Mark Burton's current approach is via a Python script
>>> which generates QMP commands. This is just another case of "management
>>> layer".
>>>
>>> Various problems have been raised regarding the current limitations of
>>> QEMU's APIs. We'd like to remember / get a broader idea on these limits
>>> and look at some ideas / proposals which have been discussed / posted
>>> on this list.
>>>
>>> Feel free to complete your thoughts on this public etherpad:
>>> https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
>>>
>>> Topic I remember which can be good starters:
>>>
>>> - Current limitations of QAPI (& QMP) model (Markus Armbruster)
>>>
>>> - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
>>>     limitations (Daniel P. Berrangé & Paolo Bonzini)
>>>
>>> - Problem with x-exit-preconfig, reworking MachinePhaseInit state
>>>     machine (Paolo Bonzini)
>>>
>>> Markus / Daniel / Paolo expressed their ideas on the list (the
>>> historical threads are referenced in the etherpad) so reading the
>>> relevant threads before the call will help to get in the topic.
>>> These people don't have to be in the call, but if they can attend
>>> that would be very nice :)
>>>
>>> The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link:
>>> http://bluejeans.com/quintela
>> We moved the call here:
>>
>> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2
> 
> Please use a video conferencing system that allows people to join
> without logging in and works across browsers. I gave up on Teams.

I also gave up after 27 or so clicks, redirections, emails checks, etc.
Too complex. There are much simpler alternatives.

Sorry.

C.


