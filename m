Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A499433929C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:00:58 +0100 (CET)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkDh-00050K-LG
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKk35-0000Bh-AK
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:49:59 -0500
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:54524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKk33-0003lq-7b
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:49:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id E95CD271E04;
 Fri, 12 Mar 2021 16:49:52 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 16:49:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00445c91745-d321-4795-ae03-4821099f8952,
 691A38DB5CB01A665C0D074ECDE31926393917AC) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 12 Mar 2021 16:49:51 +0100
From: Greg Kurz <groug@kaod.org>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 1/3] virtiofsd: Don't allow empty paths in
 lookup_name()
Message-ID: <20210312164951.3d5b5ab9@bahia.lan>
In-Reply-To: <d2b63edf-8326-a645-659e-67ad04a6db0b@redhat.com>
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-2-groug@kaod.org>
 <d2b63edf-8326-a645-659e-67ad04a6db0b@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 400ecd03-387d-4e4b-8e3b-510736f7654a
X-Ovh-Tracer-Id: 10205156757459409373
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepvhhirhhtihhoqdhfshesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo51.mail-out.ovh.net
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 09:13:36 -0600
Connor Kuehl <ckuehl@redhat.com> wrote:

> On 3/12/21 8:10 AM, Greg Kurz wrote:
> > When passed an empty filename, lookup_name() returns the inode of
> > the parent directory, unless the parent is the root in which case
> > the st_dev doesn't match and lo_find() returns NULL. This is
> > because lookup_name() passes AT_EMPTY_PATH down to fstatat() or
> > statx().
> > 
> > This behavior doesn't quite make sense because users of lookup_name()
> > then pass the name to unlinkat(), renameat() or renameat2(), all of
> > which will always fail on empty names.
> > 
> > Drop AT_EMPTY_PATH from the flags in lookup_name() so that it has
> > the consistent behavior of "returning an existing child inode or
> > NULL" for all directories.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >   tools/virtiofsd/passthrough_ll.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index fc7e1b1e8e2b..27a6c636dcaf 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -1308,8 +1308,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
> >           return NULL;
> >       }
> >   
> > -    res = do_statx(lo, dir->fd, name, &attr,
> > -                   AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> > +    res = do_statx(lo, dir->fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
> >       lo_inode_put(lo, &dir);
> >       if (res == -1) {
> >           return NULL;
> > 
> 
> Should the statx() in lo_do_lookup() have this flag removed as well? I 

This is different.

    newfd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
    if (newfd == -1) {
        goto out_err;
    }

    res = do_statx(lo, newfd, "", &e->attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
                   &mnt_id);
    if (res == -1) {
        goto out_err;
    }

No client originated name is passed to do_statx() in this case. On the
contrary, AT_EMPTY_PATH is provided on purpose since the third argument
is "". The goal here is to get the attributes of the entry newfd points
to.

Same stands for other occurences of AT_EMPTY_PATH with fstatat() in
lo_getattr() and lo_link(), fchownat() in lo_setattr() or do_statx()
again in setup_root().

> don't think its callers will pass in an empty name because:
> 
>    - One of your later patches prevents lo_mknod_symlink() from doing so
>    - lo_create() will fail an earlier call against the host file system 
> (open)
>    - lo_do_readdir() shouldn't be reading empty names because that 
> implies someone was able to pull off making an entry with an empty name
> 
> However, I don't know if there will one day be future callers to 
> lo_do_lookup() that will depend on that flag.
> 
> If the answer to the above is no, then:
> 

It is :)

> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> 

Thanks !

