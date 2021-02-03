Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B948030DF0E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:04:26 +0100 (CET)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Kdl-0002ko-Oj
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KcF-0001oZ-HE
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:02:51 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KcB-0004Od-4f
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:02:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AF664822C131;
 Wed,  3 Feb 2021 17:02:43 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 17:02:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0052448f85b-170e-4118-8a9a-9df4accbc9e3,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 17:02:37 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 3/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210203170237.0c98f95f@bahia.lan>
In-Reply-To: <20210203152850.GA3307@redhat.com>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-4-stefanha@redhat.com>
 <20210203152850.GA3307@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f6a91285-5280-4aed-b208-07e8575b047c
X-Ovh-Tracer-Id: 14493428028248267253
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegrlhgvgiesrghlgihurdgtrg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 10:28:50 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Wed, Feb 03, 2021 at 11:37:19AM +0000, Stefan Hajnoczi wrote:
> 
> [..]
> > @@ -1727,36 +1764,38 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> >  
> >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> >  
> > -    fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
> > -                mode);
> > +    /* Try to create a new file but don't open existing files */
> > +    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
> >      err = fd == -1 ? errno : 0;
> > +
> >      lo_restore_cred(&old);
> >  
> > -    if (!err) {
> > -        ssize_t fh;
> > -
> > -        pthread_mutex_lock(&lo->mutex);
> > -        fh = lo_add_fd_mapping(lo, fd);
> > -        pthread_mutex_unlock(&lo->mutex);
> > -        if (fh == -1) {
> > -            close(fd);
> > -            err = ENOMEM;
> > -            goto out;
> > -        }
> > +    /* Ignore the error if file exists and O_EXCL was not given */
> > +    if (err && !(err == EEXIST && !(fi->flags & O_EXCL))) {
> 
> Can this check be simplified to.
>        if (err && (err == EEXIST && (fi->flags & O_EXCL)) {

I guess you meant :

        if (err && (err != EEXIST || fi->flags & O_EXCL) {


>            goto out;
>        }
> > +        goto out;
> > +    }
> 
> 
> Vivek
> 


