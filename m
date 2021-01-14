Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E62F5A95
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 07:17:06 +0100 (CET)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzvwP-0006Rk-Mu
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 01:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzvuL-0005XC-5Q
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:14:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzvuJ-0004se-Kx
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610604894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3Rl3idycCcN81Gt/N3cUUm+QQRM9KVX4bbfafa07C0=;
 b=VlfNNfMSwbiMeCg8hgFguISZi2rzt2scmOn+Mc1V3fe0ojWHvzfA39BzryN0Bb0EXcqAMH
 iFOJDmzgxtwwGtse/jZbU8J3g6sJ85JdWHAY6MmJNq2GdTWoDbxFCXxHGWzT3CDhVi1VFG
 gfoPkLNIdbDdydQVvxc0KyML32ISnfU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-qeD1ZupjPEqsL6albYkrLQ-1; Thu, 14 Jan 2021 01:14:52 -0500
X-MC-Unique: qeD1ZupjPEqsL6albYkrLQ-1
Received: by mail-pl1-f197.google.com with SMTP id q12so2656408plr.9
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 22:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s3Rl3idycCcN81Gt/N3cUUm+QQRM9KVX4bbfafa07C0=;
 b=h9Yzvm+9Vf8O773sQx4Y8fp+5GRxDzcbrbTkKJT3Kql1Mx1GlueBfbPkjA+88AEpa0
 pLckhKtT2fH58NMEKzeX9/mIeO2rCNCsWVvOHdKNhDDzB22Q9/gTodnZplKXU+vRfjxV
 DxClsqWdl3H6M+dha7DdwFCQLLINvlKKeH4LWb9gCeEj+7dwfrVNnPraQQnM1/2ZHTMj
 J9dXuxYyq7Du0naNGt/q8seyMVZ/WMkom+XuaLCb95mceLTHfT+IF7EYX+766PhzDq/U
 +t7/49vfIV1X8w4W11uLurJGWDfiIfUYXC/demDjh3KpbhQ54qrBxDch4z7ATYbW4xuH
 J+mA==
X-Gm-Message-State: AOAM533DCd2pwctKjRyWVFOWth1YwMxY+KXw9da1N9Xbry95Oe+gD3KJ
 pnNijlpIhP6LlHhMtNyQOECebEDM3n9NeaZVT6suXZsYf1UV5dlDs+KntETbTya6NZTo6jmCG9x
 K4zmUeqed0LrGLnPAB6p/D4doGJbDPgQ=
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr6052387plo.29.1610604891870; 
 Wed, 13 Jan 2021 22:14:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGnh8okXoDvUEwFk4lxwyU0+/6KoJNUrsR5PbaHYfCMDOjvQIVjZFsBGCUbaCdz84JMX592b9N7f2DaBbEQfo=
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr6052367plo.29.1610604891664; Wed, 13 Jan
 2021 22:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20210113154540.24981-1-lulu@redhat.com>
 <86037c3a-f2c5-1667-7e2e-e964735f546f@redhat.com>
In-Reply-To: <86037c3a-f2c5-1667-7e2e-e964735f546f@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 14 Jan 2021 14:14:15 +0800
Message-ID: <CACLfguVeSk+nzrL4EbMJ=kPEC_PTksOETtDPmmn11eh=hF9=2w@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] vhost-vdpa: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 12:36 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/13 =E4=B8=8B=E5=8D=8811:45, Cindy Lu wrote:
> > Add configure interrupt support in vdpa_vhost. qemu will use the irqfd
> > process to support this feature.
> >
> > These code are all tested in vp-vdpa (support configure interrupt)
> > vdpa_sim (not support configure interrupt)
> >
> >
> > Cindy Lu (4):
> >    virtio:add support in configure interrupt
> >    virtio-pci:add support for configure interrupt
>
>
> If possible, I would like to add the MMIO support for this.
>
> One great advantage of vDPA is that it can avoid to expose a PCI device
> for guest.
>
> Thanks
>
Sure, Thanks Jason, I will check this part.
>
> >    vhost_net:enable configure interrupt when vhost_net start
> >    vhost-vdpa:add callback function for configure interrupt
> >
> >   hw/net/vhost_net.c                | 19 ++++++-
> >   hw/virtio/trace-events            |  2 +
> >   hw/virtio/vhost-vdpa.c            | 29 +++++++++-
> >   hw/virtio/virtio-pci.c            | 93 ++++++++++++++++++++++++++++++=
+
> >   hw/virtio/virtio.c                | 25 +++++++++
> >   include/hw/virtio/vhost-backend.h |  4 ++
> >   include/hw/virtio/virtio-bus.h    |  2 +
> >   include/hw/virtio/virtio.h        |  5 ++
> >   8 files changed, 177 insertions(+), 2 deletions(-)
> >
>


