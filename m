Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C475FC6E2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:01:15 +0200 (CEST)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicIL-00067U-S3
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oicFe-0004Pr-MW
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:58:26 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:36235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oicFZ-0008OZ-Bw
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 09:58:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 152C4227CC;
 Wed, 12 Oct 2022 13:58:08 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 12 Oct
 2022 15:58:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0023dbba2e0-3e19-4038-bcaf-febcdb888918,
 A6FB56ABCB84ED256178F5478BD78B6B7DB9F895) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 12 Oct 2022 15:58:06 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth
 <thuth@redhat.com>
Subject: Re: [PATCH 00/20] tests/9p: introduce declarative function calls
Message-ID: <20221012155806.64f67dc8@bahia>
In-Reply-To: <2170356.SogY61Bk0U@silver>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
 <2170356.SogY61Bk0U@silver>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 315ef78b-2943-4d5f-9556-35cce3350400
X-Ovh-Tracer-Id: 14406733737054214624
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdfhudeiuddvfefhtdeuleeggeevueevfeegheduheekjeeggfetueeivdffueeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.77.235; envelope-from=groug@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 12 Oct 2022 12:00:40 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 4. Oktober 2022 22:56:44 CEST Christian Schoenebeck wrote:
> > This series converts relevant 9p (test) client functions to use named
> > function arguments. For instance
> > 
> >     do_walk_expect_error(v9p, "non-existent", ENOENT);
> > 
> > becomes
> > 
> >     twalk({
> >         .client = v9p, .path = "non-existent", .expectErr = ENOENT
> >     });
> > 
> > The intention is to make the actual 9p test code more readable, and easier
> > to maintain on the long-term.
> > 
> > Not only makes it clear what a literal passed to a function is supposed to
> > do, it also makes the order and selection of arguments very liberal, and
> > allows to merge multiple, similar functions into one single function.
> > 
> > This is basically just refactoring, it does not change behaviour.
> 
> Too massive for review?
> 

Yeah, sorry :-(

But since the approach you're taking here may be valuable elsewhere,
and this is qtest, it seems fair to ask Thomas and Laurent to have
a look :-)

> If so, then I'll probably just go ahead and prepare a PR early next week with 
> this queued as well. It's just test code refactoring, so I am quite painless 
> about these changes.
> 
> Best regards,
> Christian Schoenebeck
> 
> > 
> > PREREQUISITES
> > =============
> > 
> > This series requires the following additional patch to work correctly:
> > 
> > https://lore.kernel.org/all/E1odrya-0004Fv-97@lizzy.crudebyte.com/
> > https://github.com/cschoenebeck/qemu/commit/23d01367fc7a4f27be323ed6d195c527
> > bec9ede1
> > 
> > Christian Schoenebeck (20):
> >   tests/9p: merge *walk*() functions
> >   tests/9p: simplify callers of twalk()
> >   tests/9p: merge v9fs_tversion() and do_version()
> >   tests/9p: merge v9fs_tattach(), do_attach(), do_attach_rqid()
> >   tests/9p: simplify callers of tattach()
> >   tests/9p: convert v9fs_tgetattr() to declarative arguments
> >   tests/9p: simplify callers of tgetattr()
> >   tests/9p: convert v9fs_treaddir() to declarative arguments
> >   tests/9p: simplify callers of treaddir()
> >   tests/9p: convert v9fs_tlopen() to declarative arguments
> >   tests/9p: simplify callers of tlopen()
> >   tests/9p: convert v9fs_twrite() to declarative arguments
> >   tests/9p: simplify callers of twrite()
> >   tests/9p: convert v9fs_tflush() to declarative arguments
> >   tests/9p: merge v9fs_tmkdir() and do_mkdir()
> >   tests/9p: merge v9fs_tlcreate() and do_lcreate()
> >   tests/9p: merge v9fs_tsymlink() and do_symlink()
> >   tests/9p: merge v9fs_tlink() and do_hardlink()
> >   tests/9p: merge v9fs_tunlinkat() and do_unlinkat()
> >   tests/9p: remove unnecessary g_strdup() calls
> > 
> >  tests/qtest/libqos/virtio-9p-client.c | 569 +++++++++++++++++++++-----
> >  tests/qtest/libqos/virtio-9p-client.h | 408 ++++++++++++++++--
> >  tests/qtest/virtio-9p-test.c          | 529 ++++++++----------------
> >  3 files changed, 1031 insertions(+), 475 deletions(-)
> 
> 
> 


