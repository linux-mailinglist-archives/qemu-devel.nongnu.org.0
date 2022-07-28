Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F68583B98
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:58:27 +0200 (CEST)
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0Hi-0002xe-J5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oH06b-0007yV-BX
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oH06X-0002Q5-KJ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659001611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyJNrVjhndPkMXWUgEdtYKOAYZgFu2Xp4WJ8RJPNu7k=;
 b=DNq9ncWqAz/y8DdoUmXsJPHqNCpkErl9HBbYnpovHXBFoiHp3dBHJ9c/TnOWR7+uDz3HrI
 H2VVVByLtKXdxpPfTSmfP0RpkhJVtxFsjg5qOD5hGMDWERnhmobc0v6M1s7TCWNlncteQw
 dD8tsxE+oU6I5XKP33z7En7+TSIzMMQ=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-iApW1QC-On6pRYaNlY4CoQ-1; Thu, 28 Jul 2022 05:46:47 -0400
X-MC-Unique: iApW1QC-On6pRYaNlY4CoQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 d24-20020a9d4f18000000b0061c87830c86so429839otl.15
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 02:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UyJNrVjhndPkMXWUgEdtYKOAYZgFu2Xp4WJ8RJPNu7k=;
 b=RoSiYqpqpH0/VxsBKEOeANjFd5KuzqAha0VKbRk2CeP+Vvo9iZXJLC6gTsb2u/xDuu
 Cii90wGscT96XK3LT9s6OhZUb0mnYxQr7O+jR0DrnfuI5YbPCvHpiTjLCMNqQMIrq3w+
 pr/9Dr+4ZLFhM+sv52G82bfmscHme2+7SK0s4r8OjjT0zMDbGLGRRF+LKlLVNPtxx+9a
 1Z/v4lWF85mrlaAj42u8USk6f6oyJBAsNTQpsYsSl0uKlLW1TTOvhZCCC3Hsx/V+IJn2
 4pkDyPMqCCaowwj2pQLxHWJJkovXBCYke0sK539GEgxoAfbh39AOw4WsJ88z75XiBjzv
 TuLQ==
X-Gm-Message-State: AJIora+8iFvayMneU2mKskKnUduG0DjDkCx7Anwub+2ZyprOxmeu7OIL
 flU/fZAFYv9hEt81h6BJ/3kJO4Brg0bFSHcX5aZwir0utbGntoPiIoz6pAGPD3C7HEPQXPvhjAt
 tKjdpCmyBVgX2ILMwCKRtEwTYUzDkV0U=
X-Received: by 2002:a05:6830:409f:b0:61c:cf3c:14b8 with SMTP id
 x31-20020a056830409f00b0061ccf3c14b8mr3062705ott.38.1659001607122; 
 Thu, 28 Jul 2022 02:46:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbzSTXSZ2IjXR2yeUwc2+XVvPjdvEO2+QcIFkkJlq7fQEDBggoWdcqeLI/TT3G5PB/yLwg3E2zyrORACyD5E8=
X-Received: by 2002:a05:6830:409f:b0:61c:cf3c:14b8 with SMTP id
 x31-20020a056830409f00b0061ccf3c14b8mr3062698ott.38.1659001606901; Thu, 28
 Jul 2022 02:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220728064143.209559-1-pbonzini@redhat.com>
In-Reply-To: <20220728064143.209559-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 28 Jul 2022 13:46:36 +0400
Message-ID: <CAMxuvaxf0oZ5aarkL12zVbyvPxthrUq8T3Y_c56tp9R9-+zRsw@mail.gmail.com>
Subject: Re: [PATCH] ui: dbus-display requires CONFIG_GBM
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

On Thu, Jul 28, 2022 at 10:41 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Without CONFIG_GBM, compiling dbus-display fails with
>
> ../ui/dbus.c: In function =E2=80=98dbus_create_context=E2=80=99:
> ../ui/dbus.c:47:20: error: =E2=80=98qemu_egl_rn_ctx=E2=80=99 undeclared (=
first use in this function); did you mean =E2=80=98qemu_egl_init_ctx=E2=80=
=99?
>    47 |                    qemu_egl_rn_ctx);
>       |                    ^~~~~~~~~~~~~~~
>       |                    qemu_egl_init_ctx
> ../ui/dbus.c:47:20: note: each undeclared identifier is reported only onc=
e for each function it appears in
>
> and many other similar errors, because include/ui/egl-helpers.h only has
> these declaration if gbm is found on the system.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

As Daniel said, wfm:

+ you can mention https://gitlab.com/qemu-project/qemu/-/issues/1108

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build    | 4 ++--
>  ui/meson.build | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 9b67db0d67..38403d2892 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1697,8 +1697,8 @@ dbus_display =3D get_option('dbus_display') \
>             error_message: '-display dbus requires glib>=3D2.64') \
>    .require(gdbus_codegen.found(),
>             error_message: '-display dbus requires gdbus-codegen') \
> -  .require(opengl.found(),
> -           error_message: '-display dbus requires epoxy/egl') \
> +  .require(opengl.found() and gbm.found(),
> +           error_message: '-display dbus requires epoxy/egl and gbm') \
>    .allowed()
>
>  have_virtfs =3D get_option('virtfs') \
> diff --git a/ui/meson.build b/ui/meson.build
> index e9f48c5315..ec13949776 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -81,7 +81,7 @@ if dbus_display
>                                            '--interface-prefix', 'org.qem=
u.',
>                                            '--c-namespace', 'QemuDBus',
>                                            '--generate-c-code', '@BASENAM=
E@'])
> -  dbus_ss.add(when: [gio, pixman, opengl],
> +  dbus_ss.add(when: [gio, pixman, opengl, gbm],
>                if_true: [files(
>                  'dbus-chardev.c',
>                  'dbus-clipboard.c',
> --
> 2.36.1
>


