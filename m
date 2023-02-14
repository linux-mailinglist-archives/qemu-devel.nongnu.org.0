Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75636964A1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:25:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvI6-0001Tg-F2; Tue, 14 Feb 2023 08:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pRvI3-0001TQ-W1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pRvI1-00062Q-NJ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676381048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fxGuinnNwlB2jqInTbHcLdkwWsCxpSyG3EZ1qBNa2M=;
 b=iLA6T8a+bMkdROuHvUy8yknOJMtZriNKqUdjXDxZJ5MsU3uPDyZKVnARAVEtzKOabKMqs3
 LGkBNVO2Kl4JTt5NX7FS9ULu4G9onTgfGcfVxuoJosK3cw+EW79DAjPdlvwC0jBDlzVDWU
 eSN+bwW5ZkZEO/oKNU4+j2jb0AIfwtw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-531-_YeNS5KqOOyZZWwG2dRjnw-1; Tue, 14 Feb 2023 08:24:04 -0500
X-MC-Unique: _YeNS5KqOOyZZWwG2dRjnw-1
Received: by mail-ed1-f69.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso9920923edc.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fxGuinnNwlB2jqInTbHcLdkwWsCxpSyG3EZ1qBNa2M=;
 b=OWVk5ZKuVTyFho1YoWgLUrD8+1DqAZgZNVvMGm0CGUpxe6jNbY07gTRIbh5B2B3Tvp
 1Z17+g1RsJaZ5uDu4hOh9jXdVPj6mWDvBQ9ZgYcnnethaUJXrcfbTersW4oy7qJOXcH2
 ERXbw55XV3R83SfLEECrtof0TBk4OhfhjWGMOn9lHwrMbrLPL6/6dh0fk86+uGnj+f28
 tvy1IaYpEeCb5wWPv55qqiKAoyBsBCAKdaIS5ZzUrVhUwsmNfP7ZIF98P1f+fSt5dMyJ
 u+uY87mv4prxpsG6FxNKC6rZrsoPpvGTcY1F5HaMxx1pzXdNlUBAOiT+iyIP8Nc60NW7
 R2Zg==
X-Gm-Message-State: AO0yUKUkw5VqSLmHCe/4peSIHch3bRLt1qNfYSPH2HZbTbz0JmO7TmzK
 Qp39wdMv4K9eCos6GbVFv7Gfert+JjgUz1wH75b5fxCtHIJECh92+AgwypT07GxGXqpDN1dorix
 lOjITpjvoPpQZdbPga7Dr1zWt/9FtEG4=
X-Received: by 2002:a17:906:830d:b0:889:8f1a:a153 with SMTP id
 j13-20020a170906830d00b008898f1aa153mr1241536ejx.15.1676381043200; 
 Tue, 14 Feb 2023 05:24:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8VA4CzHodNF5+rTmc0zrb1avZbZ+WMGEeaBz2a7M0pP9iGWDXEALv8GOSW3+KMLoe02NjroCw3yNCPRsNOtsM=
X-Received: by 2002:a17:906:830d:b0:889:8f1a:a153 with SMTP id
 j13-20020a170906830d00b008898f1aa153mr1241527ejx.15.1676381042995; Tue, 14
 Feb 2023 05:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20230124161159.2182117-1-eperezma@redhat.com>
 <CAJaqyWctGpCZrCYZa0hN60PG+5LA+jFL2C=_k+bahdBhKHBK+Q@mail.gmail.com>
In-Reply-To: <CAJaqyWctGpCZrCYZa0hN60PG+5LA+jFL2C=_k+bahdBhKHBK+Q@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 14 Feb 2023 21:23:23 +0800
Message-ID: <CAPpAL=zWYTaS=ZJ_UkK5HtDaFz7FY0n0XVkWLUqC3LHAk6bABw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: clear guest_announce feature if no cvq backend
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 gautam.dawar@amd.com, 
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QE uses the sim_vdpa device to test this patch and add "ctrl_vq=3Doff"
in the qemu command line. Guest can find this device, there are no any
error messages in guest dmesg, and can migrate successfully.

Tested-by: Lei Yang <leiyang@redhat.com>

Eugenio Perez Martin <eperezma@redhat.com> =E4=BA=8E2023=E5=B9=B42=E6=9C=88=
14=E6=97=A5=E5=91=A8=E4=BA=8C 14:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jan 24, 2023 at 5:32 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Since GUEST_ANNOUNCE is emulated the feature bit could be set without
> > backend support.  This happens in the vDPA case.
> >
> > However, backend vDPA parent may not have CVQ support.  This causes an
> > incoherent feature set, and the driver may refuse to start.  This
> > happens in virtio-net Linux driver.
> >
> > This may be solved differently in the future.  Qemu is able to emulate =
a
> > CVQ just for guest_announce purposes, helping guest to notify the new
> > location with vDPA devices that does not support it.  However, this is
> > left as a TODO as it is way more complex to backport.
> >
> > Tested with vdpa_net_sim, toggling manually VIRTIO_NET_F_CTRL_VQ in the
> > driver and migrating it with x-svq=3Don.
> >
>
> Friendly ping about this patch, as it fell through the cracks if I'm not =
wrong.
>
> Thanks!
>
> > Fixes: 980003debddd ("vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE i=
n vhost-vdpa")
> > Reported-by: Dawar, Gautam <gautam.dawar@amd.com>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/virtio-net.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 3ae909041a..09d5c7a664 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -820,6 +820,21 @@ static uint64_t virtio_net_get_features(VirtIODevi=
ce *vdev, uint64_t features,
> >          features |=3D (1ULL << VIRTIO_NET_F_MTU);
> >      }
> >
> > +    /*
> > +     * Since GUEST_ANNOUNCE is emulated the feature bit could be set w=
ithout
> > +     * enabled. This happens in the vDPA case.
> > +     *
> > +     * Make sure the feature set is not incoherent, as the driver coul=
d refuse
> > +     * to start.
> > +     *
> > +     * TODO: QEMU is able to emulate a CVQ just for guest_announce pur=
poses,
> > +     * helping guest to notify the new location with vDPA devices that=
 does not
> > +     * support it.
> > +     */
> > +    if (!virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_CTRL_=
VQ)) {
> > +        virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
> > +    }
> > +
> >      return features;
> >  }
> >
> > --
> > 2.31.1
> >
> >
>


