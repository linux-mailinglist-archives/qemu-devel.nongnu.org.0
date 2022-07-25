Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2C57F9E5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 09:09:18 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFsDN-00029l-3c
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 03:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFsAK-000797-99
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFsAF-0006qc-Dd
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658732762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elSTjRohIJiUeyPzNiwPS4DYIb0+TLcyHv+/MSTItP0=;
 b=OMiGTnwmhH2dXSQWw7tNIAjWOrjsRlOtfaqtO2AIf8xAC8YsTk5nsWekdI1QirUWohBOZ4
 vE6STMK/DuIfNJg+PtulakVoQbUSr9p5NIy4HTK6bZiePykzCilqwYrVpWk3aK+X77yszG
 xzGwiQg9vToKV93CPBkXvdaOk1Oe7iU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-Onr78sa5Paydpj7FZ9hyLA-1; Mon, 25 Jul 2022 03:06:00 -0400
X-MC-Unique: Onr78sa5Paydpj7FZ9hyLA-1
Received: by mail-lf1-f72.google.com with SMTP id
 t2-20020a19dc02000000b0048a097cd904so3232408lfg.17
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 00:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=elSTjRohIJiUeyPzNiwPS4DYIb0+TLcyHv+/MSTItP0=;
 b=aL2w5b3/ENzfMhwU08/420ypI90WExWUDmMsj25HqqVhYQs2wBmby3E1AClJ20eSnK
 IxhjTcrH2VesI0mYbIzZPRx2SH3AXKjydQaI+6tLpdUkZjRPNYxtUPmjcKEpYvaTzJwW
 0V8OVJN5GVfdWVf4WbPsZpaMKG4eHMfA7x4+fIDSs1tPJWqG24OywYS0i/4JJGp95jw5
 UnF/AYIppYd27EZxfcpJMSdLToiW6f1FSIaAqykrhkcv4Qth46lmzk5ME4NYGUXAYbNl
 91Bf7fJLf0tBLIs0MHKxXU68hqYCdkGGkJam5o6NnhIJIRc6aFnSwGOOicoIEGg9+mHp
 u6Pg==
X-Gm-Message-State: AJIora/7I08DFKRtz0+WslfX0jN7QcrP54dGo0a3SfcwjXVuDbIfBXBA
 HBtKYeoWypj4TNIppgk7iNjv/DnaH0neBz+QRBTaWbBIdaX1prFKmTPRDkkaESz7MrGgNP5p7AN
 JXHe9GKeULe7TYEnU5rk8gIuuKzAQwlM=
X-Received: by 2002:a2e:a99e:0:b0:25e:a54:8328 with SMTP id
 x30-20020a2ea99e000000b0025e0a548328mr596359ljq.141.1658732759058; 
 Mon, 25 Jul 2022 00:05:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVmZVAqRDsXG4CFKHCnFQ7vli9uxz3ycKXJfYa08PVb4jwQ6ZGxT+PFAf9lYLcsaSteNeKJqrYES7Uo/q6kUI=
X-Received: by 2002:a2e:a99e:0:b0:25e:a54:8328 with SMTP id
 x30-20020a2ea99e000000b0025e0a548328mr596350ljq.141.1658732758748; Mon, 25
 Jul 2022 00:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220722082630.3371384-1-eperezma@redhat.com>
In-Reply-To: <20220722082630.3371384-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Jul 2022 15:05:47 +0800
Message-ID: <CACGkMEu-kmHBbOevmMOcUW9eSk4N2-6_QAS1HTqz0cwduU4jaQ@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Fix memory listener deletions of iova tree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 22, 2022 at 4:26 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> vhost_vdpa_listener_region_del is always deleting the first iova entry
> of the tree, since it's using the needle iova instead of the result's
> one.
>
> This was detected using a vga virtual device in the VM using vdpa SVQ.
> It makes some extra memory adding and deleting, so the wrong one was
> mapped / unmapped. This was undetected before since all the memory was
> mappend and unmapped totally without that device, but other conditions
> could trigger it too:
>
> * mem_region was with .iova =3D 0, .translated_addr =3D (correct GPA).
> * iova_tree_find_iova returned right result, but does not update
>   mem_region.
> * iova_tree_remove always removed region with .iova =3D 0. Right iova wer=
e
>   sent to the device.
> * Next map will fill the first region with .iova =3D 0, causing a mapping
>   with the same iova and device complains, if the next action is a map.
> * Next unmap will cause to try to unmap again iova =3D 0, causing the
>   device to complain that no region was mapped at iova =3D 0.
>
> Fixes: 34e3c94edaef ("vdpa: Add custom IOTLB translations to SVQ")
> Reported-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 291cd19054..00e990ea40 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -290,7 +290,7 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>
>          result =3D vhost_iova_tree_find_iova(v->iova_tree, &mem_region);
>          iova =3D result->iova;
> -        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> +        vhost_iova_tree_remove(v->iova_tree, result);
>      }
>      vhost_vdpa_iotlb_batch_begin_once(v);
>      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> --
> 2.31.1
>


