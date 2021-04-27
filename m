Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4182036C11E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:39:33 +0200 (CEST)
Received: from localhost ([::1]:41530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJFk-000208-Cj
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJDt-00014E-7B
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJDn-0007ZI-Je
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ei+aW2rkyk8HHmRkrp98rW+XZvP1z/j9m5pP4pIYWsA=;
 b=Qy0tzQfUYKvC4TGETXShnGRcA1PFqatDgAVkSc+B1kC9rZ1Q8V04VJdyuXmBFuNNWnnUnX
 We+xHyeoaC1RkdVBHuB+XU22L/8h7q77JCZ3yaJs61HW2mzPVEpPl1slv/xyXYHVzwanbi
 RLT6bOk3jjHgCgz5MQTh06bdhzwJ7Yg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-e1Zs0pYAORO_XALibCJBtA-1; Tue, 27 Apr 2021 04:37:28 -0400
X-MC-Unique: e1Zs0pYAORO_XALibCJBtA-1
Received: by mail-pf1-f198.google.com with SMTP id
 x9-20020a056a000bc9b02902599e77f7afso18075844pfu.3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ei+aW2rkyk8HHmRkrp98rW+XZvP1z/j9m5pP4pIYWsA=;
 b=Lt/EG8exJw5/5McWUrnBQZsuDFdDsRV3eei1ZTTl4hb0MyUMN5XfkwctL03VM3tJCa
 VTOAmgCh79n81VMz8r8XvxdVATmj0tige5nA5mXF0wx/+cblxAqLRMpmsbu4C2OJqSIF
 6W0CXlulkvcdHciTIa9IRwaivQQtqtbdM9hJm85Hu3VQbWwQA8Vi7Bl/iEZr+Kcujryu
 ehd3zyxr78Evji1QeglUnbErteVSnj1q8Bx4AYauHVxc/b510MdHOjZ35PiUvlGhzS5V
 AqNCEGCnD+GZPYM6HtM951Kr3YlY0yGEIZzngCfYeaXr4UJVFsxMQKG8WAajEjLNRDU5
 GQVA==
X-Gm-Message-State: AOAM531Q7Kd5+kzFUm06jTMsepvgBjIDDfgmOrI+0mEA5RXQBeIO5Qn9
 FM//uIMJzoSlF6itkgB3JetbxHd5kqia93fKwT+N+J3V7XZLroYkSMuJk7Yf5nR+6MwiOjkWHQR
 At7OhG9seot+Xxd6pLounSqImDmGiOcc=
X-Received: by 2002:a17:902:e843:b029:eb:8aff:360 with SMTP id
 t3-20020a170902e843b02900eb8aff0360mr23437704plg.1.1619512647254; 
 Tue, 27 Apr 2021 01:37:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw97TKkKGGuZu8tbb67Uzr5OsqG4ryIB3ykDBSntG1PGcovGw08CY2lEtDoEzZ794Slvrr131mo8q90f1o5WG0=
X-Received: by 2002:a17:902:e843:b029:eb:8aff:360 with SMTP id
 t3-20020a170902e843b02900eb8aff0360mr23437685plg.1.1619512646998; Tue, 27 Apr
 2021 01:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-3-kraxel@redhat.com>
In-Reply-To: <20210423083351.2096734-3-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 12:37:16 +0400
Message-ID: <CAMxuvaw-whHHtYgdMQfapRuA+eRDL5Rc_V2n9PuUsz3ghS8uZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] ui: add clipboard infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000008b2d205c0f02c1f"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000008b2d205c0f02c1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 12:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Add some infrastructure to manage the clipboard in qemu.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/clipboard.h | 62 ++++++++++++++++++++++++++++
>  ui/clipboard.c         | 92 ++++++++++++++++++++++++++++++++++++++++++
>  ui/meson.build         |  1 +
>  3 files changed, 155 insertions(+)
>  create mode 100644 include/ui/clipboard.h
>  create mode 100644 ui/clipboard.c
>
> diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
> new file mode 100644
> index 000000000000..b2354a4162db
> --- /dev/null
> +++ b/include/ui/clipboard.h
> @@ -0,0 +1,62 @@
> +#ifndef QEMU_CLIPBOARD_H
> +#define QEMU_CLIPBOARD_H
> +
> +#include "qemu/notify.h"
> +
> +typedef enum QemuClipboardType QemuClipboardType;
> +typedef enum QemuClipboardSelection QemuClipboardSelection;
> +typedef struct QemuClipboardPeer QemuClipboardPeer;
> +typedef struct QemuClipboardInfo QemuClipboardInfo;
> +
> +enum QemuClipboardType {
> +    QEMU_CLIPBOARD_TYPE_TEXT,  /* text/plain; charset=3Dutf-8 */
> +    QEMU_CLIPBOARD_TYPE__COUNT,
> +};
> +
> +/* same as VD_AGENT_CLIPBOARD_SELECTION_* */
> +enum QemuClipboardSelection {
> +    QEMU_CLIPBOARD_SELECTION_CLIPBOARD,
> +    QEMU_CLIPBOARD_SELECTION_PRIMARY,
> +    QEMU_CLIPBOARD_SELECTION_SECONDARY,
> +    QEMU_CLIPBOARD_SELECTION__COUNT,
> +};
> +
> +struct QemuClipboardPeer {
> +    const char *name;
> +    Notifier update;
> +    void (*request)(QemuClipboardInfo *info,
> +                    QemuClipboardType type);
> +};
> +
> +struct QemuClipboardInfo {
> +    uint32_t refcount;
> +    QemuClipboardPeer *owner;
> +    QemuClipboardSelection selection;
> +    struct {
> +        bool available;
> +        bool requested;
> +        size_t size;
> +        void *data;
> +    } types[QEMU_CLIPBOARD_TYPE__COUNT];
> +};
> +
> +void qemu_clipboard_peer_register(QemuClipboardPeer *peer);
> +void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);
> +
> +QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
> +                                           QemuClipboardSelection
> selection);
> +QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info);
> +void qemu_clipboard_info_put(QemuClipboardInfo *info);
>

Generally, we follow the glib-style _ref/unref in qemu rather than
kernel-style, but ymmv.

For new types, it might be worth adding
G_DEFINE_AUTOPTR_CLEANUP_FUNC(QemuClipboardInfo,
qemu_clipboard_info_{put/unref}) ?

+
> +void qemu_clipboard_update(QemuClipboardInfo *info);
> +void qemu_clipboard_request(QemuClipboardInfo *info,
> +                            QemuClipboardType type);
> +
> +void qemu_clipboard_set_data(QemuClipboardPeer *peer,
> +                             QemuClipboardInfo *info,
> +                             QemuClipboardType type,
> +                             uint32_t size,
> +                             void *data,
> +                             bool update);
> +
> +#endif /* QEMU_CLIPBOARD_H */
> diff --git a/ui/clipboard.c b/ui/clipboard.c
> new file mode 100644
> index 000000000000..556531c578a1
> --- /dev/null
> +++ b/ui/clipboard.c
> @@ -0,0 +1,92 @@
> +#include "qemu/osdep.h"
> +#include "ui/clipboard.h"
> +
> +static NotifierList clipboard_notifiers =3D
> +    NOTIFIER_LIST_INITIALIZER(clipboard_notifiers);
> +
> +void qemu_clipboard_peer_register(QemuClipboardPeer *peer)
> +{
> +    notifier_list_add(&clipboard_notifiers, &peer->update);
> +}
> +
> +void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
> +{
> +    notifier_remove(&peer->update);
> +}
> +
> +void qemu_clipboard_update(QemuClipboardInfo *info)
> +{
> +    notifier_list_notify(&clipboard_notifiers, info);
> +}
> +
> +QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
> +                                           QemuClipboardSelection
> selection)
> +{
> +    QemuClipboardInfo *info =3D g_new0(QemuClipboardInfo, 1);
> +
> +    info->owner =3D owner;
> +    info->selection =3D selection;
> +    info->refcount =3D 1;
> +
> +    return info;
> +}
> +
> +QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info)
> +{
> +    info->refcount++;
> +    return info;
> +}
> +
> +void qemu_clipboard_info_put(QemuClipboardInfo *info)
> +{
> +    uint32_t type;
> +
> +    if (!info) {
> +        return;
> +    }
> +
> +    info->refcount--;
> +    if (info->refcount > 0) {
> +        return;
> +    }
> +
> +    for (type =3D 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
> +        g_free(info->types[type].data);
> +    }
> +    g_free(info);
> +}
> +
> +void qemu_clipboard_request(QemuClipboardInfo *info,
> +                            QemuClipboardType type)
> +{
> +    if (info->types[type].data ||
> +        info->types[type].requested ||
> +        !info->types[type].available ||
> +        !info->owner)
> +        return;
> +
> +    info->types[type].requested =3D true;
> +    info->owner->request(info, type);
> +}
> +
> +void qemu_clipboard_set_data(QemuClipboardPeer *peer,
> +                             QemuClipboardInfo *info,
> +                             QemuClipboardType type,
> +                             uint32_t size,
> +                             void *data,
> +                             bool update)
> +{
> +    if (!info ||
> +        info->owner !=3D peer) {
> +        return;
> +    }
> +
> +    g_free(info->types[type].data);
> +    info->types[type].data =3D g_memdup(data, size);
> +    info->types[type].size =3D size;
> +    info->types[type].available =3D true;
> +
> +    if (update) {
> +        qemu_clipboard_update(info);
> +    }
> +}
> diff --git a/ui/meson.build b/ui/meson.build
> index e8d3ff41b905..fc4fb75c2869 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -2,6 +2,7 @@ softmmu_ss.add(pixman)
>  specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for the
> include path
>
>  softmmu_ss.add(files(
> +  'clipboard.c',
>    'console.c',
>    'cursor.c',
>    'input-keymap.c',
> --
> 2.30.2
>
>
the above is minor suggestion, so:

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--00000000000008b2d205c0f02c1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 12:34 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add som=
e infrastructure to manage the clipboard in qemu.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/ui/clipboard.h | 62 ++++++++++++++++++++++++++++<br>
=C2=A0ui/clipboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 92 ++++++++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A03 files changed, 155 insertions(+)<br>
=C2=A0create mode 100644 include/ui/clipboard.h<br>
=C2=A0create mode 100644 ui/clipboard.c<br>
<br>
diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h<br>
new file mode 100644<br>
index 000000000000..b2354a4162db<br>
--- /dev/null<br>
+++ b/include/ui/clipboard.h<br>
@@ -0,0 +1,62 @@<br>
+#ifndef QEMU_CLIPBOARD_H<br>
+#define QEMU_CLIPBOARD_H<br>
+<br>
+#include &quot;qemu/notify.h&quot;<br>
+<br>
+typedef enum QemuClipboardType QemuClipboardType;<br>
+typedef enum QemuClipboardSelection QemuClipboardSelection;<br>
+typedef struct QemuClipboardPeer QemuClipboardPeer;<br>
+typedef struct QemuClipboardInfo QemuClipboardInfo;<br>
+<br>
+enum QemuClipboardType {<br>
+=C2=A0 =C2=A0 QEMU_CLIPBOARD_TYPE_TEXT,=C2=A0 /* text/plain; charset=3Dutf=
-8 */<br>
+=C2=A0 =C2=A0 QEMU_CLIPBOARD_TYPE__COUNT,<br>
+};<br>
+<br>
+/* same as VD_AGENT_CLIPBOARD_SELECTION_* */<br>
+enum QemuClipboardSelection {<br>
+=C2=A0 =C2=A0 QEMU_CLIPBOARD_SELECTION_CLIPBOARD,<br>
+=C2=A0 =C2=A0 QEMU_CLIPBOARD_SELECTION_PRIMARY,<br>
+=C2=A0 =C2=A0 QEMU_CLIPBOARD_SELECTION_SECONDARY,<br>
+=C2=A0 =C2=A0 QEMU_CLIPBOARD_SELECTION__COUNT,<br>
+};<br>
+<br>
+struct QemuClipboardPeer {<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 Notifier update;<br>
+=C2=A0 =C2=A0 void (*request)(QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Qemu=
ClipboardType type);<br>
+};<br>
+<br>
+struct QemuClipboardInfo {<br>
+=C2=A0 =C2=A0 uint32_t refcount;<br>
+=C2=A0 =C2=A0 QemuClipboardPeer *owner;<br>
+=C2=A0 =C2=A0 QemuClipboardSelection selection;<br>
+=C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool available;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool requested;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data;<br>
+=C2=A0 =C2=A0 } types[QEMU_CLIPBOARD_TYPE__COUNT];<br>
+};<br>
+<br>
+void qemu_clipboard_peer_register(QemuClipboardPeer *peer);<br>
+void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);<br>
+<br>
+QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0QemuClipboardSelection selection);<br>
+QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info);<br>
+void qemu_clipboard_info_put(QemuClipboardInfo *info);<br></blockquote><di=
v><br></div><div>Generally, we follow the glib-style _ref/unref in qemu rat=
her than kernel-style, but ymmv.<br></div><div><br></div><div>For new types=
, it might be worth adding G_DEFINE_AUTOPTR_CLEANUP_FUNC(QemuClipboardInfo,=
 qemu_clipboard_info_{put/unref}) ?<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+<br>
+void qemu_clipboard_update(QemuClipboardInfo *info);<br>
+void qemu_clipboard_request(QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardType type);<br>
+<br>
+void qemu_clipboard_set_data(QemuClipboardPeer *peer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuClipboardType type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool update);<br>
+<br>
+#endif /* QEMU_CLIPBOARD_H */<br>
diff --git a/ui/clipboard.c b/ui/clipboard.c<br>
new file mode 100644<br>
index 000000000000..556531c578a1<br>
--- /dev/null<br>
+++ b/ui/clipboard.c<br>
@@ -0,0 +1,92 @@<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;ui/clipboard.h&quot;<br>
+<br>
+static NotifierList clipboard_notifiers =3D<br>
+=C2=A0 =C2=A0 NOTIFIER_LIST_INITIALIZER(clipboard_notifiers);<br>
+<br>
+void qemu_clipboard_peer_register(QemuClipboardPeer *peer)<br>
+{<br>
+=C2=A0 =C2=A0 notifier_list_add(&amp;clipboard_notifiers, &amp;peer-&gt;up=
date);<br>
+}<br>
+<br>
+void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)<br>
+{<br>
+=C2=A0 =C2=A0 notifier_remove(&amp;peer-&gt;update);<br>
+}<br>
+<br>
+void qemu_clipboard_update(QemuClipboardInfo *info)<br>
+{<br>
+=C2=A0 =C2=A0 notifier_list_notify(&amp;clipboard_notifiers, info);<br>
+}<br>
+<br>
+QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0QemuClipboardSelection selection)<br>
+{<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info =3D g_new0(QemuClipboardInfo, 1);<br=
>
+<br>
+=C2=A0 =C2=A0 info-&gt;owner =3D owner;<br>
+=C2=A0 =C2=A0 info-&gt;selection =3D selection;<br>
+=C2=A0 =C2=A0 info-&gt;refcount =3D 1;<br>
+<br>
+=C2=A0 =C2=A0 return info;<br>
+}<br>
+<br>
+QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info)<br>
+{<br>
+=C2=A0 =C2=A0 info-&gt;refcount++;<br>
+=C2=A0 =C2=A0 return info;<br>
+}<br>
+<br>
+void qemu_clipboard_info_put(QemuClipboardInfo *info)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t type;<br>
+<br>
+=C2=A0 =C2=A0 if (!info) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 info-&gt;refcount--;<br>
+=C2=A0 =C2=A0 if (info-&gt;refcount &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (type =3D 0; type &lt; QEMU_CLIPBOARD_TYPE__COUNT; type+=
+) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(info-&gt;types[type].data);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_free(info);<br>
+}<br>
+<br>
+void qemu_clipboard_request(QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardType type)<br>
+{<br>
+=C2=A0 =C2=A0 if (info-&gt;types[type].data ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[type].requested ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !info-&gt;types[type].available ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !info-&gt;owner)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+<br>
+=C2=A0 =C2=A0 info-&gt;types[type].requested =3D true;<br>
+=C2=A0 =C2=A0 info-&gt;owner-&gt;request(info, type);<br>
+}<br>
+<br>
+void qemu_clipboard_set_data(QemuClipboardPeer *peer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuClipboardType type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool update)<br>
+{<br>
+=C2=A0 =C2=A0 if (!info ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;owner !=3D peer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_free(info-&gt;types[type].data);<br>
+=C2=A0 =C2=A0 info-&gt;types[type].data =3D g_memdup(data, size);<br>
+=C2=A0 =C2=A0 info-&gt;types[type].size =3D size;<br>
+=C2=A0 =C2=A0 info-&gt;types[type].available =3D true;<br>
+<br>
+=C2=A0 =C2=A0 if (update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index e8d3ff41b905..fc4fb75c2869 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -2,6 +2,7 @@ softmmu_ss.add(pixman)<br>
=C2=A0specific_ss.add(when: [&#39;CONFIG_SOFTMMU&#39;], if_true: pixman)=C2=
=A0 =C2=A0# for the include path<br>
<br>
=C2=A0softmmu_ss.add(files(<br>
+=C2=A0 &#39;clipboard.c&#39;,<br>
=C2=A0 =C2=A0&#39;console.c&#39;,<br>
=C2=A0 =C2=A0&#39;cursor.c&#39;,<br>
=C2=A0 =C2=A0&#39;input-keymap.c&#39;,<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div>the above is minor suggestion, so:</di=
v><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"ma=
ilto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0=
 <br></div></div></div>

--00000000000008b2d205c0f02c1f--


