Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3844299A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:36:31 +0100 (CET)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpHS-000818-Iu
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpFm-0006Yn-NM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpFk-0007Ij-Sd
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635842084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lq6Y6OGXqitUDAht4VPFaHK8F18ncGkeK96swZmf/oQ=;
 b=CF2R3xecbq5XVH4gKR9sKb2bXdT68RWgvy1VODzesYqEnGCFmB3y21gMOOuEhl8t8BrqsC
 CoO9/jDm2g4ja5Nj74Bq+eLoEpyk7ikP52g4jjC2P4x1c31nZHQ26wJkoSrqxOmGyTQPnO
 4BKJAYH5YlDVR0o0v0/GaBnLYqTtjyY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-g8C7PU0VPCK-uIVBXkKXUA-1; Tue, 02 Nov 2021 04:34:41 -0400
X-MC-Unique: g8C7PU0VPCK-uIVBXkKXUA-1
Received: by mail-qv1-f71.google.com with SMTP id
 p7-20020a05621421e700b003a31e1b87e4so8960375qvj.21
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lq6Y6OGXqitUDAht4VPFaHK8F18ncGkeK96swZmf/oQ=;
 b=3EB0KDp/2UnmvCGsQLdETLfVwW/yierqIF0VwI77WDWT3/o9eqVn41SIy74b9+zbbp
 9EzDub1xu8YSEeyA2PeLnRq1uUXJtOeOL3xH3V7kdAnswSFYBRP3Wq1ktXlIP6ew96AM
 3wn6Sy2B520CUhb1BZ9gzCbCimAl8j4RiWXnU4y0aqluWyCoJ1RnrIAUaVN1boZ5mzUO
 yeBStlp0BR2ZN0bNmW2SPLjhWkkSqze69OA+iul+84B4RA4lXn0x1y4aAKizyQJLTMqo
 OQznZRLbjkhDKkws6whGWXFxIUT2uV3GnC5y0V94h0w/KjfeR6BB0UhIgUWvXraDWdUD
 xabg==
X-Gm-Message-State: AOAM530ntzzz4Blv9FMExwrbCm+T0AkZW1DMEHC3lqtiVWOTOmHzzdX8
 WTvRUgwLzEZguNjZ90erlKr0xhfmCPvePaIYV4iJcjPsovVT+gVHaQcgzInO2jJegcC0SFborqX
 mNiVMko6o8wFdH5I2w1nJv9TSedok+7g=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr37461979qte.76.1635842081030; 
 Tue, 02 Nov 2021 01:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCcrYlqJ5n7NeRqBWwBEO7q8BjuwWiM5cwT4Ax4mIOgbIYzdJi8tKds9wheRV2XAn5O5OSDo6vX1R35K73XBY=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr37461952qte.76.1635842080865; 
 Tue, 02 Nov 2021 01:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-3-eperezma@redhat.com>
 <87a6inow7s.fsf@secure.mitica>
In-Reply-To: <87a6inow7s.fsf@secure.mitica>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 09:34:05 +0100
Message-ID: <CAJaqyWeEza4L_zzedbpu3oSm8L=ycjBCRe6g0ctexX9CQA0jBg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 02/26] vhost: Fix last queue index of devices with
 no cvq
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 8:25 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> > The -1 assumes that all devices with no cvq have an spare vq allocated
> > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be th=
e
> > case, and the device may have a pair number of queues.
>                                   ^^^^
> even
>
> I know, I know, I am Spanish myself O:-)
>

Ouch! Good catch! :).

> > To fix this, just resort to the lower even number of queues.
>
> I don't understand what you try to achieve here.
>
> > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the
> > virtio device")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/vhost_net.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 0d888f29a6..edf56a597f 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientSta=
te *ncs,
> >      NetClientState *peer;
> >
> >      if (!cvq) {
> > -        last_index -=3D 1;
> > +        last_index &=3D ~1ULL;
> >      }
>
> As far as I can see, that is a nop. last_index is defined as an int.
>
> $ cat kk.c
> #include <stdio.h>
>
> int main(void)
> {
>         int i =3D 7;
>         i &=3D -1ULL;
>         printf("%d\n", i);
>         i =3D 8;
>         i &=3D -1ULL;
>         printf("%d\n", i);
>         i =3D 0;
>         i &=3D -1ULL;
>         printf("%d\n", i);
>         i =3D -2;
>         i &=3D -1ULL;
>         printf("%d\n", i);
>         return 0;
> }
> $ ./kk
> 7
> 8
> 0
> -2
>

(Already answered by MST in another thread, but to be consistent here)
it's actually a ~1ULL :).

I will rewrite the patch message,

Thanks!


