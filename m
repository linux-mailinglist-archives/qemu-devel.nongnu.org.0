Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6C25C6C2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 18:27:43 +0200 (CEST)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDs5O-0006r2-RR
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 12:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kDrmb-0007x6-61
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:08:17 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:60227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kDrmY-0007kv-Rr
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:08:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.187])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id E1C0B5DA6AC3;
 Thu,  3 Sep 2020 18:07:43 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 3 Sep 2020
 18:07:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033b24ed8b-eb75-44c7-947d-3b7ea475217a,
 FF22E3E2F99647A0705B7EB067E934078DCBDF97) smtp.auth=groug@kaod.org
Date: Thu, 3 Sep 2020 18:07:41 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/1] 9pfs: log warning if msize <= 8192
Message-ID: <20200903180741.74a8e0c4@bahia.lan>
In-Reply-To: <2806958.T35s8Q7qhx@silver>
References: <cover.1599144062.git.qemu_oss@crudebyte.com>
 <20200903171931.3bfe611a@bahia.lan>
 <20200903174123.6b754055@bahia.lan> <2806958.T35s8Q7qhx@silver>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 97e8ee39-54cf-4bcb-8da5-438089b5437a
X-Ovh-Tracer-Id: 1499417205179914717
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleduudehgfehvefhieekheeghfeguedvtdejheefteehueekvefhieelhfffieetnecuffhomhgrihhnpehqvghmuhdrohhrghdpfihikhhiphgvughirgdrohhrghdpfihikhhimhgvughirgdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 11:41:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 03 Sep 2020 17:48:33 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 3. September 2020 17:41:23 CEST Greg Kurz wrote:
> > On Thu, 3 Sep 2020 17:19:31 +0200
> > 
> > Greg Kurz <groug@kaod.org> wrote:
> > > On Thu, 3 Sep 2020 16:41:02 +0200
> > > 
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > I have updated the QEMU 9P setup wiki page about this 'msize' issue. For
> > > > some reason the dedicated anchor 'msize' does not work though:
> > > > 
> > > > https://wiki.qemu.org/Documentation/9psetup#msize
> > > 
> > > AFAICT the wiki derives the anchor from the section name, ie.
> > > 
> > > https://wiki.qemu.org/Documentation/9psetup#Performance_Considerations
> > > 
> > > It's a bit longer than #msize but it works. I don't know if you can
> > > add anchors manually in the wiki.
> > 
> > It seems you could achieve this without the template:
> > 
> > == <span id="msize">Performance Considerations</span> ==
> 
> What I tried was this (as wiki source):
> 
> <!-- NOTE: anchor 'msize' is linked by a QEMU 9pfs log message in 9p.c  -->
> {{anchor|msize}}
> == Performance Considerations ==
> 
> Which "should" work according to:
> https://en.wikipedia.org/wiki/Template:Anchor
> 
> However after I did those changes I saw some template errors as comment in the 
> generated HTML sources, which now are gone at least.
> 
> I wait a bit to see if it is maybe just a caching problem. If it still doesn't 
> work in a while, I will update it with your solution a bit later.
> 
> Thanks for the hint!
> 

Found here:

https://meta.wikimedia.org/wiki/Help:Link#Manual_anchors

> Best regards,
> Christian Schoenebeck
> 
> 


