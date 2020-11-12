Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FB22B0343
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 12:01:48 +0100 (CET)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdAMN-0001xu-J2
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 06:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kdAKt-0001UY-5H
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:00:15 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:33943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kdAKq-0008PT-VT
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=JS4J2r13IX0uz1UzHbnrnVR0FqoGyewGghCIHJvCVIQ=; b=Gt30WFyaVl7iEZrQZMeHVeB5mB
 iUAykfS6sU51djmwfsUKgA9lUiE/e+pj259Cx+inRkP6+cZpl9AAL/D07fR3H/j62RZIAFA9bHapS
 bHzKGGvCGqz/Fxvj/OVsGQCMtKgu0rUcuVPp33dJVLmWMken0KjEp9ofpiWKwuDac4vVyl8uW2iKh
 f3L9JgqbrxctSPiuSGL+NGHyZxyRXST/nGMbssdn4M1cVWpAXVwc+C0/g7ZtD732i8VEZf9wEocL+
 AB2RM6UMv5+Vdt0z64JdKs+GR41WVcv2YKN4op5viFlC3spXOz3LejQHZMBG30iyExjGm3gW1RvYB
 +vPsHPog==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Miklos Szeredi <mszeredi@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Date: Thu, 12 Nov 2020 12:00:03 +0100
Message-ID: <2033635.TJ2JW7Qltq@silver>
In-Reply-To: <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
References: <20201105194416.GA1384085@redhat.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 06:00:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 12. November 2020 10:06:37 CET Miklos Szeredi wrote:
> On Fri, Nov 6, 2020 at 11:35 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > On Fri, Nov 06, 2020 at 08:33:50PM +0000, Venegas Munoz, Jose Carlos 
wrote:
> > > Hi Vivek,
> > > 
> > > I have tested with Kata 1.12-apha0, the results seems that are better
> > > for the use fio config I am tracking.
> > > 
> > > The fio config does  randrw:
> > > 
> > > fio --direct=1 --gtod_reduce=1 --name=test
> > > --filename=random_read_write.fio --bs=4k --iodepth=64 --size=200M
> > > --readwrite=randrw --rwmixread=75> 
> > Hi Carlos,
> > 
> > Thanks for the testing.
> > 
> > So basically two conclusions from your tests.
> > 
> > - for virtiofs, --thread-pool-size=0 is performing better as comapred
> > 
> >   to --thread-pool-size=1 as well as --thread-pool-size=64. Approximately
> >   35-40% better.
> > 
> > - virtio-9p is still approximately 30% better than virtiofs
> > 
> >   --thread-pool-size=0.
> > 
> > As I had done the analysis that this particular workload (mixed read and
> > write) is bad with virtiofs because after every write we are invalidating
> > attrs and cache so next read ends up fetching attrs again. I had posted
> > patches to gain some of the performance.
> > 
> > https://lore.kernel.org/linux-fsdevel/20200929185015.GG220516@redhat.com/
> > 
> > But I got the feedback to look into implementing file leases instead.
> 
> Hmm, the FUSE_AUTO_INVAL_DATA feature is buggy, how about turning it
> off for now?   9p doesn't have it, so no point in enabling it for
> virtiofs by default.
> 
> Also I think some confusion comes from cache=auto being the default
> for virtiofs.    Not sure what the default is for 9p, but comparing
> default to default will definitely not be apples to apples since this
> mode is nonexistent in 9p.

The default for 9p is cache=none.

That should be changed to cache=mmap being default IMO, because if users stick 
with the default setting 'none', it breaks software relying on mmap() calls.

> 
> 9p:cache=none  <-> virtiofs:cache=none
> 9p:cache=loose <-> virtiofs:cache=always
> 
> "9p:cache=mmap" and "virtiofs:cache=auto" have no match.

What does 'auto' do exactly?

> 
> Untested patch attached.
> 
> Thanks,
> Miklos

Best regards,
Christian Schoenebeck



