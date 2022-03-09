Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F085D4D29AC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 08:48:58 +0100 (CET)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRr45-0004xm-Kr
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 02:48:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRr0o-0003Of-TV
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:45:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRr0k-0003ig-Sh
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646811918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=shnlbO2A3mjmLUKm5QnWhD/RjqpKfM31LBoGyH/wW6M=;
 b=HMITw6Seallq6EewtNJTzw64hT58Ort3mh0LTSed2pbiMcdo7rGv9jhu2mQqe2NZ5d4tsB
 +4ciAVp6aNUWHcmJeqOgg9bglGiIYcJikmc1wAkLd9Dxmf0/So1Bi3e8vxoBca/P2G6vWi
 bw/IYFcnw3mh8hIrslS/tH6N1+SPEmc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-yMsVFsKbO-iaZ3n2MweaTg-1; Wed, 09 Mar 2022 02:45:16 -0500
X-MC-Unique: yMsVFsKbO-iaZ3n2MweaTg-1
Received: by mail-lj1-f197.google.com with SMTP id
 j7-20020a2e3c07000000b00247f8eb86a4so497853lja.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 23:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shnlbO2A3mjmLUKm5QnWhD/RjqpKfM31LBoGyH/wW6M=;
 b=8KbYxZhUBdEzWsO+sHd6OY9YU1CJwHB/C30wGgn4vt1BpDW1FNbbfVXqBRb0OCIsId
 W1/TKW9gBkNJ0S4OQRzlgumudKo9eH5D3BcGXsmz9ZzE+d6A6n6nG+qCvFRri/75KLyh
 hXK2fVslvDxTGYp6apGkvZrCE1DnZcTtVccX58OKeYdx0CzK5d18dMSmofUdhW2N6tpc
 dp+PuO2kFHqplUQ9qGDCtshg3XiHta3G7ydbOxs2kfGVjTzTl37cYD/UM5Ymohl0gJcw
 zmfUv8OBEUNZk0Tj0Ze1qbcMeOJCUI7UQch+0pn6s2KTj4g001TB7lRTtZGb4OIV8aZC
 Iatg==
X-Gm-Message-State: AOAM533sbe4W732sh7PYydYOWdB6Y44IOHcVU9BDc8lzvCpQWLDZAsMi
 LGcor3KDgZ9nnuRiSw6xvnJZWjt7MmCZUOf5FQRbbCek6rC52n5AuxlBaTXYwcxRfn7EPVDu9hU
 oF/MNvJBZOU7VmTOhMObdSXU2JyQ7s8M=
X-Received: by 2002:ac2:4c4f:0:b0:448:21cd:596f with SMTP id
 o15-20020ac24c4f000000b0044821cd596fmr13357403lfk.257.1646811914963; 
 Tue, 08 Mar 2022 23:45:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+iU6LcSVPqbW7uHCanSX+7wkcd3FYrOE1sjOtn2SgH6/1QPaUKwWpe+GMlQAO4l6MS7pJi0REnmvGFWAWnhU=
X-Received: by 2002:ac2:4c4f:0:b0:448:21cd:596f with SMTP id
 o15-20020ac24c4f000000b0044821cd596fmr13357370lfk.257.1646811914715; Tue, 08
 Mar 2022 23:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
 <20220308054623-mutt-send-email-mst@kernel.org>
 <CAJaqyWcuitG+01pjO__tYERN9910fL_JGiHG88xU=fTG3KmpJw@mail.gmail.com>
 <20220308071253-mutt-send-email-mst@kernel.org>
 <56b837a6-c67d-5ffc-bd70-ba51d996a6c2@redhat.com>
 <20220309023020-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220309023020-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 9 Mar 2022 15:45:03 +0800
Message-ID: <CACGkMEvsoJf3rXUe_CD3O4pwYf4=uLvAFOkdCaAOCEmnkNyKMA@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000030630505d9c44715"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030630505d9c44715
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 9, 2022 at 3:30 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Wed, Mar 09, 2022 at 11:38:35AM +0800, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/3/8 =E4=B8=8B=E5=8D=888:16, Michael S. Tsirkin =E5=86=99=
=E9=81=93:
> > > On Tue, Mar 08, 2022 at 12:37:33PM +0100, Eugenio Perez Martin wrote:
> > > > On Tue, Mar 8, 2022 at 11:48 AM Michael S. Tsirkin <mst@redhat.com>
> wrote:
> > > > > On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> > > > > > > Not by itself but I'm not sure we can guarantee guest will no=
t
> > > > > > > attempt to use the IOVA addresses we are reserving down
> > > > > > > the road.
> > > > > > The IOVA is allocated via the listeners and stored in the iova
> tree
> > > > > > per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qem=
u
> > > > > > virtio core see GPA to HVA mapping. And we do a reverse lookup
> to find
> > > > > > the HVA->IOVA we allocated previously.  So we have double check
> here:
> > > > > >
> > > > > > 1) Qemu memory core to make sure the GPA that guest uses is val=
id
> > > > > > 2) the IOVA tree that guarantees there will be no HVA beyond wh=
at
> > > > > > guest can see is used
> > > > > >
> > > > > > So technically, there's no way for the guest to use the IOVA
> address
> > > > > > allocated for the shadow virtqueue.
> > > > > >
> > > > > > Thanks
> > > > > I mean, IOVA is programmed in the host hardware to translate to
> HPA, right?
> > > > >
> > > > Yes, that's right if the device uses physical maps. Also to note, S=
VQ
> > > > vring is allocated in multiples of host huge pages to avoid garbage
> or
> > > > unintended access from the device.
> > > >
> > > > If a vdpa device uses physical addresses, kernel vdpa will pin qemu
> > > > memory first and then will send IOVA to HPA translation to hardware=
.
> > > > But this IOVA space is not controlled by the guest, but by SVQ. If =
a
> > > > guest's virtqueue buffer cannot be translated first to GPA, it will
> > > > not be forwarded.
> > > >
> > > > Thanks!
> > > Right. So if guests send a buffer where buffer address overlaps the
> > > range we used for the SVQ, then I think at the moment guest won't wor=
k.
> >
> >
> > There's no way for a guest to do this, it can only use GPA
>
> With a vIOMMU it can.
>

It should be the same or I may miss something.

With a vIOMMU, vDPA devices still won't use gIOVA. Instead the device will
use the IOVA that is managed by the Qemu.

Listeners: IOVA->HVA
Qemu virtqueue helper: gIOVA->GPA->HVA
SVQ: HVA->IOVA

So SVQ will use an IOVA that is overlapped with gIOVA/GPA

Thanks


>
> > but the Qemu
> > won't let vDPA to use GPA as IOVA. Dedicated IOVA ranges were allocated
> for
> > those GPA ranges so SVQ won't use IOVA that is overlapped with what Gue=
st
> > use.
> >
> > Thanks
> >
> >
> > >
>
>

--00000000000030630505d9c44715
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 3:30 PM Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Ma=
r 09, 2022 at 11:38:35AM +0800, Jason Wang wrote:<br>
&gt; <br>
&gt; =E5=9C=A8 2022/3/8 =E4=B8=8B=E5=8D=888:16, Michael S. Tsirkin =E5=86=
=99=E9=81=93:<br>
&gt; &gt; On Tue, Mar 08, 2022 at 12:37:33PM +0100, Eugenio Perez Martin wr=
ote:<br>
&gt; &gt; &gt; On Tue, Mar 8, 2022 at 11:48 AM Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt; &gt; On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wr=
ote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Not by itself but I&#39;m not sure we can gua=
rantee guest will not<br>
&gt; &gt; &gt; &gt; &gt; &gt; attempt to use the IOVA addresses we are rese=
rving down<br>
&gt; &gt; &gt; &gt; &gt; &gt; the road.<br>
&gt; &gt; &gt; &gt; &gt; The IOVA is allocated via the listeners and stored=
 in the iova tree<br>
&gt; &gt; &gt; &gt; &gt; per GPA range as IOVA-&gt;(GPA)-&gt;HVA.Guests wil=
l only see GPA, Qemu<br>
&gt; &gt; &gt; &gt; &gt; virtio core see GPA to HVA mapping. And we do a re=
verse lookup to find<br>
&gt; &gt; &gt; &gt; &gt; the HVA-&gt;IOVA we allocated previously.=C2=A0 So=
 we have double check here:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; 1) Qemu memory core to make sure the GPA that gues=
t uses is valid<br>
&gt; &gt; &gt; &gt; &gt; 2) the IOVA tree that guarantees there will be no =
HVA beyond what<br>
&gt; &gt; &gt; &gt; &gt; guest can see is used<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; So technically, there&#39;s no way for the guest t=
o use the IOVA address<br>
&gt; &gt; &gt; &gt; &gt; allocated for the shadow virtqueue.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; &gt; I mean, IOVA is programmed in the host hardware to tran=
slate to HPA, right?<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; Yes, that&#39;s right if the device uses physical maps. Also=
 to note, SVQ<br>
&gt; &gt; &gt; vring is allocated in multiples of host huge pages to avoid =
garbage or<br>
&gt; &gt; &gt; unintended access from the device.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; If a vdpa device uses physical addresses, kernel vdpa will p=
in qemu<br>
&gt; &gt; &gt; memory first and then will send IOVA to HPA translation to h=
ardware.<br>
&gt; &gt; &gt; But this IOVA space is not controlled by the guest, but by S=
VQ. If a<br>
&gt; &gt; &gt; guest&#39;s virtqueue buffer cannot be translated first to G=
PA, it will<br>
&gt; &gt; &gt; not be forwarded.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Thanks!<br>
&gt; &gt; Right. So if guests send a buffer where buffer address overlaps t=
he<br>
&gt; &gt; range we used for the SVQ, then I think at the moment guest won&#=
39;t work.<br>
&gt; <br>
&gt; <br>
&gt; There&#39;s no way for a guest to do this, it can only use GPA<br>
<br>
With a vIOMMU it can.<br></blockquote><div><br></div><div>It should be the =
same or I may miss something.</div><div><br></div><div>With a vIOMMU, vDPA =
devices still won&#39;t use gIOVA. Instead the device will use the IOVA tha=
t is managed by the Qemu.</div><div><br></div><div>Listeners: IOVA-&gt;HVA<=
/div><div>Qemu virtqueue helper: gIOVA-&gt;GPA-&gt;HVA</div><div>SVQ: HVA-&=
gt;IOVA</div><div><br></div><div>So SVQ will use an IOVA that is overlapped=
 with gIOVA/GPA</div><div><br></div><div>Thanks</div><div>=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; but the Qemu<br>
&gt; won&#39;t let vDPA to use GPA as IOVA. Dedicated IOVA ranges were allo=
cated for<br>
&gt; those GPA ranges so SVQ won&#39;t use IOVA that is overlapped with wha=
t Guest<br>
&gt; use.<br>
&gt; <br>
&gt; Thanks<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
<br>
</blockquote></div></div>

--00000000000030630505d9c44715--


