Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5613EE47
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 19:08:54 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is9Zd-0006fp-Fc
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 13:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1is9Yp-0006Fq-21
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:08:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1is9Yn-0008Ey-8i
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:08:02 -0500
Received: from 7.mo173.mail-out.ovh.net ([46.105.44.159]:35446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1is9Ym-0008AM-VN
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:08:01 -0500
Received: from player716.ha.ovh.net (unknown [10.109.143.79])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id C068012CB61
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 19:07:51 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 21C86E3CE28F;
 Thu, 16 Jan 2020 18:07:50 +0000 (UTC)
Date: Thu, 16 Jan 2020 19:07:48 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 02/11] 9pfs: require msize >= 4096
Message-ID: <20200116190748.6a656af8@bahia.lan>
In-Reply-To: <2705438.6bQikqVx44@silver>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
 <49ff399635ccfd21858b15417a398df362ff0b90.1578957500.git.qemu_oss@crudebyte.com>
 <20200116141503.32e36561@bahia.lan> <2705438.6bQikqVx44@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11995056135642650944
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdehgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.44.159
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jan 2020 17:16:07 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 16. Januar 2020 14:15:03 CET Greg Kurz wrote:
> > On Mon, 13 Jan 2020 23:21:04 +0100
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > A client establishes a session by sending a Tversion request along with
> > > a 'msize' parameter which client uses to suggest server a maximum
> > > message size ever to be used for communication (for both requests and
> > > replies) between client and server during that session. If client
> > > suggests a 'msize' smaller than 4096 then deny session by server
> > > immediately with an error response (Rlerror for "9P2000.L" clients or
> > > Rerror for "9P2000.u" clients) instead of replying with Rversion.
> > > 
> > > Introduction of a minimum msize is required to prevent issues in
> > > responses to numerous individual request types. For instance with a
> > > msize of < P9_IOHDRSZ no useful operations would be possible at all.
> > 
> > P9_IOHDRSZ is really specific to write/read operations.
> > 
> > /*
> >  * ample room for Twrite/Rread header
> >  * size[4] Tread/Twrite tag[2] fid[4] offset[8] count[4]
> >  */
> > #define P9_IOHDRSZ 24
> > 
> > As you see P9_IOHDRSZ is approximately the size of a Twrite header.
> > Its primary use is to inform the client about the 'count' to use for
> > Twrite/Tread messages (see get_iounit()).
> > 
> > Not sure it helps to mention P9_IOHDRSZ since we're going to choose
> > something much greater. I'd personally drop this sentence.
> 
> The point here was that there must be some kind of absolute minimum msize, 

Then the absolute minimum size is 7, the size of the header part that is
common to all messages:

size[4] Message tag[2]

> even though the protocol specs officially don't mandate one. And if a client 
> choses a msize < P9_IOHDRSZ, what useful actions shall it be able to do? 

I haven't checked but I guess some messages can fit in 24 bytes.

> That's why I mentioned P9_IOHDRSZ just in case somebody might come up later 
> asking to lower that minimum msize value for whatever reason.
> 

That's precisely what I want to avoid. The semantic of P9_IOHDRSZ is
that it is the header size of a Twrite message and as such it is used
to compute the 'iounit' which the guest later uses to compute a
suitable 'count' for Tread/Twrite messages only. It shouldn't be
involved in msize considerations IMHO.

> But np, IMO this sentence makes the fundamental requirement for this patch 
> more clear, but I have no problem dropping this sentence.
> 

Then you can mention 7 has the true minimal size.

> > > Furthermore there are some responses which are not allowed by the 9p
> > > protocol to be truncated like e.g. Rreadlink which may yield up to
> > 
> > No message may be truncated in any way actually. The spec just allows
> > an exception with the string part of Rerror.
> 
> Rreaddir, Rread, Twrite, Rerror can be truncated. So I suggest I'll just 
> change that to s/some/most/ semantically.
> 

I mean truncate with loss of data. Rreaddir can return less than 'count'
but it won't truncate an individual entry. It rewinds to the previous
one and returns its offset for the next Treaddir. Same goes with Rread
and Twrite, we always return a 'count' that can be used by the client
to continue reading or writing.

Rerror is really the only message where we can deliberately drop
data (but we actually don't do that).

> > Maybe just mention that and say we choose 4096 to be able to send
> > big Rreadlink messages.
> 
> That's not the point for this patch. The main purpose is to avoid having to 
> maintain individual error prone minimum msize checks all over the code base.
> If we would allow very small msizes (much smaller than 4096), then we would 
> need to add numerous error handlers all over the code base, each one checking 
> for different values (depending on the specific message type).
> 

I'm not sure what you mean by 'minimum msize checks all over the code base'...
Please provide an example.

> > > a size of PATH_MAX which is usually 4096. Hence this size was chosen
> > > as min. msize for server, which is already the minimum msize of the
> > > Linux kernel's 9pfs client. By forcing a min. msize already at
> > > session start (when handling Tversion) we don't have to check for a
> > > minimum msize on a per request type basis later on during session,
> > > which would be much harder and more error prone to maintain.
> > > 
> > > This is a user visible change which should be documented as such
> > > (i.e. in public QEMU release changelog).
> > 
> > This last sentence isn't informative in the commit message. This
> > kind of indication should be added after the --- below.
> > 
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> 
> np
> 
> > 
> > LGTM
> > 
> > With an updated changelog,
> > 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > 
> > >  hw/9pfs/9p.c | 12 ++++++++++++
> > >  hw/9pfs/9p.h | 11 +++++++++++
> > >  2 files changed, 23 insertions(+)
> > > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 520177f40c..a5fbe821d4 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1363,8 +1363,20 @@ static void coroutine_fn v9fs_version(void *opaque)
> > > 
> > >          s->proto_version = V9FS_PROTO_2000L;
> > >      
> > >      } else {
> > >      
> > >          v9fs_string_sprintf(&version, "unknown");
> > > 
> > > +        /* skip min. msize check, reporting invalid version has priority
> > > */ +        goto marshal;
> > > 
> > >      }
> > > 
> > > +    if (s->msize < P9_MIN_MSIZE) {
> > > +        err = -EMSGSIZE;
> > > +        error_report(
> > > +            "9pfs: Client requested msize < minimum msize ("
> > > +            stringify(P9_MIN_MSIZE) ") supported by this server."
> > > +        );
> > > +        goto out;
> > > +    }
> > > +
> > > 
> > > +marshal:
> > >      err = pdu_marshal(pdu, offset, "ds", s->msize, &version);
> > >      if (err < 0) {
> > >      
> > >          goto out;
> > > 
> > > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > > index 3904f82901..6fffe44f5a 100644
> > > --- a/hw/9pfs/9p.h
> > > +++ b/hw/9pfs/9p.h
> > > @@ -100,6 +100,17 @@ typedef enum P9ProtoVersion {
> > > 
> > >      V9FS_PROTO_2000L = 0x02,
> > >  
> > >  } P9ProtoVersion;
> > > 
> > > +/**
> > > + * @brief Minimum message size supported by this 9pfs server.
> > > + *
> > > + * A client establishes a session by sending a Tversion request along
> > > with a + * 'msize' parameter which suggests the server a maximum message
> > > size ever to be + * used for communication (for both requests and
> > > replies) between client and + * server during that session. If client
> > > suggests a 'msize' smaller than this + * value then session is denied by
> > > server with an error response. + */
> > > +#define P9_MIN_MSIZE    4096
> > > +
> > > 
> > >  #define P9_NOTAG    UINT16_MAX
> > >  #define P9_NOFID    UINT32_MAX
> > >  #define P9_MAXWELEM 16
> 
> Best regards,
> Christian Schoenebeck
> 
> 


