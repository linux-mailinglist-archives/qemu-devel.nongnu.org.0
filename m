Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3834428B0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:37:45 +0100 (CET)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoMa-0007ET-Ls
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhoKg-00069X-KJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhoKf-0000Hm-4r
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635838544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPLpaZCSdiqCPV88PMDIynF2sKRbb8C1ui4aNMfP1qM=;
 b=Nov5+8AMT29tSd2GnsUwDttzc/t+JDtBraO8gOr9O2QJStX0tvBjN7i5BjGHXlFMkHY2q5
 EP9IOzZqEOB5fblmQQpHeg7fse6VuMyhJLzcJAG1wD2FQmiG/NZo9Togy7IG09MgaEDsRs
 8c/e5nLQqhsBXInRmkfH1s1knlkKPkk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-EyGHt2_JPmKlyC4dXkG-Uw-1; Tue, 02 Nov 2021 03:35:43 -0400
X-MC-Unique: EyGHt2_JPmKlyC4dXkG-Uw-1
Received: by mail-qv1-f71.google.com with SMTP id
 q2-20020a05621419e200b003aeeeff5417so5257951qvc.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CPLpaZCSdiqCPV88PMDIynF2sKRbb8C1ui4aNMfP1qM=;
 b=YrVbSTyycdbp+coB3hqU3msfj7W98Xl5qt+vfjtee8o5PrSGXkl4IwUrGYwxra2MzK
 C5CwQ0t0gg8DKv1DV5mNzM9wQP0T85YT89rbK759D1YodueHh/Y8Sbl9if5dBJW3GAQn
 +ou2rAX7iTD/KA1D+tc4+zbT/kfDWHRgZKhSfAtlRMEmIILammlLQMNKZC7oPWDy+zfh
 kzzSTr29YlNFFXSWRQbKyM6s3LN41A3o6YsxDShZgBED5csFGUs4LeR+AhB69GP7l8LC
 7tbDErDIjlEHQtlzPQXICpA8UBwOZ5Wn2jp8R0WSaQHzRFfDfgKuQuPZAQq7w+OuFzkb
 Pvng==
X-Gm-Message-State: AOAM531xmH4EXxHLCAs8D83Hgl1m5kC1Pwcr353p1HVR0uZWTPLACo9V
 0nB9EmBQfepPFUMlOIOG2zvkHmwSKAwsraidiWa1vQZ5qNoUjhs/YcIyfNT6BaodBWT0H0VP1xv
 8o0vbhOHIyRYiQk2tE76YHWG8f2Cx+S0=
X-Received: by 2002:a05:622a:1194:: with SMTP id
 m20mr36321668qtk.175.1635838543167; 
 Tue, 02 Nov 2021 00:35:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgCMFcRKhxakF+WHeY34r8z0SD5/vJbTzmCYpdEUQZxEazA8fXPuPaczPOqbzHclYUw7OyPgDURCyhJ9u7iAA=
X-Received: by 2002:a05:622a:1194:: with SMTP id
 m20mr36321651qtk.175.1635838542995; 
 Tue, 02 Nov 2021 00:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-13-eperezma@redhat.com>
 <59e7f05d-6d1d-8c6f-cdba-d02034b49f20@redhat.com>
In-Reply-To: <59e7f05d-6d1d-8c6f-cdba-d02034b49f20@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 08:35:07 +0100
Message-ID: <CAJaqyWcd5zXgKzJU_G9R0uQJu6=nnR7DMeD_K0br2FHBi9108A@mail.gmail.com>
Subject: Re: [RFC PATCH v5 12/26] vhost: Route guest->host notification
 through shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 6:36 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/30 =E4=B8=8A=E5=8D=882:35, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > +/**
> > + * Enable or disable shadow virtqueue in a vhost vdpa device.
> > + *
> > + * This function is idempotent, to call it many times with the same va=
lue for
> > + * enable_svq will simply return success.
> > + *
> > + * @v       Vhost vdpa device
> > + * @enable  True to set SVQ mode
> > + * @errp    Error pointer
> > + */
> > +void vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable, Error **=
errp)
> > +{
>
>
> What happens if vhost_vpda is not stated when we try to enable svq?
> Another note is that, the vhost device could be stopped and started
> after svq is enabled/disabled. We need to deal with them.
>

Right, I didn't append it to the TODO list but it is in development.

Thanks!

> Thanks
>


