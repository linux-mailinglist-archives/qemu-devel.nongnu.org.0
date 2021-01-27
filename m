Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC3305F1E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:10:35 +0100 (CET)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4mSo-0007QX-IQ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l4mRj-00071L-RN
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:09:27 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:52522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l4mRh-0002c0-Qn
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:09:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 99BAB245CA6;
 Wed, 27 Jan 2021 16:09:22 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 27 Jan
 2021 16:09:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0023cc0bb6f-08f3-48d4-8007-e0734a938da1,
 E0AEAA2FFBCC539F7495E66DC8DC75F2C85CA1F9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 27 Jan 2021 16:09:20 +0100
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
Message-ID: <20210127160920.062e47f0@bahia.lan>
In-Reply-To: <CAOssrKeN9iYT-Z46FVtzdKnWcTLfMqK77b1faf78m3XTXnEVGw@mail.gmail.com>
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
 <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
 <20210127112023.0e97f909@bahia.lan>
 <CAOssrKfezsvcECQ=mO_4T2B09e+2S4LA3=_U6TQyiTtPbE=OYg@mail.gmail.com>
 <20210127144909.22dd778e@bahia.lan>
 <CAOssrKeN9iYT-Z46FVtzdKnWcTLfMqK77b1faf78m3XTXnEVGw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c3730c34-148f-4187-9863-fcf78432d6ee
X-Ovh-Tracer-Id: 9377057375258450223
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepvhhgohihrghlsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=groug@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_NONE=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 15:09:50 +0100
Miklos Szeredi <mszeredi@redhat.com> wrote:

> On Wed, Jan 27, 2021 at 2:49 PM Greg Kurz <groug@kaod.org> wrote:
> >
> > On Wed, 27 Jan 2021 11:34:52 +0100
> > Miklos Szeredi <mszeredi@redhat.com> wrote:
> 
> > > Another solution specifically for O_CREAT without O_EXCL would be to
> > > turn it into an exclusive create.
> >
> > Would this added O_EXCL then appear on the client side, e.g. to
> > guest userspace doing fcntl(F_GETFL) ?
> 
> No.  Guest kernel keeps track of open flags.
> 

That was my impression as well as I didn't find a FUSE_GETFL request.
Thanks for confirming that !

> > > If that fails with EEXIST then try
> > > the normal open path (open with O_PATH, fstat, open proc symlink).  If
> >
> > open(O_PATH | O_NOFOLLOW) + fstatat(AT_EMPTY_PATH|AT_SYMLINK_NOFOLLOW)
> > would indeed allow to filter out anything that isn't a directory and
> > to safely open the proc symlink.
> >
> > > that fails with ENOENT, then retry the whole thing a certain number of
> >
> > Indeed someone could have unlinked the file in the meantime, in which
> > case the open(O_PATH | O_NOFOLLOW) would fail, but if it succeeds then
> > we cannot hit ENOENT anymore AFAICT.
> 
> Right.
> 
> > > times.  If it still fails then somebody is definitely messing with us
> > > and we can fail the request with EIO.
> > >
> >
> > Not sure what the retry+timeout is trying to mitigate here... why not
> > returning EIO right away ?
> 
> The semantics of O_CREATE are that it can fail neither because the
> file exists nor because it doesn't.  This doesn't matter if the
> exported tree is not modified outside of a single guest, because of
> locking provided by the guest kernel.
> 

Wrong. O_CREAT can legitimately fail with ENOENT if one element
of the pathname doesn't exist. And even if pathname only has
one element, you can still have O_CREAT to fail the same way
if the path of the parent directory is removed.

cat>enoent.c<<EOF
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	mkdir("foo", 0777);
	chdir("foo");
	rmdir("../foo");
	open("bar", O_CREAT);
}
EOF
make enoent
strace ./enoent

[...]

mkdir("foo", 0777)                      = 0
chdir("foo")                            = 0
rmdir("../foo")                         = 0
openat(AT_FDCWD, "bar", O_RDONLY|O_CREAT, 0117130) = -1 ENOENT (No such file or directory)

> However if we want to support shared access to a tree then O_CREAT
> semantics should work even in the face of races due to external
> modification of the tree.  I.e. following race:
> 

Yeah, handling shared access is where the fun starts :)

> virtiofsd: open(foo, O_CREAT | O_EXCL) -> EEXIST
> other task: unlink(foo)
> virtiofsd: open(foo, O_PATH | O_NOFOLLOW) -> ENOENT
> 
> To properly support the above the O_CREAT | O_EXCL open would need to
> be retried.
> 

But in this case, it seems fine to return ENOENT since
the guest userspace cannot really assume it never happens.

> Thanks,
> Miklos
> 


