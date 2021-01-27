Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C36306040
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:54:21 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4n99-0002g8-1s
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4n85-0001z9-LW
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4n82-0002PW-O7
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611762790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fduORtxBi5jliNJE9gz6IyfdJrtnYpHEqxf5Sy2Df94=;
 b=EX/9prdEWsHSTHThm65XzY63LaWFYOwxY/LJTCRXDvXgD4+rjUORNfY+g01aZYubt/ggRt
 Cc+mNlye/i6RjnYfZCEgJZbDJJvcWOfdQ9yUs/L6oYtnz1tq4ApyAHz++6TkoqohcRKAqx
 pk7SKsOFnKC5BDaCbJtsh0dcJeyzBqs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-2TxhcSjEMlKWzHnuy4e9yA-1; Wed, 27 Jan 2021 10:53:08 -0500
X-MC-Unique: 2TxhcSjEMlKWzHnuy4e9yA-1
Received: by mail-qk1-f197.google.com with SMTP id v82so1834316qka.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 07:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fduORtxBi5jliNJE9gz6IyfdJrtnYpHEqxf5Sy2Df94=;
 b=eAlywqIlr+H+SkYR8PqniAwCcjSp7nNwKPJQXEOeFjPaj2pMtZbsvbuqXfb5mjJlkv
 9uiygsvkgSGDYBI2aAPO5MiJ45LLgjfDL70dx6b0qemqH6bHGzH1BXRq1r2P3VKIyOTb
 88C1dHTzZ3Q0PHKWwTUwUa5EnRkKPgDgCO11MuSwHS6C8kt1KQoMW8urFRWgHCTh4nmV
 UFNmt4G50+uFEl3tjARU+4nnzDITaz4bAthWdAvOsHcZSthHCJ1VTylnA6ChDtR9V9+3
 QZ6UgfICPjWyVoUi59A94cFzTIyEG4KYKATiLw25/hxrEKF8Y0dj/RDc1iee6sAcxKxJ
 XT1Q==
X-Gm-Message-State: AOAM532l2OL85GzaV4Yi0hbtRHa4yW4xLQqrBcOLl2O8o1XiqlMhCaTK
 IPgskc/gzwa2TEy3h91R0nyPv+6LjTjb1GtJryuZJQCmyviduaQLu4zvaEMTHG/ssblpQ3HdiZL
 HDDlP0eqwn/MxKqhh3VSM7Q+FywaBFz0=
X-Received: by 2002:ad4:486c:: with SMTP id u12mr8050537qvy.5.1611762787770;
 Wed, 27 Jan 2021 07:53:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz88c/6KakiW5AgOBdlGwHW1Vebz1flYMSaTCtLRx0o8f6ZRjGPd2ACKjh3ibkaqH+PUwSqxR+cyy/DuEjHqpg=
X-Received: by 2002:ad4:486c:: with SMTP id u12mr8050516qvy.5.1611762787558;
 Wed, 27 Jan 2021 07:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
 <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
 <20210127112023.0e97f909@bahia.lan>
 <CAOssrKfezsvcECQ=mO_4T2B09e+2S4LA3=_U6TQyiTtPbE=OYg@mail.gmail.com>
 <20210127144909.22dd778e@bahia.lan>
 <CAOssrKeN9iYT-Z46FVtzdKnWcTLfMqK77b1faf78m3XTXnEVGw@mail.gmail.com>
 <20210127160920.062e47f0@bahia.lan>
 <CAOssrKc=kSQQLmrAR2VrKfDzkyNDEAAa5qusK1x6+-fCM4+yCA@mail.gmail.com>
 <20210127163524.4e34596d@bahia.lan>
 <CAOssrKcbymmsVtU=jMMcE=K1T9oC=NmOzt3aSCe27K7TxXF61A@mail.gmail.com>
In-Reply-To: <CAOssrKcbymmsVtU=jMMcE=K1T9oC=NmOzt3aSCe27K7TxXF61A@mail.gmail.com>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 27 Jan 2021 16:52:56 +0100
Message-ID: <CAOssrKfGuDOoJKvia4yLcYy7udYDHHs-EtFeEvjrfKiV9UkLPw@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
To: Greg Kurz <groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 4:47 PM Miklos Szeredi <mszeredi@redhat.com> wrote:
>
> On Wed, Jan 27, 2021 at 4:35 PM Greg Kurz <groug@kaod.org> wrote:
> >
> > On Wed, 27 Jan 2021 16:22:49 +0100
> > Miklos Szeredi <mszeredi@redhat.com> wrote:
> >
> > > On Wed, Jan 27, 2021 at 4:09 PM Greg Kurz <groug@kaod.org> wrote:
> > > >
> > > > On Wed, 27 Jan 2021 15:09:50 +0100
> > > > Miklos Szeredi <mszeredi@redhat.com> wrote:
> > > > > The semantics of O_CREATE are that it can fail neither because the
> > > > > file exists nor because it doesn't.  This doesn't matter if the
> > > > > exported tree is not modified outside of a single guest, because of
> > > > > locking provided by the guest kernel.
> > > > >
> > > >
> > > > Wrong. O_CREAT can legitimately fail with ENOENT if one element
> > >
> > > Let me make my  statement more precise:
> > >
> > > O_CREAT cannot fail with ENOENT if parent directory exists throughout
> > > the operation.
> > >
> >
> > True, but I still don't see what guarantees guest userspace that the
> > parent directory doesn't go away... I must have missed something.
> > Please elaborate.
>
> Generally there's no guarantee, however there can be certain
> situations where the caller can indeed rely on the existence of the
> parent (e.g. /tmp).

Example from the virtiofs repo:

https://gitlab.com/virtio-fs/ireg/-/blob/master/ireg.c#L315
https://gitlab.com/virtio-fs/ireg/-/blob/master/ireg.c#L382

In that case breaking O_CREAT would be harmless, since no two
instances are allowed anyway, so it would just give a confusing error.
But it is breakage and it probably wouldn't be hard to find much worse
breakage in real life applications.

Thanks,
Miklos


