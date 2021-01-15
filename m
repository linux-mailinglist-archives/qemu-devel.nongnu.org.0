Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA26E2F7FF7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:47:32 +0100 (CET)
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RJz-000093-Ty
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0RBv-0000Jy-1w
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:39:11 -0500
Received: from relay64.bu.edu ([128.197.228.104]:51098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0RBt-0004Zl-9b
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:39:10 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10FFc4eu014309
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 15 Jan 2021 10:38:07 -0500
Date: Fri, 15 Jan 2021 10:38:04 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] fuzz: Add virtio-9p configurations for fuzzing
Message-ID: <20210115153804.cgkm2hi236hnc5x6@mozz.bu.edu>
References: <20210114221748.503565-1-alxndr@bu.edu>
 <20210115132308.371a0675@bahia.lan> <1628745.NxVj4HnTpz@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628745.NxVj4HnTpz@silver>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210115 1351, Christian Schoenebeck wrote:
> On Freitag, 15. Januar 2021 13:23:08 CET Greg Kurz wrote:
> > On Thu, 14 Jan 2021 17:17:48 -0500
> > 
> > Alexander Bulekov <alxndr@bu.edu> wrote:
> > > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > ---
> > 
> > No changelog at all ?
> 
> Yeah, that's indeed quite short. :)
> 
> > >  tests/qtest/fuzz/generic_fuzz_configs.h | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
> > > b/tests/qtest/fuzz/generic_fuzz_configs.h index 7fed035345..ffdb590c58
> > > 100644
> > > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> > > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> > > @@ -59,6 +59,18 @@ const generic_fuzz_config predefined_configs[] = {
> > > 
> > >          .name = "virtio-mouse",
> > >          .args = "-machine q35 -nodefaults -device virtio-mouse",
> > >          .objects = "virtio*",
> > > 
> > > +    },{
> > > +        .name = "virtio-9p",
> > > +        .args = "-machine q35 -nodefaults "
> > > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > > +        "-fsdev local,id=hshare,path=/tmp/,security_model=none",
> > 
> > Sharing a general purpose directory like "/tmp" is definitely not a
> > recommended practice. This is typically the kind of thing that I'd
> > like to see documented in the changelog to help me understand ;-)
> 
> For the (non fuzzing) 9p 'local' tests Peter wanted either an auto generated 
> (e.g. mkdtemp()) or at least a hard coded test path that allows a person to 
> easily identify where the data came from. So I guess that applies to fuzzing 
> as well, i.e. something like "/tmp/qemu-fuzz/9pfs/" at least.
> 
> Also note that the existing (non fuzzing) 9p 'local' tests auto generate  
> individual test pathes with mkdtemp() already. This was necessary there, 
> because tests are often run by "make -jN ..." in which case tests were 
> accessing concurrently the same single test directory before. Probably less of 
> a problem here, but you might consider using the same approach that
> virtio-9p-test.c already does.
> 
> Also note that 'security_model=none' is maybe Ok as a starting point for 
> fuzzing, but a realistic 9p config is rather 'security_model=xattr', because 
> 'security_model=none' requires the qemu process to be run as root to avoid 
> permission denied errors with any minor operation. I would expect these 
> fuzzing tests to mostly error out with permission denied errors early instead 
> of entering relevant execution pathes.
> 

Ah. That's good to know. I just copied the security_model from the bug
report for the recent CVE (https://bugs.launchpad.net/qemu/+bug/1911666)
I'll switch to mapped-xattr, in v2
-Alex

> > What operations does the fuzz test perform on the device ?
> > 
> > > +        .objects = "virtio*",
> > > +    },{
> > > +        .name = "virtio-9p-synth",
> > > +        .args = "-machine q35 -nodefaults "
> > > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > > +        "-fsdev synth,id=hshare",
> > > +        .objects = "virtio*",
> > 
> > Not sure this is super useful since the only known use case for
> > the synth fsdev driver is running the virtio-9p qtest, but
> > it looks fine anyway.
> 
> Yeah, that's ok. Maybe it raises the chance to enter some execution pathes 
> here and there. So I would keep the 'synth' driver config.
> 
> > 
> > >      },{
> > >      
> > >          .name = "e1000",
> > >          .args = "-M q35 -nodefaults "
> 
> Nice to see fuzzing coming for 9p BTW!
> 
> Best regards,
> Christian Schoenebeck
> 
> 

