Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B769702BAA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:40:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWXH-0002XC-DU; Mon, 15 May 2023 07:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pyWXD-0002Wc-Jy
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:38:35 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pyWX0-0005WD-OS
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:38:24 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f2510b2b98so10424542e87.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684150696; x=1686742696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xvf3hV3dOUYPq+ST529nAjJ0JWosKJsHlMCh/YsHiWU=;
 b=kc2laDc3UgLwto4Q4LX5ZsudUwkqFGSB+aujfF4J2fhF1IvlP672oshOb/o9AEohPf
 ddPP72hzjntU/NdDQektzb1QnxH47FiW/4BlfTgK5mb8+pJIwGAIVg+ApWiYFZgxnisb
 jA0Tvl2R4Z7KsrpWZscsPNTFhgzrAo2nEeWiFIEmlyPIfNUoMPQ8kIJDbcU6k/POcOu+
 sHVA8PAU5Qlp0enKb6fzeqsz13HY8lVHAWFgsJjGvSSFurLaHzoCqve+3dN2nvtHA7oF
 BQl7XkAQjHK7YHUoKcVy5LF4LqcRPIBnmFPkA547xTdPbgbQ5FMT/6VZhIBuDdqUdrHD
 Beyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684150696; x=1686742696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xvf3hV3dOUYPq+ST529nAjJ0JWosKJsHlMCh/YsHiWU=;
 b=WcSGEG5EPJZ+2VOAhivexiAzsXhrtYs8C1fXwTtPye3jlBlZtBvXG6hc5hoyzgJG/w
 C+TH5lRzXv4SGZzhTbetgNqT6mkBBk01t42bTu8ZMXQTrj5dfCTifJcHfRHWAUgDx63o
 H4W2+GGX1tnQx6HKK8HqSJchxxEY4LPc3WFLBZC8PXIYhYDAez2+dBSk3p/PHROfiL5k
 XRuaFRypPl81Gce0/6IbePYLygtVYoC3Y1zqvqQCE96l0yX8cuB/G72Tepe09UhH8ry3
 KotJxtIIMQOoBif7jJPbyJZaBCwXqqQ+7pNhgA/xfm0Rxire8wm93vfWWzdIqyJeKobo
 ykwA==
X-Gm-Message-State: AC+VfDysxSAgndy7nFtM+3BUPQFbgfk00p1XSKgFc6/3ht3XjXtQ5koU
 LKDBVpLU26Td1cCkkgIiyR2pR/i0D+FZ5hpxEJ8=
X-Google-Smtp-Source: ACHHUZ5GYHF7wQseypyarCtrOsBgXbHSzdbfPKMQIpmejbwI/dL3KvN49j1KetZ5ab62SCoHa3Xj8wqfJxEu6m6wqp8=
X-Received: by 2002:ac2:4e63:0:b0:4f0:1a32:ca23 with SMTP id
 y3-20020ac24e63000000b004f01a32ca23mr6019593lfs.40.1684150696120; Mon, 15 May
 2023 04:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230511125803.594963-1-ernunes@redhat.com>
In-Reply-To: <20230511125803.594963-1-ernunes@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 15 May 2023 15:38:04 +0400
Message-ID: <CAJ+F1CK8+kPrGZfhWnk=91tUQCAggH=qHXjZ73K9ZF0t-1aTBA@mail.gmail.com>
Subject: Re: [PATCH 0/2] vhost-user-gpu get_edid feature
To: Erico Nunes <ernunes@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, kraxel@redhat.com
Content-Type: multipart/alternative; boundary="000000000000fd97a005fbb9e3d5"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000fd97a005fbb9e3d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 11, 2023 at 5:02=E2=80=AFPM Erico Nunes <ernunes@redhat.com> wr=
ote:

> This adds support to the virtio-gpu get_edid command when using the
> vhost-user-gpu implementation in contrib/.
> So far, qemu has been outputting the following message:
>   EDID requested but the backend doesn't support it.
> when using that implementation.
>
> This is tested with vhost-user-gpu, the dbus ui backend and the
> monitor-edid application, which now shows complete "QEMU Monitor" edid
> data.
>
> In this v1, I would appreciate some feedback especially regarding:
> - Can we enable it by default or do need to create another config option
>   flag for it?
>

Enabled as default is ok I think


> - Can we now also remove the "EDID requested but the backend doesn't
>   support it." warning and logic from hw/display or do we still want to
>   keep that around for other potential implementations of
>   vhost-user-gpu?
>

Imho, that should remain. (vhost-user-gpu could have set edid=3Dfalse by
default to avoid this error, but then it would need to be explicitly turned
on to match the backend implementation)


> - The structs used as payloads of the vhost-user-gpu messages. Looks
>   like there was no command so far requiring bidirectional messages with
>   different payloads so I just based it on similar available ones.
>
>
That looks fine to me


> Thanks
>
>
> Erico Nunes (2):
>   virtio-gpu: refactor generate_edid function to virtio_gpu_base
>   vhost-user-gpu: implement get_edid feature
>
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 53 ++++++++++++++++++++++++-
>  contrib/vhost-user-gpu/virgl.c          |  3 ++
>  contrib/vhost-user-gpu/vugpu.h          |  8 ++++
>  docs/interop/vhost-user-gpu.rst         |  9 +++++
>  hw/display/vhost-user-gpu.c             | 31 +++++++++++++++
>  hw/display/virtio-gpu-base.c            | 17 ++++++++
>  hw/display/virtio-gpu.c                 | 20 +---------
>  include/hw/virtio/virtio-gpu.h          |  2 +
>  8 files changed, 122 insertions(+), 21 deletions(-)
>
> --
> 2.39.2
>
>
>
I wonder if the backend couldn't have avoided the need for calling the
front-end (the VHOST_USER_GPU_GET_EDID call). But after all, it can still
implement it on its own, so it's optional anyway.

However, I worry about using the new backend (calling GET_EDID) with an
older front-end/QEMU. It may just hang, since
vhost_user_gpu_handle_display() won't reply to unknown messages. That's
what PROTOCOL_FEATURES were meant for, iirc. Can you check? thanks


--=20
Marc-Andr=C3=A9 Lureau

--000000000000fd97a005fbb9e3d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 11, 2023 at 5:02=E2=80=
=AFPM Erico Nunes &lt;<a href=3D"mailto:ernunes@redhat.com">ernunes@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">This adds support to the virtio-gpu get_edid command when using the<br>
vhost-user-gpu implementation in contrib/.<br>
So far, qemu has been outputting the following message:<br>
=C2=A0 EDID requested but the backend doesn&#39;t support it.<br>
when using that implementation.<br>
<br>
This is tested with vhost-user-gpu, the dbus ui backend and the<br>
monitor-edid application, which now shows complete &quot;QEMU Monitor&quot;=
 edid<br>
data.<br>
<br>
In this v1, I would appreciate some feedback especially regarding:<br>
- Can we enable it by default or do need to create another config option<br=
>
=C2=A0 flag for it?<br></blockquote><div><br></div><div>Enabled as default =
is ok I think</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
- Can we now also remove the &quot;EDID requested but the backend doesn&#39=
;t<br>
=C2=A0 support it.&quot; warning and logic from hw/display or do we still w=
ant to<br>
=C2=A0 keep that around for other potential implementations of<br>
=C2=A0 vhost-user-gpu?<br></blockquote><div><br></div><div>Imho, that shoul=
d remain. (vhost-user-gpu could have set edid=3Dfalse by default to avoid t=
his error, but then it would need to be explicitly turned on to match the b=
ackend implementation)<br></div><div>=C2=A0<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
- The structs used as payloads of the vhost-user-gpu messages. Looks<br>
=C2=A0 like there was no command so far requiring bidirectional messages wi=
th<br>
=C2=A0 different payloads so I just based it on similar available ones.<br>
<br></blockquote><div><br></div><div>That looks fine to me</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
<br>
<br>
Erico Nunes (2):<br>
=C2=A0 virtio-gpu: refactor generate_edid function to virtio_gpu_base<br>
=C2=A0 vhost-user-gpu: implement get_edid feature<br>
<br>
=C2=A0contrib/vhost-user-gpu/vhost-user-gpu.c | 53 ++++++++++++++++++++++++=
-<br>
=C2=A0contrib/vhost-user-gpu/virgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ++<br>
=C2=A0contrib/vhost-user-gpu/vugpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 8 ++++<br>
=C2=A0docs/interop/vhost-user-gpu.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 9 +++++<br>
=C2=A0hw/display/vhost-user-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 31 +++++++++++++++<br>
=C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 17 ++++++++<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 20 +---------<br>
=C2=A0include/hw/virtio/virtio-gpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +<br>
=C2=A08 files changed, 122 insertions(+), 21 deletions(-)<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div><div><br></div><div>I wonder if the backend couldn&#39;t=
 have avoided the need for calling the front-end (the VHOST_USER_GPU_GET_ED=
ID call). But after all, it can still implement it on its own, so it&#39;s =
optional anyway.<br></div><div><br></div><div>However, I worry about using =
the new backend (calling GET_EDID) with an older front-end/QEMU. It may jus=
t hang, since vhost_user_gpu_handle_display() won&#39;t reply to unknown me=
ssages. That&#39;s what PROTOCOL_FEATURES were meant for, iirc. Can you che=
ck? thanks<br></div><div><br></div><br><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9=
 Lureau<br></div></div>

--000000000000fd97a005fbb9e3d5--

