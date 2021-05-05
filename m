Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9A37378F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:30:55 +0200 (CEST)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDrq-0006Q6-AT
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDlr-0001Ql-2A
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:24:44 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leDll-00063a-3F
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:24:39 -0400
Received: by mail-qt1-x830.google.com with SMTP id 1so663688qtb.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/r4oUydODTvMXrB5vw1tllJRrd5sDO+tebrlhUMv+oc=;
 b=Amod4JvzNfRipWuib5piIsttHwAsbzePZwshAwM3oEdFB4xtcLrIcr/haKA5dHIpwt
 IAYeOFU3QG7ZrRaHxppRI1AaXtzGpXJyqMLuO2sRbzfDLGE2a6K3ej2MaYxqy/KOmeEX
 K28blIP1GjSczQOrG7Cxj6syzZcukTAR4tqR6IJ3A9KcI05utruVBaTehW6PMzp6pTYG
 h5bTKLxUjg5xa5BvYZ7xdD4zll5hDTMTxRAW2qCS7F6jNWkTCWSso5Go9gDtZNAfYLHF
 b+sG2widR+Lk/8l3jZX0S1mb0seAKmQDz/+JvMHwg2cQaiaWHzjwDtyBFJ15BGJyyVqH
 nMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/r4oUydODTvMXrB5vw1tllJRrd5sDO+tebrlhUMv+oc=;
 b=td888uq2Pn6jKZDXFxmquqktz+5ODfNnt3ZH7eQoilNgNRIVgY5xK7BkYjq7gUo5Z3
 UQgWKDhNDXcrNo7L86KvCb0BxAOVRqNqkQiP8MOxq26BZ4YowiaV5XAKFkFxsiO6kmWj
 m5imfCvRqNGb54DIHoH5N9Es0yNGcJPEzShdzL1H6wtEJ6pWMxfQTx80v93XICfWKUkN
 OaAZ298urgOqKspr9Tui1xlnMTIkJP6Xj6tQP2pGPPB2xAQwPrjjiSFvhh5dVdLZPvJY
 vgjnKKdhiKM+EQLz6SDd3bAFcIYK9B4WgXD0+GUlFT+soGzijhxQeT3Imoe0fJwGhFE8
 dl6Q==
X-Gm-Message-State: AOAM531fvPrI1BKkvwcau1QTH8i2uVGRguGoW2UYpTkgca/5sgTO2R8j
 UMsVKixIAw3SnS8OS65FYtz7fVblfSNdH3tKQ6Q=
X-Google-Smtp-Source: ABdhPJz/gGLkM0ZDbzm4GF7tOFIJENeo4Yy3zabezQbGlZrLiph9OJLqPgwtuYznTE907d9FHWDx3TwRIZ+lfnKRW68=
X-Received: by 2002:a05:622a:1704:: with SMTP id
 h4mr27154022qtk.30.1620206674737; 
 Wed, 05 May 2021 02:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-7-liq3ea@163.com>
 <qq3n3949-n544-no21-649q-rqq0r7569n19@erqung.pbz>
 <CAJ+F1CL0Wz88FgUT-SYJMZdXKzgnYUdv3SsHPEstz9uSyqvTrQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CL0Wz88FgUT-SYJMZdXKzgnYUdv3SsHPEstz9uSyqvTrQ@mail.gmail.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 5 May 2021 17:23:59 +0800
Message-ID: <CAKXe6SLmbnmBs2NhyP=8Vm51wQXxFKW9m2XAYYcVTb3dpmEsYg@mail.gmail.com>
Subject: Re: [PATCH 6/7] vhost-user-gpu: fix memory leak in
 'virgl_resource_attach_backing'
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=liq3ea@gmail.com; helo=mail-qt1-x830.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> =E4=BA=8E2021=E5=B9=B45=
=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:08=E5=86=99=E9=81=
=93=EF=BC=9A
>
> Hi
>
> On Wed, May 5, 2021 at 12:03 PM P J P <ppandit@redhat.com> wrote:
>>
>> +-- On Tue, 4 May 2021, Li Qiang wrote --+
>> | diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/v=
irgl.c
>> | index c669d73a1d..a16a311d80 100644
>> | --- a/contrib/vhost-user-gpu/virgl.c
>> | +++ b/contrib/vhost-user-gpu/virgl.c
>> | @@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
>> |          return;
>> |      }
>> |
>> | -    virgl_renderer_resource_attach_iov(att_rb.resource_id,
>> | +    ret =3D virgl_renderer_resource_attach_iov(att_rb.resource_id,
>> |                                         res_iovs, att_rb.nr_entries);
>> | +    if (ret !=3D 0) {
>> | +        g_free(res_iovs);
>> | +    }
>> |  }
>>
>> * Similar to earlier,
>>   hw/display/virtio-gpu-3d.c:virgl_resource_attach_backing() calls
>>   'virtio_gpu_cleanup_mapping_iov'
>>
>> * should it be same for vhost-user-gpu?
>>
>>
>
> Good question, that's also what you did when you fixed it for virtio-gpu =
in:
>
> commit 33243031dad02d161225ba99d782616da133f689
> Author: Li Qiang <liq3ea@gmail.com>
> Date:   Thu Dec 29 03:11:26 2016 -0500
>
>     virtio-gpu-3d: fix memory leak in resource attach backing
>

Do you mean this;
-->https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01156.html

I think there is no need for this.

The virtio_gpu_cleanup_mapping_iov is needed in virtio-gpu is because
it need map guest memory.
But in vhost-user-gpu case, the 'vg_create_mapping_iov' calls
'vu_gpa_to_va' and this function don't need
do map memory.

But for the beauty of symmetry we can abstract a function called
'vg_destroy_mapping_iov' and it just calls g_free(res->iov).
Like the pair 'virtio_gpu_create_mapping_iov' and 'virtio_gpu_cleanup_mappi=
ng'.

Thanks,
Li Qiang

>
> Btw, for each patch, it would be nice to have a reference to the original=
 fix in virtio-gpu.
>
> Thanks!
>

