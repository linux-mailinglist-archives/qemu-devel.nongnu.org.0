Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BA7381E0F
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 12:28:27 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liE0X-0007ys-RL
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 06:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1liDxM-0006e7-95
 for qemu-devel@nongnu.org; Sun, 16 May 2021 06:25:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1liDxF-0004is-Mk
 for qemu-devel@nongnu.org; Sun, 16 May 2021 06:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621160700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6EBPO4Z5gBMgy/K+Mo3YUMR0X+aViAai0cyQp9fe1s4=;
 b=MnVx73SC/yzIC3fZNML47Su8vP5kWF/r9tDC3xVTf6MLxURUNu0oZO2hwqdQ9Pd9Hu++W7
 4GMfm0qT7TZZlme90UsvfgT1meA+M7FlpDA1qdxpkhda6aHHPcAmgQ/brYYVfpUF5gSZUn
 tcmgh+MASpNxIXulEnBLtuoo67RlaI0=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-ztyMs4R-O5-waxIoXXFPpQ-1; Sun, 16 May 2021 06:24:56 -0400
X-MC-Unique: ztyMs4R-O5-waxIoXXFPpQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 m36-20020a634c640000b02901fbb60ec3a6so2515713pgl.15
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 03:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6EBPO4Z5gBMgy/K+Mo3YUMR0X+aViAai0cyQp9fe1s4=;
 b=BcIIuaknjDn1HiReF4uHskm6ZfSLPQASWV/16nWdCBMTpnViDvVWY9yXXMNTzZNB6J
 pDAfyseMFkAxz91cD6AF2EFz+JgDHFMM4Od9QY0OZuZwfeUPejNHiRMriC0+A8LpBspy
 BMGOYzXQdApRgQmF4qT6ATPTFTMd3iRwh3LWkcX00upMiQF2lzYlUYQUM9WI5BRfkjV+
 vT1ai1tFsDlw5qTr0kc9rw/3kus8swkpg94635qJSOZNLsrNuYMQsbMZVfZKrM8t1E7g
 acHbQyM4ICwZ7p0tGAPnZTWU3Evdd78txp6WCd9slZzo3jE0nkariUvLVzdQxz3DJYLj
 Tt4w==
X-Gm-Message-State: AOAM533YMwvnzJltJZn4aCbDPkofZU1WS4KSVf+u+De2ICgYC0cjkXhl
 RYjFcRJUeX/aJ8DPkqyxskaLqy5Pdy4OUCxTjcWYYVfR8YV9CiPKckpX8SjeyQexmz3ki+PBcUA
 sAEYDRlNyq4Nn1/GzzfKmcyxx1QsLx40=
X-Received: by 2002:a17:902:ee8b:b029:ef:ab33:b835 with SMTP id
 a11-20020a170902ee8bb02900efab33b835mr14825501pld.27.1621160694843; 
 Sun, 16 May 2021 03:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZrn9e7kO0HYGNzOn7EdxvCxqeZBgIX/ExGxVGG0ANd6/0UfGq3LyQ+DHQ1Mr5zsjbBS41pFhnAleEhwITcp0=
X-Received: by 2002:a17:902:ee8b:b029:ef:ab33:b835 with SMTP id
 a11-20020a170902ee8bb02900efab33b835mr14825486pld.27.1621160694590; Sun, 16
 May 2021 03:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210516030403.107723-1-liq3ea@163.com>
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 16 May 2021 14:24:43 +0400
Message-ID: <CAMxuvaw+QTQ7J381gf78qcj9sA8cvuHKF1V1unF8MitFpNpG6g@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] vhost-user-gpu: fix several security issues
To: Li Qiang <liq3ea@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000534a1405c26fe303"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, "Qiang, Li" <liq3ea@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Prasad Pandit <ppandit@redhat.com>,
 "Hoffmann, Gerd" <kraxel@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000534a1405c26fe303
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, May 16, 2021 at 7:04 AM Li Qiang <liq3ea@163.com> wrote:

> These security issue is low severity and is similar with the
> virtio-vga/virtio-gpu device. All of them can be triggered by
> the guest user.
>
> Change since v1:
> Add the CVE information:
> Several memory leak issues is combined assigned CVE-2021-3544.
> Information disclosure is assigned CVE-2021-3545.
> OOB memory write access is assigned CVE-2021-3545.
>
> Abstract 'vg_cleanup_mapping_iov' to make code more clearly.
>
> Li Qiang (8):
>   vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info
>     (CVE-2021-3545)
>   vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
>     (CVE-2021-3544)
>   vhost-user-gpu: fix memory leak in vg_resource_attach_backing
>     (CVE-2021-3544)
>   vhost-user-gpu: fix memory leak while calling 'vg_resource_unref'
>     (CVE-2021-3544)
>   vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
>     (CVE-2021-3544)
>   vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'
>     (CVE-2021-3544)
>   vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
>     (CVE-2021-3546)
>   vhost-user-gpu: abstract vg_cleanup_mapping_iov
>
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 29 ++++++++++++++++++++++---
>  contrib/vhost-user-gpu/virgl.c          | 20 +++++++++++++++--
>  contrib/vhost-user-gpu/vugpu.h          |  2 +-
>  3 files changed, 45 insertions(+), 6 deletions(-)
>
> --
> 2.25.1
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--000000000000534a1405c26fe303
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div>Hi</div><div><br></div><div><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May =
16, 2021 at 7:04 AM Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com">liq3ea@1=
63.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">These security issue is low severity and is similar with the<br>
virtio-vga/virtio-gpu device. All of them can be triggered by<br>
the guest user.<br>
<br>
Change since v1:<br>
Add the CVE information:<br>
Several memory leak issues is combined assigned CVE-2021-3544.<br>
Information disclosure is assigned CVE-2021-3545.<br>
OOB memory write access is assigned CVE-2021-3545.<br>
<br>
Abstract &#39;vg_cleanup_mapping_iov&#39; to make code more clearly.<br>
<br>
Li Qiang (8):<br>
=C2=A0 vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info<b=
r>
=C2=A0 =C2=A0 (CVE-2021-3545)<br>
=C2=A0 vhost-user-gpu: fix resource leak in &#39;vg_resource_create_2d&#39;=
<br>
=C2=A0 =C2=A0 (CVE-2021-3544)<br>
=C2=A0 vhost-user-gpu: fix memory leak in vg_resource_attach_backing<br>
=C2=A0 =C2=A0 (CVE-2021-3544)<br>
=C2=A0 vhost-user-gpu: fix memory leak while calling &#39;vg_resource_unref=
&#39;<br>
=C2=A0 =C2=A0 (CVE-2021-3544)<br>
=C2=A0 vhost-user-gpu: fix memory leak in &#39;virgl_cmd_resource_unref&#39=
;<br>
=C2=A0 =C2=A0 (CVE-2021-3544)<br>
=C2=A0 vhost-user-gpu: fix memory leak in &#39;virgl_resource_attach_backin=
g&#39;<br>
=C2=A0 =C2=A0 (CVE-2021-3544)<br>
=C2=A0 vhost-user-gpu: fix OOB write in &#39;virgl_cmd_get_capset&#39;<br>
=C2=A0 =C2=A0 (CVE-2021-3546)<br>
=C2=A0 vhost-user-gpu: abstract vg_cleanup_mapping_iov<br>
<br>
=C2=A0contrib/vhost-user-gpu/vhost-user-gpu.c | 29 ++++++++++++++++++++++--=
-<br>
=C2=A0contrib/vhost-user-gpu/virgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20=
 +++++++++++++++--<br>
=C2=A0contrib/vhost-user-gpu/vugpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A03 files changed, 45 insertions(+), 6 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt; <br></div></div></div></div>

--000000000000534a1405c26fe303--


