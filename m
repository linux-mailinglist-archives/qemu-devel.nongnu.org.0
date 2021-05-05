Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BEE373746
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:21:12 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDiR-0007ab-0C
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDcK-0005t6-TI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:14:52 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDcJ-00007U-AN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:14:52 -0400
Received: by mail-qk1-x731.google.com with SMTP id l129so829130qke.8
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5TaWIDgvwlgeslfkHd78sC8Bo4MzvBfi+qdbx32kllo=;
 b=QUCSVh/5GI1b9MvSFd8XrytzyxYPYxMNgNLXTgIjkt7iHzxwyQ4iIr88pxFN40pPMQ
 jnXJr1w9jvOW/1A63sN5OO306CKWWHpGX15CR3jZn6LOkmuskbA2hSHKQCDDHJSfYiRt
 BknhOb84W67ZPH1Ikb1X78Yg6RuBxVDC6BUw1+ZesmejzP1TuLflVJq5zGtiI6zhXV6a
 6gyi1ZpR+OLa+O8CWSgZwNgXRYvSAYUdJ9ZgBtvIEn2wx0Y/F3ZKm1JOYmNbn9K5Y0g/
 khxR5NtY0e55ap8gSk2KRR4KyQXAw+FLpyvpD3mYdWZwE3MWA0F+mCoHMNBZzibJo8Hs
 rU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5TaWIDgvwlgeslfkHd78sC8Bo4MzvBfi+qdbx32kllo=;
 b=Oo3NIF/6WGbLBNJL2Sb4C3inRuUvh22FAXqFprnkiLou9GXQpNPqdwZ+aoE73WRHR/
 SgPje5erImqpi6+Ptb6cQXdH3SPs/BjGZEgLUQavpPZ54uerdFC+80cwhQEpoqQjRoJM
 1TLwmyLpzcH3F9/Lre/pgLgHrFfkUoHuP8T4bcSMPwjqcCfgkbfT5ytPo8g3VaunsPhF
 jcFQqTlizppCEBt5zaSi9P9Ky8JbYUgWckURSL8XecF9KVArKQM3islKtXRUEgZr4eJt
 R2jnS6yAHDZKzoKmty7Yf3vv1Nu13QvuAehFxLHN5tMxPCaIw0vDeBLVhYW5hm5yRq+o
 0hAw==
X-Gm-Message-State: AOAM533XkwhrRNkSBZjHSeK18r7j64WszhC2ppeYVvqheVo2uvk9UwFL
 LSLgV808koftSEQDqjV0LoaJkFT5zhqL5ZUbsdk=
X-Google-Smtp-Source: ABdhPJyQCGmri+pq7lVvSPM3zRIqnvbi7i+zlWuoO6IOsU2KwvZILx2AqptZHvndXwjzBIj8sJEMZivskh5qhR5hzGw=
X-Received: by 2002:a37:8443:: with SMTP id g64mr29612838qkd.185.1620206090404; 
 Wed, 05 May 2021 02:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-6-liq3ea@163.com>
 <o617p20-s2pp-6p4n-69pn-31o9s74pq97r@erqung.pbz>
In-Reply-To: <o617p20-s2pp-6p4n-69pn-31o9s74pq97r@erqung.pbz>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 5 May 2021 17:14:15 +0800
Message-ID: <CAKXe6SJFf2eqcP+2b41GnVH8NsGMDvaBTAg-sgjP25WP++tHZw@mail.gmail.com>
Subject: Re: [PATCH 5/7] vhost-user-gpu: fix memory leak in
 'virgl_cmd_resource_unref'
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=liq3ea@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: marcandre lureau <marcandre.lureau@redhat.com>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

P J P <ppandit@redhat.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=885=E6=97=A5=E5=91=
=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:48=E5=86=99=E9=81=93=EF=BC=9A
>
> +-- On Tue, 4 May 2021, Li Qiang wrote --+
> | diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/vi=
rgl.c
> | index 6a332d601f..c669d73a1d 100644
> | --- a/contrib/vhost-user-gpu/virgl.c
> | +++ b/contrib/vhost-user-gpu/virgl.c
> | @@ -108,9 +108,16 @@ virgl_cmd_resource_unref(VuGpu *g,
> |                           struct virtio_gpu_ctrl_command *cmd)
> |  {
> |      struct virtio_gpu_resource_unref unref;
> | +    struct iovec *res_iovs =3D NULL;
> | +    int num_iovs =3D 0;
> |
> |      VUGPU_FILL_CMD(unref);
> |
> | +    virgl_renderer_resource_detach_iov(unref.resource_id,
> | +                                       &res_iovs,
> | +                                       &num_iovs);
> | +    g_free(res_iovs);
> | +
> |      virgl_renderer_resource_unref(unref.resource_id);
>
> * Should this also call 'virtio_gpu_cleanup_mapping_iov' similar to
>   'hw/display/virtio-gpu-3d.c:virgl_cmd_resource_unref'?
>
>     if (res_iovs !=3D NULL && num_iovs !=3D 0) {
>         virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
>     }
>
>

No because the resource here contains only 'res->iov' no memory mapping
like 'hw/display/virtio-gpu-3d.c:virgl_cmd_resource_unref'.

Thanks,
Li Qiang

> Thank you.
> --
>  - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
>

