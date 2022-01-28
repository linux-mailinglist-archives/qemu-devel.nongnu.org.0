Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BAF49F4C8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 08:58:24 +0100 (CET)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDM9H-0003C4-Kc
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 02:58:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDM0Q-0008UV-St
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 02:49:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDM0M-0000m1-PB
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 02:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643356149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnUNt5t+nP9mYSb8ARl8sKtQVrIdbpC7wV2R0+D5TJM=;
 b=RoEzNsJlloqXmGD5e9glD8i+6daEmmeb4XpStpkfWKzWhcqh8Qas6GW3eYvAgntQE3+b6z
 MFdm7ry6JvKyuBRE7mBzDMOCrN8wt7RQnbb8XFQmNkEIk0Znf4lRaBJVCx2wy/qKhxQz0K
 DcXuW31HPakhIQZlPP8XYsN7fqNYnbI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-EeWhLptpPMudeXT2ZLEEHg-1; Fri, 28 Jan 2022 02:49:07 -0500
X-MC-Unique: EeWhLptpPMudeXT2ZLEEHg-1
Received: by mail-qk1-f197.google.com with SMTP id
 b185-20020a37b2c2000000b004783172e402so4273288qkf.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 23:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QnUNt5t+nP9mYSb8ARl8sKtQVrIdbpC7wV2R0+D5TJM=;
 b=ovXHz+PfwW2LKfeSMcnwU/Wu+QerHrLjYvlCDayoWpMTNsUjxeBn/c6gyoN6i/5hPM
 EUuMQyQ1XZf9qfk0p7cBpU2+zzZFtajybci/tEvBPuj+nGNLDUvp7IdcOr+4jiN9TZtV
 +3v0i8LXZuopAM2Ibf6pfAT0Oh6jFcrZh2FOC6r4zFGShj3EFKdea00tMrV82W+4GeL0
 tdc4Z+c2bSg++v9rFI9at/mYf4C32fobssIDrgrHsvpr9PrH2LSw3a14cCqsy56l2waT
 BF6rnMVOA7wzP4kOhmaYgU3NqT6nGmSImuxKwqqRq91KXm3l56nVDwkQQtigptBb+eOs
 Ll8w==
X-Gm-Message-State: AOAM531ZIcgkpz4oBlGIPMqHR1JI0dZDpXpoDucgIIOdSVPKVLswqLfI
 oLpbGHu84MKh/PEsQaun/6TOLAsPBzVhPfT2Dv/z8B0TTNCTIHgUUYWGna5vlCLjNS7+ZpKiA0U
 Xo52vNu1uJcOXu2l2bylnE6UGLw63azY=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr4846074qkb.764.1643356147274; 
 Thu, 27 Jan 2022 23:49:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5XvIVfXyLdwILRInkkBLUv4ckifBQi5bPrjg19V+z1mxkGoiqDkHRXeU0O3Asa2cPXqOY83pxKz7x9AF3sMY=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr4846051qkb.764.1643356146978; 
 Thu, 27 Jan 2022 23:49:06 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
 <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
 <Ye6IhLCe6NDKO6+E@xz-m1.local>
 <CAJaqyWcdpTr2X4VuAN2NLmpviCjDoAaY269+VQGZ7-F6myOhSw@mail.gmail.com>
 <YfJSezhQv1kXa1x8@xz-m1.local>
 <CAJaqyWczZ7C_vbwugyN9bEgOVuRokGqVMb_g5UK_R4F8O+qKOA@mail.gmail.com>
 <YfNprA3OLUqj8LSG@xz-m1.local>
 <345cd684-0cc2-a685-0611-e2fcf0dfc52b@redhat.com>
In-Reply-To: <345cd684-0cc2-a685-0611-e2fcf0dfc52b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 28 Jan 2022 08:48:31 +0100
Message-ID: <CAJaqyWc8fQyhKmwKUq2cbfKVjED8s4uGqt2qsYgP96L6NYejJA@mail.gmail.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 6:56 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/28 =E4=B8=8A=E5=8D=8811:57, Peter Xu =E5=86=99=E9=81=93:
> > On Thu, Jan 27, 2022 at 10:24:27AM +0100, Eugenio Perez Martin wrote:
> >> On Thu, Jan 27, 2022 at 9:06 AM Peter Xu <peterx@redhat.com> wrote:
> >>> On Tue, Jan 25, 2022 at 10:40:01AM +0100, Eugenio Perez Martin wrote:
> >>>> So I think that the first step to remove complexity from the old one
> >>>> is to remove iova_begin and iova_end.
> >>>>
> >>>> As Jason points out, removing iova_end is easier. It has the drawbac=
k
> >>>> of having to traverse all the list beyond iova_end, but a well forme=
d
> >>>> iova tree should contain none. If the guest can manipulate it, it's
> >>>> only hurting itself adding nodes to it.
> >>>>
> >>>> It's possible to extract the check for hole_right (or this in Jason'=
s
> >>>> proposal) as a special case too.
> >>>>
> >>>> But removing the iova_begin parameter is more complicated. We cannot
> >>>> know if it's a valid hole without knowing iova_begin, and we cannot
> >>>> resume traversing. Could we assume iova_begin will always be 0? I
> >>>> think not, the vdpa device can return anything through syscall.
> >>> Frankly I don't know what's the syscall you're talking about,
> >> I meant VHOST_VDPA_GET_IOVA_RANGE, which allows qemu to know the valid
> >> range of iova addresses. We get a pair of uint64_t from it, that
> >> indicates the minimum and maximum iova address the device (or iommu)
> >> supports.
> >>
> >> We must allocate iova ranges within that address range, which
> >> complicates this algorithm a little bit. Since the SVQ iova addresses
> >> are not GPA, qemu needs extra code to be able to allocate and free
> >> them, creating a new custom iova as.
> >>
> >> Please let me know if you want more details or if you prefer me to
> >> give more context in the patch message.
> > That's good enough, thanks.
> >
> >>> I mean this one:
> >>>
> >>> https://lore.kernel.org/qemu-devel/20211029183525.1776416-24-eperezma=
@redhat.com/
> >>>
> >>> Though this time I have some comments on the details.
> >>>
> >>> Personally I like that one (probably with some amendment upon the old=
 version)
> >>> more than the current list-based approach.  But I'd like to know your=
 thoughts
> >>> too (including Jason).  I'll further comment in that thread soon.
> >>>
> >> Sure, I'm fine with whatever solution we choose, but I'm just running
> >> out of ideas to simplify it. Reading your suggestions on old RFC now.
> >>
> >> Overall I feel list-based one is both more convenient and easy to
> >> delete when qemu raises the minimal glib version, but it adds a lot
> >> more code.
> >>
> >> It could add less code with this less elegant changes:
> >> * If we just put the list entry in the DMAMap itself, although it
> >> exposes unneeded implementation details.
> >> * We force the iova tree either to be an allocation-based or an
> >> insertion-based, but not both. In other words, you can only either use
> >> iova_tree_alloc or iova_tree_insert on the same tree.
>
>
> This seems an odd API I must say :(
>
>
> > Yeah, I just noticed it yesterday that there's no easy choice on it.  L=
et's go
> > with either way; it shouldn't block the rest of the code.  It'll be goo=
d if
> > Jason or Michael share their preferences too.
>
>
> (Havne't gone through the code deeply)
>
> I wonder how about just copy-paste gtree_node_first|last()? A quick
> google told me it's not complicated.
>

Both GTree and GTreeNode definitions are not part of the ABI of glib.
I think the ustream code has not changed its layout for a long time
but still it's allowed to do so in the future.

Having said that, they use a list internally to traverse the nodes,
with node->left and node->right instead of TAILQ entries. These
patches duplicate that intrusive list in DMAMap entries, and make them
private so other parts of qemu are not affected.

Thanks!

> Thanks
>
>
> >
> >> I have a few tests to check the algorithms, but they are not in the
> >> qemu test format. I will post them so we all can understand better
> >> what is expected from this.
> > Sure.  Thanks.
> >
>


