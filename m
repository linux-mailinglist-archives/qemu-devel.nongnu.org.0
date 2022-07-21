Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F957D22F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 19:05:12 +0200 (CEST)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZbr-0005wW-7W
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 13:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZXN-0001HA-TV
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 13:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZXJ-0003qP-3G
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 13:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658422827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ryy2otNmGAL7oztYCI6XS9dEvSYiqgls3vd3aQK5IIQ=;
 b=iXH5iJ9ik71qJBxRSo88OghKUn7+Q6HF+IZq0dny6YoFhstz4q92PajBWPMywcH+SyqMPx
 nOUItqvtfbok+7mtdMaUpynz/eL6CFeMNz6zcj2k4hIXKUm/fXCP1ZUzkLG1JPI+k18HEX
 /IdOAhK2OpFqaJKm891171KKymuseyg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-AtapV9H2M6iwsOx09itB-A-1; Thu, 21 Jul 2022 13:00:26 -0400
X-MC-Unique: AtapV9H2M6iwsOx09itB-A-1
Received: by mail-qt1-f199.google.com with SMTP id
 ay25-20020a05622a229900b0031ef5fdf8f8so1385139qtb.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 10:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ryy2otNmGAL7oztYCI6XS9dEvSYiqgls3vd3aQK5IIQ=;
 b=FjkohbtJNPf9kNjBcEu9Ng8+UtpDRamE9EFHE8UfhkkdwtdkNxuAhjA8glOP7XBIRy
 8uiiNyL9SRM0o05ieX7koFLJ+nWTVv4LrkX/fWaTwVsBM3cjwHvaIRRBu5YzuOfGkKjB
 zaPSZr47Qhu8IXVgSZCGa5L0o+2pqaWe2Bg6nBNVyCYDLy4Txab2gn5kMy7mcMdpBU5/
 a/BbMAw3Efs1Sq/GVIpXFUW9SpRH+Er4NdTID0Tmnc3EIkgsm9MW4nepRVjmE2G+X0ld
 SlVNAGkghCNYeSn1PasKehFkFBREjVsIBm4usqXGBFfyXfLLPByRgiaPppMwu6uI0dT7
 U2gw==
X-Gm-Message-State: AJIora97EcFdK3CkqTKVh31C5OmRhnc8yD8jICqhxIDILuZeo2MTY7GW
 1iOWp6kNA+KX/4VnVGp5OoO6lenPUlT77Wisj41H3yWnzlETm0jUBkh63kdstsOAPtIODMv79mi
 a8icaiNZJY2Q5t3v0As6LdIGXYCDFZrQ=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr24894349qkp.255.1658422825240; 
 Thu, 21 Jul 2022 10:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnrd05rwPVPhN+Od/WeOCtvhGEQH6mJaZnXFBzlWUmL+yy9wU8bpA4P5IEQT019hk8vORMmF3QHyFxcCOXaSA=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr24894314qkp.255.1658422824948; Thu, 21
 Jul 2022 10:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220721164331.3328625-1-eperezma@redhat.com>
In-Reply-To: <20220721164331.3328625-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 21 Jul 2022 18:59:49 +0200
Message-ID: <CAJaqyWdtEVYOYunaYSGGJChvt6H9orKLRd7ghn05V7vhwv7Jxg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Control VQ is the way net devices use to send changes
 to the device state, like
To: qemu-level <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cornelia Huck <cohuck@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 6:53 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
>
> QEMU needs to intercept this queue so it can track these changes and is a=
ble to
> migrate the device. It can do it from 1576dbb5bbc4 ("vdpa: Add x-svq to
> NetdevVhostVDPAOptions"). However, to enable x-svq implies to shadow all =
VirtIO
> device's virtqueues, which will damage performance.
>
> This series adds address space isolation, so the device and the guest
> communicate directly with them (passthrough) and CVQ communication is spl=
it in
> two: The guest communicates with QEMU and QEMU forwards the commands to t=
he
> device.
>
> This series is based on [1], although each one of them adds a feature on
> isolation and could be merged individually once conflicts are solved.
>
> Comments are welcome. Thanks!
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03101.htm=
l
>

The title of this series should be "vDPA net ASID support" or
something like that, I forgot that first line by mistake.

Should I resend it or can it stay like that?

Thanks!


