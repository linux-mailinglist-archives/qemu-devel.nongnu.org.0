Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3422C219860
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 08:18:10 +0200 (CEST)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtPsn-0000Li-2e
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 02:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jtPrx-0008Hr-2K; Thu, 09 Jul 2020 02:17:17 -0400
Received: from charlie.dont.surf ([128.199.63.193]:35044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jtPru-00008F-PG; Thu, 09 Jul 2020 02:17:16 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 7A821BF5AA;
 Thu,  9 Jul 2020 06:17:11 +0000 (UTC)
Date: Thu, 9 Jul 2020 08:17:07 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH v3 01/18] hw/block/nvme: bump spec data structures to v1.3
Message-ID: <20200709061707.GA1025960@apples.localdomain>
References: <20200706061303.246057-1-its@irrelevant.dk>
 <20200706061303.246057-2-its@irrelevant.dk>
 <222a814fdd8a6ca878e04b30d64015ed629bac68.camel@wdc.com>
 <20200708212404.GA1018121@apples.localdomain>
 <MN2PR04MB59518B3ACCDC857E87D0417DE1670@MN2PR04MB5951.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MN2PR04MB59518B3ACCDC857E87D0417DE1670@MN2PR04MB5951.namprd04.prod.outlook.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 02:17:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: "fam@euphon.net" <fam@euphon.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "javier.gonz@samsung.com" <javier.gonz@samsung.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul  8 21:47, Dmitry Fomichev wrote:
> 
> > -----Original Message-----
> > From: Klaus Jensen <its@irrelevant.dk>
> > Sent: Wednesday, July 8, 2020 5:24 PM
> > To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
> > Cc: qemu-block@nongnu.org; qemu-devel@nongnu.org; fam@euphon.net;
> > javier.gonz@samsung.com; kwolf@redhat.com; mreitz@redhat.com;
> > mlevitsk@redhat.com; philmd@redhat.com; kbusch@kernel.org;
> > k.jensen@samsung.com
> > Subject: Re: [PATCH v3 01/18] hw/block/nvme: bump spec data structures to
> > v1.3
> > 
> > On Jul  8 19:19, Dmitry Fomichev wrote:
> > > Looks good with a small nit (see below),
> > >
> > > Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > >
> > > >
> > > On Mon, 2020-07-06 at 08:12 +0200, Klaus Jensen wrote:
> > > > +#define NVME_TEMP_TMPTH(temp) ((temp >>  0) & 0xffff)
> > >
> > > There is an extra space after temp >>
> > >
> > 
> > Good catch! I won't repost for this ;) - but I'll fix it and add it in
> > the qemu-nvme tree.
> 
> Yes, no need to repost :) Thanks for reviewing our ZNS series! I am working
> on addressing your comments and I am also starting to review your
> "AIO and address mapping refactoring" patchset.
> 

Since I think this patchset gets merged on nvme-next today, there is a
v2 on the way for that set.

