Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754165A08C3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 08:19:07 +0200 (CEST)
Received: from localhost ([::1]:53540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6Co-0006Fk-DA
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 02:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR62t-0001sT-Ll
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR62k-0003we-K1
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661407721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qtvqKkIXeZD7/k3dpmQvAdiVno6xnExR96ET0XDvFMw=;
 b=hEGeBK/buVFkM8oOgxOitTz+4tkKOqL3GPfxyaQhqhoxXtG81ooRHF8dSL3LDpOfyx2VF7
 X/pL5VJdG14i3mYwNfNbYi3PI3LXNFP2IQcQwqXME2BSj0ehi8CIZyw0jY+eZ6cQOU7RFj
 ziN1f56PveAlwQkWAsuuH5KVFoWHSgI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-C0H8yavgOKqWkYoS3GTs8A-1; Thu, 25 Aug 2022 02:08:40 -0400
X-MC-Unique: C0H8yavgOKqWkYoS3GTs8A-1
Received: by mail-lf1-f70.google.com with SMTP id
 x7-20020a056512130700b00492c545b3cfso5520819lfu.11
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qtvqKkIXeZD7/k3dpmQvAdiVno6xnExR96ET0XDvFMw=;
 b=gjczm5JObbfKNpjaokun7yOp3XhOAj3ugVYPiWf2hcRNGApjC70QPagkT8LN0mFf7t
 yH5zrtoxjjCvoPGec28TeGPRQM2vjRH+Qfv2ndG0PfHNbfQxPGoPrl/peB+g8pznSfiZ
 2M1uW7ISMdvB9R+om4p4xgUoGSOvCXRC5a5nS7S02gykK7byCtHpA5SfOvpfC6z5xf00
 SbGQI0YfY9SCoez7zEOYJ+kXCXyKkdnAVo443pbYSE/3aKzsIuTw0yXyD1UnKWdbD5kf
 Ew4NzvLws2puCSYTgL6nqLIa/tl0e4v3onkJJHS5sJYvsua/X9UL7476Ys2E7GXlKEoD
 99Sg==
X-Gm-Message-State: ACgBeo354UGlAU78eiIxBINCY3esocW/R/18900Vsx3iVWOazyQnLXf1
 uEURW5WO+Exw050EFYWc+T6a1I7T7BNaakWzvs7MymRmryOyfs0rFFg4fLOrXRy0VxaHRTvC4nq
 Bg3nhG0QpjrzwNoMOtDGTFkGjlT+gBDY=
X-Received: by 2002:a05:6512:3da1:b0:48f:cad0:195a with SMTP id
 k33-20020a0565123da100b0048fcad0195amr664428lfv.397.1661407719075; 
 Wed, 24 Aug 2022 23:08:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR54RyUxaJTUF8o32LQV9y2v/wRnQ11oW7PlomuyqBpV9KShXf7a9ELtlYDf2HJ2XG4rbfOjyQAehiIerytRnc4=
X-Received: by 2002:a05:6512:3da1:b0:48f:cad0:195a with SMTP id
 k33-20020a0565123da100b0048fcad0195amr664419lfv.397.1661407718825; Wed, 24
 Aug 2022 23:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
In-Reply-To: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 14:08:27 +0800
Message-ID: <CACGkMEtkQ+AqrWYnDz-3tMQ0TS+eO53J7_zn_gJPmC3NqiN3qA@mail.gmail.com>
Subject: Re: [RFC 0/2] Virtio in order feature support for virtio-net device.
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Cc: eperezma <eperezma@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 18, 2022 at 11:13 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>
> In virtio-spec 1.1, new feature bit VIRTIO_F_IN_ORDER was introduced.
> When this feature has been negotiated, virtio driver will use
> descriptors in ring order: starting from offset 0 in the table, and
> wrapping around at the end of the table. Virtio devices will always use
> descriptors in the same order in which they have been made available.
> This can reduce virtio accesses to used ring.

So the bached used buffer seems like an optimization, I'd like
re-order the patches

1) Just enable virtio-net in-order without the batching, to see the performance
2) Add the batching optimization on top.

>
> Based on updated virtio-spec, this series realized IN_ORDER prototype
> for virtio-net device in QEMU.

Please share with us some performance numbers. E.g pps.

>
> Some work haven't been done in this patch series:
> 1. Virtio device in_order support for packed vq is left for the future.

Anything makes packed virtqueue special?

Thanks

>
> Related patches:
> In order feature in Linux(support virtio driver, vhost_test and vsock device): https://lkml.org/lkml/2022/8/17/643
>
> Guo Zhi (2):
>   virtio: expose used buffers
>   virtio: enable f_in_order feature for virtio-net
>
>  hw/net/virtio-net.c        | 30 +++++++++++++++++++++++++++---
>  include/hw/virtio/virtio.h |  4 +++-
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> --
> 2.17.1
>


