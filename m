Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AD37AA53
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:11:46 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgU2z-0000z8-Gv
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1lgU0L-0006VV-L4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1lgU0I-0004EI-Ji
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=49kahAQprPmYeKDXygdVGf4FQORhI+AIe0OnMoT5N28=;
 b=BAQDKNUfk2rtd9aYFFYgAdy8Y3dPtt8UO71ZO8mTo//ai9VwNS/aFwXTR6Vl87I0Ow7K7F
 fElVdhChczTl9A4E49pofLRiV/PsIFOPvKFVNab3W8qrciDGvc5zEsBUfk1t03LvASN9Bl
 fYphKrKBw2Ky6K5krNWUBxVgf3Abzs4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-0t3SqQudOme6Bz9Gi6d3bA-1; Tue, 11 May 2021 11:08:55 -0400
X-MC-Unique: 0t3SqQudOme6Bz9Gi6d3bA-1
Received: by mail-qk1-f198.google.com with SMTP id
 s10-20020a05620a030ab02902e061a1661fso14635565qkm.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49kahAQprPmYeKDXygdVGf4FQORhI+AIe0OnMoT5N28=;
 b=kpoZFyBI0Gtts+N1kuWTjwhw42TV0EpNSHomrCUdgmhPw8/D9AvgDD7Bxq94MOnA+i
 ZsFa9oKC2txb7fz9alvQQ7r0Z2rxLL+XEaFHxvnSvUEDA2WPb9frDkt9OrstRoqY7oEu
 eCoLwY4jnnD3yQtd/MDIJ+SVYy9V8WlYM6KfHEsc1gKgKdFNAqOUIbzPbkZToKJFjco2
 Urp4kFvkChYVrzqDe7T2rJbScCT4tOSXz7nwNVPjJ7+ahqz7bgKLu1JLe7ywfKh5PnLB
 XkCcFyJU6hH/aDihGbiBcOF58+TqK1xt+VEiLFUBkslOOgSngdKvnxNJh8FHmn+vU0TG
 SiDQ==
X-Gm-Message-State: AOAM530WiNPyFDTIw8dnBY5qac4xm40cDryQOAnzEqK6WkZP3Ih3ETRa
 JyFF50Mm1bJpLsB5eNRM1dqHheWmXvfwbkht2r3zcEFe+7F4g/m10CssPxoSapAP1ywoVvZO4B5
 ezks0RLDVG3mmxcYMPTRjym5NOImfexQ=
X-Received: by 2002:a37:a8cb:: with SMTP id
 r194mr29059217qke.349.1620745734483; 
 Tue, 11 May 2021 08:08:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMkx1TTUlss+FHShRAvIazFJyZrxg6Bt6L36IOaHhdOoSUCA7ytQ5Nab8GVEketRaFrW7a2tPwNSbYHK2WIbc=
X-Received: by 2002:a37:a8cb:: with SMTP id
 r194mr29059176qke.349.1620745734136; 
 Tue, 11 May 2021 08:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-4-groug@kaod.org>
 <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
 <20210511125409.GA234533@horse> <20210511144923.GA238488@horse>
In-Reply-To: <20210511144923.GA238488@horse>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Tue, 11 May 2021 17:08:42 +0200
Message-ID: <CAOssrKeSBnDTa3SF0y49ZuoFMJPr1iq6KqzPCkXYmNsRxXP7vQ@mail.gmail.com>
Subject: Re: [Virtio-fs] [for-6.1 v3 3/3] virtiofsd: Add support for
 FUSE_SYNCFS request
To: Vivek Goyal <vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:49 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Tue, May 11, 2021 at 08:54:09AM -0400, Vivek Goyal wrote:
> > On Tue, May 11, 2021 at 02:31:14PM +0200, Miklos Szeredi wrote:
> > > On Mon, May 10, 2021 at 5:55 PM Greg Kurz <groug@kaod.org> wrote:
> > > >
> > > > Honor the expected behavior of syncfs() to synchronously flush all data
> > > > and metadata on linux systems. Simply loop on all known submounts and
> > > > call syncfs() on them.
> > >
> > > Why not pass the submount's root to the server, so it can do just one
> > > targeted syncfs?
> > >
> > > E.g. somehting like this in fuse_sync_fs():
> > >
> > > args.nodeid = get_node_id(sb->s_root->d_inode);
> >
> > Hi Miklos,
> >
> > I think current proposal was due to lack of full understanding on my part.
> > I was assuming we have one super block in client and that's not the case
> > looks like. For every submount, we will have another superblock known
> > to vfs, IIUC. That means when sync() happens, we will receive ->syncfs()
> > for each of those super blocks. And that means file server does not
> > have to keep track of submounts explicitly and it will either receive
> > a single targeted SYNCFS (for the case of syncfs(fd)) or receive
> > multile SYNCFS calls (one for each submount when sync() is called).
>
> Tried sync() with submounts enabled and we are seeing a SYNCFS call
> only for top level super block and not for submounts.
>
> Greg noticed that it probably is due to the fact that iterate_super()
> skips super blocks which don't have SB_BORN flag set.
>
> Only vfs_get_tree() seems to set SB_BORN and for our submounts we
> are not calling vfs_get_tree(), hence SB_BORN is not set. NFS seems
> to call vfs_get_tree() and hence SB_BORN must be set for submounts.
>
> Maybe we need to modify virtio_fs_get_tree() so that it can deal with
> mount as well as submounts and then fuse_dentry_automount() should
> probably call vfs_get_tree() and that should set SB_BORN and hopefully
> sync() will work with it. Greg is planning to give it a try.
>
> Does it sound reasonable.

Just setting SB_BORN sounds much simpler.  What's the disadvantage?

Thanks,
Miklos


