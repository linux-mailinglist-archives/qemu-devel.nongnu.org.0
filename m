Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB464042A7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 03:11:50 +0200 (CEST)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO8bV-0001Zy-Gs
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 21:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mO8a9-0000fq-Kt
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 21:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mO8a6-0000FL-H3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 21:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631149819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mnR6UdWlFsDP7bR1QEVT6MnJGQr/L1FtpzGt9BcPNYA=;
 b=BzQOrvv8VvYAUPfiGfpq5kiaajQLtaLwWFtf2bxD6X0nQw+olNpYv/KJ/huBbcVaJugpFk
 yPCokUixRdLam5Ao2OELHQlENFGB+gTTdLCRX/agTDXDXrINcMQ8ujEv+b52pe2vC7oS10
 Et5BXSkjz2UJyy7r1Kv5Y9tFIvZkjzY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-BMRD9EznO1CYDjxGmftAbA-1; Wed, 08 Sep 2021 21:10:16 -0400
X-MC-Unique: BMRD9EznO1CYDjxGmftAbA-1
Received: by mail-lj1-f198.google.com with SMTP id
 d19-20020a2e8913000000b001c2cf57d9b7so59778lji.16
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 18:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mnR6UdWlFsDP7bR1QEVT6MnJGQr/L1FtpzGt9BcPNYA=;
 b=mntn7zxJeGs/oi//4wF5czJ44DnAX5ObEFfnFWHYo5OyDYBUeHQQ4peGJWKa/+Hx8Y
 0ozyI+N2ED+8U9OYPSMpiak4fP4YKt3o6fO1H3FyZFh+OE4hFuKPgHpRAQylp7aip5Zj
 n1Y6KdSTYE7W5Dtw32MVqJenEo4X4UQIDtiF/Dd3fha/9GpeBtga++e8PHJMZ83B6Brz
 8rZDU8EPQT/gk6o5kS3w8uJlW+n8P1KsGEU1cQGWtvpVcDTGhAoB17pjuXML92AMv02o
 UR61KIX2uW7H4A5O0Rj2nzr0r1vDoq+lSKxFhZxyEVrwGH/w2h73PE7FmzKUNOXZeplD
 5fcA==
X-Gm-Message-State: AOAM531nmvbcFJHsg+t1owxT0qYeMYR8Fx4Tcafvf+pTA0slZgXz0q8h
 wMbfcj2EnnxbkgWBSnsouubOexCOpP9OBrbaIZyvfhfok40eAbI3XUX+/q9NT8sUgIlextiJgkz
 uyVZGKg3RmLjlZVHsUJOff3LrXEJEKAI=
X-Received: by 2002:a2e:a804:: with SMTP id l4mr200172ljq.420.1631149815188;
 Wed, 08 Sep 2021 18:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztFO3HB/a3FoxromalMoPMTQllowjEVjA5ZSyt9v5Gcn6r+DytE2pHALBT7Fut9RPa+aUrFEEWYRvcfXt2eI0=
X-Received: by 2002:a2e:a804:: with SMTP id l4mr200150ljq.420.1631149814784;
 Wed, 08 Sep 2021 18:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTewN8JZLbpL1Gcf@t490s>
 <CACGkMEuH+Ndh3cckaGfsit=uOLQ=gk39xptGm8bhPWWMzxEDJg@mail.gmail.com>
 <YThyDzq+fiBW75Q/@work-vm> <YTjUa5DuqE9RU0ZF@t490s>
In-Reply-To: <YTjUa5DuqE9RU0ZF@t490s>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Sep 2021 09:10:03 +0800
Message-ID: <CACGkMEtvPH0+_d903+x50FcfRVHzLsCuJqkEV63ybR+3iKzJ1g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 8, 2021 at 11:19 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Sep 08, 2021 at 09:19:27AM +0100, Dr. David Alan Gilbert wrote:
> > * Jason Wang (jasowang@redhat.com) wrote:
> > > On Wed, Sep 8, 2021 at 2:32 AM Peter Xu <peterx@redhat.com> wrote:
> > > >
> > > > On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> > > > > > I don't think it is valid to unconditionally enable this feature due to the
> > > > > > resource usage implications
> > > > > >
> > > > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > > > >
> > > > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> > > > > >    if the socket option was not set, the socket exceeds its optmem
> > > > > >    limit or the user exceeds its ulimit on locked pages."
> > > > >
> > > > > You are correct, I unfortunately missed this part in the docs :(
> > > > >
> > > > > > The limit on locked pages is something that looks very likely to be
> > > > > > exceeded unless you happen to be running a QEMU config that already
> > > > > > implies locked memory (eg PCI assignment)
> > > > >
> > > > > Do you mean the limit an user has on locking memory?
> > > > >
> > > > > If so, that makes sense. I remember I needed to set the upper limit of locked
> > > > > memory for the user before using it, or adding a capability to qemu before.
> > > >
> > > > So I'm a bit confused on why MSG_ZEROCOPY requires checking RLIMIT_MEMLOCK.
> > > >
> > > > The thing is IIUC that's accounting for pinned pages only with either mlock()
> > > > (FOLL_MLOCK) or vfio (FOLL_PIN).
> > > >
> > > > I don't really think MSG_ZEROCOPY is doing that at all...  I'm looking at
> > > > __zerocopy_sg_from_iter() -> iov_iter_get_pages().
> > >
> > > It happens probably here:
> > >
> > > E.g
> > >
> > > __ip_append_data()
> > >     msg_zerocopy_realloc()
> > >         mm_account_pinned_pages()
> >
> > When do they get uncounted?  i.e. is it just the data that's in flight
> > that's marked as pinned?
>
> I think so - there's __msg_zerocopy_callback() -> mm_unaccount_pinned_pages()
> correspondingly.  Thanks,

Yes, and actually the memory that could be pinned is limited by the
sndbuf of TCP socket. So we are fine with rlimit (e.g we don't need to
pin all guest pages).

Thanks

>
> --
> Peter Xu
>


