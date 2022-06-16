Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E325454E58A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 17:01:03 +0200 (CEST)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qzX-0001x7-14
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 11:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qxr-0001Fr-OJ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:59:21 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qxq-0007Dm-0l
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:59:19 -0400
Received: by mail-lf1-x133.google.com with SMTP id i29so2639727lfp.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YwjMbuNmRyqbPa0UwFhz1TF31GAKRqeH2rGNymIkmQo=;
 b=Xm6TVJw3YPYmU/3wgKlx+V+f67cIWkfsj48K+gGRGx83ksd+5qxS6k78nvEARM8fMj
 U62+jh1up8DQAhdkpLQ7Da9aqkF/QSmeaXaBNE3J5Dgyq+xMovfRI6lr1fqgMu+5COhA
 /yrkw8bPtDwWirNUkNAVpUrHC+Eaulv+O+7Y84PRVRdvD241ZjpUzAjthaVmPfMtvCFw
 Sb2Bchxmmy/cHMgP/Rc5wpGkEMj5jvdbTeG8R7hEdZB6PoRCCiuYGPwTud/zI8HH+gSu
 LMNr0LzQQSCSTEzmYwPYzphtqZstAxWS7dWt/LkQXB/q5r652tE9sC0m6kFJufHc8wTV
 vzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YwjMbuNmRyqbPa0UwFhz1TF31GAKRqeH2rGNymIkmQo=;
 b=gYDrAwhUNpSOchrhbROv2dQsRWvHTZnwm4aFbiPJ2rKBVEP5a4/kOWWF763Hsjk5C+
 Aj10nHqAYqQcTXe/+qKZPKNe+rH+g8aKa6g5ZXqStaBNNbt8GuYVnDS5o1wFNeyhA4hS
 p9cxDa6ZYmO1fcy2yPuI9Hsr8CIZmtAdvbUmUkjnMjzXgKaDoXHBOLa5p+15mrn/CKSN
 9EmyG/kLNm2Fkom/gE0ozOqsJziXRxHtTBrffFjFaXh49N7qhRL0AH5Uv26smJl6b0gj
 3DPZFLc0boLPWySSM6IfYJ3NsRNElvO3ebRyTL0yDPWXiKsIZhlo0cJoH9RPbndlDuj8
 5eFg==
X-Gm-Message-State: AJIora/UJqHjZpgn5cn0GjgPbSX/ixDJ/kEunAijbhj2B6OnnqnlwWCd
 RkuNhJdjMpGlbtMoAD92VQe65d7I8VkSrn5oyWA=
X-Google-Smtp-Source: AGRyM1tD0Uw6+cGuAbNadoq4cSN+707rFLbfJ76BQ6Qbr5wPw9G5h6kHAYGUPSrj1tQqLu4lf4/G0CXgAchJfUiNFxE=
X-Received: by 2002:a05:6512:108b:b0:479:4cce:7ab1 with SMTP id
 j11-20020a056512108b00b004794cce7ab1mr2922142lfg.94.1655391556312; Thu, 16
 Jun 2022 07:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-4-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-4-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 18:59:04 +0400
Message-ID: <CAJ+F1CL85hOgz+d9TT+4uq+T1EdZz8f=_O+SeGbbewWT2e2Yew@mail.gmail.com>
Subject: Re: [PATCH V8 03/39] migration: simplify savevm
To: Steve Sistare <steven.sistare@oracle.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ada3d605e191e1ee"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ada3d605e191e1ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 15, 2022 at 6:57 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Use qemu_file_open to simplify a few functions in savevm.c.
> No functional change.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

(ok, I get why you keep the mode_t in fopen)

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  migration/savevm.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d907689..0b2c5cd 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2931,7 +2931,6 @@ void qmp_xen_save_devices_state(const char
> *filename, bool has_live, bool live,
>                                  Error **errp)
>  {
>      QEMUFile *f;
> -    QIOChannelFile *ioc;
>      int saved_vm_running;
>      int ret;
>
> @@ -2945,14 +2944,11 @@ void qmp_xen_save_devices_state(const char
> *filename, bool has_live, bool live,
>      vm_stop(RUN_STATE_SAVE_VM);
>      global_state_store_running();
>
> -    ioc =3D qio_channel_file_new_path(filename, O_WRONLY | O_CREAT |
> O_TRUNC,
> -                                    0660, errp);
> -    if (!ioc) {
> +    f =3D qemu_fopen_file(filename, O_WRONLY | O_CREAT | O_TRUNC, 0660,
> +                        "migration-xen-save-state", errp);
> +    if (!f) {
>          goto the_end;
>      }
> -    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
> -    f =3D qemu_fopen_channel_output(QIO_CHANNEL(ioc));
> -    object_unref(OBJECT(ioc));
>      ret =3D qemu_save_device_state(f);
>      if (ret < 0 || qemu_fclose(f) < 0) {
>          error_setg(errp, QERR_IO_ERROR);
> @@ -2981,7 +2977,6 @@ void qmp_xen_save_devices_state(const char
> *filename, bool has_live, bool live,
>  void qmp_xen_load_devices_state(const char *filename, Error **errp)
>  {
>      QEMUFile *f;
> -    QIOChannelFile *ioc;
>      int ret;
>
>      /* Guest must be paused before loading the device state; the RAM sta=
te
> @@ -2993,14 +2988,11 @@ void qmp_xen_load_devices_state(const char
> *filename, Error **errp)
>      }
>      vm_stop(RUN_STATE_RESTORE_VM);
>
> -    ioc =3D qio_channel_file_new_path(filename, O_RDONLY | O_BINARY, 0,
> errp);
> -    if (!ioc) {
> +    f =3D qemu_fopen_file(filename, O_RDONLY | O_BINARY, 0,
> +                        "migration-xen-load-state", errp);
> +    if (!f) {
>          return;
>      }
> -    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-load-state");
> -    f =3D qemu_fopen_channel_input(QIO_CHANNEL(ioc));
> -    object_unref(OBJECT(ioc));
> -
>      ret =3D qemu_loadvm_state(f);
>      qemu_fclose(f);
>      if (ret < 0) {
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ada3d605e191e1ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 6:57 PM Ste=
ve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@=
oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Use qemu_file_open to simplify a few functions in savevm.c.<br>
No functional change.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
Reviewed-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.c=
om" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br></blockquote><div><br>=
</div><div>(ok, I get why you keep the mode_t in fopen)<br></div><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0migration/savevm.c | 20 ++++++--------------<br>
=C2=A01 file changed, 6 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/migration/savevm.c b/migration/savevm.c<br>
index d907689..0b2c5cd 100644<br>
--- a/migration/savevm.c<br>
+++ b/migration/savevm.c<br>
@@ -2931,7 +2931,6 @@ void qmp_xen_save_devices_state(const char *filename,=
 bool has_live, bool live,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUFile *f;<br>
-=C2=A0 =C2=A0 QIOChannelFile *ioc;<br>
=C2=A0 =C2=A0 =C2=A0int saved_vm_running;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
@@ -2945,14 +2944,11 @@ void qmp_xen_save_devices_state(const char *filenam=
e, bool has_live, bool live,<br>
=C2=A0 =C2=A0 =C2=A0vm_stop(RUN_STATE_SAVE_VM);<br>
=C2=A0 =C2=A0 =C2=A0global_state_store_running();<br>
<br>
-=C2=A0 =C2=A0 ioc =3D qio_channel_file_new_path(filename, O_WRONLY | O_CRE=
AT | O_TRUNC,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0660, errp);<br>
-=C2=A0 =C2=A0 if (!ioc) {<br>
+=C2=A0 =C2=A0 f =3D qemu_fopen_file(filename, O_WRONLY | O_CREAT | O_TRUNC=
, 0660,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;migration-xen-save-state&quot;, errp);<br>
+=C2=A0 =C2=A0 if (!f) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto the_end;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qio_channel_set_name(QIO_CHANNEL(ioc), &quot;migration-xen-s=
ave-state&quot;);<br>
-=C2=A0 =C2=A0 f =3D qemu_fopen_channel_output(QIO_CHANNEL(ioc));<br>
-=C2=A0 =C2=A0 object_unref(OBJECT(ioc));<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_save_device_state(f);<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0 || qemu_fclose(f) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_IO_ERROR);<br>
@@ -2981,7 +2977,6 @@ void qmp_xen_save_devices_state(const char *filename,=
 bool has_live, bool live,<br>
=C2=A0void qmp_xen_load_devices_state(const char *filename, Error **errp)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QEMUFile *f;<br>
-=C2=A0 =C2=A0 QIOChannelFile *ioc;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Guest must be paused before loading the device state=
; the RAM state<br>
@@ -2993,14 +2988,11 @@ void qmp_xen_load_devices_state(const char *filenam=
e, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0vm_stop(RUN_STATE_RESTORE_VM);<br>
<br>
-=C2=A0 =C2=A0 ioc =3D qio_channel_file_new_path(filename, O_RDONLY | O_BIN=
ARY, 0, errp);<br>
-=C2=A0 =C2=A0 if (!ioc) {<br>
+=C2=A0 =C2=A0 f =3D qemu_fopen_file(filename, O_RDONLY | O_BINARY, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;migration-xen-load-state&quot;, errp);<br>
+=C2=A0 =C2=A0 if (!f) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qio_channel_set_name(QIO_CHANNEL(ioc), &quot;migration-xen-l=
oad-state&quot;);<br>
-=C2=A0 =C2=A0 f =3D qemu_fopen_channel_input(QIO_CHANNEL(ioc));<br>
-=C2=A0 =C2=A0 object_unref(OBJECT(ioc));<br>
-<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_loadvm_state(f);<br>
=C2=A0 =C2=A0 =C2=A0qemu_fclose(f);<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ada3d605e191e1ee--

