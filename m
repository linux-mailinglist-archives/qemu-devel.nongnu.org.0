Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114FB551A9F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 15:09:07 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3H9N-0007oo-Lb
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 09:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1o3H7g-0006ym-BB
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1o3H7Z-0000Ld-1B
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655730431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FzYejRPIG9nwJ8iSQUBB7SwiX3STTcei9/08qivSdUU=;
 b=fVMtoeGSqM2Wk7MxYmdyZQ1IL/d/IGQ0x3dDqI8r7pYBu0B99QvRS4G4nmCQ8Msm3wSqq4
 7u4buen3E/FnMBKokG2c7x8GT8ox9OLDDi+rQK8QGeqviMJ1e/T4Vk0OBQWbdOFMMwBKO9
 roDAs9X+fTdoenl/9+K/NRBuqSjgQ+w=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-6Ro6ytFVM_algRaDCF5r1Q-1; Mon, 20 Jun 2022 09:07:10 -0400
X-MC-Unique: 6Ro6ytFVM_algRaDCF5r1Q-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2eb7d137101so94220747b3.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 06:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FzYejRPIG9nwJ8iSQUBB7SwiX3STTcei9/08qivSdUU=;
 b=27Ju+iarEZ5Xl52uL8eHWT2RdBZnoHF9/80LQ2b8/H1YbCur8dOEpPU4Df6y0+M0gt
 EavIhe5nKJdxecwd3YBIoZe0a4Uzumb7yBNJkYQscr30ozzy/VpklfI8K+ZrcvM6qCxc
 7suDgdytQZXMmG11w0Y0yfvVtDYAI3Tc/iqqCvXEdDM/3+GvXmI582NXhnc5JVVQL7At
 j1cPAvHX/IPQT3ZUyGk/LKym17aIfcQROdLOsqf/eZIC/s9tu1luarqshkGkUacaULuQ
 TbpLXbG7ZMx9a1P0/4PKGy/Ds+k6RgCdRLdUAaoSqB76kxqZlwBpNdd56EgwaACvXl/i
 l8uQ==
X-Gm-Message-State: AJIora8MoQYYxkkXZWkgp8GIpeLhtJ/NohMwM+CwSHQVB6qEjn3yZ/fu
 TCq2tiqofJ3QgPMtcLkYOVLdz39QpI7VNe80rQs8UG8ul10jtW8wVHRX7P3Fj71p0T4QQ6Io4iz
 yTHO/+OkoAx+ajDAkUrv3Qz1dWMNEDRY=
X-Received: by 2002:a81:74d7:0:b0:317:7463:d852 with SMTP id
 p206-20020a8174d7000000b003177463d852mr23255112ywc.385.1655730429497; 
 Mon, 20 Jun 2022 06:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/st1xGIoApOJbwl/rSSnKoU2KocjaAWgjQOuTWy9LcTgyHfPv8hBuyKYAgiOA0oJY0TXwBI/OE/tj+bShHuY=
X-Received: by 2002:a81:74d7:0:b0:317:7463:d852 with SMTP id
 p206-20020a8174d7000000b003177463d852mr23255089ywc.385.1655730429276; Mon, 20
 Jun 2022 06:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
 <20220615173345.32456-2-akihiko.odaki@gmail.com>
In-Reply-To: <20220615173345.32456-2-akihiko.odaki@gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 20 Jun 2022 16:06:58 +0300
Message-ID: <CAPMcbCp-vzvS9Bp4pkqbDBkuEkOhYXMwC3qyAT4kWyX3u9wEnw@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] qga: Relocate a path emitted in the help text
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Programmingkid <programmingkidx@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000014c5cf05e1e0c8f0"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000014c5cf05e1e0c8f0
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>


On Wed, Jun 15, 2022 at 8:43 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  qga/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index c373fec3ee6..06e507b9979 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -270,7 +270,7 @@ QEMU_HELP_BOTTOM "\n"
>      , cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT,
>      dfl_pathnames.pidfile,
>  #ifdef CONFIG_FSFREEZE
> -    QGA_FSFREEZE_HOOK_DEFAULT,
> +    get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT),
>  #endif
>      dfl_pathnames.state_dir);
>  }
> --
> 2.32.1 (Apple Git-133)
>
>
>

--00000000000014c5cf05e1e0c8f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div id=3D"gmail-:vz" class=3D"gmail-a3s =
gmail-aiL"><div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"=
mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</=
div></div></div></div></div><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 8:43 PM Akihiko Oda=
ki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko=
.odaki@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.=
odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
---<br>
=C2=A0qga/main.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/main.c b/qga/main.c<br>
index c373fec3ee6..06e507b9979 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -270,7 +270,7 @@ QEMU_HELP_BOTTOM &quot;\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0, cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT=
,<br>
=C2=A0 =C2=A0 =C2=A0dfl_pathnames.pidfile,<br>
=C2=A0#ifdef CONFIG_FSFREEZE<br>
-=C2=A0 =C2=A0 QGA_FSFREEZE_HOOK_DEFAULT,<br>
+=C2=A0 =C2=A0 get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT),<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0dfl_pathnames.state_dir);<br>
=C2=A0}<br>
-- <br>
2.32.1 (Apple Git-133)<br>
<br>
<br>
</blockquote></div>

--00000000000014c5cf05e1e0c8f0--


