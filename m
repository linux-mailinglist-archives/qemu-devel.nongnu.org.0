Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEEE3736D9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:15:38 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDd3-0005aK-PL
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDZj-0003uY-Ek
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:12:11 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:34335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDZh-0006zS-Lo
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:12:11 -0400
Received: by mail-qt1-x82f.google.com with SMTP id o1so629412qta.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Es1fNdshS3RNC+LDe4IGMs73DDxIGOGN7GWe3B5gIo=;
 b=myyIGwFF++nakBx1OpJRyhWVZIU0f9yj5WBFwuVwCE4yyyi6mf9OkDnkhFOj43zYlT
 N1X4JWQgFiUgprJJoX1OJSR2MIj1+k9MBA5zZEjsJyPGMcDyKuDYkAEBSmgz9dnDNW32
 nUEFYa8BMrLPdVTkWLXzQ8bQK47RrO3CeU20dyVzheCSAB5JzDmJyBT65MbluJSJX6/u
 ySyf+mGiEhogecX0O3q5izOuBe1ahZY5DyMpZ7aEOeH6xUbJi68fCg63gbUNHY3ao8xD
 fKgrvEpIoTBo9oDomGDt6/3rtVUGXxv2d2VZD/zVK/HpE3Tak1ExzzfhveNBuszupFns
 u0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Es1fNdshS3RNC+LDe4IGMs73DDxIGOGN7GWe3B5gIo=;
 b=R+p+RA82HglBD27IBtLTDEMa7rC6ZEa8qDwdGpRP+78hAeik7z0lU5i9qnXqzppTh6
 TaGB2SrVvB1z1uMz4CXABiLMepRaOIwcCeExg0yaOh6mPtbAmXaMM+gycdMDGicuku1m
 2GlNmw1/P4OTmwFGYM3ThuoqrpdNFR7oLmGYw5EkgBjR1hRkOO5xUBXwh6LrKUXEY3sb
 bzzrDsBijHiBbY3a8M0G+SCTGKmhP7Puq31PnN1J8SgwfRJjgwOjT+DX3ATQs6/f7F1a
 jmxfrdMXuHT4bnEaHPOlIedRdyElfNw1eVQIeLooucj716iwtQ7l7cDncDf6G/uMIfZw
 nqSA==
X-Gm-Message-State: AOAM530OXt0OMl6eMy5Dnqmd/TuPFF+XxJqWwxO/XQxZsXqWfaSReO1K
 dPXoKzo8wi1tHQQt1nBzjc4HgufgVNt+PSEdkNo=
X-Google-Smtp-Source: ABdhPJxxHSvLxuYQlOF5EjNYFFz/YazkE5mOIg3/Ij6kAviRatCnNHkMRdCafLRlcM4TPOOFeQ8xmD8JBoyDSO8LD0I=
X-Received: by 2002:ac8:d83:: with SMTP id s3mr26547253qti.333.1620205928737; 
 Wed, 05 May 2021 02:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-4-liq3ea@163.com>
 <69s57r0-9534-294-p4ns-o56p9698o9p@erqung.pbz>
In-Reply-To: <69s57r0-9534-294-p4ns-o56p9698o9p@erqung.pbz>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 5 May 2021 17:11:33 +0800
Message-ID: <CAKXe6SJdXbi5DPTSXy=ceS_AtBNjKqbK5M2GV3tzNMpeE3m=1w@mail.gmail.com>
Subject: Re: [PATCH 3/7] vhost-user-gpu: fix memory leak in
 vg_resource_attach_backing
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=liq3ea@gmail.com; helo=mail-qt1-x82f.google.com
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
=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:39=E5=86=99=E9=81=93=EF=BC=9A
>
> +-- On Tue, 4 May 2021, Li Qiang wrote --+
> | Check whether the 'res' has already been attach_backing to avoid
> | memory leak.
> |
> | Signed-off-by: Li Qiang <liq3ea@163.com>
> | ---
> |  contrib/vhost-user-gpu/vhost-user-gpu.c | 5 +++++
> |  1 file changed, 5 insertions(+)
> |
> | diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-us=
er-gpu/vhost-user-gpu.c
> | index b5e153d0d6..0437e52b64 100644
> | --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> | +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> | @@ -489,6 +489,11 @@ vg_resource_attach_backing(VuGpu *g,
> |          return;
> |      }
> |
> | +    if (res->iov) {
> | +        cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
> | +        return;
> | +    }
> | +
> |      ret =3D vg_create_mapping_iov(g, &ab, cmd, &res->iov);
> |      if (ret !=3D 0) {
> |          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>
>
> * While it'll work, should the check be done by 'virtio_gpu_find_resource=
()'
>   before returning 'res' ? ie. if 'res->iov' is being used, then it's sim=
ilar
>   case as 'illegal resource specified %d'.

No, 'virtio_gpu_find_resource' is a general function and is used in a lot p=
lace
and 'res->iov' is specified to 'vg_resource_[de]attach_backing' so we shoul=
d do
this check in 'vg_resource_attach_backing'.

Thanks,
Li Qiang

>
>
> Thank you.
> --
>  - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
>

