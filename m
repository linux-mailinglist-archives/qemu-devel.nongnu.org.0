Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44B4EA851
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:08:44 +0200 (CEST)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ5y7-0001s9-CQ
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:08:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZ5vC-0000wM-AK
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZ5v9-0001HV-Dr
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648537536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dy2PwjP0nAj+vmAp8ZJeDeOKuGr6VQGAWzuOjQSq2Ds=;
 b=FRfe8Zcorx6IovCtyJPY9CLDOjfbY18B8UgklmYxhH9NRrJq7P7FZzIYBsw+upf4fxT7Mf
 Kx8dWX0EREPQWiM7l/cWxZ334bCKKg7opINyQvg5DVf33tRZ3uI/OO2NqLofl9Cnkq7TDE
 kK4lzdWKv/j42FW7Dkg2XUScgt6pRCQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-zWlRu3J2M0e_if1kJ0I_4g-1; Tue, 29 Mar 2022 03:05:35 -0400
X-MC-Unique: zWlRu3J2M0e_if1kJ0I_4g-1
Received: by mail-lf1-f71.google.com with SMTP id
 q19-20020ac24a73000000b0044a100bb508so4951918lfp.14
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 00:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dy2PwjP0nAj+vmAp8ZJeDeOKuGr6VQGAWzuOjQSq2Ds=;
 b=enqBn0o+5OMeDqv+r5fH36nefToygVqEAmyinepoUByrBqHf3FfLywtJTF+j2m6hE5
 xARAot9An8N8pml2KvoRWz6LTvphn/HnhMcnYdwQ6e2loQgwMacvx3UQllkX4P2YW39k
 VR3ZoK9LCX7vj1nQXHgLyCGAr2fRm1aTpfnGKyVrGznR/xVMgEVqvBIAPjRl5d4m3d65
 iwtO8jYC3z0nT+plH4ExLuXlBzylBmdeIJyJNI1pxmli+XG74aWp3swa/vjcGaDPD8E7
 k2pzsbFkIgbz7GbQcLmKIAqQcLEgxcYFOtv7/Kli7DwJwpTtcBnczVamlnU7w58q3IDL
 2/+g==
X-Gm-Message-State: AOAM532SM6k1jV9NdNCVPZsnDLMn6riH1+FCB+RiLo113pB8HR4HYnfR
 /2vusMbrVKiABWJwFdJWYR5N+lfl8YMvikPZG9PGIu889IvCtFsW1lBI1cE5pNLKBjiSApVLylp
 lp2noxdOo5T2/ghRciiyXirRT7Ge6w10=
X-Received: by 2002:ac2:57d4:0:b0:448:2cba:6c86 with SMTP id
 k20-20020ac257d4000000b004482cba6c86mr1342038lfo.201.1648537533993; 
 Tue, 29 Mar 2022 00:05:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxftP2zIE55o7i//6nOXruKbrLjbSOQf+U9IePGts4d2uQWqP1Sy2cXFSIPT/HvZHy9In0IovlLjOonEzv7IuU=
X-Received: by 2002:ac2:57d4:0:b0:448:2cba:6c86 with SMTP id
 k20-20020ac257d4000000b004482cba6c86mr1342014lfo.201.1648537533742; Tue, 29
 Mar 2022 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220319072012.525-1-longpeng2@huawei.com>
 <20220319072012.525-6-longpeng2@huawei.com>
 <CAGxU2F5PTOdZtZPpb4q65=dh9omrAMridfOvpAEktBOF1EVnFA@mail.gmail.com>
 <2fd4698cd9a54e1a928e9e6aa18c1965@huawei.com>
In-Reply-To: <2fd4698cd9a54e1a928e9e6aa18c1965@huawei.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 29 Mar 2022 09:05:21 +0200
Message-ID: <CAGxU2F77CHk6LbhSZNJGJTGzUrMFLCzTFNN=G4E1_qT0nEhgxw@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] vdpa-dev: implement the realize interface
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Tsirkin <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 7:16 AM Longpeng (Mike, Cloud Infrastructure
Service Product Dept.) <longpeng2@huawei.com> wrote:
> > On Sat, Mar 19, 2022 at 03:20:07PM +0800, Longpeng(Mike) wrote:
> > >From: Longpeng <longpeng2@huawei.com>
> > >
>
> [snap]
>
> > > static void vhost_vdpa_device_unrealize(DeviceState *dev)
> > >@@ -66,6 +197,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice *vdev,
> > uint8_t status)
> > > static Property vhost_vdpa_device_properties[] = {
> > >     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
> > >     DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),
> >
> > Other vhost devices use the `vhostfd` property, maybe we should use the
> > same name.
> >
> > If we go for this change, then maybe we also need to change `vdpa-dev`
> > to `vhostpath` or something like that
> >
>
> Make sense.
>
> I prefer to use 'vhostdev' for the file path, just like the usage in Netdev:
>   -netdev type=vhost-vdpa,vhostdev=/dev/vhost-vdpa-0,id=vhostvdpa1
>

Yep, I agree with 'vhostdev'.

Thanks,
Stefano


