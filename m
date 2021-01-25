Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30C302B8F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:26:35 +0100 (CET)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47VS-0005eT-PN
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l47SU-0004KD-Q7
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:23:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l47SR-0001SQ-SV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611602606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IbLGpxMvxKoUOiJf6AdHbZqKriWP56yXvhjHXz27f8=;
 b=AJF/HRotdWkbj3H95iVeOUgCMvxYW0T3tHMYJpkr6+LWHRL4S0UwSFBOVoadVthuc5Bedy
 kYCZRHNgUaZrMCY7PnNiDUSBJT7KFW5tHiPOfHQE9y7Ldl20bgzHqQ43YL9zodEpbZFtq+
 +mzg9IYMwnacgNdzk6sy8BKm9osOjP4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-bEya46RoPZSiwaISH58F_w-1; Mon, 25 Jan 2021 14:23:24 -0500
X-MC-Unique: bEya46RoPZSiwaISH58F_w-1
Received: by mail-qt1-f198.google.com with SMTP id b23so7899525qto.23
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 11:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6IbLGpxMvxKoUOiJf6AdHbZqKriWP56yXvhjHXz27f8=;
 b=Q3x5MipSvEowXVD0riwyRi5yM8jlZL5wqpzPo1QKCh782XtjpGMTWcyauM6AAAWthr
 sACSVRgIlxMnXVbqw9CS47QOCNeDDseFDkh+KuTF7xdKBqydnk2yvSfq/NJtsM1LRWb/
 1Ejhrv6XAsZJNYTDpHjKPw8sXt4E7jCx0IgXTTHwaLt+y4w/R6eC02qCzqtf7FzO1MIB
 DPEQri4PHoMrtLr9/GJwHo9g2/ML93gpZawKoyX6LUUmmkYBsfWsyRVf39HzRRMfABV4
 7+nZMMBTdvht5pkWS2Hm6T9GtIWeX2bF8OQZD1tm66Yh77HrrlquxUha1O21z4o08p3E
 4Xsw==
X-Gm-Message-State: AOAM530Mdqgs1Fnv07lkT6lzc7qoMazJOqFsSW1OLGPxru33GEArlukE
 HOfirWLtQi3JBfjeQkIUWHt+RYn4PkB0JlqNuZC+sb2vnAni8J6OGIMImFvb//AlrU0M+ZKcsdv
 VljMBb/WC+xGRUhLbvNGmVTp1kQ11wPo=
X-Received: by 2002:a0c:c488:: with SMTP id u8mr2264697qvi.9.1611602603869;
 Mon, 25 Jan 2021 11:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpJnzRBWVGahRrwHTr6211Av2R8nSk2kNZGJZ6hUYehxo87Shgm/6ClaQrThCDZyGb0yyEkrdCkC7TRouFyuc=
X-Received: by 2002:a0c:c488:: with SMTP id u8mr2264682qvi.9.1611602603676;
 Mon, 25 Jan 2021 11:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20210122200851.345259-1-eperezma@redhat.com>
 <65ea6f69-538f-7f2e-b2d9-bb0a110f004b@redhat.com>
 <CAJaqyWdYQH8O-WvLm4raWtWbhwz6BiC3ucGyi584BWALyy+UUA@mail.gmail.com>
 <20210125171804.GL260413@xz-x1>
In-Reply-To: <20210125171804.GL260413@xz-x1>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 25 Jan 2021 20:22:47 +0100
Message-ID: <CAJaqyWc_0kuRieVFpcvVVtQvTz5DApPLQcD9_Ww0vzUKc69LhQ@mail.gmail.com>
Subject: Re: [PATCH] virtio: Add corresponding memory_listener_unregister to
 unrealize
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 6:18 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jan 25, 2021 at 05:55:35PM +0100, Eugenio Perez Martin wrote:
> > On Mon, Jan 25, 2021 at 4:15 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > On 2021/1/23 =E4=B8=8A=E5=8D=884:08, Eugenio P=C3=A9rez wrote:
> > > > Cannot destroy address spaces of IOMMU-aware virtio devices without=
 it,
> > > > since they can contain memory listeners.
> > >
> > >
> > > It's better to explain why the one in finalize doesn't work here.
> > >
> >
> > Hi Jason! Good point. The other call is at virtio_device_instance_final=
ize.
> >
> > Function virtio_device_instance_finalize is called after
> > address_space_destroy if we follow steps of buglink.
> >
> > Address_space_destroy is called by
> > pci_qdev_unrealize/do_pci_unregister_device, after call to
> > virtio_device_unrealize. After that call,
> > virtio_device_instance_finalize is called through object_deinit,
> > freeing the bus.
> >
> > Also, memory_listener_unregister can be called again because it checks
> > for listener->address_space !=3D NULL at start, and sets it to NULL at
> > end.
> >
> > In regular shutdown, nothing of this is called, so maybe we could
> > safely delete the call to memory_listener_unregister at
> > virtio_device_instance_finalize?
>
> I didn't notice this; if so we'd better remove that call if it's destined=
 to be
> a noop after all.
>
> >
> > If not, should I send again the patch with a new commit message?
>
> Maybe attach the full backtrace too along with above?  The assertion itse=
lf
> could be a very good explanation of what's happened.
>

I agree, sending v2.

Thanks!

> Thanks,
>
> --
> Peter Xu
>


