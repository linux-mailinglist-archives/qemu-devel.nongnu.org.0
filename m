Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271694EE612
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:32:32 +0200 (CEST)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na75T-00086N-8m
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:32:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na73a-0006Jr-Vj
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:30:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na73Y-0005dD-TK
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648780232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0Izd3I613P9CzGgMYJPxEUEMUA4QPcRASa85pagxRE=;
 b=M96HoAU/OL57s3YogHrop1YLckm+E20H7IheZ/xacIxj717qinT9LXRCyMKtf3sQExin+f
 Bty+dfEgdlGbzrEHiXZ2T0hqIi7U7TvwM0x0LfODd5Lzbku2yBDhGJM3u5hCLsHPSUTJcg
 QALPWqKl2xA0kEQ6yp8jplALd6l7was=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-gngvuijBNFqjFzEsIjoMYQ-1; Thu, 31 Mar 2022 22:30:30 -0400
X-MC-Unique: gngvuijBNFqjFzEsIjoMYQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 n2-20020a0565120ac200b0044a2c76f7e1so598854lfu.5
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W0Izd3I613P9CzGgMYJPxEUEMUA4QPcRASa85pagxRE=;
 b=lKU2msxI5ycWuLGBBXfHuFGKmQzfTJvXtG76ruzP3NYLhBCSVCbvM9lCiOusJLP4eK
 ANhHQTIndGxxtPeYn6sAq4Yt5IFenZLoJR8MgMVynSiXJWZ+YhN8QUHHjyx7Ht5jJDCV
 GKumhf+WByTz4o3IuR8h/QMlRPIMj1gs7s5npWGC9k8KIYjRtEnhgf3xJVGx4cuZ2p+m
 kqez0CD/+CuyvrmXSDXvddtf5TbKTgsJMUkyja2gZqAx2EqiXDwnVrtLeTUdaGBGaWFm
 Pa2dKw3rQ5l1mLYN7Ps/In3iA03r6IumnYDbq2jsEUvE7pTjwSNbwivCuF0J8Ngo/5H7
 s9jw==
X-Gm-Message-State: AOAM531tVL5bZLYeALd3BVW7w0L3mwrS7Yr+ssRpYLxhEcVx1rSfy2+K
 3r/YQ44mZnI0p/T35XTaiJahACP2/vHM/9msuR3xle7FaOIYYKESbhsHp/fLvUtbA7/PuyPoZ/T
 Lpg7Evn8C29jVPZAQT7eBxuor03RVlFw=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr12633050lfv.257.1648780229342; 
 Thu, 31 Mar 2022 19:30:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9d0MDtAM0UCocoMsdzm7PvWs8aetaQ4GSow8xPpjXG1e8aDT0dTF39SaINOBn2Tt22l5Q+T5YSRU22PULT5o=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr12633040lfv.257.1648780229125; Thu, 31
 Mar 2022 19:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220331181712.535039-1-eperezma@redhat.com>
In-Reply-To: <20220331181712.535039-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Apr 2022 10:30:17 +0800
Message-ID: <CACGkMEsikhiZ8dA7-9PgOSPeScPvwh7JqoW7dcWNCzm388-GVA@mail.gmail.com>
Subject: Re: [PATCH] util: Return void on iova_tree_remove
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 2:17 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> It always returns IOVA_OK so nobody uses it.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  include/qemu/iova-tree.h | 4 +---
>  util/iova-tree.c         | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index c938fb0793..16bbfdf5f8 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -72,10 +72,8 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map=
);
>   * provided.  The range does not need to be exactly what has inserted,
>   * all the mappings that are included in the provided range will be
>   * removed from the tree.  Here map->translated_addr is meaningless.
> - *
> - * Return: 0 if succeeded, or <0 if error.
>   */
> -int iova_tree_remove(IOVATree *tree, const DMAMap *map);
> +void iova_tree_remove(IOVATree *tree, const DMAMap *map);
>
>  /**
>   * iova_tree_find:
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 6dff29c1f6..fee530a579 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -164,15 +164,13 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_it=
erator iterator)
>      g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
>  }
>
> -int iova_tree_remove(IOVATree *tree, const DMAMap *map)
> +void iova_tree_remove(IOVATree *tree, const DMAMap *map)
>  {
>      const DMAMap *overlap;
>
>      while ((overlap =3D iova_tree_find(tree, map))) {
>          g_tree_remove(tree->tree, overlap);
>      }
> -
> -    return IOVA_OK;
>  }
>
>  /**
> --
> 2.27.0
>


