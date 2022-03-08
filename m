Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0554D16CF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:04:34 +0100 (CET)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYZt-0006uJ-8z
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRYAS-0003Kt-Rw
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRYAO-0006S3-Lu
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646739491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nK0X8RtHpYGnU3/8LcjbXCF17d5Tuj5uuT4Ltfyz/rk=;
 b=CqBg2/kp7xNDMFtTSGXrXEylbWfelfroCCQ0N8d2D3bRCOB380HloJjf/zRJ7GRqMKcmk0
 hAxEPPcDxhGROo2m9wAijbmHg88pT9LyMwA0Z2qCp2Er/pNypcoN/a+SlG9KX628sQQae+
 F6BZzunUr1ZRHgFuFpxW9sk172rRA/M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-ILz-cIR1NO2g6Bqe7PE-iw-1; Tue, 08 Mar 2022 06:38:10 -0500
X-MC-Unique: ILz-cIR1NO2g6Bqe7PE-iw-1
Received: by mail-qk1-f197.google.com with SMTP id
 v16-20020a376110000000b0067b2749e0fbso5017473qkb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nK0X8RtHpYGnU3/8LcjbXCF17d5Tuj5uuT4Ltfyz/rk=;
 b=JELNqd1QNoUMpZNgZ7+aZcUC/fRAKIrHUGK0A6wnscN+GYWHi9R6bmcHL2zYSyww9f
 yL/wim3T4tzgjAig9cLkloEZoE+PZVoiyxBevYvET+JBhAhN4YocpfqHQnkSbS7iZ/Un
 JWkHtBz/B48sa/sgT9kpzXrrGqth/EdpoGojKse0gxP4pm2yrBIcDo/gMOvMkxtuNHSq
 mNi++z+X8e+UN3X8MTIoLoR4yk32a/qzW/UUC7nNUxOoluIrMVEEzF1Xn3ngMdkfECUG
 L1xBwhUXNaxphdvrenPWfWbutNKZZDkzBBnWq9ArXkH0Sj4F9N8+QPiZ5hbaSXx5Qgc7
 1eqA==
X-Gm-Message-State: AOAM532BUow3RUxspaEJAi4sk1cyi0N+4yufue/ZKH7dpcjrJYCpyoGC
 bptm64CR5fOKAAJOIDF0LAyF/hPQQhuQ70/N3+e63Nc8TsmnBeBe6hVdwNH6u61XIGXLlfmnaRP
 rol0lrEik9wh5nHGHaFNbOxI/YhjP4jY=
X-Received: by 2002:a05:6214:19ed:b0:42c:3b5f:cda6 with SMTP id
 q13-20020a05621419ed00b0042c3b5fcda6mr11732219qvc.70.1646739490307; 
 Tue, 08 Mar 2022 03:38:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwkiTE/Uo6jkPckP9pZv8DmIlv+/tXCmkQ+0jLtRnfUxPZIzmfKhgmtO1TtU366catinWAmgOJ7JROozAcM34=
X-Received: by 2002:a05:6214:19ed:b0:42c:3b5f:cda6 with SMTP id
 q13-20020a05621419ed00b0042c3b5fcda6mr11732190qvc.70.1646739490066; Tue, 08
 Mar 2022 03:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
 <20220308054623-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308054623-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 8 Mar 2022 12:37:33 +0100
Message-ID: <CAJaqyWcuitG+01pjO__tYERN9910fL_JGiHG88xU=fTG3KmpJw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 11:48 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> > > Not by itself but I'm not sure we can guarantee guest will not
> > > attempt to use the IOVA addresses we are reserving down
> > > the road.
> >
> > The IOVA is allocated via the listeners and stored in the iova tree
> > per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qemu
> > virtio core see GPA to HVA mapping. And we do a reverse lookup to find
> > the HVA->IOVA we allocated previously.  So we have double check here:
> >
> > 1) Qemu memory core to make sure the GPA that guest uses is valid
> > 2) the IOVA tree that guarantees there will be no HVA beyond what
> > guest can see is used
> >
> > So technically, there's no way for the guest to use the IOVA address
> > allocated for the shadow virtqueue.
> >
> > Thanks
>
> I mean, IOVA is programmed in the host hardware to translate to HPA, right?
>

Yes, that's right if the device uses physical maps. Also to note, SVQ
vring is allocated in multiples of host huge pages to avoid garbage or
unintended access from the device.

If a vdpa device uses physical addresses, kernel vdpa will pin qemu
memory first and then will send IOVA to HPA translation to hardware.
But this IOVA space is not controlled by the guest, but by SVQ. If a
guest's virtqueue buffer cannot be translated first to GPA, it will
not be forwarded.

Thanks!


