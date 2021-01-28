Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1DB30779B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:04:35 +0100 (CET)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57uU-0003qG-Re
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l57rI-0002ET-9d
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:01:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l57rF-0001Wp-BX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611842472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0tehKjU/ZoqXoOa8uMYMcjxJwziBFN51jmfXQIRhyLY=;
 b=QZELzrdQXFr/+ge+buxBrDZCbVpP6YOVuLSGXRJAI9O7kUfp2/OvyJWHY+rOTdMTogGiRe
 78A6S+OupqL4zsASAPShmitp4CZrfoJMS3ATOBaVOWD3viRXS+XfEhpTR0ZiKWwRkzT6Ue
 hc0qtlqx6er/x8AR03FwPWMqfi6+bFc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-aQQBSe8cO524qNHrGB_YsQ-1; Thu, 28 Jan 2021 09:01:10 -0500
X-MC-Unique: aQQBSe8cO524qNHrGB_YsQ-1
Received: by mail-qv1-f69.google.com with SMTP id j4so3767320qvi.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tehKjU/ZoqXoOa8uMYMcjxJwziBFN51jmfXQIRhyLY=;
 b=DeTl5DIgGTpqor4o7yqBBScUvPnA/y2v13LKsH50fpDRTUgTBom8F4SfadCmq+Tay5
 8L9cDEQPebWz6YN71p6rW5AVGkNVNM3PphFmFstMKW629YL2HUzhGqELYYrSeJkD+rgD
 2t4dpwTpqUih+I7vOFUM6zUuM6IXOPXMjH9+E3mY2DojdK+og4A/ffkOt/KioXt0hiw4
 CwLXQwt7N/VnGs5k6sRhqueMtq/qeHJzTa7AYmc/h5DplFXD6wAV9u+gJed3vZJ89A2e
 rv48FnV7c3baidB9ifMhRJ2EuhqN//Tcgl5NKo0mGm88q3+a/iwyZDZvtF7xhyqSyBmU
 WDwA==
X-Gm-Message-State: AOAM532iVOANEgPc3cIeB/BtQoRdaRXtdJx/rGjxFqh4/oiEQMpN2aA2
 a4BUCjGMRWlp7FmQEcHAJVhfnwXoudQVx0Hl1aZQVadV4tzXY6vRwWFTlpCf+ju/c+AqtVaCCxT
 BqmJ7CWpiXCWy/CKCOfxggI8Xf+T3+3c=
X-Received: by 2002:a37:4e05:: with SMTP id c5mr15497271qkb.349.1611842469611; 
 Thu, 28 Jan 2021 06:01:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQNYjSujkngrM7bjWrZOddeLY9hkV9Xnmg8WWA4V6RCtRbPqr7RwdB6bsjC5IdX1pSmHek//3jJVqE4KIvuxo=
X-Received: by 2002:a37:4e05:: with SMTP id c5mr15497238qkb.349.1611842469323; 
 Thu, 28 Jan 2021 06:01:09 -0800 (PST)
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
 <CAOssrKfGuDOoJKvia4yLcYy7udYDHHs-EtFeEvjrfKiV9UkLPw@mail.gmail.com>
 <20210128131454.2f66ed21@bahia.lan>
In-Reply-To: <20210128131454.2f66ed21@bahia.lan>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Thu, 28 Jan 2021 15:00:58 +0100
Message-ID: <CAOssrKff8FyC0i+Q1MY0paEiXdARp2=vkSnTwNHZxpntyV7oxA@mail.gmail.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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

On Thu, Jan 28, 2021 at 1:15 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Wed, 27 Jan 2021 16:52:56 +0100
> Miklos Szeredi <mszeredi@redhat.com> wrote:
>
> > On Wed, Jan 27, 2021 at 4:47 PM Miklos Szeredi <mszeredi@redhat.com> wrote:
> > >
> > > On Wed, Jan 27, 2021 at 4:35 PM Greg Kurz <groug@kaod.org> wrote:
> > > >
> > > > On Wed, 27 Jan 2021 16:22:49 +0100
> > > > Miklos Szeredi <mszeredi@redhat.com> wrote:
> > > >
> > > > > On Wed, Jan 27, 2021 at 4:09 PM Greg Kurz <groug@kaod.org> wrote:
> > > > > >
> > > > > > On Wed, 27 Jan 2021 15:09:50 +0100
> > > > > > Miklos Szeredi <mszeredi@redhat.com> wrote:
> > > > > > > The semantics of O_CREATE are that it can fail neither because the
> > > > > > > file exists nor because it doesn't.  This doesn't matter if the
> > > > > > > exported tree is not modified outside of a single guest, because of
> > > > > > > locking provided by the guest kernel.
> > > > > > >
> > > > > >
> > > > > > Wrong. O_CREAT can legitimately fail with ENOENT if one element
> > > > >
> > > > > Let me make my  statement more precise:
> > > > >
> > > > > O_CREAT cannot fail with ENOENT if parent directory exists throughout
> > > > > the operation.
> > > > >
> > > >
> > > > True, but I still don't see what guarantees guest userspace that the
> > > > parent directory doesn't go away... I must have missed something.
> > > > Please elaborate.
> > >
> > > Generally there's no guarantee, however there can be certain
> > > situations where the caller can indeed rely on the existence of the
> > > parent (e.g. /tmp).
> >
> > Example from the virtiofs repo:
> >
> > https://gitlab.com/virtio-fs/ireg/-/blob/master/ireg.c#L315
> > https://gitlab.com/virtio-fs/ireg/-/blob/master/ireg.c#L382
> >
> > In that case breaking O_CREAT would be harmless, since no two
> > instances are allowed anyway, so it would just give a confusing error.
> > But it is breakage and it probably wouldn't be hard to find much worse
> > breakage in real life applications.
> >
>
> Ok, I get your point : a guest userspace application can't expect
> to hit ENOENT when doing open("/some_dir/foo", O_CREAT) even if
> someone else is doing unlink("/some_dir/foo"), which is a different
> case than somebody doing rmdir("/some_dir").
>
> But we still have a TOCTOU : the open(O_CREAT|O_EXCL) acts as
> the check to use open(O_PATH) and retry+timeout can't fix it
> reliably.

Right.

> A possible fix for the case where the race comes from the
> client itself would be to serialize FUSE requests that
> create/remove paths in the same directory. I don't know
> enough the code yet to assess if it's doable though.
>
> Then this would leave the case where something else on
> the host is racing with virtiofsd. IMHO this belongs to
> the broader family of "bad things the host can do
> in our back". This requires a bigger hammer than
> adding band-aids here and there IMHO. So in the
> scope of this patch, I don't think we should retry
> and timeout, but just return whatever errno that
> makes sense.

I never suggested a timeout, that would indeed be nonsense.

Just do a simple retry loop with a counter.  I'd set counter to a
small number (5 or whatever), so that basically any accidental races
are cared for, and the only case that would trigger the EIO is if the
file was constantly removed and recreated (and even in that case it
would be pretty difficult to trigger).  This would add only minimal
complexity or overhead.

The proper solution might be adding O_REGULAR, and it actually would
be useful for other O_CREAT users, since it's probably what they want
anyway (but existing semantics can't be changed).

Thanks,
Miklos


