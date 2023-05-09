Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1086FC6F6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:44:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMgr-0000mY-BC; Tue, 09 May 2023 08:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwMgp-0000ln-Nx
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:43:35 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwMgn-0006lQ-T4
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:43:35 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f11d267d8bso6512370e87.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683636212; x=1686228212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t4SSkMFeRI7vcsk/OuLYo/BkRGO+WCbZQgx5Hu0hptI=;
 b=EytDEZHbtPpISjhugFAP/SRAKXLd9nZPYtovJ+5eFHpO9GB6dogmtE6HAJ609LW5eH
 3PZVSaiDT9bMMFKd8I14IcrzEkNVCxdLqH6R9yQvo6or/1NFbBL1LzSBFw6+Ng+7p74u
 P0wiNnHBUG/Y83ZzYiK+iA6sDd5+L3DlndFF6ZMKxu1crUmdRgfNz4BBIUrDSDgGiXiH
 NGKWCKtYrwBRDl6NDn+jnZBborUvpvuPyqaHJXbgUSzDG8wTyPp91RkB+T81XdbVwqT+
 sLZMI0coE38f3e8vpCcw2+7A/X03Pv4cr981b11mjz5jSdjLiC3qHIRJovSnSzmja06a
 voFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683636212; x=1686228212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t4SSkMFeRI7vcsk/OuLYo/BkRGO+WCbZQgx5Hu0hptI=;
 b=bPmqsUmFOLpT7nAEl6FNGGAOi/IVYsiQJDAEJ7x38sD3fOGvqUJAPHZ3EN5AMmNpVI
 2QFKZhPIVrkMgdRVT1r2JGdZ1v9sNIKrW6YZslsHKKSZzecrtqyaC21jnq6sTONqGNNW
 tXfMCu9k8AxrwqbZ9cjNa7sDYDSxe8PeRgGKpXpOEPU6dhl8L0NQK7vkDirxhPg7SSPi
 raX4CTDKH6U8HN8TIQNrO0tMIoWBKHczl/DLWxO8TT5Al2eeRfmvMwOI6S8Bq9NFV36E
 l2QPQQ4WT7Lgek9Z1oPJxilRVOlxSDGbEmhhJUyWK4dBw5dpyjVtd+2Kz6E0JYJmY9m9
 1J2w==
X-Gm-Message-State: AC+VfDw7xEWj3+YRcIRtbpyrFtc2o/piMDldNm06Kiv/wCh+TIvFhEa8
 5QBfkUTkKAoCbRFr1yh3mbb05w+dwiqnEN00vDk=
X-Google-Smtp-Source: ACHHUZ716yHThwDi+4tLGhm/z8ZwkRu5TlytIKSvQ9oNAdKPoOLN+WIlWLEtkQyEMuVrVhlTusebIbaNyNKkt22dxJY=
X-Received: by 2002:ac2:4571:0:b0:4e8:61ea:509a with SMTP id
 k17-20020ac24571000000b004e861ea509amr767101lfm.7.1683636211802; Tue, 09 May
 2023 05:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230504191243.746-1-gurchetansingh@chromium.org>
In-Reply-To: <20230504191243.746-1-gurchetansingh@chromium.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 May 2023 16:43:20 +0400
Message-ID: <CAJ+F1CK+myw2n3bvT9Ys-heDr8W-CatJcroR=cPOpJUv_VDNwQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] virtio-gpu cleanups and obvious definitions
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, kraxel@redhat.com, 
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com, 
 alex.bennee@linaro.org, shentey@gmail.com
Content-Type: multipart/alternative; boundary="00000000000055e80805fb421a50"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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

--00000000000055e80805fb421a50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 4, 2023 at 11:13=E2=80=AFPM Gurchetan Singh <gurchetansingh@chr=
omium.org>
wrote:

> From: Gurchetan Singh <gurchetansingh@google.com>
>
> v3 of "virtio-gpu cleanups and obvious definitions"
>
> https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05392.html
>
> All patches have been reviewed, though there was a question from
> Bernhard Beschow about patch (3) and how it fits with the QOM:
>
> https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00057.html
>
> I go into detail in patch 3 commit message, but I think we meet
> the requirements (which are tricky/fuzzy anyways).  Also, I think
> this is the cleanest way to add another 3D virtgpu backend.  But
> if anyone has other ideas, please do reply/review.
>
> Antonio Caggiano (1):
>   virtio-gpu: CONTEXT_INIT feature
>
> Dr. David Alan Gilbert (1):
>   virtio: Add shared memory capability
>
> Gurchetan Singh (3):
>   hw/display/virtio-gpu-virgl: virtio_gpu_gl -> virtio_gpu_virgl
>   hw/display/virtio-gpu-virgl: make GL device more library agnostic
>   hw/display/virtio-gpu-virgl: define callbacks in realize function
>
>  hw/display/virtio-gpu-base.c   |   3 +
>  hw/display/virtio-gpu-gl.c     | 114 +--------------------------
>  hw/display/virtio-gpu-virgl.c  | 137 +++++++++++++++++++++++++++++++--
>  hw/virtio/virtio-pci.c         |  18 +++++
>  include/hw/virtio/virtio-gpu.h |  11 +--
>  include/hw/virtio/virtio-pci.h |   4 +
>  6 files changed, 160 insertions(+), 127 deletions(-)
>
> --
> 2.40.1.521.gf1e218fcd8-goog
>
>
>
This looks fine to me:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

however, do you have a series rebased on top that makes use of those
changes? (I think we may want to delay merging this one until it's actually
needed)


--=20
Marc-Andr=C3=A9 Lureau

--00000000000055e80805fb421a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 4, 2023 at 11:13=E2=80=
=AFPM Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org">gu=
rchetansingh@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Gurchetan Singh &lt;<a href=3D"mailto:gurche=
tansingh@google.com" target=3D"_blank">gurchetansingh@google.com</a>&gt;<br=
>
<br>
v3 of &quot;virtio-gpu cleanups and obvious definitions&quot;<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05392.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2023-04/msg05392.html</a><br>
<br>
All patches have been reviewed, though there was a question from<br>
Bernhard Beschow about patch (3) and how it fits with the QOM:<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00057.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2023-05/msg00057.html</a><br>
<br>
I go into detail in patch 3 commit message, but I think we meet<br>
the requirements (which are tricky/fuzzy anyways).=C2=A0 Also, I think<br>
this is the cleanest way to add another 3D virtgpu backend.=C2=A0 But<br>
if anyone has other ideas, please do reply/review.<br>
<br>
Antonio Caggiano (1):<br>
=C2=A0 virtio-gpu: CONTEXT_INIT feature<br>
<br>
Dr. David Alan Gilbert (1):<br>
=C2=A0 virtio: Add shared memory capability<br>
<br>
Gurchetan Singh (3):<br>
=C2=A0 hw/display/virtio-gpu-virgl: virtio_gpu_gl -&gt; virtio_gpu_virgl<br=
>
=C2=A0 hw/display/virtio-gpu-virgl: make GL device more library agnostic<br=
>
=C2=A0 hw/display/virtio-gpu-virgl: define callbacks in realize function<br=
>
<br>
=C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/display/virtio-gpu-gl.c=C2=A0 =C2=A0 =C2=A0| 114 +----------------=
----------<br>
=C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 | 137 +++++++++++++++++++++++++++=
++++--<br>
=C2=A0hw/virtio/virtio-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ++=
+++<br>
=C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 11 +--<br>
=C2=A0include/hw/virtio/virtio-pci.h |=C2=A0 =C2=A04 +<br>
=C2=A06 files changed, 160 insertions(+), 127 deletions(-)<br>
<br>
-- <br>
2.40.1.521.gf1e218fcd8-goog<br>
<br>
<br>
</blockquote></div><div><br></div><div>This looks fine to me:</div><div>Rev=
iewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div><div>howev=
er, do you have a series rebased on top that makes use of those changes? (I=
 think we may want to delay merging this one until it&#39;s actually needed=
)</div><div><br></div><br><span class=3D"gmail_signature_prefix">-- </span>=
<br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></=
div></div>

--00000000000055e80805fb421a50--

