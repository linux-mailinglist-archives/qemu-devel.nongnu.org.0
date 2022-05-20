Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81ED52ED62
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 15:43:08 +0200 (CEST)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns2uI-0006pD-RL
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 09:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ns2rm-0004L3-U3
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ns2rj-00066s-8t
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653054025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WVPJddcS2AFoOu+9FM5vzvM7YGjEuDqNNkxaPWsrtk4=;
 b=OqQbKiYTiUrjUWS1agegFcAsdive3B6uqVlpRPolFFTgPfqgngKzC7m3wCyU1Qb1FmKZqk
 yHAD8AtzPDt+BRtIXsdJmmwQByAgKvpHDt6ahcva3rs20Il3TPToIgjICf+QpJA59r3O+H
 tuawMvvmkqE6/uvAFGIdeCeMshRzSX8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-RwcpnEUnN7-6kCh4UDnyzA-1; Fri, 20 May 2022 09:39:36 -0400
X-MC-Unique: RwcpnEUnN7-6kCh4UDnyzA-1
Received: by mail-yb1-f200.google.com with SMTP id
 p5-20020a254205000000b0064da2110759so7140968yba.12
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 06:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVPJddcS2AFoOu+9FM5vzvM7YGjEuDqNNkxaPWsrtk4=;
 b=lWrRLakH+d9YNy1QPuvbzN4kttad2PpV/tLW92wibs+zFA+WStxB8QcoUix8UqWnWh
 u9wf9Dn1LLX5j6Yf98qWGiHN41TDs9mUl82e0KJCyZGC3jKItUw4EhKjcjGfDSWR19e8
 c3v2CGXez0X/XmfwOFyT40JgJEjKYuLoKdpYT8abgLyLHckdl8NBM8mfhcH8WM/y+A/d
 WNa7i2hYOFC6VHmvVGZi3vonEIvNAXvuiOmT03O5fvPT1GqStsoEIJV7ckkXsqxt6F6s
 BlRko4XAIHDwCXreSWJ8sGOZYFeWjHtEQ2grVHBwlshIbrAijOLr2hTKOFGOC0Zg93qA
 nOnQ==
X-Gm-Message-State: AOAM531n+WFYXr7JlTFVnmt2YqViwibMF9gpYDdT45AiGGKTsn5eedZl
 K1FCSe6qBAeZcTbOzH8HM1aDXVF+22pK6qMN0RdaPIgN+bEalvHGiiOhmTTGtUx4sEduWNT9CZd
 mUtaxKjeCk0cwwBGdGkd/tRxj1CxHwGY=
X-Received: by 2002:a05:6902:729:b0:64f:3cfb:6d28 with SMTP id
 l9-20020a056902072900b0064f3cfb6d28mr6964076ybt.30.1653053973278; 
 Fri, 20 May 2022 06:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1XHEGx5Cc/4fils3CBHqyNi6zVXUb5XZruuAwXGx+O9KgoAmelBXBSyKYAd9TNYmMIaZu9bv5BPK5LddfRe0=
X-Received: by 2002:a05:6902:729:b0:64f:3cfb:6d28 with SMTP id
 l9-20020a056902072900b0064f3cfb6d28mr6964060ybt.30.1653053973055; Fri, 20 May
 2022 06:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-9-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Fri, 20 May 2022 16:39:21 +0300
Message-ID: <CAPMcbCq3XU+zRLtZet2v9ZHzgGhwofLsM3_Ur7Br3muAU5yFJA@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] qga: replace qemu_open_old() with
 qemu_open_cloexec()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dbdffa05df719e56"
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

--000000000000dbdffa05df719e56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, May 13, 2022 at 9:08 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> qemu_open_old() uses qemu_open_internal() which handles special
> "/dev/fdset/" path for monitor fd sets, set CLOEXEC, and uses Error
> reporting (and some O_DIRECT special error casing).
>
> The monitor fdset handling is unnecessary for qga, use
> qemu_open_cloexec() instead.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/channel-posix.c  | 14 +++++++++-----
>  qga/commands-posix.c | 24 ++++++++++++------------
>  2 files changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> index 039e1ddcb2..affee485fc 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include <termios.h>
>  #include "qapi/error.h"
>  #include "qemu/sockets.h"
> @@ -128,11 +129,15 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
>      switch (c->method) {
>      case GA_CHANNEL_VIRTIO_SERIAL: {
>          assert(fd < 0);
> -        fd =3D qemu_open_old(path, O_RDWR | O_NONBLOCK
> +        fd =3D qemu_open_cloexec(
> +            path,
>  #ifndef CONFIG_SOLARIS
> -                           | O_ASYNC
> +            O_ASYNC |
>  #endif
> -                           );
> +            O_RDWR | O_NONBLOCK,
> +            0,
> +            errp
> +        );
>          if (fd =3D=3D -1) {
>              error_setg_errno(errp, errno, "error opening channel");
>              return false;
> @@ -157,9 +162,8 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
>          struct termios tio;
>
>          assert(fd < 0);
> -        fd =3D qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
> +        fd =3D qemu_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0=
,
> errp);
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "error opening channel");
>              return false;
>          }
>          tcgetattr(fd, &tio);
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 7761458ce1..e8eafad74d 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1394,6 +1394,7 @@ static GuestDiskInfoList *get_disk_partitions(
>
>  static void get_nvme_smart(GuestDiskInfo *disk)
>  {
> +    Error *err =3D NULL;
>      int fd;
>      GuestNVMeSmart *smart;
>      NvmeSmartLog log =3D {0};
> @@ -1406,9 +1407,10 @@ static void get_nvme_smart(GuestDiskInfo *disk)
>                   | (((sizeof(log) >> 2) - 1) << 16)
>      };
>
> -    fd =3D qemu_open_old(disk->name, O_RDONLY);
> +    fd =3D qemu_open_cloexec(disk->name, O_RDONLY, 0, &err);
>      if (fd =3D=3D -1) {
> -        g_debug("Failed to open device: %s: %s", disk->name,
> g_strerror(errno));
> +        g_debug("Failed to open device: %s: %s", disk->name,
> error_get_pretty(err));
> +        error_free(err);
>          return;
>      }
>
> @@ -1739,9 +1741,8 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool
> has_mountpoints,
>              }
>          }
>
> -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
>          if (fd =3D=3D -1) {
> -            error_setg_errno(errp, errno, "failed to open %s",
> mount->dirname);
>              goto error;
>          }
>
> @@ -1806,7 +1807,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)
>
>      QTAILQ_FOREACH(mount, &mounts, next) {
>          logged =3D false;
> -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, NULL);
>          if (fd =3D=3D -1) {
>              continue;
>          }
> @@ -1866,21 +1867,20 @@ static void guest_fsfreeze_cleanup(void)
>  GuestFilesystemTrimResponse *
>  qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
>  {
> +    ERRP_GUARD();
>      GuestFilesystemTrimResponse *response;
>      GuestFilesystemTrimResult *result;
>      int ret =3D 0;
>      FsMountList mounts;
>      struct FsMount *mount;
>      int fd;
> -    Error *local_err =3D NULL;
>      struct fstrim_range r;
>
>      slog("guest-fstrim called");
>
>      QTAILQ_INIT(&mounts);
> -    build_fs_mount_list(&mounts, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    build_fs_mount_list(&mounts, errp);
> +    if (*errp) {
>          return NULL;
>      }
>
> @@ -1892,11 +1892,11 @@ qmp_guest_fstrim(bool has_minimum, int64_t
> minimum, Error **errp)
>
>          QAPI_LIST_PREPEND(response->paths, result);
>
> -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
>          if (fd =3D=3D -1) {
> -            result->error =3D g_strdup_printf("failed to open: %s",
> -                                            strerror(errno));
> +            result->error =3D g_strdup(error_get_pretty(*errp));
>              result->has_error =3D true;
> +            g_clear_pointer(errp, error_free);
>              continue;
>          }
>
> --
> 2.36.1
>
>

--000000000000dbdffa05df719e56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 1=
3, 2022 at 9:08 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
>&gt;<br>
<br>
qemu_open_old() uses qemu_open_internal() which handles special<br>
&quot;/dev/fdset/&quot; path for monitor fd sets, set CLOEXEC, and uses Err=
or<br>
reporting (and some O_DIRECT special error casing).<br>
<br>
The monitor fdset handling is unnecessary for qga, use<br>
qemu_open_cloexec() instead.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/channel-posix.c=C2=A0 | 14 +++++++++-----<br>
=C2=A0qga/commands-posix.c | 24 ++++++++++++------------<br>
=C2=A02 files changed, 21 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
index 039e1ddcb2..affee485fc 100644<br>
--- a/qga/channel-posix.c<br>
+++ b/qga/channel-posix.c<br>
@@ -1,4 +1,5 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &lt;termios.h&gt;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
@@ -128,11 +129,15 @@ static gboolean ga_channel_open(GAChannel *c, const g=
char *path,<br>
=C2=A0 =C2=A0 =C2=A0switch (c-&gt;method) {<br>
=C2=A0 =C2=A0 =C2=A0case GA_CHANNEL_VIRTIO_SERIAL: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(fd &lt; 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(path, O_RDWR | O_NONBLOCK=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path,<br>
=C2=A0#ifndef CONFIG_SOLARIS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| O_ASYNC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O_ASYNC |<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O_RDWR | O_NONBLOCK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errn=
o, &quot;error opening channel&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -157,9 +162,8 @@ static gboolean ga_channel_open(GAChannel *c, const gch=
ar *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct termios tio;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(fd &lt; 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(path, O_RDWR | O_NOCTTY |=
 O_NONBLOCK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(path, O_RDWR | O_NOCT=
TY | O_NONBLOCK, 0, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcgetattr(fd, &amp;tio);<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 7761458ce1..e8eafad74d 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -1394,6 +1394,7 @@ static GuestDiskInfoList *get_disk_partitions(<br>
<br>
=C2=A0static void get_nvme_smart(GuestDiskInfo *disk)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 Error *err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0GuestNVMeSmart *smart;<br>
=C2=A0 =C2=A0 =C2=A0NvmeSmartLog log =3D {0};<br>
@@ -1406,9 +1407,10 @@ static void get_nvme_smart(GuestDiskInfo *disk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (((sizeof(=
log) &gt;&gt; 2) - 1) &lt;&lt; 16)<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
-=C2=A0 =C2=A0 fd =3D qemu_open_old(disk-&gt;name, O_RDONLY);<br>
+=C2=A0 =C2=A0 fd =3D qemu_open_cloexec(disk-&gt;name, O_RDONLY, 0, &amp;er=
r);<br>
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open device: %s: %s&qu=
ot;, disk-&gt;name, g_strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open device: %s: %s&qu=
ot;, disk-&gt;name, error_get_pretty(err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1739,9 +1741,8 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mount=
points,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(mount-&gt;dirname, O_RDON=
LY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(mount-&gt;dirname, O_=
RDONLY, 0, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;failed to open %s&quot;, mount-&gt;dirname);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1806,7 +1807,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logged =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(mount-&gt;dirname, O_RDON=
LY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(mount-&gt;dirname, O_=
RDONLY, 0, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1866,21 +1867,20 @@ static void guest_fsfreeze_cleanup(void)<br>
=C2=A0GuestFilesystemTrimResponse *<br>
=C2=A0qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0GuestFilesystemTrimResponse *response;<br>
=C2=A0 =C2=A0 =C2=A0GuestFilesystemTrimResult *result;<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0FsMountList mounts;<br>
=C2=A0 =C2=A0 =C2=A0struct FsMount *mount;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0struct fstrim_range r;<br>
<br>
=C2=A0 =C2=A0 =C2=A0slog(&quot;guest-fstrim called&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;mounts);<br>
-=C2=A0 =C2=A0 build_fs_mount_list(&amp;mounts, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 build_fs_mount_list(&amp;mounts, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1892,11 +1892,11 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum,=
 Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPI_LIST_PREPEND(response-&gt;paths, res=
ult);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(mount-&gt;dirname, O_RDON=
LY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(mount-&gt;dirname, O_=
RDONLY, 0, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strdup_pr=
intf(&quot;failed to open: %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strdup(er=
ror_get_pretty(*errp));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result-&gt;has_error =3D tr=
ue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(errp, error_free=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div>

--000000000000dbdffa05df719e56--


