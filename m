Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42743508B4B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:56:35 +0200 (CEST)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBkw-0003MW-BS
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nhBF1-0002Ys-0G
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:23:35 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nhBEy-0005eU-8N
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:23:34 -0400
Received: by mail-vk1-xa31.google.com with SMTP id m203so848324vke.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7C0c3JJ2VjSYidyV4IMGxpVwRFUVChOyxy72OfKHIfs=;
 b=xYbKY78vWAoUj1mEekm9cCYmVgFnbiREeaJyCvWsZ4NwnsAhhsj0gGTflrq6k9CDC4
 JTCH8rTWJ2Bmqc4a0eb9ZmR9Rkc+ICVqHDUDVkv2Da67iNByTK+1EV8qpRgiwt5631MK
 cvz4vtjqapI/UFMEDhqOLp+7U/Kxf+SGVQPupJZQuC9MQjXW/DXT7AY+TGbk6oiDb4G6
 PPNXiIpKV0tdkPnfUPMNvxF4clGWCsjHAVN4Z1PoG2f+mU7t7E3QbY9L5w2NyqQ0ZdWK
 DK0suZX2IBlgWqmshdK8t+xcNWhwZGV12aAABv8ezAh68v2d7JWQ6u5qYfQhQylJ0LYF
 hbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7C0c3JJ2VjSYidyV4IMGxpVwRFUVChOyxy72OfKHIfs=;
 b=R5mGX7BreJAGJtsyomDKsTvsaopfJXIwqfNDtZRsoBam4ccdPwVSdmLvB/snehNUHo
 0yNRwF9MLGAPsE6zJtYXIq7UKGNeUwMXqSf/grAznefBEvQUhVMgQjr1jT4JQ6n41n2v
 UzI5WhR2RJllS3Y0+Btx8ZLhknZVrMUalYCjLuYk/9h/IjJP+KYCbaJ9hed5nwuvn98t
 dgP16KuOdW6r2gK00g4famfNggXLRYGyyiymwvqaiuYqKlkC0yKWjgfXidgHZYHUfmOY
 IOzN2Gej7n+XC1DHXnxFs75BeidhfxZthcfaYSC7WiEDpFnj2DpKPEKxt5wZrOfPtXk0
 7cgg==
X-Gm-Message-State: AOAM532x522gwHMiE1BNEkUFgULV6oqhh7oBi3ge3j+oa7n5+sfMPble
 BG44CIUBQXJXH1Ty3aUNvlphUvnQquZfGiZ5ASI/rQ==
X-Google-Smtp-Source: ABdhPJzxrM0lLjjFszyRgQY8iLqGFk+NIvZXgc02zBR9wp5lRuGUF2hjieNjmN7lHlhZu0Ss+UOmUte2iBYE11KXJt0=
X-Received: by 2002:a1f:2f48:0:b0:349:d232:8d02 with SMTP id
 v69-20020a1f2f48000000b00349d2328d02mr2457098vkv.22.1650464610025; Wed, 20
 Apr 2022 07:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-7-marcandre.lureau@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 20 Apr 2022 08:23:19 -0600
Message-ID: <CANCZdfq2oNFcDcMsccEe+GZUBc3+0eLezG88v25y6DskfA64eQ@mail.gmail.com>
Subject: Re: [PATCH 06/41] include: rename qemu-common.h qemu/copyright.h
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cb95b005dd16bc55"
Received-SPF: none client-ip=2607:f8b0:4864:20::a31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 "open list:virtiofs" <virtio-fs@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cb95b005dd16bc55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:26 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> ---
>  include/{qemu-common.h =3D> qemu/copyright.h} | 0
>  bsd-user/main.c                             | 2 +-
>  linux-user/main.c                           | 2 +-
>  qemu-img.c                                  | 2 +-
>  qemu-io.c                                   | 2 +-
>  qemu-nbd.c                                  | 2 +-
>  qga/main.c                                  | 2 +-
>  scsi/qemu-pr-helper.c                       | 2 +-
>  softmmu/vl.c                                | 2 +-
>  storage-daemon/qemu-storage-daemon.c        | 2 +-
>  tools/virtiofsd/passthrough_ll.c            | 2 +-
>  ui/cocoa.m                                  | 2 +-
>  12 files changed, 11 insertions(+), 11 deletions(-)
>  rename include/{qemu-common.h =3D> qemu/copyright.h} (100%)
>
> diff --git a/include/qemu-common.h b/include/qemu/copyright.h
> similarity index 100%
> rename from include/qemu-common.h
> rename to include/qemu/copyright.h
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 88d347d05ebf..aaab3f278534 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -24,7 +24,7 @@
>  #include <sys/sysctl.h>
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/units.h"
>  #include "qemu/accel.h"
>  #include "sysemu/tcg.h"
> diff --git a/linux-user/main.c b/linux-user/main.c
> index fbc9bcfd5f5f..744d216b1e8e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -18,7 +18,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/units.h"
>  #include "qemu/accel.h"
>  #include "sysemu/tcg.h"
> diff --git a/qemu-img.c b/qemu-img.c
> index 116e05867558..a2b1d3653a1e 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -25,7 +25,7 @@
>  #include "qemu/osdep.h"
>  #include <getopt.h>
>
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/qemu-progress.h"
>  #include "qemu-version.h"
>  #include "qapi/error.h"
> diff --git a/qemu-io.c b/qemu-io.c
> index eb8afc8b413b..952a36643b0c 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -15,7 +15,7 @@
>  #include <termios.h>
>  #endif
>
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/error.h"
>  #include "qemu-io.h"
>  #include "qemu/error-report.h"
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 713e7557a9eb..f4d121c0c40e 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -21,7 +21,7 @@
>  #include <libgen.h>
>  #include <pthread.h>
>
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
>  #include "sysemu/block-backend.h"
> diff --git a/qga/main.c b/qga/main.c
> index ac63d8e47802..8994f73e4735 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -18,7 +18,7 @@
>  #include <syslog.h>
>  #include <sys/wait.h>
>  #endif
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/qmp/json-parser.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qjson.h"
> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index f281daeced8d..e7549ffb3bc9 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -36,7 +36,7 @@
>  #include <mpath_persist.h>
>  #endif
>
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
>  #include "qemu/main-loop.h"
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 46aba6a039c4..b0bf16e16aaa 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -23,7 +23,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "exec/cpu-common.h"
> diff --git a/storage-daemon/qemu-storage-daemon.c
> b/storage-daemon/qemu-storage-daemon.c
> index eb724072579a..a4415e8c995b 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -42,7 +42,7 @@
>  #include "qapi/qmp/qstring.h"
>  #include "qapi/qobject-input-visitor.h"
>
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu-version.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> diff --git a/tools/virtiofsd/passthrough_ll.c
> b/tools/virtiofsd/passthrough_ll.c
> index 028dacdd8f5a..8af28f5fb823 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -38,7 +38,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/timer.h"
>  #include "qemu-version.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "fuse_virtio.h"
>  #include "fuse_log.h"
>  #include "fuse_lowlevel.h"
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 839ae4f58a69..a2a74656fabf 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -27,7 +27,7 @@
>  #import <Cocoa/Cocoa.h>
>  #include <crt_externs.h>
>
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu-main.h"
>  #include "ui/clipboard.h"
>  #include "ui/console.h"
> --
> 2.35.1.693.g805e0a68082a
>
>

--000000000000cb95b005dd16bc55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:26 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Suggested-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
 target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto=
:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/{qemu-common.h =3D&gt; qemu/copyright.h} | 0<br>
=C2=A0bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0qemu-io.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A0qemu-nbd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0scsi/qemu-pr-helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0storage-daemon/qemu-storage-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
-<br>
=C2=A0tools/virtiofsd/passthrough_ll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
=C2=A0ui/cocoa.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A012 files changed, 11 insertions(+), 11 deletions(-)<br>
=C2=A0rename include/{qemu-common.h =3D&gt; qemu/copyright.h} (100%)<br>
<br>
diff --git a/include/qemu-common.h b/include/qemu/copyright.h<br>
similarity index 100%<br>
rename from include/qemu-common.h<br>
rename to include/qemu/copyright.h<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index 88d347d05ebf..aaab3f278534 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -24,7 +24,7 @@<br>
=C2=A0#include &lt;sys/sysctl.h&gt;<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/accel.h&quot;<br>
=C2=A0#include &quot;sysemu/tcg.h&quot;<br>
diff --git a/linux-user/main.c b/linux-user/main.c<br>
index fbc9bcfd5f5f..744d216b1e8e 100644<br>
--- a/linux-user/main.c<br>
+++ b/linux-user/main.c<br>
@@ -18,7 +18,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/accel.h&quot;<br>
=C2=A0#include &quot;sysemu/tcg.h&quot;<br>
diff --git a/qemu-img.c b/qemu-img.c<br>
index 116e05867558..a2b1d3653a1e 100644<br>
--- a/qemu-img.c<br>
+++ b/qemu-img.c<br>
@@ -25,7 +25,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;getopt.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qemu/qemu-progress.h&quot;<br>
=C2=A0#include &quot;qemu-version.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/qemu-io.c b/qemu-io.c<br>
index eb8afc8b413b..952a36643b0c 100644<br>
--- a/qemu-io.c<br>
+++ b/qemu-io.c<br>
@@ -15,7 +15,7 @@<br>
=C2=A0#include &lt;termios.h&gt;<br>
=C2=A0#endif<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu-io.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/qemu-nbd.c b/qemu-nbd.c<br>
index 713e7557a9eb..f4d121c0c40e 100644<br>
--- a/qemu-nbd.c<br>
+++ b/qemu-nbd.c<br>
@@ -21,7 +21,7 @@<br>
=C2=A0#include &lt;libgen.h&gt;<br>
=C2=A0#include &lt;pthread.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
diff --git a/qga/main.c b/qga/main.c<br>
index ac63d8e47802..8994f73e4735 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -18,7 +18,7 @@<br>
=C2=A0#include &lt;syslog.h&gt;<br>
=C2=A0#include &lt;sys/wait.h&gt;<br>
=C2=A0#endif<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/json-parser.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qjson.h&quot;<br>
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c<br>
index f281daeced8d..e7549ffb3bc9 100644<br>
--- a/scsi/qemu-pr-helper.c<br>
+++ b/scsi/qemu-pr-helper.c<br>
@@ -36,7 +36,7 @@<br>
=C2=A0#include &lt;mpath_persist.h&gt;<br>
=C2=A0#endif<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 46aba6a039c4..b0bf16e16aaa 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -23,7 +23,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;exec/cpu-common.h&quot;<br>
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-sto=
rage-daemon.c<br>
index eb724072579a..a4415e8c995b 100644<br>
--- a/storage-daemon/qemu-storage-daemon.c<br>
+++ b/storage-daemon/qemu-storage-daemon.c<br>
@@ -42,7 +42,7 @@<br>
=C2=A0#include &quot;qapi/qmp/qstring.h&quot;<br>
=C2=A0#include &quot;qapi/qobject-input-visitor.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qemu-version.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c<br>
index 028dacdd8f5a..8af28f5fb823 100644<br>
--- a/tools/virtiofsd/passthrough_ll.c<br>
+++ b/tools/virtiofsd/passthrough_ll.c<br>
@@ -38,7 +38,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu-version.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;fuse_virtio.h&quot;<br>
=C2=A0#include &quot;fuse_log.h&quot;<br>
=C2=A0#include &quot;fuse_lowlevel.h&quot;<br>
diff --git a/ui/cocoa.m b/ui/cocoa.m<br>
index 839ae4f58a69..a2a74656fabf 100644<br>
--- a/ui/cocoa.m<br>
+++ b/ui/cocoa.m<br>
@@ -27,7 +27,7 @@<br>
=C2=A0#import &lt;Cocoa/Cocoa.h&gt;<br>
=C2=A0#include &lt;crt_externs.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
+#include &quot;qemu/copyright.h&quot;<br>
=C2=A0#include &quot;qemu-main.h&quot;<br>
=C2=A0#include &quot;ui/clipboard.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
-- <br>
2.35.1.693.g805e0a68082a<br>
<br>
</blockquote></div></div>

--000000000000cb95b005dd16bc55--

