Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ABF305E44
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:29:31 +0100 (CET)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4lp4-0001PN-B7
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4lnI-0000rH-Vg
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:27:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4lnG-0008Mh-Nb
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611757657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MWBkwvpIFtwnbtPE/1H7ETMgKCiA/dkCZreggI4dNQI=;
 b=WQEY9/CRn4gyBNMu3IBpRLHMcndYKcIOVC8qXQkdDcrW26hNO9IfAF/FopxV0KQeCslBMI
 euVz3c9+nI8RhHRa6904sJQn+vM27BMNWqvBHCv+mYGwl+R3p0Rs8cqxypvqkR1uZKHdZE
 MPtZiCxO5B2q+waBAGf1SGl2oJX+AaM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-1a36Bo8zNNKrFEi2x2uiuw-1; Wed, 27 Jan 2021 09:27:35 -0500
X-MC-Unique: 1a36Bo8zNNKrFEi2x2uiuw-1
Received: by mail-qk1-f198.google.com with SMTP id y79so1081713qka.23
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 06:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MWBkwvpIFtwnbtPE/1H7ETMgKCiA/dkCZreggI4dNQI=;
 b=s0U/vmDyWtTbXKP838iBWR9zIs029eowKVpyvFeCdyA7HzvkdtyUnor30JLgm9fFsc
 V8Ns9E45NI5wtcuMNUZ+lkgyGuZQv465UMAJQBzo4oTupNreDVL2wks/i1SVx4/T6fuH
 WcKG4XrrPimkNLf/FgnquK6C37t6t6g9itSFMwX9Cm5D0x+apCIu+cqLisOmVoURO4xw
 A6rky5ygQO9AKLe+I07BG05VAE6udatU/CfXi+XV3snEazJ9VOt+ySfobiKneYm+gonS
 sf1PaT2YdlbT32rLz4lpTp0IXthFBjgXb5tUq4Kxz3m4nOTB3kW7pLILBN2cEZUvfUFI
 hmzA==
X-Gm-Message-State: AOAM531OtvcIXzGer8mOEFqNNiRTVe0GoMlC8BqPDpBxUlNFspNikGmP
 ic9Th6/w3aLdsy4AoYku7Kc6vC7yjY/K3GalPeTtKYcS3YsZJzzs5IsddK6e6nn+Dq9q/RjnIyS
 ZS8V+BEqhfwAdSx+OSbK3Cup4ZR33o7c=
X-Received: by 2002:a05:622a:453:: with SMTP id
 o19mr9988581qtx.344.1611757655061; 
 Wed, 27 Jan 2021 06:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZjzcXD+ElmjgBWMQWQTNfQKjc7udtJ1i0BH5UULVQ2T6uCoeo7RhOcvnTRZJEEoIeYfhORI2dHtoKui6hNDM=
X-Received: by 2002:a05:622a:453:: with SMTP id
 o19mr9988564qtx.344.1611757654850; 
 Wed, 27 Jan 2021 06:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20210127112131.308451-1-stefanha@redhat.com>
 <CAOssrKfY7zDOH3NNbtyARHMCdJJN1tKQJri8ec=igjBf=K6Dog@mail.gmail.com>
 <20210127141430.GA310142@stefanha-x1.localdomain>
In-Reply-To: <20210127141430.GA310142@stefanha-x1.localdomain>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 27 Jan 2021 15:27:23 +0100
Message-ID: <CAOssrKdmpjMG1fVRJBBG7DKy4Fy46HaBz5gHvWZfOTy6FGF+6Q@mail.gmail.com>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 Sergio Lopez Pascual <slp@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Alex Xu <alex@alxu.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 3:14 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, Jan 27, 2021 at 02:01:54PM +0100, Miklos Szeredi wrote:

> > The problem here is there can also be a race between the open and the
> > subsequent lo_do_lookup().
> >
> > At this point it's probably enough to verify that fuse_entry_param
> > refers to the same object as the fh (using fstat and comparing st_dev
> > and st_ino).
>
> Can you describe the race in detail? FUSE_CREATE vs FUSE_OPEN?
> FUSE_CREATE vs FUSE_CREATE?

A race between FUSE_CREATE and external modification:

VIRTIOFSD: lo_create() {
VIRTIOFSD:     fd = open(foo, O_CREAT | O_EXCL)
EXTERNAL:  unlink(foo)
EXTERNAL:  open(foo, O_CREAT)
VIRTIOFSD:     lo_do_lookup() {
VIRTIOFSD:         newfd = open(foo, O_PATH | O_NOFOLLOW)

Nothing serious will happen, but there will be a discrepancy between
the open file and the inode that it references.  I.e.  the following
in the client will yield weird results:

open(foo, O_CREAT) -> fd
sprintf(procname, "/proc/self/fd/%i", fd);
open(procname, O_RDONLY) -> fd2
write(fd, buf, bufsize)
read(fd2, buf, bufsize)

This is probably not a security issue, more of a quality of
implementation issue.

Thanks,
Miklos


