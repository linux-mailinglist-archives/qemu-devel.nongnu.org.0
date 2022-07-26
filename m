Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F95580A81
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:38:32 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCL2-0007KY-1j
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCHL-0004XA-Hn
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCHJ-0007fS-UZ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658810080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJ5xOLHPncxOBj5H7Chl9wJHdrXZujfOPVZRvf0eUQI=;
 b=HpiIiJKWygLfdRDcByAnoLmVmsswE+cUT7VT9cgzBwUE0gIN5yaJrYh3T+SyCIvhlye3Az
 hvX1EoQH/WsO8qdOpHsuSJcj/ZhJ8W8Xfj0L847Yzt6Rh3N4QGegYnXXepcL+kJwJ2jAts
 hFLqVdFNMyByOF7GqY+ewC3mJahGM4s=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-8MhBSL36PpWLUC36QmHe5g-1; Tue, 26 Jul 2022 00:34:39 -0400
X-MC-Unique: 8MhBSL36PpWLUC36QmHe5g-1
Received: by mail-lf1-f69.google.com with SMTP id
 dt17-20020a0565122a9100b0048a878a2a56so1162199lfb.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UJ5xOLHPncxOBj5H7Chl9wJHdrXZujfOPVZRvf0eUQI=;
 b=JWYV9hEejqR/FNG7CHrk/xvtj4tWTkYStI70nkHUpebgFjl8cF0Pzpx1KwqqiNGxEh
 fr4b7DnQYYQCsvknzMoPCxACgg8fUx7rNkF6jEvKvLyUYLX49KX9tB21ZsEiI9KM+gc/
 ca+f0k8hSVTLZcRgCNSRnbf0hia3bWkhwIdRRlFYAi6MtyWyOJeVc1c7GSuIt34cGtxF
 NrXyhLcPxpEw23o+wBYSzcqfuM+6cjMN5J0JhQgn3xKX2Lj52vfzdwoz71Daykgj4kB/
 YQvYUqiVKHq45kgKvRKLNKzjoUnjpG8VE0Ys/sc7jaz+ZeqyLvr81fIuKeBsztHf+53u
 /Ecg==
X-Gm-Message-State: AJIora+ZMP0nuq6M93zqErtzxACEMoZgzkJPwm8nUuzWv19nKfzXa6vq
 8LUvgXnVxkQxJt9KBuQ3r4BTADS0fFTMevGtUwPRSdKRYnkC9QuBhnZ5SpqaqTuzAH3KzW4fETo
 l+2L2o8qclxX+5eVCNb6dVfyMqsF1DQQ=
X-Received: by 2002:a2e:b0c6:0:b0:25e:b20:94b4 with SMTP id
 g6-20020a2eb0c6000000b0025e0b2094b4mr2148219ljl.487.1658810077524; 
 Mon, 25 Jul 2022 21:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1svmOJq71BOQ6IMX3gsyIiMotJNSJ/PN5H2Cr6IM1CH4nVD+goKiQlkonxPHjNyec2Wbd7nwY0Qs3dPyBiDxv0=
X-Received: by 2002:a2e:b0c6:0:b0:25e:b20:94b4 with SMTP id
 g6-20020a2eb0c6000000b0025e0b2094b4mr2148209ljl.487.1658810076965; Mon, 25
 Jul 2022 21:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220722082630.3371384-1-eperezma@redhat.com>
 <CACGkMEu-kmHBbOevmMOcUW9eSk4N2-6_QAS1HTqz0cwduU4jaQ@mail.gmail.com>
In-Reply-To: <CACGkMEu-kmHBbOevmMOcUW9eSk4N2-6_QAS1HTqz0cwduU4jaQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Jul 2022 12:34:25 +0800
Message-ID: <CACGkMEvx4sk0jsHDiVajnxNijn-z=xDfZAmD3yE=ceEfHDvpgg@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Fix memory listener deletions of iova tree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, Jul 25, 2022 at 3:05 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 22, 2022 at 4:26 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > vhost_vdpa_listener_region_del is always deleting the first iova entry
> > of the tree, since it's using the needle iova instead of the result's
> > one.
> >
> > This was detected using a vga virtual device in the VM using vdpa SVQ.
> > It makes some extra memory adding and deleting, so the wrong one was
> > mapped / unmapped. This was undetected before since all the memory was
> > mappend and unmapped totally without that device, but other conditions
> > could trigger it too:
> >
> > * mem_region was with .iova =3D 0, .translated_addr =3D (correct GPA).
> > * iova_tree_find_iova returned right result, but does not update
> >   mem_region.
> > * iova_tree_remove always removed region with .iova =3D 0. Right iova w=
ere
> >   sent to the device.
> > * Next map will fill the first region with .iova =3D 0, causing a mappi=
ng
> >   with the same iova and device complains, if the next action is a map.
> > * Next unmap will cause to try to unmap again iova =3D 0, causing the
> >   device to complain that no region was mapped at iova =3D 0.
> >
> > Fixes: 34e3c94edaef ("vdpa: Add custom IOTLB translations to SVQ")
> > Reported-by: Lei Yang <leiyang@redhat.com>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Acked-by: Jason Wang <jasowang@redhat.com>

I've queued this for hard-freeze.

Thanks

>
> > ---
> >  hw/virtio/vhost-vdpa.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 291cd19054..00e990ea40 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -290,7 +290,7 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >
> >          result =3D vhost_iova_tree_find_iova(v->iova_tree, &mem_region=
);
> >          iova =3D result->iova;
> > -        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> > +        vhost_iova_tree_remove(v->iova_tree, result);
> >      }
> >      vhost_vdpa_iotlb_batch_begin_once(v);
> >      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> > --
> > 2.31.1
> >


