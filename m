Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BC5B3141
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:01:53 +0200 (CEST)
Received: from localhost ([::1]:48454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWYxU-0002AM-53
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oWYu7-0000Ts-Vc
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 03:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oWYu4-0001PE-Fk
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 03:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662710297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBWILuiOSyWB2Rl3xi/3av0+6jtT1gicHEEcCPYHL0E=;
 b=XspHntnk2ymB69YDK5hUD/cwDz7OWe96VugVdaBoUJIi4yuXDw+fcaMW/zUSvyqmgRil6+
 yZ8Ft117u0gY1ZZb6JkR3hMESh1jXgkDpldekaGtVTYwBovXL1JLMHubR7vUoDb9ihuE8/
 YgRHygGyHbcYJKiHHLCpNcucvTnr1Nw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-kAiWD3pIPs6SIns5D4pv3g-1; Fri, 09 Sep 2022 03:58:16 -0400
X-MC-Unique: kAiWD3pIPs6SIns5D4pv3g-1
Received: by mail-qt1-f200.google.com with SMTP id
 h19-20020ac85493000000b00343408bd8e5so914085qtq.4
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 00:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FBWILuiOSyWB2Rl3xi/3av0+6jtT1gicHEEcCPYHL0E=;
 b=BxmEJmIlRZHGfPUpSjIATcC3KIjHX7L8uFK371Ca4mz6yIECv9MNVXWd+pK7jI48FZ
 tHKxMrgW5d5qgmk57rBZF0Lz/zhCqur69OtqNhx+KDop4THBhdVaFfzZtldUqGiUn7jO
 6oNhWUL1enkndQtSpTJpfbpEqLGKUdG/NuCjFXasR+ufkR3OaBCwWbetZTMp+pALlGta
 5Ln1Mzb7eBiigvKGHcKrdzaw5A8HTRgdTVH4iIT2KtZ2LRCtj+voEVD/Tup8WQu2Do0f
 I0PdHnTXVn5oRweVV24ARPBRNq+HQ1il/n4k1jPiRE6lO/zC4gpCp4oATW1t2fl1xKRC
 NCow==
X-Gm-Message-State: ACgBeo0abzyV7MCURcrQbNNATthXgq2ms8tIGnpHGIEBghYYop5pRBBe
 kbNo1NzMaCQPAlVlfp05tdJYD4pDd+5rSj0S0UTwKayiODdq/2DfZakp5CGRnerdc6MAWzp77S3
 gxtv4ZkcI3xhOKQ4nneg4F7gbbqeKFpo=
X-Received: by 2002:a05:620a:2a0d:b0:6b9:9976:1bf3 with SMTP id
 o13-20020a05620a2a0d00b006b999761bf3mr8934694qkp.255.1662710296076; 
 Fri, 09 Sep 2022 00:58:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4qJm4sQbw3l+AJurUy5RZufrM2IL8poX8UlX+NAKVAp3U7MNxxDk/6Xl9/MX99pYx8+R9vg0hhr1qtWf0xrrw=
X-Received: by 2002:a05:620a:2a0d:b0:6b9:9976:1bf3 with SMTP id
 o13-20020a05620a2a0d00b006b999761bf3mr8934674qkp.255.1662710295887; Fri, 09
 Sep 2022 00:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-4-eperezma@redhat.com>
 <CACGkMEtXzZPtJ6iQZAdXk1YH4s62gZBhWtFYXv972kwECg2_1A@mail.gmail.com>
In-Reply-To: <CACGkMEtXzZPtJ6iQZAdXk1YH4s62gZBhWtFYXv972kwECg2_1A@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 9 Sep 2022 09:57:39 +0200
Message-ID: <CAJaqyWfkaAZzKWT=T=arFVvGoFkm2saxpdL8NSDRhG+eQQB8og@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa: Support VLAN on nic control shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 9, 2022 at 8:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Update the virtio-net device model with each guest's update of vlan
> > through control virtqueue, and accept creating a SVQ with a device
> > exposing vlan feature bit.
> >
> > Done in the same commit since a malicious guest could send vlan
> > commands otherwise.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index ecbfd08eb9..40f7c60399 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -94,6 +94,7 @@ static const uint64_t vdpa_svq_device_features =3D
> >      BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
> >      BIT_ULL(VIRTIO_NET_F_STATUS) |
> >      BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
> > +    BIT_ULL(VIRTIO_NET_F_CTRL_VLAN) |
> >      BIT_ULL(VIRTIO_NET_F_MQ) |
> >      BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
> >      BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> > @@ -538,6 +539,16 @@ static bool vhost_vdpa_net_cvq_validate_cmd(const =
void *out_buf, size_t len)
> >                            __func__, ctrl.cmd);
> >          };
> >          break;
> > +    case VIRTIO_NET_CTRL_VLAN:
> > +        switch (ctrl->cmd) {

Rebase mistake by my side: This must be ctrl.cmd.

> > +        case VIRTIO_NET_CTRL_VLAN_ADD:
> > +        case VIRTIO_NET_CTRL_VLAN_DEL:
> > +            return true;
> > +        default:
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid vlan cmd %u\n"=
,
> > +                          __func__, ctrl->cmd);

Same here (s/ctrl->cmd/ctrl.cmd/).


> > +        };
>
> Considering we may add more features here, is it still worthwhile to
> keep a whitelist like this?
>

I guess we can remove it, let me test without it.

Thanks!

> Thanks
>
> > +        break;
> >      default:
> >          qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n=
",
> >                        __func__, ctrl.class);
> > --
> > 2.31.1
> >
>


