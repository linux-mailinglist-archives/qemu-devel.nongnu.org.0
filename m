Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDA9135049
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 01:08:07 +0100 (CET)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipLMs-0006OJ-9o
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 19:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ipLJn-0002OJ-8O
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 19:04:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ipL97-0006QA-NZ
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 18:53:55 -0500
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:36282)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ipL97-00067R-Ft
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 18:53:53 -0500
Received: from player750.ha.ovh.net (unknown [10.108.57.14])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 2A0558AC9D
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 00:53:42 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id DF297DF819BA;
 Wed,  8 Jan 2020 23:53:37 +0000 (UTC)
Date: Thu, 9 Jan 2020 00:53:35 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 2/9] 9pfs: validate count sent by client with T_readdir
Message-ID: <20200109005335.4b6214a5@bahia.lan>
In-Reply-To: <6289486.8nMSniMWIK@silver>
References: <cover.1576678644.git.qemu_oss@crudebyte.com>
 <4866c87cb19f3191b977fc7fbe2857abf1da80b6.1576678644.git.qemu_oss@crudebyte.com>
 <20200106133024.2ce31324@bahia.lan> <6289486.8nMSniMWIK@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7747880211890936128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehgihhthhhusgdrihhopdhgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.76.150
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
Cc: anthony.perard@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 06 Jan 2020 16:10:28 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 6. Januar 2020 13:30:24 CET Greg Kurz wrote:
> > On Wed, 18 Dec 2019 14:17:59 +0100
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > A good 9p client sends T_readdir with "count" parameter that's
> > > sufficiently smaller than client's initially negotiated msize
> > > (maximum message size). We perform a check for that though to
> > > avoid the server to be interrupted with a "Failed to encode
> > > VirtFS reply type 41" error message by bad clients.
> > 
> > Hmm... doesn't v9fs_do_readdir() already take care of that ?
> 
> No, unfortunately it doesn't. It just looks at the "count" parameter 
> transmitted with client's T_readdir request, but not at session's msize.
> So a bad client could send a T_readdir request with a "count" parameter that's 
> substantially higher than session's msize, which would lead to that mentioned 
> transport error ATM. Hence I suggested this patch here to address it.
> 
> You can easily reproduce this issue:
> 
> 1. Omit this patch 2 (since it would fix it).
> 
> 2. Apply patch 3 and patch 4 of this patch set, which assemble a T_readdir
>    test case combined, then stop patches here (i.e. don't apply subsequent 
>    patches of this patch set, since e.g. patch 6 would increase test client's 
>    msize).
> 
> 3. Set QTEST_V9FS_SYNTH_READDIR_NFILES in hw/9pfs/9p-synth.h to a high number
>    (e.g. several thousands).
> 
> 4. Run the T_readdir test case:
> 
>    cd build
>    make && make tests/qos-test
>    export QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64
>    tests/qos-test -p $(tests/qos-test -l | grep readdir/basic)
> 
> Result: Since the test client's msize is quite small at this point (4kB), test 
> client would transmit a very large "count" parameter with T_readdir request to 
> retrieve all QTEST_V9FS_SYNTH_READDIR_NFILES files, and you'll end up getting 
> the quoted transport error message on server (see precise error message 
> above).
> 
> > > Note: we should probably also check for a minimum size of
> > > msize during T_version to avoid issues and/or too complicated
> > > count/size checks later on in other requests of that client.
> > > T_version should submit an msize that's at least as large as
> > > the largest request's header size.
> > 
> > Do you mean that the server should expose such an msize in the
> > R_version response ? The 9p spec only says that the server must
> > return an msize <= to the one proposed by the client [1]. Not
> > sure we can do more than to emit a warning and/or interrupt the
> > server if the client sends a silly size.
> > 
> > [1] https://9fans.github.io/plan9port/man/man9/version.html
> 
> My idea was to "handle it as an error" immediately when server receives a 
> T_version request with a "msize" argument transmitted by client that would be 
> way too small for anything.
> 
> Because if client sends T_version with msize < P9_IOHDRSZ then it is obvious 
> that this msize would be way too small for handling any subsequent 9p request 
> at all.
> 

P9_IOHDRSZ is 24 bytes, it is definitely not enough to accommodate an
R_getattr message (153 bytes and heavily used by the linux client) for
example, so we would likely need a higher minimum as you're suggesting
later in this mail.

> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > > 
> > >  hw/9pfs/9p.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 520177f40c..30e33b6573 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -2414,6 +2414,7 @@ static void coroutine_fn v9fs_readdir(void *opaque)
> > > 
> > >      int32_t count;
> > >      uint32_t max_count;
> > >      V9fsPDU *pdu = opaque;
> > > 
> > > +    V9fsState *s = pdu->s;
> > > 
> > >      retval = pdu_unmarshal(pdu, offset, "dqd", &fid,
> > >      
> > >                             &initial_offset, &max_count);
> > > 
> > > @@ -2422,6 +2423,13 @@ static void coroutine_fn v9fs_readdir(void *opaque)
> > > 
> > >      }
> > >      trace_v9fs_readdir(pdu->tag, pdu->id, fid, initial_offset,
> > >      max_count);
> > > 
> > > +    if (max_count > s->msize - P9_IOHDRSZ) {
> > > +        max_count = s->msize - P9_IOHDRSZ;
> > 
> > What if s->msize < P9_IOHDRSZ ?
> 
> Exactly, that's why I added that comment to the commit log of this patch for 
> now to make this circumstance clear as yet TODO.
> 
> This issue with T_version and msize needs to be addressed anyway, because it 
> will popup again and again with various other request types and also with 
> transport aspects like previously discussed on a transport buffer size issue 
> (submitters of that transport patch on CC here for that reason):
> https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04701.html
> 
> The required patch to address this overall minimum msize issue would be very 
> small: just comparing client's transmitted "msize" parameter of client's 
> T_version request and if that transmitted msize is smaller than a certain 
> absolute minimum msize then raise an error immediately to prevent the session 
> to start.
> 
> But there are some decisions to be made, that's why I haven't provided a patch 
> for this min. msize issue in this patch series yet:
> 
> 1. What is the minimum msize to be allowed with T_version?
> 
>    P9_IOHDRSZ would be IMO too small, because P9_IOHDRSZ is the size of the 
>    common header portion of all IO requests. So it would rather make sense IMO
>    reviewing the protocol and pick the largest header size among all possible 

Not the largest header size, rather the size of the largest message,
otherwise we may still disconnect. Some response messages contain a
variable size string that the 9p spec forbids to truncate. In the case
of R_readlink for example, this could go up to the largest target size
supported by the host filesystem for symbolic links... ie. likely PATH_MAX.

>    requests supported by 9pfs server ATM. The advantage of this approach would 
>    be that overall code would be easier too maintain, since we don't have to 
>    add minimum msize checks in any (or even all) individual request type 
>    handlers. T_version handler of server would already enforce a minimum msize 
>    and prevent the session if msize too small, and that's it.
> 

Makes sense. Since the linux client already requires msize to be at
least 4096, this could be a reasonable choice: it doesn't break any
existing setups and it allows fairly large strings in messages.

> 2. How to handle that error with T_version exactly?
> 
>    As far as I can see it, it was originally not considered that T_version 
>    might react with an error response at all. The specs are ambiguous about 
>    this topic. All you can find is that if the transmitted protocol version
>    is not supported by server, then server should respond with "unknown" with 
>    its R_version response, but should not respond with R_error in that case.
> 
>    The specs do not prohibit R_error for T_version in general, but I could 
>    imagine that some clients might not expect if we would send R_error. On the 
>    other hand responding with R_version "unknown" would not be appropriate for 
>    this msize error either, because that would mean to the client that the 
>    protocol version was not supported, which is not the case. So it would 
>    leave client uninformed about the actual reason/cause of the error.
> 

Other 9p implementations have minimal msize checks and return an error
message. We could go that way too. The only fishy thing I see, and that
the other implementations seem to ignore, is that the error message format
depends on the protocol version. It is R_error for older 9p2000 and 9p2000.u,
while 9p2000.L uses R_lerror. If the client doesn't understand any of these
protocols, which is very unlikely, it seems reasonable to interrupt the
server.

> 3. Are there any undocumented special msizes, e.g. msize=0 for "don't care" ?
> 
>    Probably not, but you might have seen more client implementations than me.
> 

I'm not aware of special msizes.

> Best regards,
> Christian Schoenebeck
> 
> 

Cheers,

--
Greg

