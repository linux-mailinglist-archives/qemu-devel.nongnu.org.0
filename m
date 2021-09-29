Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA241CC51
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:07:49 +0200 (CEST)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVevk-0000nZ-IU
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVeu5-0008Hl-Mu
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVeu3-0007J5-I8
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632942362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubSadoL9lZPv3uFEJrs22Q28MDpYSRqDwW23UoZyeZg=;
 b=bDe3rXCAGDahbuYk/AC0Z7+s9orJ2wTVz7UaaVjLz6I79o3P9zPZNcIB5X9hdAKDcnUu9y
 kUha0XigMInofX+lv7hmnPvPzzjpa0uV3sev6x8YPS29c7A8fO16AZ5GITMM5CvZL6J1m7
 xWiqW5WYRUb6aeZj3dKI8kRWspnYKHo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-mKHsFdTkOT-uESO8N4k_zQ-1; Wed, 29 Sep 2021 15:06:01 -0400
X-MC-Unique: mKHsFdTkOT-uESO8N4k_zQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 m2-20020ac24ac2000000b003f524eae63eso3290443lfp.10
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ubSadoL9lZPv3uFEJrs22Q28MDpYSRqDwW23UoZyeZg=;
 b=5lpTLERGQbBxiAyw6tld4UZergrP2Q3Dy9+6PUCmYyayNN1F5iQpho6pgXFdit9MT9
 sGW2axvuxEcdUWoKi5amLHtC4GLt4vs+RmPUiwPMX5tkULvKqkCGJ590XvNpDFyDt1Js
 cmbwBvLGtQy2DeXBsPFq8pXpUTyeWmiav88jxua8PfvivnK/wcRaffu8BDqWTomoIENE
 YeLgU9Ul60ZiVNGTyhKK3D2wi0QdEFemiYvlejTiGR7XO7ElqcfVa5oxQ2d9HO1Omxde
 ggKRsolRgQt8WBSdxYj90esa+oqYSjB2E3Busj+ooh/oqL9yDQZiKWepqO1aoOQ3Jvwd
 a9mw==
X-Gm-Message-State: AOAM530H+zgOGlyMDacgre6hi9wfD9I1s3yBrSm7b+iLb1YmGnBouJ+b
 rL97bhGSyX0FnPQclEXZ0/+2jQEZcSLkpur7HV+Xnoma5OI8/jziiUaCkk7IMqJ+bBYSLfRajY2
 VwvhWIObUqFRl5ZzKgq/EPA0AP2vV+Ss=
X-Received: by 2002:a2e:b449:: with SMTP id o9mr1602424ljm.472.1632942359898; 
 Wed, 29 Sep 2021 12:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySZdFvGN8NMoax1lKNCK5tZ6HwyBXpfyRw5XIvpspGPe8xD1poguxsB50nAQsdRQtCucsyzs9AwB5WtY/pib8=
X-Received: by 2002:a2e:b449:: with SMTP id o9mr1602395ljm.472.1632942359632; 
 Wed, 29 Sep 2021 12:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-2-leobras@redhat.com>
 <YU4H1HwsiAO3KM6r@redhat.com> <YVOOhSk2QbTpYP2V@t490s>
In-Reply-To: <YVOOhSk2QbTpYP2V@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 29 Sep 2021 16:06:33 -0300
Message-ID: <CAJ6HWG6F9nyJKvS436-NznqEmG_vQ5K=3mxib-5QtkqZ8gqwLQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] QIOChannel: Add io_async_writev & io_async_flush
 callbacks
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter, thanks for reviewing!

On Tue, Sep 28, 2021 at 6:52 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Sep 24, 2021 at 06:16:04PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > > +ssize_t qio_channel_async_writev(QIOChannel *ioc,
> > > +                                 const struct iovec *iov,
> > > +                                 size_t niov,
> > > +                                 int *fds,
> > > +                                 size_t nfds,
> > > +                                 Error **errp);
> >
> > This is missing any flags. We need something like
> >
> >    QIO_CHANNEL_WRITE_FLAG_ZEROCOPY
> >
> > passed in an 'unsigned int flags' parameter. This in
> > turn makes me question whether we should have the
> > common helpers at all, as the api is going to be
> > different for sync vs async.
> >
> > The QIOChannelFeature enum probably ought to be
> > extended with QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY with
> > support for probing whether that's supported or not.
>
> I'm also wondering whether we could just drop the fds/nfds as per my know=
ledge
> SCM_RIGHT is the only user, at the meantime I don't see why an async inte=
rface
> would pass in any fd anyways..  Thanks,

FWIW, I think it's a great idea.
Daniel, what do you think?

>
> --
> Peter Xu
>

Best regards,
Leonardo


