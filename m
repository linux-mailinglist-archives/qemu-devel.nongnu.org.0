Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D060F6DC4D1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 11:06:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plnSU-0001bW-EL; Mon, 10 Apr 2023 05:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1plnSR-0001bJ-HU
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 05:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1plnSP-0005NI-JN
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 05:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681117499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bbMEEXmtu/Hlu7ynFOWFPmkjj+3Tz2gcukQYMHDHU4=;
 b=ObA/RiuYVYhxIyfmOqW1kwDz/iAm6ekj4omuRZo8dfLqY7I5sGxhsUNy8p2lpVHeEmCYWs
 hbDZi9H1qzftJ+mRbZVkKTDsdNb1YUYIFCCUr5obWJ9jyhotjPPddfr27A+qSKK7JvCbQ3
 WRcW0GVA+EQwvhDzlayaycyzu5aqr+o=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-qTmwWSfHMnKmc96mxWO9cg-1; Mon, 10 Apr 2023 05:04:57 -0400
X-MC-Unique: qTmwWSfHMnKmc96mxWO9cg-1
Received: by mail-yb1-f199.google.com with SMTP id
 67-20020a250146000000b00b714602d43fso5068248ybb.10
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 02:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681117497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bbMEEXmtu/Hlu7ynFOWFPmkjj+3Tz2gcukQYMHDHU4=;
 b=m3nmPhbky3GEev9hCju22HGCw5Dgx064bmYWbHWpK1bBtKwfFHIMQdH8JOBdBsnLxz
 jzkRWEk63G2C6xz1Au/izdyfaeZAPY6OgsiBrk4aMnZDXbKqyk/58SKXskWat2rhGpNh
 czKMIv0c7KgjLh5Yo5Z5xZY4GqCjYzsbVsnE0cdNzioWAicrLfSfJJ6w4ONVG7sHoE0Q
 MMdxFlnJR/NVlWjli7ypN/ZwNGKtxAQJZ03BE/Fka5mAkwBiOMiSR32duxRh1vrgBPVv
 RcyA25Cwnt6Z0o3GowEyo1V/KJvuZYdyuiF5Ecu8ycELhRLLe59Je6PAmwUo97Jh3SOq
 DkuA==
X-Gm-Message-State: AAQBX9dmCYTdlDbLCewObG3yftzIoFCrEXtGaIlmajOBinJpu5mFTunc
 4RVQ1lxAfnQwuk74rvIxUSgj4BGOuZAthmfbhJ7X44D9lBuGAiuOKbZkl8ipikhnrvFnGhmPevF
 bVH+g/uAd96EJtCyR6osLKVJTUZTBDZo=
X-Received: by 2002:a81:eb09:0:b0:541:7266:3fd7 with SMTP id
 n9-20020a81eb09000000b0054172663fd7mr5366295ywm.3.1681117496942; 
 Mon, 10 Apr 2023 02:04:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bv4/zzQnctv30Q0kKgwIoTeLt5/qa56FxPd24hEvQJIjRutP1keZm6ljKt6eLum84FVFyioPMsnAymlnf8hvA=
X-Received: by 2002:a81:eb09:0:b0:541:7266:3fd7 with SMTP id
 n9-20020a81eb09000000b0054172663fd7mr5366282ywm.3.1681117496719; Mon, 10 Apr
 2023 02:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
 <16c48190-bc4d-3001-3460-d7dfa6041919@huawei.com>
 <CACGkMEsRqsOEVsLeiMxTXBJeN2f+92ZEhTvn6yq+b-V4P_CnSA@mail.gmail.com>
In-Reply-To: <CACGkMEsRqsOEVsLeiMxTXBJeN2f+92ZEhTvn6yq+b-V4P_CnSA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 10 Apr 2023 11:04:20 +0200
Message-ID: <CAJaqyWdB-1+ZLe1S1jqzhtz0S+urvJXp2F-pQpH-iq0=GN9SGQ@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Jason Wang <jasowang@redhat.com>
Cc: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>,
 qemu-level <qemu-devel@nongnu.org>, 
 Michael Tsirkin <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Mon, Apr 10, 2023 at 5:22=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Mon, Apr 10, 2023 at 11:17=E2=80=AFAM Longpeng (Mike, Cloud Infrastruc=
ture
> Service Product Dept.) <longpeng2@huawei.com> wrote:
> >
> >
> >
> > =E5=9C=A8 2023/4/10 10:14, Jason Wang =E5=86=99=E9=81=93:
> > > On Wed, Apr 5, 2023 at 7:38=E2=80=AFPM Eugenio Perez Martin <eperezma=
@redhat.com> wrote:
> > >>
> > >> Hi!
> > >>
> > >> As mentioned in the last upstream virtio-networking meeting, one of
> > >> the factors that adds more downtime to migration is the handling of
> > >> the guest memory (pin, map, etc). At this moment this handling is
> > >> bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, th=
e
> > >> destination device waits until all the guest memory / state is
> > >> migrated to start pinning all the memory.
> > >>
> > >> The proposal is to bind it to the char device life cycle (open vs
> > >> close), so all the guest memory can be pinned for all the guest / qe=
mu
> > >> lifecycle.
> > >>
> > >> This has two main problems:
> > >> * At this moment the reset semantics forces the vdpa device to unmap
> > >> all the memory. So this change needs a vhost vdpa feature flag.
> > >
> > > Is this true? I didn't find any codes to unmap the memory in
> > > vhost_vdpa_set_status().
> > >
> >
> > It could depend on the vendor driver, for example, the vdpasim would do
> > something like that.
> >
> > vhost_vdpa_set_status->vdpa_reset->vdpasim_reset->vdpasim_do_reset->vho=
st_iotlb_reset
>
> This looks like a bug. Or I wonder if any user space depends on this
> behaviour, if yes, we really need a new flag then.
>

My understanding was that we depend on this for cases like qemu
crashes. We don't do an unmap(-1ULL) or anything like that to make
sure the device is clean when we bind a second qemu to the same
device. That's why I think that close() should clean them. Or maybe
even open().

The only other option I see is to remove the whole vhost-vdpa device
every time, or am I missing something?

Thanks!


