Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1439340F3C8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:09:03 +0200 (CEST)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR8ve-0007O6-5C
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1mR8pk-0000uK-D8
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:02:58 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1mR8pd-000603-Ao
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:02:56 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210917080241euoutp015c7eeb71ba453213bffaccfc897cf454~ljUOwVFF60795807958euoutp01T
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:02:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210917080241euoutp015c7eeb71ba453213bffaccfc897cf454~ljUOwVFF60795807958euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631865761;
 bh=w0NXGo+nulqSoFunSiCP0ziWY5FFAmQZEXrc62b5r+4=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=F+tDmb1meh6mtAjVkN+6jQnUXhktQ2wuyBKlAP3wE5x5Iaf/0GHZ3EhXkjgLFe0GK
 naqng43Pa8judCVYt1FTDmzbduSx5jWDtKWaJy5WUo5TgmLtyqhrVQD0lP6fmRXWDY
 l2RcpAoy+eh1hJKQIo/+Dv43iQoJnKgm75nAZlz8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210917080241eucas1p1be4fed883ce65412fb50e2d7e663ba33~ljUOY-RjR0730407304eucas1p1U;
 Fri, 17 Sep 2021 08:02:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 74.77.56448.1AB44416; Fri, 17
 Sep 2021 09:02:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210917080240eucas1p20fa8a9919cec957600f77e1c2a7f26db~ljUN4Lu8R0263602636eucas1p2W;
 Fri, 17 Sep 2021 08:02:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210917080240eusmtrp22e88ffd9484668b679181ea5975e1d6a~ljUN3dFib0832908329eusmtrp2b;
 Fri, 17 Sep 2021 08:02:40 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-a4-61444ba1b078
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.D4.20981.0AB44416; Fri, 17
 Sep 2021 09:02:40 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210917080240eusmtip2487da90a03779194f42935d2784bf33d~ljUNp3jb32475524755eusmtip2y;
 Fri, 17 Sep 2021 08:02:40 +0000 (GMT)
Received: from apples.localdomain (106.210.248.65) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Sep 2021 09:02:39 +0100
Date: Fri, 17 Sep 2021 10:02:38 +0200
From: Klaus Jensen <k.jensen@samsung.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH RFC 00/13] hw/nvme: experimental user-creatable objects
Message-ID: <YURLnv5wq5XMWzHg@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YURGB/6SfQUMu992@redhat.com>
X-Originating-IP: [106.210.248.65]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7oLvV0SDRZcE7OYv/Y+i8WDu/2M
 FvsPfmO1mHToGqPFkoupFr3LfrNbzHrXzmZxvHcHi8XrSf9ZHTg9zu04z+6xaVUnm8eTa5uZ
 PN7vu8oWwBLFZZOSmpNZllqkb5fAlXHz+XKmgslGFXdmv2ZrYFyj1sXIySEhYCJx6uJM5i5G
 Lg4hgRWMEr3z7rJDOF8YJb7+3s0G4XxmlJjTMJ+pi5EDrGXB+jSI+HJGicXnPrLDFT1ouwnl
 7GWUaLp5lQVkCYuAqsTZq/NZQWw2AU2J7X/+g8VFBBQlrvdvYQRpYBZYzSRx48NydpCEsIC3
 xMx3hxhBbF4BQ4m5/RvYIGxBiZMzn7CAnMEMNGj9Ln0IU1pi+T8OkApOAS2JZy+/MkP8piTx
 tOUTO4RdK3Fqyy0mkFUSAm84JF7tvc8EkXCROPl0G1SRsMSr41ugbBmJ/zvnQzV0M0r0ffjK
 DOHMYJSYvuw7GyQsrCX6zuRANDhKLLzznxEizCdx460gSJgZyJy0bTozRJhXoqNNCKJaTWJH
 01bGCYzKs5A8NgvhsVkIjy1gZF7FKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmHRO/zv+
 dQfjilcf9Q4xMnEwHmKU4GBWEuG9UOOYKMSbklhZlVqUH19UmpNafIhRmoNFSZx319Y18UIC
 6YklqdmpqQWpRTBZJg5OqQYmptgLrf1+XHJTP/9ct11CwPP7Zm3jL3F1imYieZpHj7gv4rX2
 iGw48XhvR9CGuh/vrBn6N99RSYyZxO61jHnHt3M2d7fa/pnPc1YxdJEo25NrGyb3Frs4hs2b
 fnYlx5bbS33mXFiV9L768z7HxwZLHPj3fFvOcYotd3Lp7RlJk6RM18y5H2TM6Nh3S2Ti06gZ
 Ky8K8m9yLZDJmbv3XmTXgkyZ3YKh9vstc+KFyxfpS844Hz/rsYPx2pcWM7Vz2Ws+TFr81Nn4
 rNjsjB9BVvF/nOf9ZDB9JpS7quLB7WMB1S7Xr728IffpOOvy1TutGj3UCtOzE95emzhzhZe/
 7OJr14wD5v7xuBGi7aZi+2XPdCWW4oxEQy3mouJEAJdH5vCpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xe7oLvF0SDab/M7SYv/Y+i8WDu/2M
 FvsPfmO1mHToGqPFkoupFr3LfrNbzHrXzmZxvHcHi8XrSf9ZHTg9zu04z+6xaVUnm8eTa5uZ
 PN7vu8oWwBKlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqk
 b5egl3Hz+XKmgslGFXdmv2ZrYFyj1sXIwSEhYCKxYH1aFyMXh5DAUkaJli9/2LsYOYHiMhKf
 rnyEsoUl/lzrYoMo+sgo0bNpMROEs5dRYsGSO8wgVSwCqhJnr85nBbHZBDQltv/5zwJiiwgo
 Slzv38II0sAssJpJ4saH5WBjhQW8JWa+O8QIYvMKGErM7d8AtWI2k8SGKffZIBKCEidnPmEB
 uZUZaOr6XfoQprTE8n8cIBWcAloSz15+ZYa4VEniacsnqKtrJT7/fcY4gVF4FpJBsxAGzUIY
 tICReRWjSGppcW56brGRXnFibnFpXrpecn7uJkZg7G079nPLDsaVrz7qHWJk4mA8xCjBwawk
 wnuhxjFRiDclsbIqtSg/vqg0J7X4EKMpMCQmMkuJJucDoz+vJN7QzMDU0MTM0sDU0sxYSZzX
 5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQamtKCTE2eUcS7PslzHoKbyV2neNYkvDSv6ttg5SC49
 LLR92cIXaccX2V9PW9195mLugq2eGlpF2qISV7km6HUsq1xalxPbzNTb3n4msjhki1tSYCfr
 buUMyc4vrZKpLJMW3GqLV1lyM6flrNfU2bdO+Z+7eE23MW3qet2Q9R9mvuzcvklfy1eYsfK6
 R/2pleeYTjFXRs1203/eOrdYOT3leX7T7F3vcp8Yf+ryYRA8U+c+X3zlu8ma/Tzr/i5XZevP
 /rBoS6BCd2udpoLumSMON/RUrjeveWyhHKEnz2833ZajaGZcYtAuBkfLrz0V51Y2MCVOzdH+
 ocC7Joyvf+m08sNsSUsc7t/+Izol1FWJpTgj0VCLuag4EQBZOSD0RgMAAA==
X-CMS-MailID: 20210917080240eucas1p20fa8a9919cec957600f77e1c2a7f26db
X-Msg-Generator: CA
X-RootMTR: 20210917073916eucas1p1f6e1675331d83cd30b3226c9e548153f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210917073916eucas1p1f6e1675331d83cd30b3226c9e548153f
References: <20210914203737.182571-1-its@irrelevant.dk>
 <YUM7YEQDQ2L3Qdh9@redhat.com> <YUNxQCbZSF3nMkVT@apples.localdomain>
 <YUQ0B3VQzY++MGsz@apples.localdomain>
 <CGME20210917073916eucas1p1f6e1675331d83cd30b3226c9e548153f@eucas1p1.samsung.com>
 <YURGB/6SfQUMu992@redhat.com>
Received-SPF: pass client-ip=210.118.77.11; envelope-from=k.jensen@samsung.com;
 helo=mailout1.w1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sep 17 09:38, Kevin Wolf wrote:
> Am 17.09.2021 um 08:21 hat Klaus Jensen geschrieben:
> > On Sep 16 18:30, Klaus Jensen wrote:
> > > On Sep 16 14:41, Kevin Wolf wrote:
> > > > Am 14.09.2021 um 22:37 hat Klaus Jensen geschrieben:
> > > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > This is an attempt at adressing a bunch of issues that have presented
> > > > > themselves since we added subsystem support. It's been brewing for a
> > > > > while now.
> > > > > 
> > > > > Fundamentally, I've come to the conclusion that modeling namespaces and
> > > > > subsystems as "devices" is wrong. They should have been user-creatable
> > > > > objects. We've run into multiple issues with wrt. hotplugging due to how
> > > > > namespaces hook up to the controller with a bus. The bus-based design
> > > > > made a lot of sense when we didn't have subsystem support and it follows
> > > > > the design of hw/scsi. But, the problem here is that the bus-based
> > > > > design dictates a one parent relationship, and with shared namespaces,
> > > > > that is just not true. If the namespaces are considered to have a single
> > > > > parent, that parent is the subsystem, not any specific controller.
> > > > > 
> > > > > This series adds a set of experimental user-creatable objects:
> > > > > 
> > > > >   -object x-nvme-subsystem
> > > > >   -object x-nvme-ns-nvm
> > > > >   -object x-nvme-ns-zoned
> > > > > 
> > > > > It also adds a new controller device (-device x-nvme-ctrl) that supports
> > > > > these new objects (and gets rid of a bunch of deprecated and confusing
> > > > > parameters). This new approach has a bunch of benefits (other than just
> > > > > fixing the hotplugging issues properly) - we also get support for some
> > > > > nice introspection through some new dynamic properties:
> > > > > 
> > > > >   (qemu) qom-get /machine/peripheral/nvme-ctrl-1 attached-namespaces
> > > > >   [
> > > > >       "/objects/nvm-1",
> > > > >       "/objects/zns-1"
> > > > >   ]
> > > > > 
> > > > >   (qemu) qom-list /objects/zns-1
> > > > >   type (string)
> > > > >   subsys (link<x-nvme-subsystem>)
> > > > >   nsid (uint32)
> > > > >   uuid (string)
> > > > >   attached-ctrls (str)
> > > > >   eui64 (string)
> > > > >   blockdev (string)
> > > > >   pi-first (bool)
> > > > >   pi-type (NvmeProtInfoType)
> > > > >   extended-lba (bool)
> > > > >   metadata-size (uint16)
> > > > >   lba-size (size)
> > > > >   zone-descriptor-extension-size (size)
> > > > >   zone-cross-read (bool)
> > > > >   zone-max-open (uint32)
> > > > >   zone-capacity (size)
> > > > >   zone-size (size)
> > > > >   zone-max-active (uint32)
> > > > > 
> > > > >   (qemu) qom-get /objects/zns-1 pi-type
> > > > >   "none"
> > > > > 
> > > > >   (qemu) qom-get /objects/zns-1 eui64
> > > > >   "52:54:00:17:67:a0:40:15"
> > > > > 
> > > > >   (qemu) qom-get /objects/zns-1 zone-capacity
> > > > >   12582912
> > > > > 
> > > > > Currently, there are no shortcuts, so you have to define the full
> > > > > topology to get it up and running. Notice that the topology is explicit
> > > > > (the 'subsys' and 'attached-ctrls' links). There are no 'nvme-bus'
> > > > > anymore.
> > > > > 
> > > > >   -object x-nvme-subsystem,id=subsys0,subnqn=foo
> > > > >   -device x-nvme-ctrl,id=nvme-ctrl-0,serial=foo,subsys=subsys0
> > > > >   -device x-nvme-ctrl,id=nvme-ctrl-1,serial=bar,subsys=subsys0
> > > > >   -drive  id=nvm-1,file=nvm-1.img,format=raw,if=none,discard=unmap
> > > > >   -object x-nvme-ns-nvm,id=nvm-1,blockdev=nvm-1,nsid=1,subsys=subsys0,attached-ctrls=nvme-ctrl-1
> > > > >   -drive  id=nvm-2,file=nvm-2.img,format=raw,if=none,discard=unmap
> > > > >   -object x-nvme-ns-nvm,id=nvm-2,blockdev=nvm-2,nsid=2,subsys=subsys0,attached-ctrls=nvme-ctrl-0
> > > > 
> > > > I may be wrong here, but my first gut feeling when seeing this was that
> > > > referencing the controller device in the namespace object feels
> > > > backwards. Usually, we have objects that are created independently and
> > > > then the devices reference them.
> > > > 
> > > > Your need to use a machine_done notifier is probably related to that,
> > > > too, because it goes against the normal initialisation order, so you
> > > > have to wait. Error handling also isn't really possible in the notifier
> > > > any more, so this series seems to just print something to stderr, but
> > > > ignore the error otherwise.
> > > > 
> > > > Did you consider passing a list of namespaces to the controller device
> > > > instead?
> > > > 
> > > > I guess a problem that you have with both ways is that support for
> > > > list options isn't great in QemuOpts, which is still used both for
> > > > -object and -device in the system emulator...
> > > 
> > > Heh. Exactly. The ability to better support lists with -object through
> > > QAPI is why I did it like this...
> 
> I see. I really need to continue with the QAPIfication work, in the hope
> that devices will have the same level of support for lists in the
> future...
> 
> QOM really has usable support for lists, it's just the outer layer that
> doesn't support them well. I wonder how hard (or how stupid) it would be
> to support JSON syntax without QAPIfying things first.
> 
> > > Having the list of namespaces on the controller is preferable. I'll see
> > > what I can come up with.
> > 
> > There is also the issue that the x-nvme-ns-nvm -object needs a blockdev
> > - and the ordering is also a problem here. That also requires the
> > machine done notifier.
> 
> True, initialisation order can be a mess because QEMU tries to be clever
> and figure it out automatically. But I guess for this part you could
> just have an exception in object_create_early() to switch it to late
> initialisation when blockdevs are already there.

Oh! That's neat! Did not know about that, thanks!

> 
> Even when returning false in object_create_early(), this is still before
> device creation, so the question of whether to move the list to the
> device remains relevant.
> 

Yeah, but I think we can honestly get rid of the full blown flexibility
and just have all namespaces be attached to all controllers initially.
Should QEMU get better support for lists on qdevs, then we can add it.
I'm leaning towards that.


-- 
k

