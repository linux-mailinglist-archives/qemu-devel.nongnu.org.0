Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E803F1519
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 10:23:14 +0200 (CEST)
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGdKT-0002h9-4P
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 04:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGdJT-0001P7-KF
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGdJO-0004Yb-3j
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629361324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cuL2Mpl0d5SUxzrq9bvkOQlwBgRZ+tMpJmn+DXpZmak=;
 b=BSbcotqJhnjcypVkLln/g2LrCnUZR50uZvCp9lFaPnm9RhCN3D8OOnqzl8QL8pM/8UjoXR
 z5dyHojGQ2A2ggAdElUlXatHe60nmSkB0gmEFcErQWTfpKfDK9glnryw5mcdP4Y1tHr/PL
 esUb5DgwxtOJmLvUqmq/kYRvsQb0B1w=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-ymh5PLuBOOSrbvNC68QDkQ-1; Thu, 19 Aug 2021 04:22:01 -0400
X-MC-Unique: ymh5PLuBOOSrbvNC68QDkQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 e17-20020a2ea551000000b001ba24d10343so1900846ljn.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 01:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cuL2Mpl0d5SUxzrq9bvkOQlwBgRZ+tMpJmn+DXpZmak=;
 b=VI84Rcp0h5b/OOyU8/emJsr1Xd5tvVCGS2IyX/77NoPQqkx+M8rRnS3wUHZpiKJiab
 MabfkstwRCQFrFdKq4sf8u7+0V/vhwQA1KTxTxAYVGeBlryY4US+W1eECug3TIlNe4Dc
 STw9m0GuioGISi8nAx+b5xGmV+8uegfyUklzRnTXWb1/0cRd166c0DDsCJNyft0SGb3Y
 i2GkAvvMwtKXF8+muGNYEbBJTyJcJSdRl+oXs3Ub/px4KXdcD4zSLOOT6HG/XJXrCtbE
 0uUDjgPDCU+QVZxPVTsJmtAC70cNS4s7Cu5DOig7L44aIUT8F09N1RPoPniqZQW+/iJc
 eaQQ==
X-Gm-Message-State: AOAM53012lbEGe8MjsyKiuGqGH58c4m+NQMHfUG2v/h7bSvUOJ11pHYw
 NYJZYLSc4zzIp3vbeO9LhiRtoI4gk9tli+xhemqwueVJ1F6IlLP+eIfL9AIXwKjR8gYzjEToTIs
 1UFbhJBRKIjGehE4OefLWbBdWvCRo6Mg=
X-Received: by 2002:a2e:2414:: with SMTP id k20mr11155979ljk.482.1629361320103; 
 Thu, 19 Aug 2021 01:22:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw205j7PuwDrqV1gW9y1ZKoOOedhnxgPBtLh9Fv+3Mb61uyL/dAnSzLmbRzaNh87s3pPKvbhvFY/CLrmMFn+U4=
X-Received: by 2002:a2e:2414:: with SMTP id k20mr11155954ljk.482.1629361319825; 
 Thu, 19 Aug 2021 01:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
In-Reply-To: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Aug 2021 16:21:48 +0800
Message-ID: <CACGkMEsfHNX4nO6y2a8wRZF42Pus8UpCk6+TNhbqTp-ecFKhpw@mail.gmail.com>
Subject: Re: Is QEMU's vmxnet3 still being used?
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Leonid Bloch <leonid@daynix.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 9:42 PM Thomas Huth <thuth@redhat.com> wrote:
>
>
>   Hi all,
>
> I recently noticed that we have quite a bunch of tickets against the vmxnet3
> device in our bug trackers, which indicate that this device could be used to
> crash QEMU in various ways:
>
>   https://gitlab.com/qemu-project/qemu/-/issues?state=opened&search=vmxnet3
>
>   https://bugs.launchpad.net/qemu?field.searchtext=vmxnet3
>
> Having hardly any knowledge about this device and its usage at all, I wonder
> how much it is still used out there in the wild?

I guess it might have been used for virt-v2v in the past.

But I'm not sure what's the status now.

Thanks

> If there are still many
> users of this device, is there anybody interested here in helping to get
> these crashes fixed in the near future? Otherwise, should we maybe rather
> mark this device as deprecated and remove it in a couple of releases? What
> do you think?
>
>   Thomas
>


