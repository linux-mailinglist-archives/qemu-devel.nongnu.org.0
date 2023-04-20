Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961556E899B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:27:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppMne-0001VV-Jt; Thu, 20 Apr 2023 01:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peili@andrew.cmu.edu>)
 id 1ppMnO-0001V8-AO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:25:26 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peili@andrew.cmu.edu>)
 id 1ppMnK-0000vb-Je
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:25:25 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 k1-20020a4ab281000000b0053e8b5524abso371281ooo.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andrew.cmu.edu; s=google-2021; t=1681968316; x=1684560316;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BeupVaKfG87w+1FDfyJQOdX5xwk9kTFCd4jtzsCs9RU=;
 b=FQKi2t+yHM4LlngmBGrSapXvj5sJsdLPJ8q67/QmoDl56i197IoiJDB7rHbb5Y9FVy
 5Jv2A2R1C24d6l6r8qssfISzabirFQZfbISAZ9roKAu5qRUe+AG6wDkFJYWYyXsiisPh
 fmmtIraa+1H2kcqbqnC+lelf421g40nzs2Yo4SWrhuAb4fs9FZFbNnrot0PXMxV65LaJ
 ++8SOuSBt+KjFtTQzDS9oQWExxybWeQOSoYjE6eJLpn4NXS4BRGcNThOHMwCYIsQQXEE
 70j53Pk/NRA9mxp2UCn9sPsWzKM/Y2FdiyGonWwE4W51JblIBnN0s8cFvI/Yr37l2ctb
 PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681968316; x=1684560316;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BeupVaKfG87w+1FDfyJQOdX5xwk9kTFCd4jtzsCs9RU=;
 b=dhg7WU7QZb+3mEVelN1A7nmo3fvHLHRw1SkKHI79zizatx0zqFO1efpUv/afjGtoJG
 rFpoaWYf9K9RTmweZF/w4Dab1y1zRjj8nmw9xPvYLBvur4WwbomTjjwk0rQ2pneJXpkf
 blVWQvNOGrQvy9zpFoW1ar1e5ys26wjzzigEGODA9MaAMs8jIhUK8vEY+6OAXR2x3C4z
 Xl+xu/SgN+8McHoLfgq7fSPOTpqPKO7k3SEVEsiBMVHubAQrBqf7E7Uja/2GxK++77A3
 2QcFAtJ7WiIhOXF2QMxwOuducUln+4+jKQH4TRBjhP67c1g2x94DFzQYnf0glvriTuLb
 c0/Q==
X-Gm-Message-State: AAQBX9e+YkdJGvYbZclkt8mg60c4f49/iF4mfJeosixT0twdkN2tJ07h
 DB5d48jETtoabF0ZIbJuCC7N8oQp6it8PuD2LMX5VA==
X-Google-Smtp-Source: AKy350bo6HMhp8QnZ0KE5kns560VQZCjq/o4R3QP5at1VFibd6mUzmvFSHrIdgN5tiwuZ2MLXuCoP2emV8ZFcpAqOo4=
X-Received: by 2002:a4a:5254:0:b0:545:899b:e9cb with SMTP id
 d81-20020a4a5254000000b00545899be9cbmr271797oob.7.1681968316233; Wed, 19 Apr
 2023 22:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230418225638.1467969-1-peili.dev@gmail.com>
 <CAJaqyWebSowMMWh+HCjj7tmbA3Ey6C69T=SPA4k+6fd_-GjfoA@mail.gmail.com>
 <CACGkMEu0d0y82wo1p2g-ovbUTYJcVon0-t8fvgFQLokZmd7hDQ@mail.gmail.com>
In-Reply-To: <CACGkMEu0d0y82wo1p2g-ovbUTYJcVon0-t8fvgFQLokZmd7hDQ@mail.gmail.com>
From: Pei Li <peili@andrew.cmu.edu>
Date: Wed, 19 Apr 2023 22:25:05 -0700
Message-ID: <CACCFcFr8rYbM3OF8Hk=WnS7mAUv49aTsYHWnMwkMVg8SWRhp+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Reduce vdpa initialization / startup overhead
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, peili.dev@gmail.com,
 qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000003593c05f9bdc4d8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=peili@andrew.cmu.edu; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000003593c05f9bdc4d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

My bad, I just submitted the kernel patch. If we are passing some generic
command, still we have to add an additional field in the structure to
indicate what is the unbatched version of this command, and the struct
vhost_ioctls would be some command specific structure. In summary, the
structure would be something like
struct vhost_cmd_batch {
    int ncmds;
    int cmd;
    struct vhost_ioctls[];
};

This is doable. Also, this is my first time submitting patches to open
source, sorry about the mess in advance. That being said, feel free to
throw questions / comments!

Thanks and best regards,
Pei

On Wed, Apr 19, 2023 at 9:19=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:

> On Wed, Apr 19, 2023 at 11:33=E2=80=AFPM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Wed, Apr 19, 2023 at 12:56=E2=80=AFAM <peili.dev@gmail.com> wrote:
> > >
> > > From: Pei Li <peili.dev@gmail.com>
> > >
> > > Currently, part of the vdpa initialization / startup process
> > > needs to trigger many ioctls per vq, which is very inefficient
> > > and causing unnecessary context switch between user mode and
> > > kernel mode.
> > >
> > > This patch creates an additional ioctl() command, namely
> > > VHOST_VDPA_GET_VRING_GROUP_BATCH, that will batching
> > > commands of VHOST_VDPA_GET_VRING_GROUP into a single
> > > ioctl() call.
>
> I'd expect there's a kernel patch but I didn't see that?
>
> If we want to go this way. Why simply have a more generic way, that is
> introducing something like:
>
> VHOST_CMD_BATCH which did something like
>
> struct vhost_cmd_batch {
>     int ncmds;
>     struct vhost_ioctls[];
> };
>
> Then you can batch other ioctls other than GET_VRING_GROUP?
>
> Thanks
>
> > >
> >
> > It seems to me you forgot to send the 0/2 cover letter :).
> >
> > Please include the time we save thanks to avoiding the repetitive
> > ioctls in each patch.
> >
> > CCing Jason and Michael.
> >
> > > Signed-off-by: Pei Li <peili.dev@gmail.com>
> > > ---
> > >  hw/virtio/vhost-vdpa.c                       | 31 +++++++++++++++---=
--
> > >  include/standard-headers/linux/vhost_types.h |  3 ++
> > >  linux-headers/linux/vhost.h                  |  7 +++++
> > >  3 files changed, 33 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index bc6bad23d5..6d45ff8539 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -679,7 +679,8 @@ static int vhost_vdpa_set_backend_cap(struct
> vhost_dev *dev)
> > >      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> > >          0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> > >          0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
> > > -        0x1ULL << VHOST_BACKEND_F_SUSPEND;
> > > +        0x1ULL << VHOST_BACKEND_F_SUSPEND |
> > > +        0x1ULL << VHOST_BACKEND_F_IOCTL_BATCH;
> > >      int r;
> > >
> > >      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features))=
 {
> > > @@ -731,14 +732,28 @@ static int vhost_vdpa_get_vq_index(struct
> vhost_dev *dev, int idx)
> > >
> > >  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> > >  {
> > > -    int i;
> > > +    int i, nvqs =3D dev->nvqs;
> > > +    uint64_t backend_features =3D dev->backend_cap;
> > > +
> > >      trace_vhost_vdpa_set_vring_ready(dev);
> > > -    for (i =3D 0; i < dev->nvqs; ++i) {
> > > -        struct vhost_vring_state state =3D {
> > > -            .index =3D dev->vq_index + i,
> > > -            .num =3D 1,
> > > -        };
> > > -        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > > +
> > > +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOCTL_BATCH))) =
{
> > > +        for (i =3D 0; i < nvqs; ++i) {
> > > +            struct vhost_vring_state state =3D {
> > > +                .index =3D dev->vq_index + i,
> > > +                .num =3D 1,
> > > +            };
> > > +            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state=
);
> > > +        }
> > > +    } else {
> > > +        struct vhost_vring_state states[nvqs + 1];
> > > +        states[0].num =3D nvqs;
> > > +        for (i =3D 1; i <=3D nvqs; ++i) {
> > > +            states[i].index =3D dev->vq_index + i - 1;
> > > +            states[i].num =3D 1;
> > > +        }
> > > +
> >
> > I think it's more clear to share the array of vhost_vring_state
> > states[nvqs + 1], and then fill it either in one shot with
> > VHOST_VDPA_SET_VRING_ENABLE_BATCH or individually with
> > VHOST_VDPA_SET_VRING_ENABLE.
> >
> > The same feedback goes for VHOST_VDPA_GET_VRING_GROUP_BATCH in the next
> patch.
> >
> > > +        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE_BATCH,
> &states[0]);
> > >      }
> > >      return 0;
> >
> > This comment is previous to your patch but I just realized we don't
> > check the return value of vhost_vdpa_call. Maybe it is worth
> > considering addressing that in this series too.
> >
> > >  }
> > > diff --git a/include/standard-headers/linux/vhost_types.h
> b/include/standard-headers/linux/vhost_types.h
> > > index c41a73fe36..068d0e1ceb 100644
> > > --- a/include/standard-headers/linux/vhost_types.h
> > > +++ b/include/standard-headers/linux/vhost_types.h
> > > @@ -164,4 +164,7 @@ struct vhost_vdpa_iova_range {
> > >  /* Device can be suspended */
> > >  #define VHOST_BACKEND_F_SUSPEND  0x4
> > >
> > > +/* IOCTL requests can be batched */
> > > +#define VHOST_BACKEND_F_IOCTL_BATCH 0x6
> > > +
> > >  #endif
> > > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.=
h
> > > index f9f115a7c7..4c9ddd0a0e 100644
> > > --- a/linux-headers/linux/vhost.h
> > > +++ b/linux-headers/linux/vhost.h
> > > @@ -180,4 +180,11 @@
> > >   */
> > >  #define VHOST_VDPA_SUSPEND             _IO(VHOST_VIRTIO, 0x7D)
> > >
> > > +/* Batch version of VHOST_VDPA_SET_VRING_ENABLE
> > > + *
> > > + * Enable/disable the ring while batching the commands.
> > > + */
> > > +#define VHOST_VDPA_SET_VRING_ENABLE_BATCH      _IOW(VHOST_VIRTIO,
> 0x7F, \
> > > +                                            struct vhost_vring_state=
)
> > > +
> >
> > These headers should be updated with update-linux-headers.sh. To be
> > done that way we need the changes merged in the kernel before.
> >
> > We can signal that the series is not ready for inclusion with the
> > subject [RFC. PATCH], like [1], and note it in the commit message.
> > That way, you can keep updating the header manually for demonstration
> > purposes.
> >
> > Thanks!
> >
> > [1]
> https://lore.kernel.org/qemu-devel/20220413163206.1958254-23-eperezma@red=
hat.com/
> >
>
>
>

--00000000000003593c05f9bdc4d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0all,<div><br></div><div>My bad, I just submitted t=
he kernel patch. If we are passing some generic command, still we have to a=
dd an additional field in the structure to indicate what is the unbatched v=
ersion of this command, and the struct vhost_ioctls would be some command s=
pecific structure. In summary, the structure would be something like</div><=
div>struct vhost_cmd_batch {<br>=C2=A0 =C2=A0 int ncmds;</div><div>=C2=A0 =
=C2=A0 int cmd;<br>=C2=A0 =C2=A0 struct vhost_ioctls[];<br>};<br></div><div=
><br></div><div>This is doable. Also, this is my first time submitting patc=
hes to open source, sorry about the mess in advance. That being said, feel =
free to throw questions / comments!</div><div><br></div><div>Thanks and bes=
t regards,</div><div>Pei</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Apr 19, 2023 at 9:19=E2=80=AFPM Jason=
 Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Apr 19, 2023 at 11:33=E2=80=AFPM Eugenio Perez Martin<br=
>
&lt;<a href=3D"mailto:eperezma@redhat.com" target=3D"_blank">eperezma@redha=
t.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Apr 19, 2023 at 12:56=E2=80=AFAM &lt;<a href=3D"mailto:peili.d=
ev@gmail.com" target=3D"_blank">peili.dev@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Pei Li &lt;<a href=3D"mailto:peili.dev@gmail.com" target=3D=
"_blank">peili.dev@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Currently, part of the vdpa initialization / startup process<br>
&gt; &gt; needs to trigger many ioctls per vq, which is very inefficient<br=
>
&gt; &gt; and causing unnecessary context switch between user mode and<br>
&gt; &gt; kernel mode.<br>
&gt; &gt;<br>
&gt; &gt; This patch creates an additional ioctl() command, namely<br>
&gt; &gt; VHOST_VDPA_GET_VRING_GROUP_BATCH, that will batching<br>
&gt; &gt; commands of VHOST_VDPA_GET_VRING_GROUP into a single<br>
&gt; &gt; ioctl() call.<br>
<br>
I&#39;d expect there&#39;s a kernel patch but I didn&#39;t see that?<br>
<br>
If we want to go this way. Why simply have a more generic way, that is<br>
introducing something like:<br>
<br>
VHOST_CMD_BATCH which did something like<br>
<br>
struct vhost_cmd_batch {<br>
=C2=A0 =C2=A0 int ncmds;<br>
=C2=A0 =C2=A0 struct vhost_ioctls[];<br>
};<br>
<br>
Then you can batch other ioctls other than GET_VRING_GROUP?<br>
<br>
Thanks<br>
<br>
&gt; &gt;<br>
&gt;<br>
&gt; It seems to me you forgot to send the 0/2 cover letter :).<br>
&gt;<br>
&gt; Please include the time we save thanks to avoiding the repetitive<br>
&gt; ioctls in each patch.<br>
&gt;<br>
&gt; CCing Jason and Michael.<br>
&gt;<br>
&gt; &gt; Signed-off-by: Pei Li &lt;<a href=3D"mailto:peili.dev@gmail.com" =
target=3D"_blank">peili.dev@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/virtio/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 +++++++++++++++-----<b=
r>
&gt; &gt;=C2=A0 include/standard-headers/linux/vhost_types.h |=C2=A0 3 ++<b=
r>
&gt; &gt;=C2=A0 linux-headers/linux/vhost.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++<br>
&gt; &gt;=C2=A0 3 files changed, 33 insertions(+), 8 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c<br>
&gt; &gt; index bc6bad23d5..6d45ff8539 100644<br>
&gt; &gt; --- a/hw/virtio/vhost-vdpa.c<br>
&gt; &gt; +++ b/hw/virtio/vhost-vdpa.c<br>
&gt; &gt; @@ -679,7 +679,8 @@ static int vhost_vdpa_set_backend_cap(struct =
vhost_dev *dev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t f =3D 0x1ULL &lt;&lt; VHOST_BACKEND_=
F_IOTLB_MSG_V2 |<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1ULL &lt;&lt; VHOST_BACKEND_F=
_IOTLB_BATCH |<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1ULL &lt;&lt; VHOST_BACKEND_F=
_IOTLB_ASID |<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1ULL &lt;&lt; VHOST_BACKEND_F_SUSP=
END;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1ULL &lt;&lt; VHOST_BACKEND_F_SUSP=
END |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1ULL &lt;&lt; VHOST_BACKEND_F_IOCT=
L_BATCH;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FE=
ATURES, &amp;features)) {<br>
&gt; &gt; @@ -731,14 +732,28 @@ static int vhost_vdpa_get_vq_index(struct v=
host_dev *dev, int idx)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev=
)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 int i;<br>
&gt; &gt; +=C2=A0 =C2=A0 int i, nvqs =3D dev-&gt;nvqs;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint64_t backend_features =3D dev-&gt;backend_cap;=
<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 trace_vhost_vdpa_set_vring_ready(dev);<br>
&gt; &gt; -=C2=A0 =C2=A0 for (i =3D 0; i &lt; dev-&gt;nvqs; ++i) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_vring_state state =3D {=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .index =3D dev-&gt;vq_=
index + i,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num =3D 1,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_vdpa_call(dev, VHOST_VDPA_SET_=
VRING_ENABLE, &amp;state);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!(backend_features &amp; BIT_ULL(VHOST_BACKEND=
_F_IOCTL_BATCH))) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nvqs; ++i) {<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_vring_sta=
te state =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .index =
=3D dev-&gt;vq_index + i,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num =3D=
 1,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_vdpa_call(dev, V=
HOST_VDPA_SET_VRING_ENABLE, &amp;state);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_vring_state states[nvqs=
 + 1];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 states[0].num =3D nvqs;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i &lt;=3D nvqs; ++i) {=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 states[i].index =3D de=
v-&gt;vq_index + i - 1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 states[i].num =3D 1;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt;<br>
&gt; I think it&#39;s more clear to share the array of vhost_vring_state<br=
>
&gt; states[nvqs + 1], and then fill it either in one shot with<br>
&gt; VHOST_VDPA_SET_VRING_ENABLE_BATCH or individually with<br>
&gt; VHOST_VDPA_SET_VRING_ENABLE.<br>
&gt;<br>
&gt; The same feedback goes for VHOST_VDPA_GET_VRING_GROUP_BATCH in the nex=
t patch.<br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_vdpa_call(dev, VHOST_VDPA_SET_=
VRING_ENABLE_BATCH, &amp;states[0]);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;<br>
&gt; This comment is previous to your patch but I just realized we don&#39;=
t<br>
&gt; check the return value of vhost_vdpa_call. Maybe it is worth<br>
&gt; considering addressing that in this series too.<br>
&gt;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; diff --git a/include/standard-headers/linux/vhost_types.h b/inclu=
de/standard-headers/linux/vhost_types.h<br>
&gt; &gt; index c41a73fe36..068d0e1ceb 100644<br>
&gt; &gt; --- a/include/standard-headers/linux/vhost_types.h<br>
&gt; &gt; +++ b/include/standard-headers/linux/vhost_types.h<br>
&gt; &gt; @@ -164,4 +164,7 @@ struct vhost_vdpa_iova_range {<br>
&gt; &gt;=C2=A0 /* Device can be suspended */<br>
&gt; &gt;=C2=A0 #define VHOST_BACKEND_F_SUSPEND=C2=A0 0x4<br>
&gt; &gt;<br>
&gt; &gt; +/* IOCTL requests can be batched */<br>
&gt; &gt; +#define VHOST_BACKEND_F_IOCTL_BATCH 0x6<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 #endif<br>
&gt; &gt; diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vh=
ost.h<br>
&gt; &gt; index f9f115a7c7..4c9ddd0a0e 100644<br>
&gt; &gt; --- a/linux-headers/linux/vhost.h<br>
&gt; &gt; +++ b/linux-headers/linux/vhost.h<br>
&gt; &gt; @@ -180,4 +180,11 @@<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 #define VHOST_VDPA_SUSPEND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_IO(VHOST_VIRTIO, 0x7D)<br>
&gt; &gt;<br>
&gt; &gt; +/* Batch version of VHOST_VDPA_SET_VRING_ENABLE<br>
&gt; &gt; + *<br>
&gt; &gt; + * Enable/disable the ring while batching the commands.<br>
&gt; &gt; + */<br>
&gt; &gt; +#define VHOST_VDPA_SET_VRING_ENABLE_BATCH=C2=A0 =C2=A0 =C2=A0 _I=
OW(VHOST_VIRTIO, 0x7F, \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct vhost_vring_state)<br>
&gt; &gt; +<br>
&gt;<br>
&gt; These headers should be updated with update-linux-headers.sh. To be<br=
>
&gt; done that way we need the changes merged in the kernel before.<br>
&gt;<br>
&gt; We can signal that the series is not ready for inclusion with the<br>
&gt; subject [RFC. PATCH], like [1], and note it in the commit message.<br>
&gt; That way, you can keep updating the header manually for demonstration<=
br>
&gt; purposes.<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt; [1] <a href=3D"https://lore.kernel.org/qemu-devel/20220413163206.19582=
54-23-eperezma@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/qemu-devel/20220413163206.1958254-23-eperezma@redhat.com/</a>=
<br>
&gt;<br>
<br>
<br>
</blockquote></div>

--00000000000003593c05f9bdc4d8--

