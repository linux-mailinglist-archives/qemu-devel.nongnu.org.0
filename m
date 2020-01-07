Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E84C132A5D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:46:53 +0100 (CET)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ior4G-0008CN-76
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ioqly-0003i3-0z
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:27:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ioqlw-0002At-Eq
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:27:57 -0500
Received: from 5.mo178.mail-out.ovh.net ([46.105.51.53]:53405)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ioqlw-00029g-8V
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:27:56 -0500
Received: from player774.ha.ovh.net (unknown [10.108.35.103])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id EC9E179C29
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 16:27:53 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id CE7F2E053DBD;
 Tue,  7 Jan 2020 15:27:51 +0000 (UTC)
Date: Tue, 7 Jan 2020 16:27:49 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 4/9] tests/virtio-9p: added readdir test
Message-ID: <20200107162749.60aa0f6e@bahia.lan>
In-Reply-To: <10962452.xo9bJ14PLm@silver>
References: <cover.1576678644.git.qemu_oss@crudebyte.com>
 <a8d6dab2625554d425bd44a4d54d84459f083b18.1576678644.git.qemu_oss@crudebyte.com>
 <20200106182252.58dd6712@bahia.lan> <10962452.xo9bJ14PLm@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11779446303352199488
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehgedgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.51.53
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

On Tue, 07 Jan 2020 13:25:46 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 6. Januar 2020 18:22:52 CET Greg Kurz wrote:
> > > diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
> > > index 06263edb53..48c0eca292 100644
> > > --- a/tests/virtio-9p-test.c
> > > +++ b/tests/virtio-9p-test.c
> > > @@ -68,6 +68,11 @@ static void v9fs_memread(P9Req *req, void *addr, size_t
> > > len)> 
> > >      req->r_off += len;
> > >  
> > >  }
> > > 
> > > +static void v9fs_uint8_read(P9Req *req, uint8_t *val)
> > > +{
> > > +    v9fs_memread(req, val, 1);
> > > +}
> > > +
> > > 
> > >  static void v9fs_uint16_write(P9Req *req, uint16_t val)
> > >  {
> > >  
> > >      uint16_t le_val = cpu_to_le16(val);
> > > 
> > > @@ -101,6 +106,12 @@ static void v9fs_uint32_read(P9Req *req, uint32_t
> > > *val)> 
> > >      le32_to_cpus(val);
> > >  
> > >  }
> > > 
> > > +static void v9fs_uint64_read(P9Req *req, uint64_t *val)
> > > +{
> > > +    v9fs_memread(req, val, 8);
> > > +    le64_to_cpus(val);
> > > +}
> > > +
> > > 
> > >  /* len[2] string[len] */
> > >  static uint16_t v9fs_string_size(const char *string)
> > >  {
> > > 
> > > @@ -191,6 +202,7 @@ static const char *rmessage_name(uint8_t id)
> > > 
> > >          id == P9_RLOPEN ? "RLOPEN" :
> > >          id == P9_RWRITE ? "RWRITE" :
> > > 
> > >          id == P9_RFLUSH ? "RFLUSH" :
> > > +        id == P9_RREADDIR ? "READDIR" :
> > >          "<unknown>";
> > >  
> > >  }
> > > 
> > > @@ -348,6 +360,79 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid,
> > > v9fs_qid **wqid)> 
> > >      v9fs_req_free(req);
> > >  
> > >  }
> > > 
> > > +/* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
> > > +static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t
> > > offset,
> > > +                            uint32_t count, uint16_t tag)
> > > +{
> > > +    P9Req *req;
> > > +
> > > +    req = v9fs_req_init(v9p, 4 + 8 + 4, P9_TREADDIR, tag);
> > > +    v9fs_uint32_write(req, fid);
> > > +    v9fs_uint64_write(req, offset);
> > > +    v9fs_uint32_write(req, count);
> > > +    v9fs_req_send(req);
> > > +    return req;
> > > +}
> > > +
> > > +struct v9fs_dirent {
> > 
> > The QEMU coding style calls for a CamelCase typedef,
> > 
> > ie.
> > 
> > typedef struct V9fsDirent V9fsDirent;
> 
> np
> 
> > > +    v9fs_qid qid;
> > 
> > Yeah... I should have done the same when I introduced this type ;-)
> 
> So I'll probably address your sin with a separate patch then.
> 

Thanks. :)

> > > +static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
> > > +{
> > > +    QVirtio9P *v9p = obj;
> > > +    alloc = t_alloc;
> > > +    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> > > +    uint16_t nqid;
> > > +    v9fs_qid qid;
> > > +    uint32_t count, nentries;
> > > +    struct v9fs_dirent *entries = NULL;
> > > +    P9Req *req;
> > > +
> > > +    fs_attach(v9p, NULL, t_alloc);
> > > +    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> > > +    v9fs_req_wait_for_reply(req, NULL);
> > > +    v9fs_rwalk(req, &nqid, NULL);
> > > +    g_assert_cmpint(nqid, ==, 1);
> > > +
> > > +    req = v9fs_tlopen(v9p, 1, O_DIRECTORY, 0);
> > > +    v9fs_req_wait_for_reply(req, NULL);
> > > +    v9fs_rlopen(req, &qid, NULL);
> > > +
> > > +    req = v9fs_treaddir(v9p, 1, 0, P9_MAX_SIZE - P9_IOHDRSZ, 0);
> > > +    v9fs_req_wait_for_reply(req, NULL);
> > > +    v9fs_rreaddir(req, &count, &nentries, &entries);
> > > +
> > > +    /*
> > > +     * Assuming msize (P9_MAX_SIZE) is large enough so we can retrieve
> > > all
> > > +     * dir entries with only one readdir request.
> > > +     */
> > > +    g_assert_cmpint(
> > > +        nentries, ==,
> > > +        QTEST_V9FS_SYNTH_READDIR_NFILES + 2 /* "." and ".." */
> > > +    );
> > 
> > What about coming up with a version of this test that loops until
> > it could read all the entries instead of this assumption ?
> 
> Yes, I had this planned a bit later though. And not as a replacement for this 
> one, but rather as a subsequent advanced readdir test. Because it makes sense 
> to cover both cases: readdir a large amount of entries with a single request, 
> but also splitted down by several readdir requests as subsequent, separate 
> test.
> 

Works for me.

> Best regards,
> Christian Schoenebeck
> 
> 


