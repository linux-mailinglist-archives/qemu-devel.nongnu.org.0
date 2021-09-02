Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246F63FEA6C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:09:04 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhmR-0005Ab-7x
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLhlY-0004Aj-Vy
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLhlX-0005iG-6A
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630570086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUAdxWWaN4ZQ5aQAzg/H/AAM1eV13hA7VWMDQwIRNbg=;
 b=ejrnmqwAPSt867DXEZeberWV9O1xrlB57LyzatW9NvCy+z/rMTamuAOiLLbj3c0aWdNIXn
 F7j/ccYEa3I+JkzvLlRnxdyX9EPMV+yCLP2VKMCJUQE2QNNhPaUflUfLcQFuzqdXTp/oOV
 IxTwObSWqtO00Ij56B2lW2sdHVMEGFQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-ZKKQqOBYMMm_3lRKkqquAw-1; Thu, 02 Sep 2021 04:08:05 -0400
X-MC-Unique: ZKKQqOBYMMm_3lRKkqquAw-1
Received: by mail-lf1-f71.google.com with SMTP id
 d2-20020ac25442000000b003e52a038afaso513667lfn.10
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 01:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QUAdxWWaN4ZQ5aQAzg/H/AAM1eV13hA7VWMDQwIRNbg=;
 b=UYnZjcdCdIbO/w0VMN9JMgVB5S4IwXePHNZIJYmH7u+FEme4w0f0Uooi9gO8LVbkeH
 UB4PWTyz3JPyeEeCd00jQSm5C91a11kef2RGkO3B9LoyWrTq/l2KXtf+g3innaa48YYN
 zW9anfGIvghtUHBFApqowT3hD66xbK4y2ScK8bK3zogAFzK4ighcns1+e9dGtz2OA/qD
 D/1IVdxjQ4K9MZ3XBvAjJpgkLrOUO1GXJ71D6k0BS4qpRy+4VvDj+t4TvRhDvwq5Yh5U
 e71RQ+fPb+5pq7LeMt3t6Nszx91IH7wIacKCXR5Nuds5l3DvMWyS3NY9K3863DsS6KOF
 ju0Q==
X-Gm-Message-State: AOAM53320vh7+TjW3dfJfW1+zENRX+3qSK2XvVjjrW4VH6lRrn7a6LqO
 O8AaLwTlh1vB3NZuTqeTsA6zUy4Df1Tb1eSPGwgbXPhKFQxGy1HQ+IYlslpSQlsxG9+iuN6rQsy
 RObrpcJ4a+6hx8bFt3r25SFwsrnN3qn0=
X-Received: by 2002:a05:6512:128b:: with SMTP id
 u11mr1746416lfs.384.1630570082625; 
 Thu, 02 Sep 2021 01:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9HDNmapc6ZZf7qv0IeMFpASfBGs7xsR+nDazNJmgtDh820gv8mM3vhCvD6Y/ZMUjsu6yFnBYfOIeBWWdhY8U=
X-Received: by 2002:a05:6512:128b:: with SMTP id
 u11mr1746383lfs.384.1630570082149; 
 Thu, 02 Sep 2021 01:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com> <YS6RFcQnZEhE8XpG@t490s>
 <YS8/cxTtiC7QIxTD@redhat.com>
 <YS+dxUBrhogJQkEY@t490s> <517ed9ad-7e80-098c-52b4-566c6644df31@redhat.com>
In-Reply-To: <517ed9ad-7e80-098c-52b4-566c6644df31@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 05:08:13 -0300
Message-ID: <CAJ6HWG6952K6GefMvGvNteLDv_iJQboQfxFBjKEUbJ6VJv=O8A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for contributing Jason!

On Thu, Sep 2, 2021 at 4:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/9/1 =E4=B8=8B=E5=8D=8811:35, Peter Xu =E5=86=99=E9=81=93:
> > On Wed, Sep 01, 2021 at 09:53:07AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> >> On Tue, Aug 31, 2021 at 04:29:09PM -0400, Peter Xu wrote:
> >>> On Tue, Aug 31, 2021 at 02:16:42PM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> >>>> On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> >>>>> Call qio_channel_set_zerocopy(true) in the start of every multifd t=
hread.
> >>>>>
> >>>>> Change the send_write() interface of multifd, allowing it to pass d=
own
> >>>>> flags for qio_channel_write*().
> >>>>>
> >>>>> Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping=
 the
> >>>>> other data being sent at the default copying approach.
> >>>>>
> >>>>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> >>>>> ---
> >>>>>   migration/multifd-zlib.c | 7 ++++---
> >>>>>   migration/multifd-zstd.c | 7 ++++---
> >>>>>   migration/multifd.c      | 9 ++++++---
> >>>>>   migration/multifd.h      | 3 ++-
> >>>>>   4 files changed, 16 insertions(+), 10 deletions(-)
> >>>>> @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> >>>>>               }
> >>>>>
> >>>>>               if (used) {
> >>>>> -                ret =3D multifd_send_state->ops->send_write(p, use=
d, &local_err);
> >>>>> +                ret =3D multifd_send_state->ops->send_write(p, use=
d, MSG_ZEROCOPY,
> >>>>> +                                                          &local_e=
rr);
> >>>> I don't think it is valid to unconditionally enable this feature due=
 to the
> >>>> resource usage implications
> >>>>
> >>>> https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> >>>>
> >>>>    "A zerocopy failure will return -1 with errno ENOBUFS. This happe=
ns
> >>>>     if the socket option was not set, the socket exceeds its optmem
> >>>>     limit or the user exceeds its ulimit on locked pages."
> >>>>
> >>>> The limit on locked pages is something that looks very likely to be
> >>>> exceeded unless you happen to be running a QEMU config that already
> >>>> implies locked memory (eg PCI assignment)
> >>> Yes it would be great to be a migration capability in parallel to mul=
tifd. At
> >>> initial phase if it's easy to be implemented on multi-fd only, we can=
 add a
> >>> dependency between the caps.  In the future we can remove that depend=
ency when
> >>> the code is ready to go without multifd.  Thanks,
> >> Also, I'm wondering how zerocopy support interacts with kernel support
> >> for kTLS and multipath-TCP, both of which we want to be able to use
> >> with migration.
> > Copying Jason Wang for net implications between these features on kerne=
l side
>
>
> Note that the MSG_ZEROCOPY is contributed by Google :)
>
>
> > and whether they can be enabled together (MSG_ZEROCOPY, mptcp, kTLS).
>
>
> I think they can. Anyway kernel can choose to do datacopy when necessary.
>
> Note that the "zerocopy" is probably not correct here. What's better is
> "Enable MSG_ZEROCOPY" since:
>
> 1) kernel supports various kinds of zerocopy, for TX, it has supported
> sendfile() for many years.
> 2) MSG_ZEROCOPY is only used for TX but not RX
> 3) TCP rx zerocopy is only supported via mmap() which requires some
> extra configurations e.g 4K MTU, driver support for header split etc.

RX would be my next challenge :)

>
> [1] https://www.youtube.com/watch?v=3D_ZfiQGWFvg0

Thank you for sharing!

Best regards,
Leonardo


