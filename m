Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0994321A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:45:15 +0100 (CET)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECSY-0000Oj-OK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lECRD-0007oT-2B
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:43:51 -0500
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:44780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lECRA-0004sJ-Vy
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:43:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 8135E23FFD7;
 Mon, 22 Feb 2021 15:43:44 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Feb
 2021 15:43:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004c422c599-5c40-4a3c-8d8b-f272010ec64c,
 7322555201F4CCBA135B576978D07BE5564972B5) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 22 Feb 2021 15:43:41 +0100
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
Message-ID: <20210222154341.0992238d@bahia.lan>
In-Reply-To: <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
 <20210222082137.1b3f8b3b@bahia.lan>
 <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 9b2ca55f-3cc0-4c88-9638-9cfac66b1ef3
X-Ovh-Tracer-Id: 14060238038734117225
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedugfeljeetjefhfeduhfffledvieelfffggeegfeegteegfeeukeduudetffdunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhm
Received-SPF: pass client-ip=87.98.180.222; envelope-from=groug@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 13:59:34 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 22 Feb 2021 at 07:21, Greg Kurz <groug@kaod.org> wrote:
> >
> > On Fri, 19 Feb 2021 17:51:02 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >
> > > On 19/02/2021 17.26, Peter Maydell wrote:
> > > > Does anybody use the ozlabs patchwork install for QEMU patches,
> > > > either occasionally or on a regular basis ?
> > > > http://patchwork.ozlabs.org/project/qemu-devel/list/
> > > > The admins for that system are trying to identify which of
> > > > the various projects are really using their patchwork instances,
> > > > so I figured I'd do a quick survey here. We don't use it
> > > > as an official project tool but it's certainly possible to
> > > > use it as an individual developer in one way or another.
> > >
> > > I think it might be used by some of the ppc hackers ... so CC:-ing to
> > > qemu-pcc ...
> > >
> >
> > I do on a very regular basis.
> 
> Thanks for the reports. Do you use the features like assigning
> patches to people and changing patch status, or do you mostly
> just use it as a read-only archive-of-patches ?
> 

Only the latter but mostly because I don't have the permissions
to change status, e.g. when trying to change status of this
recent patch from Cedric to rearrange the PowerPC docs:

You don't have permissions to edit patch 'docs/system: Extend PPC section'

My understanding is that users must be "maintainer" to edit other's
patches. Only three 'maintainers' are currently listed at ozlabs for
QEMU:

https://patchwork.ozlabs.org/api/1.0/projects/14/

We had a discussion about that a few months back with Christian Schoenebeck
(9pfs maintainer, Cc'd) who also uses patchworks. It turned out we didn't
quite know how to go further because of lack of documentation, but I'd be
glad to experiment the full patchwork experience if someone knows how to
do it :-)

Cheers,

--
Greg


> -- PMM


