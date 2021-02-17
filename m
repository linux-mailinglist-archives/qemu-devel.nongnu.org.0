Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0DA31DF38
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 19:50:00 +0100 (CET)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCRtf-00046D-CE
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 13:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCRs0-0002wy-5n
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 13:48:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCRrw-0005mM-Rz
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 13:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613587691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/uYlhoX5BpxDMWN3UbR4/bCfHPlx5JsNTJ8MKFxTQI=;
 b=UnKahijWIVCgxsJrGtgw5hx7+aJQRBr8Z9LrQNWxfNHVlO3wfA+xSKotQDXdFkCyUnLAwt
 i1kmX7JBtl93Jxu/tSgUOq2+qAqYEPBXD8yDC87C83oRidFRDzC6wEStuKCr/jYCYZMerQ
 bUZWXWKK2b0S/NbT/GckQcAdZSuPwu8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-_wRxOf-ENbWNhEzFjvBK6Q-1; Wed, 17 Feb 2021 13:48:10 -0500
X-MC-Unique: _wRxOf-ENbWNhEzFjvBK6Q-1
Received: by mail-qv1-f71.google.com with SMTP id p4so10573131qvn.23
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 10:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t/uYlhoX5BpxDMWN3UbR4/bCfHPlx5JsNTJ8MKFxTQI=;
 b=X0ErCrctUNwZu5rNCwa7T6gvc5+k0rfNhi9d1hm/wTHUE1Fz+ufQb6ez8b9XodWKy1
 wf3jO2Skj31O7EjPXu2dm8CwZiTy8Fa1T6VHtiIxYq/rzKg0kJyr+xRQ/awxysa5V1vX
 ZvuZdT86ulDZDPe5LktRq5BDYanEVmVxkcJfQM1+AhE2XuASAksYOZtNKbfh7MnTxvrD
 qbX9w8SiswhrEC2MvCEfAob5eQaCyQ58LmVrJpsQlsGqipgBSm/RaTvkHDpIHk6BRgui
 6Eq8yv+WHHsSOqBNh7Eu93U9yWm9/vn3Lms8GsB1+b3pfVsO/0Oqh/9K/D501UXWDDkl
 7NCw==
X-Gm-Message-State: AOAM5323c06PlAGNwehN60dLMl6Xo6CRqWyeUqwZ2NPgx1Wzn8sSaYRe
 6cDn1hmHwZ2DpQvTCbStkqoWAve/NDcGFsFsesj8PQvJonYzxaCbIE+c1tXadAoTYjLTVlLdeoD
 e2AGkwi8qy+/ssOpYOT7Wg8XgcTKO2kc=
X-Received: by 2002:a37:4a89:: with SMTP id x131mr545523qka.233.1613587689577; 
 Wed, 17 Feb 2021 10:48:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi54WrAFQT19ZJhI+bbJM+TSrB4DgZ9T4ALsMvBU9YEP5OXKyXVPB3L54TaOYyXLIybcwsY7o33gXiaQhfZWI=
X-Received: by 2002:a37:4a89:: with SMTP id x131mr545498qka.233.1613587689401; 
 Wed, 17 Feb 2021 10:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-6-eperezma@redhat.com>
 <20210217152633.GG269203@stefanha-x1.localdomain>
In-Reply-To: <20210217152633.GG269203@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 17 Feb 2021 19:47:33 +0100
Message-ID: <CAJaqyWd2St=CYbOCzqhW5WKktAG5zfzEjEpFuEXRoUU4dk_w0A@mail.gmail.com>
Subject: Re: [RFC v2 5/7] vhost: Add x-vhost-enable-shadow-vq qmp
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 4:26 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Tue, Feb 09, 2021 at 04:37:55PM +0100, Eugenio P=C3=A9rez wrote:
> > diff --git a/qapi/net.json b/qapi/net.json
> > index c31748c87f..a1cdffb0f9 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -77,6 +77,28 @@
> >  ##
> >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> >
> > +##
> > +# @x-vhost-enable-shadow-vq:
> > +#
> > +# Use vhost shadow virtqueue.
>
> Is this command for testing only or do you expect it to be invoked by
> libvirt in production? I think the shadow virtqueue can be an internal
> QEMU feature that is hidden from management tools.
>

I think shadow virtqueue should kick in automatically when live
migration is triggered and the vhost device does not have _F_LOG too.

Maybe something like "prefer shadow vq to vhost logging" could be
exposed, but it is not a thing we have to figure now.

> > +#
> > +# @name: the device name of the virtual network adapter
> > +#
> > +# @enable: true to use he alternate shadow VQ notification path
> > +#
> > +# Returns: Error if failure, or 'no error' for success
> > +#
> > +# Since: 6.0
>
> Is this a generic feature for any vhost or vDPA device? If yes, please
> replace "virtual network adapter" in the doc comment.
>
> Does this only apply to vhost-net devices? If so, please put "vhost-net"
> in the name since there are other non-net vhost devices.

Right, thanks for the catch!

>
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "x-vhost-enable-shadow-vq", "arguments": {"enable": =
true} }
>
> Missing "name" field?

Yes, I will fix the example in future revisions.

Thanks!


