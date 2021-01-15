Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5812F7AA7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:53:56 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Oby-00051z-VN
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l0Oaz-0004ad-JJ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:52:53 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l0Oax-0007nu-JZ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=XXzY+ypZZOrAGh9lKDMenCTFPf0ROZDgDKTNMXyStBY=; b=pw5ebTHyEQBsy2wWiaWhb6M1j+
 boaIj6aT5icj/ANNGE9ddNDK93pQm2kkXWzUoXkqknJ+T42WPDyfIfCbHDMlPMpHyfBNADz94j/sF
 0g+CAN94UlldAqkoBenZKYAjphisyvE5qznbIrj/CRAaC5Tq5m8i9tpwMN6pzkWnaG8jMWGWSV2Xf
 EWrdfZ4KUB+eAdGb4k6hD8opm7Dzi4QN8zVlOUbVJFgQFxyQSiNEIvkYwAFGMOIgjKpPbv94xxcpf
 sVDTdBt2wQ/sehPIAk8ww5DpGgAKPYDPTKbvK6uP5mmnHS+uuZlDsve4DoTxU+eHO+Ow/i86hfYi4
 rpEkwk1p1io4K/itZ64jXEdm60eVlKv9rgZiOG/j60MwYGtY19WlmlnnepGJzCDrSZbeqvOtrUQum
 scJIino2kIgP0+GtamljvBKdq5Ge4Gsq+0o2y9USoXOXrHEtjohKrRcFDYxQ+NoYxJ6VmTPFAdnIy
 ZctmDaNlybWIhlzRsZdpP7YdvEJTe3toF3WRMD1RdwiTlkAmbgK+2rzFcz0idudFUPactxhezGoX3
 +BmuByzz/EFN/Z71/5fQsjuLB844DdloK0TgmTeaJhS7EuxqpU6MyqMsZl02X6GNJ5FoWlYOLOZCp
 gl8TrlOwv1yYP7tx5QPwxfX/6DOTMUJAO42yPyzcU=;
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: Add virtio-9p configurations for fuzzing
Date: Fri, 15 Jan 2021 13:51:41 +0100
Message-ID: <1628745.NxVj4HnTpz@silver>
In-Reply-To: <20210115132308.371a0675@bahia.lan>
References: <20210114221748.503565-1-alxndr@bu.edu>
 <20210115132308.371a0675@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Christian Schoenebeck <qemu_oss@crudebyte.com>
From: Christian Schoenebeck via <qemu-devel@nongnu.org>

On Freitag, 15. Januar 2021 13:23:08 CET Greg Kurz wrote:
> On Thu, 14 Jan 2021 17:17:48 -0500
> 
> Alexander Bulekov <alxndr@bu.edu> wrote:
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> 
> No changelog at all ?

Yeah, that's indeed quite short. :)

> >  tests/qtest/fuzz/generic_fuzz_configs.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
> > b/tests/qtest/fuzz/generic_fuzz_configs.h index 7fed035345..ffdb590c58
> > 100644
> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> > @@ -59,6 +59,18 @@ const generic_fuzz_config predefined_configs[] = {
> > 
> >          .name = "virtio-mouse",
> >          .args = "-machine q35 -nodefaults -device virtio-mouse",
> >          .objects = "virtio*",
> > 
> > +    },{
> > +        .name = "virtio-9p",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > +        "-fsdev local,id=hshare,path=/tmp/,security_model=none",
> 
> Sharing a general purpose directory like "/tmp" is definitely not a
> recommended practice. This is typically the kind of thing that I'd
> like to see documented in the changelog to help me understand ;-)

For the (non fuzzing) 9p 'local' tests Peter wanted either an auto generated 
(e.g. mkdtemp()) or at least a hard coded test path that allows a person to 
easily identify where the data came from. So I guess that applies to fuzzing 
as well, i.e. something like "/tmp/qemu-fuzz/9pfs/" at least.

Also note that the existing (non fuzzing) 9p 'local' tests auto generate  
individual test pathes with mkdtemp() already. This was necessary there, 
because tests are often run by "make -jN ..." in which case tests were 
accessing concurrently the same single test directory before. Probably less of 
a problem here, but you might consider using the same approach that
virtio-9p-test.c already does.

Also note that 'security_model=none' is maybe Ok as a starting point for 
fuzzing, but a realistic 9p config is rather 'security_model=xattr', because 
'security_model=none' requires the qemu process to be run as root to avoid 
permission denied errors with any minor operation. I would expect these 
fuzzing tests to mostly error out with permission denied errors early instead 
of entering relevant execution pathes.

> What operations does the fuzz test perform on the device ?
> 
> > +        .objects = "virtio*",
> > +    },{
> > +        .name = "virtio-9p-synth",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > +        "-fsdev synth,id=hshare",
> > +        .objects = "virtio*",
> 
> Not sure this is super useful since the only known use case for
> the synth fsdev driver is running the virtio-9p qtest, but
> it looks fine anyway.

Yeah, that's ok. Maybe it raises the chance to enter some execution pathes 
here and there. So I would keep the 'synth' driver config.

> 
> >      },{
> >      
> >          .name = "e1000",
> >          .args = "-M q35 -nodefaults "

Nice to see fuzzing coming for 9p BTW!

Best regards,
Christian Schoenebeck



