Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D8606E1D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 05:05:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliLJ-00064V-Be
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:05:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliJJ-0002f6-DE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliJB-0002Ps-SV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliJA-0007P2-Gr
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666321371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yoq36VxoHMsxyi59IkXWjEoN+qVzFBVdlHt1N1tXEhA=;
 b=I9EM6Cd18tJbN0Q0PWDskrkojByAdADZ82Upe16LNDYuplPJHMPxfDlbfAczlqHBu2cHF7
 5isyBc0CYp1fDZFOlSZeyEAU5xqwpZtF3iug8GJWmUb1vCGDyLJaZ4isaPly89028JUuFO
 faWxqOobXLugIbwqUWfoFJee0nRxUi4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-iC1dzwd5P3KOdL9hT0ULkA-1; Thu, 20 Oct 2022 23:02:50 -0400
X-MC-Unique: iC1dzwd5P3KOdL9hT0ULkA-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga20-20020a1709070c1400b0078db506c555so715566ejc.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 20:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yoq36VxoHMsxyi59IkXWjEoN+qVzFBVdlHt1N1tXEhA=;
 b=rUTTLomJiJ0PKanCf+a+wUIcUpghV4AEbSKmFhnDwYqLwJoKE8XsTeeZkIo3GOgGb5
 qutDKLWZymuv6N7QW2NgrPrKJepuqwLPENFR7rPHLJOiwGKfLMU/dRcSxUHU1O2F4n0v
 L8YznzMSWbmUxmCnb8FPURaO1cVdrtrt8i8Ys+0oseUquinKdwxwAoBKYii5Za5r3C7Q
 ASN+LrsfLnUfqsEAdTfiDsMDtFPHNYhOw50RbP6LMKoc18MvNGeBm9/jxAuF7TZxv4Of
 33UgDvcPF+9XnbUQT2tX0t1LFr6D+NKvFWcKC4BELaVjWqH7ZfH6KmyQKKSeoAyfyifH
 qo3Q==
X-Gm-Message-State: ACrzQf27CQ5DYeoovvY8eXKtu/DPl0n+Zu+1+wIf58KLJknIhSlt1hoJ
 uNmFFJ6NgvpX4N+PANl1vWvlvzwBsw86TeutLU0NpH4iwDUUOMByVlN4LScqxo6xpZYhdLsPlYQ
 jrwxqboOuDmwDYFUtZKitsk0jVB6FYdg=
X-Received: by 2002:a05:6402:1941:b0:457:13a:cce9 with SMTP id
 f1-20020a056402194100b00457013acce9mr15362003edz.265.1666321367519; 
 Thu, 20 Oct 2022 20:02:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ztxXheEuy6U6SzI+6mkXkc7kkegplsOumDcGCYv0ABSmCHSYL7PtPlNOE9j2lBreHOPOxsc1XT3QErtkEKMU=
X-Received: by 2002:a05:6402:1941:b0:457:13a:cce9 with SMTP id
 f1-20020a056402194100b00457013acce9mr15361993edz.265.1666321367373; Thu, 20
 Oct 2022 20:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221020080058.318454-1-eperezma@redhat.com>
In-Reply-To: <20221020080058.318454-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 11:02:33 +0800
Message-ID: <CACGkMEsSbb8_1gSuecw5uWajgEGr8vYnAZhEk6mpVWced_5XDQ@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Delete duplicated vdpa_feature_bits entry
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 4:01 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This entry was duplicated on referenced commit. Removing it.
>
> Fixes: 402378407dbd ("vhost-vdpa: multiqueue support")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

I've queued this.

Thanks

> ---
>  net/vhost-vdpa.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4bc3fd01a8..eebf29f5c1 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -63,7 +63,6 @@ const int vdpa_feature_bits[] =3D {
>      VIRTIO_NET_F_CTRL_RX,
>      VIRTIO_NET_F_CTRL_RX_EXTRA,
>      VIRTIO_NET_F_CTRL_VLAN,
> -    VIRTIO_NET_F_GUEST_ANNOUNCE,
>      VIRTIO_NET_F_CTRL_MAC_ADDR,
>      VIRTIO_NET_F_RSS,
>      VIRTIO_NET_F_MQ,
> --
> 2.31.1
>


