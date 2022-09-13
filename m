Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D875B5B68BB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:33:46 +0200 (CEST)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0QT-0003FC-1k
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oY09p-0008VN-Jx
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:16:34 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:49643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oY09l-0000bS-4p
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:16:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C247022F25;
 Tue, 13 Sep 2022 07:16:15 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 13 Sep
 2022 09:16:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003c8f4b3f8-0b54-40d6-8d70-af0d56f397f9,
 100000D2639293FA209945C79AD02F9CE6615B5E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a209c249-bdd2-f011-a1ca-139f073b92cb@kaod.org>
Date: Tue, 13 Sep 2022 09:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Any interest in a QEMU emulation BoF at KVM Forum?
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Mark Burton <mburton@qti.qualcomm.com>, Bill Mills
 <bill.mills@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Richard
 Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Michael
 Rolnik <mrolnik@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>, Song Gao
 <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, David Gibson
 <david@gibson.dropbear.id.au>, Markus Armbruster <armbru@redhat.com>, Michael
 Roth <michael.roth@amd.com>, Luc Michel <luc@lmichel.fr>, Damien Hedde
 <damien.hedde@greensocs.com>, Alessandro Di Federico <ale@rev.ng>
References: <87a67kphih.fsf@linaro.org>
 <CAHDbmO3CT+7q19gj_037cBt2c4wVEEVMTDr_5Lj8-uWXEt5xRw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAHDbmO3CT+7q19gj_037cBt2c4wVEEVMTDr_5Lj8-uWXEt5xRw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 698a88f4-6712-4c1b-ad67-59c6f25ac1a0
X-Ovh-Tracer-Id: 3332382249972632406
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedufedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveffhfehgeeiieehieeiudevgfelleejjedtgfdtgeffgfeujedujeejudfhkeeknecuffhomhgrihhnpehophgvnhguvghvrdhorhhgpdhgohhoghhlvgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlvgesrhgvvhdrnhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/13/22 09:12, Alex Bennée wrote:
> The BoF session will be in Lifey A (the big hall) this afternoon. I thought being able to sit around tables while we discuss things would make things a bit easier. We can share note taking on the etherpad:
> 
> https://etherpad.opendev.org/p/qemu-emulation-bof%40kvmforum2022 <https://etherpad.opendev.org/p/qemu-emulation-bof%40kvmforum2022>
> 
> I'll run a HO at: https://meet.google.com/rac-axef-xvv <https://meet.google.com/rac-axef-xvv>

Thanks for that. I will try to join. What time approximately ?

C.


> 
> On Wed, 31 Aug 2022 at 16:19, Alex Bennée <alex.bennee@linaro.org <mailto:alex.bennee@linaro.org>> wrote:
> 
>     Hi,
> 
>     Given our slowly growing range of TCG emulations and the evident
>     interest in keeping up with modern processor architectures is it worth
>     having an emulation focused BoF at the up-coming KVM Forum?
> 
>     Some potential topics for discussion I could think of might include:
> 
>       * Progress towards heterogeneous vCPU emulation
> 
>       We've been making slow progress in removing assumptions from the
>       various front-ends about their global nature and adding accel:TCG
>       abstractions and support for the translator loop. We can already have
>       CPUs from the same architecture family in a model. What else do we need
>       to do so we can have those funky ARM+RiscV+Tricore heterogeneous
>       models? Is it library or something else?
> 
>       * External Device Models
> 
>       I know this is a contentious topic given the potential for GPL
>       end-runs. However there are also good arguments for enabling the
>       testing of open source designs without having forcing the
>       implementation of a separate C model to test software. For example if
>       we hypothetically modelled a Pi Pico would it make sense to model the
>       PIO in C if we could just compile the Verilog for it into a SystemC
>       model? Would a plethora of closed device models be the inevitable
>       consequence of such an approach? Would it matter if we just
>       concentrated on supporting useful open source solutions?
> 
>       * Dynamic Machine Models
> 
>       While we try and avoid modelling bespoke virtual HW in QEMU
>       (virt/goldfish not withstanding ;-) there is obviously a desire in the
>       EDA space to allow such experimentation. Is this something we can
>       provide so aspiring HW engineers can experiment with system
>       architectures without having to form QEMU and learn QOM. There have
>       been suggestions about consuming device trees or maybe translating to
>       QMP calls and adding support for wiring devices together. Given the
>       number of forks that exist is this something that could be better
>       supported upstream without degenerating into messy hacks?
> 
>       * A sense of time
> 
>       Currently we have the fairly limited support for -icount in QEMU. At
>       the same time we have no desire to start expanding frontends with
>       the details cost models required for a more realistic sense of time to
>       be presented. One suggestion is to expand the TCG plugin interface to
>       allow for the plugin to control time allowing as much or little logic
>       to be pushed there as we like and freeing up frontends from ever having
>       to consider it.
> 
>     Are any of these topics of interest? Are there any other emulation
>     topics people would like to discuss?
> 
>     -- 
>     Alex Bennée
> 
> 
> 
> -- 
> Alex Bennée
> KVM/QEMU Hacker for Linaro


