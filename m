Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE4B538BCA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 09:07:24 +0200 (CEST)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvvyM-00020X-NI
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 03:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nvvss-0000Bj-K0
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nvvsp-0002fi-TF
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653980498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApjK9kOXmQExeIIWqdnaZeBX3PZvG9MCEjpw9y9dzic=;
 b=ZYy1y7I6iUp72+O56s3+AjPNwoLDcIUJ6d7zV21tV7+HVNX/Vfy/x6nQ/y15Y6/UCG2qkT
 4/v+hrXhdHBFeA/n5UzaP1HlC1sigHC6slBbkUEkGNAf1WDyVeOn+brVZE64+o3T8l5s0I
 Be/L0fqaJxwIhpWKZXp8NjN8vligdb8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-PX7QbMenPhKRPqPobF7XEg-1; Tue, 31 May 2022 03:01:37 -0400
X-MC-Unique: PX7QbMenPhKRPqPobF7XEg-1
Received: by mail-lj1-f199.google.com with SMTP id
 22-20020a05651c00d600b002554fae0896so529570ljr.8
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 00:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ApjK9kOXmQExeIIWqdnaZeBX3PZvG9MCEjpw9y9dzic=;
 b=f7mCluOQDbNhS5UIRMKRWCH4cnz/rB+Xe7yPWM2OKLdbf9/HFAN58SgqNLTqvbR6xk
 5wTyQbvcYdVv4CgJTTqWnE04Jphn3TMWhsQHA1jQvBydLSt2VC7Wm8W9TWi0u6UBw4Px
 03RBNHwt5ndC3aNiBicS63+zFAtfTEhIzhirMFTpInLYw/L6Eda6xaGgG6Jfup+UsK0i
 BGgxVnU7uAlQernKjLU8v22mAnkGlj10GL+GXBoh3468hC6VbKC/6X1lW4HppQ3A2Knh
 IqSUlI3IMxsA0jHF7ARwxNnT+3SzURSfrBLTi+jng5GK/TdrevO+nVCWV2VieeiA/3HM
 YOjQ==
X-Gm-Message-State: AOAM5332N++ykG8oJS3xgX7T1wOAj3v4VxftoyuSDtGHIJJs+LDyZAMf
 lDEccTpS20tCTcuBtA+OKVWeTtFitNo4bW6yr5Z79slh6TTrROkPjKAvrOKbkN6XOGNsJ/iJwqK
 0goxUJ/BMkmEHuAPgJqbI7tWpu8inej8=
X-Received: by 2002:a05:6512:39d2:b0:478:5ad6:1989 with SMTP id
 k18-20020a05651239d200b004785ad61989mr36472750lfu.98.1653980495549; 
 Tue, 31 May 2022 00:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd2ni6iPDW6ze5XS1XUXziUlX4Vihw5Uj52+3g2Q2iOBlNTWbzBbYW3hK4q4G6JlLmg2uM47PmjN4d98HtNRg=
X-Received: by 2002:a05:6512:39d2:b0:478:5ad6:1989 with SMTP id
 k18-20020a05651239d200b004785ad61989mr36472740lfu.98.1653980495381; Tue, 31
 May 2022 00:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220518073945.24787-1-cheptsov@ispras.ru>
In-Reply-To: <20220518073945.24787-1-cheptsov@ispras.ru>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 31 May 2022 15:01:24 +0800
Message-ID: <CACGkMEvhBWkcQwJD3eqY7f2=nqxC6RPBdhMq0iq=qi7NpuJ_3w@mail.gmail.com>
Subject: Re: [PATCH v2] net: fix multicast support with BSD (macOS) socket
 implementations
To: Vitaly Cheptsov <cheptsov@ispras.ru>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, May 18, 2022 at 3:40 PM Vitaly Cheptsov <cheptsov@ispras.ru> wrote:
>

Hi Vitaly:

We need a changelog to describe why we need this.

Thanks

> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
> ---
>  net/socket.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/net/socket.c b/net/socket.c
> index bfd8596250..583f788a22 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -239,6 +239,22 @@ static int net_socket_mcast_create(struct sockaddr_i=
n *mcastaddr,
>          return -1;
>      }
>
> +#ifdef __APPLE__
> +    val =3D 1;
> +    ret =3D qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &val, sizeof(v=
al));
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno,
> +                         "can't set socket option SO_REUSEPORT");
> +        goto fail;
> +    }
> +
> +    struct sockaddr_in bindaddr;
> +    memset(&bindaddr, 0, sizeof(bindaddr));
> +    bindaddr.sin_family =3D AF_INET;
> +    bindaddr.sin_addr.s_addr =3D htonl(INADDR_ANY);
> +    bindaddr.sin_port =3D mcastaddr->sin_port;
> +    ret =3D bind(fd, (struct sockaddr *)&bindaddr, sizeof(bindaddr));
> +#else
>      /* Allow multiple sockets to bind the same multicast ip and port by =
setting
>       * SO_REUSEADDR. This is the only situation where SO_REUSEADDR shoul=
d be set
>       * on windows. Use socket_set_fast_reuse otherwise as it sets SO_REU=
SEADDR
> @@ -253,6 +269,8 @@ static int net_socket_mcast_create(struct sockaddr_in=
 *mcastaddr,
>      }
>
>      ret =3D bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr));
> +#endif
> +
>      if (ret < 0) {
>          error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
>                           inet_ntoa(mcastaddr->sin_addr));
> --
> 2.32.1 (Apple Git-133)
>


