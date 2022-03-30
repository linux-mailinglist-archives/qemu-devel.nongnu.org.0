Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD384ECCE0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:03:28 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdbL-0003Wa-JY
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:03:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZdZl-0001Po-KB
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 15:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZdZi-0007dZ-F8
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 15:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648666905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heC29Ckv00kf/+U9WNcNbOY0CLKJgJAOgYHpm7kRdVo=;
 b=e/1aEzOPLzF/4A8nchhSz0pehrqbTxIoZFF113vhits9tmWN52t2jLZ5uLcl0BJPiPGwXl
 NAVDKVe0DMl03AS2+sDKqVY76t71HAX/r3ttpgnN2/cMxKZmgL73wwd9ZsUUdwX87J2HRo
 k04crbN1KGvChDofdudR/BDy3fDApKc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-TLtWZT-6PIa2uj7KDxZRGQ-1; Wed, 30 Mar 2022 15:01:43 -0400
X-MC-Unique: TLtWZT-6PIa2uj7KDxZRGQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 12-20020a37090c000000b0067b32f93b90so13153639qkj.16
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 12:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=heC29Ckv00kf/+U9WNcNbOY0CLKJgJAOgYHpm7kRdVo=;
 b=XCK3m5Pk/Wm3PNqkslM1Q0cx/Xwq6eaKW/kgwpB/c7l07wF4cMDy4c3jAVfXqn1GkZ
 cSAiyusz9iDi3I4OjJq3F7vTnSz5Xfmqu+7PBnhbZIMC0vosCZh4RCWl8Pt7TssBfm6x
 5OjCcJZlsn+fNfrfdB/uJKBzlUB7CmixZwbzVGmH0J+r8HlSyF5BPJ/71yCDP638rrZr
 qE/YXOFhgqG9na6BsZBNYutBxf3sqfAS2s3He5Yt5pSFj9IHwscgTkKcVUxqe9d4Cyid
 DGmvYEC5tjWMQvq2bmfvHM++Gdo4SG1WyFI8Wq5Ts0nWOBkKQZV70QorjYj//zt/KEo0
 dZdg==
X-Gm-Message-State: AOAM531S7BeqXY59L36ubXUna/Vaa6Kha7rUA+W44xjkabSAClK7WAKr
 TKnHZeWzI1ZkfQHCRsvVVQQsdbESNrCgzi3LLKzDZXXg8TiyJCArViHI/dXNEtZPL46x9Gxvs18
 Tpw36y+xjM0svOMnrgo0LGRNZtW5dw5U=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr997686qtf.320.1648666902105; 
 Wed, 30 Mar 2022 12:01:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrExZ4mawynbzmoF8x64obJWsG4ulW7bMaKtszCD0A4U3wmibHpP/EaEH9NFMTexNvJZo3ImryP66kZ3ysbmg=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr997634qtf.320.1648666901597; Wed, 30 Mar
 2022 12:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 30 Mar 2022 21:01:05 +0200
Message-ID: <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
To: Si-Wei Liu <si-wei.liu@oracle.com>
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
Cc: Jason Wang <jasowang@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 8:33 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> The vhost_vdpa_one_time_request() branch in
> vhost_vdpa_set_backend_cap() incorrectly sends down
> iotls on vhost_dev with non-zero index. This may
> end up with multiple VHOST_SET_BACKEND_FEATURES
> ioctl calls sent down on the vhost-vdpa fd that is
> shared between all these vhost_dev's.
>

Not only that. This means that qemu thinks the device supports iotlb
batching as long as the device does not have cvq. If vdpa does not
support batching, it will return an error later with no possibility of
doing it ok. Some open questions:

Should we make the vdpa driver return error as long as a feature is
used but not set by qemu, or let it as undefined? I guess we have to
keep the batching at least without checking so the kernel supports old
versions of qemu.

On the other hand, should we return an error if IOTLB_MSG_V2 is not
supported here? We're basically assuming it in other functions.

> To fix it, send down ioctl only once via the first
> vhost_dev with index 0. Toggle the polarity of the
> vhost_vdpa_one_time_request() test would do the trick.
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c5ed7a3..27ea706 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_de=
v *dev)
>
>      features &=3D f;
>
> -    if (vhost_vdpa_one_time_request(dev)) {
> +    if (!vhost_vdpa_one_time_request(dev)) {
>          r =3D vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features=
);
>          if (r) {
>              return -EFAULT;
> --
> 1.8.3.1
>


