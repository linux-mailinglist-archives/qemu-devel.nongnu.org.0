Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81D3736D0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:12:16 +0200 (CEST)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDZo-0003OM-0v
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDVf-0007tu-Ml
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:08:00 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDVb-0004Wc-MG
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:07:59 -0400
Received: by mail-qt1-x832.google.com with SMTP id o1so623659qta.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o9syYfayZQd/475CP6MDkv3DaFkxoR3gfpzTbDUzAoU=;
 b=sj1OwRz7UeGsokHUSdof4OeGqKyFIcKb4DWy+b73RayuwwObCvHn3R0MEXTjsUwaXm
 ZFO6BgnCEgYN14rG9X40+dWnkfB+ZOcNVExJ/xdLw4H7eMDlM418DUJWFHpCBEqnS735
 Y1gc0ToKhxcifYXeXEZs0F8vRSYjHu5M+mRwQgOoEkapjpjs5/wZZpX65RVwSXQFWv0d
 HxfCIlgXvRd4q3qEZcYKqpw0X2zAkVZupnLsdi2L038ZMg7/oQjCNDfOLMNlgb99FegH
 IV75eY74GaAocCCai+17TG6tqngDqaeYmHrFvS98yNsvc737suwml9QjXq6/qJ4N7TRM
 WfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o9syYfayZQd/475CP6MDkv3DaFkxoR3gfpzTbDUzAoU=;
 b=FqvvRg0VLxuxzIU3rP31XV3z6UdZ7IkVv2Bwa7a0pu5Ak4IWeqdYI9DIhJr7L8ZuNJ
 gGya5U0HQEVro9GAqGaD5KW56BM1YH20OUAxC/h+Ds6jgj9wRouHZvMbgC1tc+FKFh7R
 02POX5/CL4sMQW5cHULSxukgtYOETYuWZDY5t9diQ5dAOqmp7f5lzeK3wdjpkm0mZU0+
 VpfG9Xn1EbcyE7u6p/Qt5trYNp8Cq0lpgBq5re4Tq/aTpxnaBfL+D+kiG/vUe7wbGs1I
 n4cpQ78nmKDAyUiCbmYOsDHomBKnioSrEXK0osvEli93qDY79C9NFZ81MXsmFycoS9Qr
 is7g==
X-Gm-Message-State: AOAM533grc3z0g89iNZJwtRf+fp2mbajbfGN5swindBm8V62qZOdxdtE
 lDEoAGMbU5ilxGuyn6l4L8UnwQ/7+INGiJ9OJJg=
X-Google-Smtp-Source: ABdhPJydCwUu20RlpFIQglJkwHtg7gZepfDXxuJliv+e5EdDLsiW4Fal/OByrpow2J6GVMzxzfn2aP0+vzp0C4yNeiE=
X-Received: by 2002:ac8:d02:: with SMTP id q2mr26153356qti.110.1620205674818; 
 Wed, 05 May 2021 02:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-2-liq3ea@163.com>
 <8o22o26q-9342-o822-2758-372s9s59r2qn@erqung.pbz>
In-Reply-To: <8o22o26q-9342-o822-2758-372s9s59r2qn@erqung.pbz>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 5 May 2021 17:07:20 +0800
Message-ID: <CAKXe6SK_gwLad2khA9iJda2DJi2BDXSg=ZGpPUFqPQdb+V6tRw@mail.gmail.com>
Subject: Re: [PATCH 1/7] vhost-user-gpu: fix memory disclosure in
 virgl_cmd_get_capset_info
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=liq3ea@gmail.com; helo=mail-qt1-x832.google.com
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
=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:24=E5=86=99=E9=81=93=EF=BC=9A
>
> +-- On Tue, 4 May 2021, Li Qiang wrote --+
> | Otherwise some of the 'resp' will be leaked to guest.
> |
> | diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/vi=
rgl.c
> | index 9e6660c7ab..6a332d601f 100644
> |
> | +    memset(&resp, 0, sizeof(resp));
> |      if (info.capset_index =3D=3D 0) {
> |          resp.capset_id =3D VIRTIO_GPU_CAPSET_VIRGL;
> |          virgl_renderer_get_cap_set(resp.capset_id,
>
> -   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp.hdr));
>
> * While memset(3) is okay, should it also send header(hdr) size as 'resp_=
len'?
>

I don't think so. This function also set fields other than header such
as 'resp.capset_id', 'resp.capset_max_version' and so on.


Thanks,
Li Qiang

>
> Thank you.
> --
>  - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
>

