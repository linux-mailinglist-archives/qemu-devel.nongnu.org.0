Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2743736CD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:11:10 +0200 (CEST)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDYj-0001nE-QQ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDVn-000811-0i
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:08:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDVl-0004Zw-A6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:08:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id b17so1129566ede.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1MyQRSbmCS2bMfFh3far3auQorFu8hbacn2k989wDCI=;
 b=RgWVz4n9onhhAtUGzKjm+e5VMBfM8JYa7CtfvVhV2/t7PrPFY98dBpEEOYauob/9rI
 9votSHSkJuFyRgchTxRDSZinNTfXNnl6C+bc3clKOIRKHzCp66S6uVu1XTAF8sqkYIz/
 sFzRYvxHrZyknKAV4y05zY8jVEUZUAukVdQZDs220aIgI8kwOcy15LYbJqXYV1KydegQ
 hTOikak+Mwp+i0/xhfhDORX6cXmJkL/8TbLpSpOKMoGNa1+8PJmEdp0iQz+IVwJiL7Zq
 +oDjoFzjK0WlME9Dkd5UN2624pQ+ATTLJ04CiZ1ovDeGgpGjNPf2qF1Qb6sCogJy5Jq+
 aOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1MyQRSbmCS2bMfFh3far3auQorFu8hbacn2k989wDCI=;
 b=tGgiL2ewMzgtIiaTE2yvcGiNXXIFm9qxypIt1dflJ72GMXBvd3DH1fW6xCrIy9DX30
 MvlKvaaa1B7Me4lJymOrd85U4TXvJrVYfmo0+p0tNUcBqe/3HmbXHdQd3wW/qjyG4Pgz
 w7jYAHRyjnX5OvUgyWb3HrDS2cL9AlSqWPIPKz0B+/tTgoYbJNiTzzUzB3S+8RZqmIXS
 SPApVh2L4NbBVJFbaQIFORBnxAMXSF3ZL7E0Fj1TtIPsqv/GzXGSYAcHZuDziGDBS3oL
 hsV8DpC+9zB22gYM3Y0v16DGDYNBu03zk0bh6X0dFJ6VEmpyngHVSxFnr80DA/0Oz4QV
 2GiQ==
X-Gm-Message-State: AOAM532UjVQPZW0ERpliZphKSo7r+XG+SswuYs5Xwu6zoijoKrevz3/M
 IolDfR1DE4ToRPvJCk7dkNi+OaA9CqUmrrIGrtU=
X-Google-Smtp-Source: ABdhPJwy09mSJ3mKl9PSQCPkphGW0U/YybiveIc9DyLwIImcWCOOKp8drrwcR5B5oDq7eGGFvjV1w/+n+9DQk3icZVE=
X-Received: by 2002:a05:6402:31a7:: with SMTP id
 dj7mr17403458edb.314.1620205682865; 
 Wed, 05 May 2021 02:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-7-liq3ea@163.com>
 <qq3n3949-n544-no21-649q-rqq0r7569n19@erqung.pbz>
In-Reply-To: <qq3n3949-n544-no21-649q-rqq0r7569n19@erqung.pbz>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 5 May 2021 13:07:51 +0400
Message-ID: <CAJ+F1CL0Wz88FgUT-SYJMZdXKzgnYUdv3SsHPEstz9uSyqvTrQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] vhost-user-gpu: fix memory leak in
 'virgl_resource_attach_backing'
To: P J P <ppandit@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000030ba0805c19188af"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Li Qiang <liq3ea@gmail.com>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030ba0805c19188af
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, May 5, 2021 at 12:03 PM P J P <ppandit@redhat.com> wrote:

> +-- On Tue, 4 May 2021, Li Qiang wrote --+
> | diff --git a/contrib/vhost-user-gpu/virgl.c
> b/contrib/vhost-user-gpu/virgl.c
> | index c669d73a1d..a16a311d80 100644
> | --- a/contrib/vhost-user-gpu/virgl.c
> | +++ b/contrib/vhost-user-gpu/virgl.c
> | @@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
> |          return;
> |      }
> |
> | -    virgl_renderer_resource_attach_iov(att_rb.resource_id,
> | +    ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
> |                                         res_iovs, att_rb.nr_entries);
> | +    if (ret != 0) {
> | +        g_free(res_iovs);
> | +    }
> |  }
>
> * Similar to earlier,
>   hw/display/virtio-gpu-3d.c:virgl_resource_attach_backing() calls
>   'virtio_gpu_cleanup_mapping_iov'
>
> * should it be same for vhost-user-gpu?
>
>
>
Good question, that's also what you did when you fixed it for virtio-gpu in:

commit 33243031dad02d161225ba99d782616da133f689
Author: Li Qiang <liq3ea@gmail.com>
Date:   Thu Dec 29 03:11:26 2016 -0500

    virtio-gpu-3d: fix memory leak in resource attach backing


Btw, for each patch, it would be nice to have a reference to the original
fix in virtio-gpu.

Thanks!

--00000000000030ba0805c19188af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 12:03 PM P J=
 P &lt;<a href=3D"mailto:ppandit@redhat.com">ppandit@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+-- On Tue, =
4 May 2021, Li Qiang wrote --+<br>
| diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virg=
l.c<br>
| index c669d73a1d..a16a311d80 100644<br>
| --- a/contrib/vhost-user-gpu/virgl.c<br>
| +++ b/contrib/vhost-user-gpu/virgl.c<br>
| @@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
|=C2=A0 =C2=A0 =C2=A0 }<br>
|=C2=A0 <br>
| -=C2=A0 =C2=A0 virgl_renderer_resource_attach_iov(att_rb.resource_id,<br>
| +=C2=A0 =C2=A0 ret =3D virgl_renderer_resource_attach_iov(att_rb.resource=
_id,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
s_iovs, att_rb.nr_entries);<br>
| +=C2=A0 =C2=A0 if (ret !=3D 0) {<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(res_iovs);<br>
| +=C2=A0 =C2=A0 }<br>
|=C2=A0 }<br>
<br>
* Similar to earlier, <br>
=C2=A0 hw/display/virtio-gpu-3d.c:virgl_resource_attach_backing() calls <br=
>
=C2=A0 &#39;virtio_gpu_cleanup_mapping_iov&#39;<br>
<br>
* should it be same for vhost-user-gpu?<br>
<br>
<br></blockquote><div><br></div><div>Good question, that&#39;s also what yo=
u did when you fixed it for virtio-gpu in:<br></div><div><br></div><div>com=
mit 33243031dad02d161225ba99d782616da133f689<br>Author: Li Qiang &lt;<a hre=
f=3D"mailto:liq3ea@gmail.com">liq3ea@gmail.com</a>&gt;<br>Date: =C2=A0 Thu =
Dec 29 03:11:26 2016 -0500<br><br>=C2=A0 =C2=A0 virtio-gpu-3d: fix memory l=
eak in resource attach backing</div><div><br></div><div>=C2=A0</div><div>Bt=
w, for each patch, it would be nice to have a reference to the original fix=
 in virtio-gpu.</div><div><br></div><div>Thanks!<br></div><div><br></div></=
div></div>

--00000000000030ba0805c19188af--

