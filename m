Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3996059A3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 10:24:10 +0200 (CEST)
Received: from localhost ([::1]:49360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQqX-0003wi-Gq
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:24:09 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQqX-0003cs-9A
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olPYE-0002NA-G3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 03:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olPY5-0005v4-DX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 03:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666249259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vftwg498zBqo+FuGW2qMpXv1UFPD5fAUNJIWBipJhrQ=;
 b=Bso6OsJpp7bu51/VI//DyYBw5+dU1BNmGeuomSA5qckBq828iwq0GYc0M2mUgMJgN1tMsc
 NgLaZqjISX0PXM+b0nDJSyYjtf9OTfKMrSo/TsL5PafNSSZFEmvgebBKPkeL/SXWdwzuCu
 LDeFrI/6i9DyEwRbDYg99PUoizhvG7Y=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-muDN6lDjNgeqvjLK8CpNXw-1; Thu, 20 Oct 2022 03:00:55 -0400
X-MC-Unique: muDN6lDjNgeqvjLK8CpNXw-1
Received: by mail-pf1-f197.google.com with SMTP id
 g3-20020a056a000b8300b00563772d1021so10693749pfj.18
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 00:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vftwg498zBqo+FuGW2qMpXv1UFPD5fAUNJIWBipJhrQ=;
 b=79cFF/8gwjQcDZMuJOrPPpqIaaDkVkgWy19igRUnPjxyWRF2p6SIf/X8aXiS21ABBI
 Pmw62ySTEyznlNH8LUqtpOb34hrc2hhl+TxZI89r6O2nY195TMAp5+fygxtaS9PW2Rnl
 UKL08pM81c1PAB0H8NkeIZCEfatWlv7VV4xIOP0B+bf04QFA1cIVT17j/Y+cv2NCmnHR
 3+ZT57TFVUCu50yvwJ+TegZtKrmLgNlKy+MfgWZoTrckhcfPsLA0swZBmQzZbfUatIjI
 tUDlWnqsagB3DLbg7ZX2MlBKwBTpXiYtYMNJD5kGnGMCz8YTh74ak+B3gIfEqfpT+j7G
 jJWg==
X-Gm-Message-State: ACrzQf2b03DrRn6suyrCs4UxuC68LNPPJk+g1heGe4aLY61J24STKC4o
 e0SO5tL4IFS61h7rs+IX/C+x5msL7Po+emIEg67TMqAqr50YzlU4DrSDEteCSl+uZFJ1On3xiyZ
 /hLnvoOmZ++AAMst1WF585nMyKy+G+dw=
X-Received: by 2002:a62:174a:0:b0:563:69ac:562f with SMTP id
 71-20020a62174a000000b0056369ac562fmr12601963pfx.68.1666249254204; 
 Thu, 20 Oct 2022 00:00:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56/ideSrEi0faRPJZxkTIFAEEJ8U58zCKcIa3+1sRLYukkBsAy9N66KXtIy6DuzihR+TSgofLE7JiW0kiApfc=
X-Received: by 2002:a62:174a:0:b0:563:69ac:562f with SMTP id
 71-20020a62174a000000b0056369ac562fmr12601909pfx.68.1666249253673; Thu, 20
 Oct 2022 00:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-7-eperezma@redhat.com>
 <CACGkMEuKCXP2DMQWtPFmLnCKYuyDA8LEFbETU==AM_aRvdVM8g@mail.gmail.com>
In-Reply-To: <CACGkMEuKCXP2DMQWtPFmLnCKYuyDA8LEFbETU==AM_aRvdVM8g@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 20 Oct 2022 09:00:17 +0200
Message-ID: <CAJaqyWfFk_yXTJjsvSpqG2XCJvgP7BqjcVediQL0KSDgN5nZ=A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/8] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 6:35 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Since this capability is emulated by qemu shadowed CVQ cannot forward i=
t
> > to the device.
>
> I wonder what happens for a device that has GUEST_ANNOUNCE support on its=
 own?
>

If SVQ is enabled the feature is always emulated by qemu by this series.

if SVQ is disabled then the device is the one in charge of all of it.

> > Process all that command within qemu.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 3374c21b4d..5fda405a66 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -488,9 +488,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostS=
hadowVirtqueue *svq,
> >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> >                               s->cvq_cmd_out_buffer,
> >                               vhost_vdpa_net_cvq_cmd_len());
> > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(stat=
us));
> > -    if (unlikely(dev_written < 0)) {
> > -        goto out;
> > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_ANNOU=
NCE) {
>
> Interesting, I thought we can do better by forbidding the code that
> goes into vhost-vDPA specific code, everything should be set at
> virtio-net.c level.
>

Do you mean to move the SVQ processing to each handle_output? It's
somehow on the roadmap but I'm not sure if it has more priority than
implementing the different features.

Thanks!


> Thanks
>
> > +        /*
> > +         * Guest announce capability is emulated by qemu, so dont forw=
ard to
> > +         * the device.
> > +         */
> > +        dev_written =3D sizeof(status);
> > +        *s->status =3D VIRTIO_NET_OK;
> > +    } else {
> > +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(=
status));
> > +        if (unlikely(dev_written < 0)) {
> > +            goto out;
> > +        }
> >      }
> >
> >      if (unlikely(dev_written < sizeof(status))) {
> > --
> > 2.31.1
> >
>


