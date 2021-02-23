Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD932282D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:56:30 +0100 (CET)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUQf-0003Ce-TC
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lEUPY-0002hB-A3; Tue, 23 Feb 2021 04:55:20 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:52533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lEUPW-0005hR-7Q; Tue, 23 Feb 2021 04:55:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 97D8E906B7C6;
 Tue, 23 Feb 2021 10:55:13 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 23 Feb
 2021 10:55:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003fdd3c27a-2c97-4ecb-bfbd-29b1a101441f,
 6F2917FB5EF69EFB637F8DE19110E4015BA123FD) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 23 Feb 2021 10:55:10 +0100
From: Greg Kurz <groug@kaod.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
Message-ID: <20210223105510.0687d0b6@bahia.lan>
In-Reply-To: <CAEUhbmV+qUWtw0Cksrp9dwO2vPnCD8B7Se88a3K_dn3FENnLLQ@mail.gmail.com>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
 <20210222082137.1b3f8b3b@bahia.lan>
 <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
 <20210222154341.0992238d@bahia.lan>
 <CAEUhbmV+qUWtw0Cksrp9dwO2vPnCD8B7Se88a3K_dn3FENnLLQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: e7aab1c2-4495-495f-9cd5-bc5b32af9fb4
X-Ovh-Tracer-Id: 15060318630309697900
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedugfeljeetjefhfeduhfffledvieelfffggeegfeegteegfeeukeduudetffdunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_BL_SPAMCOP_NET=1.347,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 14:57:21 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> On Mon, Feb 22, 2021 at 10:43 PM Greg Kurz <groug@kaod.org> wrote:
> >
> > On Mon, 22 Feb 2021 13:59:34 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > > On Mon, 22 Feb 2021 at 07:21, Greg Kurz <groug@kaod.org> wrote:
> > > >
> > > > On Fri, 19 Feb 2021 17:51:02 +0100
> > > > Thomas Huth <thuth@redhat.com> wrote:
> > > >
> > > > > On 19/02/2021 17.26, Peter Maydell wrote:
> > > > > > Does anybody use the ozlabs patchwork install for QEMU patches,
> > > > > > either occasionally or on a regular basis ?
> > > > > > http://patchwork.ozlabs.org/project/qemu-devel/list/
> > > > > > The admins for that system are trying to identify which of
> > > > > > the various projects are really using their patchwork instances,
> > > > > > so I figured I'd do a quick survey here. We don't use it
> > > > > > as an official project tool but it's certainly possible to
> > > > > > use it as an individual developer in one way or another.
> > > > >
> > > > > I think it might be used by some of the ppc hackers ... so CC:-ing to
> > > > > qemu-pcc ...
> > > > >
> > > >
> > > > I do on a very regular basis.
> > >
> > > Thanks for the reports. Do you use the features like assigning
> > > patches to people and changing patch status, or do you mostly
> > > just use it as a read-only archive-of-patches ?
> > >
> >
> > Only the latter but mostly because I don't have the permissions
> > to change status, e.g. when trying to change status of this
> > recent patch from Cedric to rearrange the PowerPC docs:
> >
> > You don't have permissions to edit patch 'docs/system: Extend PPC section'
> >
> > My understanding is that users must be "maintainer" to edit other's
> > patches. Only three 'maintainers' are currently listed at ozlabs for
> > QEMU:
> 
> I can update my patch status in the QEMU project. I am not sure if
> this is due to I am a maintainer of another project hosted on
> ozlabs.org.
> 

Yeah everyone can update its own patches but you need to
be maintainer of a project to update the status of other's
patch for this project IIUC.

> >
> > https://patchwork.ozlabs.org/api/1.0/projects/14/
> >
> > We had a discussion about that a few months back with Christian Schoenebeck
> > (9pfs maintainer, Cc'd) who also uses patchworks. It turned out we didn't
> > quite know how to go further because of lack of documentation, but I'd be
> > glad to experiment the full patchwork experience if someone knows how to
> > do it :-)
> 
> I personally found patchwork is really helpful for mainatiner's work.
> But it looks the maintainers from the QEMU community do not use it.
> 
> Regards,
> Bin


