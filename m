Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A73155AD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:13:45 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XWC-0007mu-7Y
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9XUz-0006p8-Qt
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9XUu-0002zz-H0
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612894342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYWlGRsAr7HYmUXa3CSZ6lw+Y4vvVRZ5Jo22TMSc+Mk=;
 b=Sj9jhqojcKVXXr/OQX6eIdiKAU15jZ3GOjDh9h8x8WJlNjW/wMp4/MZsSSqMapx9BfW9cJ
 q7CMqAyzhFLMk7hdgmF0WKWKjSe3f3bz2DOy4F/dPZ5C4TdrP3KiCV4pdXCbcZMWMhzyjq
 JmPtvM8EKOrisSnAYGJjG1f1a71RjNY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-lJKGEk00Prm6E8ROSdRZhw-1; Tue, 09 Feb 2021 13:12:18 -0500
X-MC-Unique: lJKGEk00Prm6E8ROSdRZhw-1
Received: by mail-qv1-f72.google.com with SMTP id j13so13750594qvy.19
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zYWlGRsAr7HYmUXa3CSZ6lw+Y4vvVRZ5Jo22TMSc+Mk=;
 b=iVBN1/F6s1PmRTwBRZsntYFBGomyZbMZ+q0Om1PowbVKrIWIA4yzsabb4lxrj26Bz8
 6ipXLP0eArYU8CVfQYAm0+ridXUwBm/9kZprDEwy0+pU3UbWu4368rNJgni51KboBp8C
 /a69y2WtLDhfx1VJ/I6rdQo/zPvC4OBOJw/lhpWPW9PcYDV9jVDa8aYd/jma6qq3o1+K
 aZwo6Q/wyi/B3ZguxXeyXDLuG/oMmo5+yQyQz8uy9mlBWXG4Mt2bLO+T4+tLN5G2gHe3
 wFesgp6Z3TPoZbAB7QzqFuFx++tQjgDMIxnLikl/IOZKV0FC4Ylrz/0vQ+vthhnu3prl
 jrOA==
X-Gm-Message-State: AOAM531B0iJNQYB3+QyiqnZAQTFRS3RppOgwdRMRK67YFqHjaVkuzTdA
 G/AFp8iQmnB/E4QIEQhKB+IqfDDN5bOjJhmGD1NEu2BemaRx9Y3jtq8PGrSrKY3EJ13yo/nYve0
 Se6BXg9Pc4lJx1x3JVISSTn1LejQRSKg=
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr22864793qkl.131.1612894337971; 
 Tue, 09 Feb 2021 10:12:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS+MSzX3J0pROFe7AhfnUs9liqj3eqyl9AcQ1UZrAUuWRjzRSQNfw6HBzesLUXvNHfB0PiecTiheSd4BX4C4U=
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr22864770qkl.131.1612894337657; 
 Tue, 09 Feb 2021 10:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-2-eperezma@redhat.com>
 <14b2637e-9610-356e-ad18-27a9a8b82508@redhat.com>
In-Reply-To: <14b2637e-9610-356e-ad18-27a9a8b82508@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 Feb 2021 19:11:41 +0100
Message-ID: <CAJaqyWd+NuY3B94HX8J_EzFf4sxeZnFCcw=aXfT-KZ7nfmL6DQ@mail.gmail.com>
Subject: Re: [RFC v2 1/7] vhost: Delete trailing dot in errpr_setg argument
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 9, 2021 at 5:25 PM Eric Blake <eblake@redhat.com> wrote:
>
> On 2/9/21 9:37 AM, Eugenio P=C3=A9rez wrote:
> > As error_setg points
>
> Incomplete sentence?
>
> Missing Signed-off-by.
>

Sorry, I should have paid more attention.

Maybe it is better to send this though qemu-trivial, so it does not
mess with this series?

Thanks!

> > ---
> >  hw/virtio/vhost.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 6e17d631f7..1c5b442081 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -1358,7 +1358,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *=
opaque,
> >      if (hdev->migration_blocker =3D=3D NULL) {
> >          if (!(hdev->features & (0x1ULL << VHOST_F_LOG_ALL))) {
> >              error_setg(&hdev->migration_blocker,
> > -                       "Migration disabled: vhost lacks VHOST_F_LOG_AL=
L feature.");
> > +                       "Migration disabled: vhost lacks VHOST_F_LOG_AL=
L feature");
> >          } else if (vhost_dev_log_is_shared(hdev) && !qemu_memfd_alloc_=
check()) {
> >              error_setg(&hdev->migration_blocker,
> >                         "Migration disabled: failed to allocate shared =
memory");
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>


