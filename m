Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC442C8FD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:47:26 +0200 (CEST)
Received: from localhost ([::1]:60576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majHh-00016B-RF
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maixj-00023g-D5
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maixf-000655-Dj
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634149599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIexyks6trSE4vLyprIcGWiExaP7tJJPFto2dPxB1b4=;
 b=CwES9KYYfUxZqKY27Uug88LZ16yRBBtg+QZnF4sthj7iWIIbiMGPrIBotLhBrTc2vT5Cu+
 uQdD4G8CoZmavW0y2O/1UlZmn72tBH/jM6/PWBYQGT40NsLwALxt/23K+M0qQYH0D7Y/gP
 a3YpyXYkUhq4kvtV+5r7vP7lnf+mhxM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-gMUsJvShMXS0RX05kU8sQw-1; Wed, 13 Oct 2021 14:26:37 -0400
X-MC-Unique: gMUsJvShMXS0RX05kU8sQw-1
Received: by mail-qt1-f198.google.com with SMTP id
 k1-20020ac80c01000000b002a79e319399so1516028qti.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mIexyks6trSE4vLyprIcGWiExaP7tJJPFto2dPxB1b4=;
 b=DwgSutR+Cvf8Gss05p061UURZdeeyXLyjgb62bO2uNfeGffWyfstaPcrbs2ctD1L0R
 rH0EG+a2fUUL8Nw+tO83id4ZVU4VM5SknGmRDquQg2wsVMDZt2Det/g/+4WGcjbjJexY
 gdqGhpsU4KcMzaAnWTSgUvTC9yKwV8SCTthom9a92ysHY9PxMkjz/6A8aRx0E3EIqjzh
 w+tdzsgTtVZeoO/O5yzzn8ZeOOgEbIf6Bhkjd36pXljlE6oxMHQYYq0Re1AGwsrxzCM2
 Uex7/5Ccbrf8rKqtt9uvj3OagxAw2qIEG4FQwvrBZC73kvzH//CUjQGrFc3lQl0491+t
 Rzow==
X-Gm-Message-State: AOAM531oaZ8fi1nBybmWmepuT9zuDBj0/mG+r2KlzlCuJZ7xoqWXnIDP
 i9p5S4TNNaQp9CbNIlekdLymtZiMCS407LPP897YwFUGOwBjvb7vQo4g1LbTmX60fJdDxaGMoJz
 /f+oJJQ/IPg1StqkE9SauFOu+qwWOJKk=
X-Received: by 2002:a05:6214:1763:: with SMTP id
 et3mr790933qvb.37.1634149597394; 
 Wed, 13 Oct 2021 11:26:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRFt/7cjPVChdZyGIAZoygkpUKw3Tdx8nF4d8DyPJS8dttXav/oxK+uXEu9B07GjNxskcF8Jvj/T0WcYYcfRo=
X-Received: by 2002:a05:6214:1763:: with SMTP id
 et3mr790913qvb.37.1634149597223; 
 Wed, 13 Oct 2021 11:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211012155001.811160-1-eperezma@redhat.com>
 <20211012155001.811160-2-eperezma@redhat.com>
 <4af0e643-b80a-7a77-bf4c-f3bff68d70f7@redhat.com>
In-Reply-To: <4af0e643-b80a-7a77-bf4c-f3bff68d70f7@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 13 Oct 2021 20:26:01 +0200
Message-ID: <CAJaqyWd_h3ci04D5223uaiy2-SRJfpo6vPx63spXsb4oJe_0Rw@mail.gmail.com>
Subject: Re: [PATCH 1/1] util: Make some iova_tree parameters const
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 12:21 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 10/12/21 17:50, Eugenio P=C3=A9rez wrote:
> > As qemu guidelines:
> > Unless a pointer is used to modify the pointed-to storage, give it the
> > "const" attribute.
> >
> > In the particular case of iova_tree_find it allows to enforce what is
> > requested by its comment, since the compiler would shout in case of
> > modifying or freeing the const-qualified returned pointer.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/qemu/iova-tree.h |  8 ++++----
> >  hw/i386/intel_iommu.c    |  2 +-
> >  util/iova-tree.c         | 10 +++++-----
> >  3 files changed, 10 insertions(+), 10 deletions(-)
>
> > -DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova)
> > +const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova=
)
> >  {
> >      DMAMap map =3D { .iova =3D iova, .size =3D 0 };
>
> You missed this one ^
>
> With it declared const:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Right! Sending v2.

Thanks!


