Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8936C128
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:41:39 +0200 (CEST)
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJHm-0004Rs-O0
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJGN-0003H5-Rw
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJGK-0000S8-5S
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FsPvQNXtqCy6i44n3tbca4U3FQoJ6fVRhKMfTpMEReQ=;
 b=feLTB2QCFG8fH0CyD/sgNipE4r8xx3lhfr2TRcdiwPWPRyJge9mtULYHgi7/WwwGX4112U
 rJPusIdB5qqUkkrwIUclppo+WDmHaeNaodOLGH1Yq3zFShyMTAL90pdvmBkEAPuVEDUTQO
 wduEq7c+GS89GLeUBVDgt5TurQSl1NU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-VJG4hkg9PgOI0kzNfDBgBw-1; Tue, 27 Apr 2021 04:39:13 -0400
X-MC-Unique: VJG4hkg9PgOI0kzNfDBgBw-1
Received: by mail-pl1-f197.google.com with SMTP id
 m8-20020a170902db08b02900ecafbf66bbso11800951plx.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FsPvQNXtqCy6i44n3tbca4U3FQoJ6fVRhKMfTpMEReQ=;
 b=C329I2+oUyAKdHQxlQKD84W/aFWu7L3r4cpHTAJRcqrI0zcJUf4D64ai4FpRc90lvv
 UBc8pg4c1Em45lDHqwoyYQOCcpPDPFXIS4mOyMG7kuAy8f93DNbtROluRZgiIt+RnQNH
 TxAiQVE6HPutDzsQL99IufZ7pG+7BcJ1w+qGocezuw1tHbby4hMbG+L18h3ZF2uvOd8H
 2x9eOl75R9lhkieDjNkT66qWen++X5g8vL1ayDtcH0OZ/afTQzkJr5PB/wXfTyCa4TmL
 lnxcRZMapcCgEYgP8KpbAY76ZU/9v+PdpLHdUN1i4EVpPFiZl2hZdGg3RRZgl1MWWrd2
 Sbqg==
X-Gm-Message-State: AOAM530+jDQrU5eJ2hpSR/JkMlHnVMpmRpQ8bDSzYsBcBzLvJPo1mglB
 zEUvnGnhmykdLR4TXHfdql8mHNfHLcfifb0zBeVScMA+pdQrCVK3DQmkTby2RuEPHd0F3r0mWpv
 mtdjqBKfp+w87ikQP91dEluwEHHhB9Og=
X-Received: by 2002:a17:90a:8d82:: with SMTP id
 d2mr25687926pjo.200.1619512751907; 
 Tue, 27 Apr 2021 01:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8n9f2GLfWmRH/my/gnmyooTfPVy7tUItYL/w54ZW6dCKizpdXxCs935kWRwO2TZdA6UZf3mwZ3kGEDoJcmFc=
X-Received: by 2002:a17:90a:8d82:: with SMTP id
 d2mr25687911pjo.200.1619512751717; 
 Tue, 27 Apr 2021 01:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-4-kraxel@redhat.com>
In-Reply-To: <20210423083351.2096734-4-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 12:39:00 +0400
Message-ID: <CAMxuvawwS=kn2hj86EeojW6b6TU-dSXuffLaiNBd5Embye-rHA@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] ui: add clipboard documentation
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000046a3b805c0f03223"
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

--00000000000046a3b805c0f03223
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 12:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Document clipboard infrastructure in qemu.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/clipboard.h | 133 ++++++++++++++++++++++++++++++++++++++++-
>  docs/devel/index.rst   |   1 +
>  docs/devel/ui.rst      |   8 +++
>  3 files changed, 141 insertions(+), 1 deletion(-)
>  create mode 100644 docs/devel/ui.rst
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
> index b2354a4162db..57d4ad445628 100644
> --- a/include/ui/clipboard.h
> +++ b/include/ui/clipboard.h
> @@ -3,17 +3,47 @@
>
>  #include "qemu/notify.h"
>
> +/**
> + * DOC: Introduction
> + *
> + * The header ``ui/clipboard.h`` declares the qemu clipboard interface.
> + *
> + * All qemu elements which want use the clipboard can register as
> + * clipboard peer.  Subsequently they can set the clipboard content
> + * and get notifications for clipboard updates.
> + *
> + * Typical users are user interfaces (gtk), remote access protocols
> + * (vnc) and devices talking to the guest (vdagent).
> + *
> + * Even though the design allows different data types only plain text
> + * is supported for now.
> + */
> +
>  typedef enum QemuClipboardType QemuClipboardType;
>  typedef enum QemuClipboardSelection QemuClipboardSelection;
>  typedef struct QemuClipboardPeer QemuClipboardPeer;
>  typedef struct QemuClipboardInfo QemuClipboardInfo;
>
> +/**
> + * enum QemuClipboardType
> + *
> + * @QEMU_CLIPBOARD_TYPE_TEXT: text/plain; charset=3Dutf-8
> + * @QEMU_CLIPBOARD_TYPE__COUNT: type count.
> + */
>  enum QemuClipboardType {
> -    QEMU_CLIPBOARD_TYPE_TEXT,  /* text/plain; charset=3Dutf-8 */
> +    QEMU_CLIPBOARD_TYPE_TEXT,
>      QEMU_CLIPBOARD_TYPE__COUNT,
>  };
>
>  /* same as VD_AGENT_CLIPBOARD_SELECTION_* */
> +/**
> + * enum QemuClipboardSelection
> + *
> + * @QEMU_CLIPBOARD_SELECTION_CLIPBOARD: clipboard (explitcit cut+paste).
> + * @QEMU_CLIPBOARD_SELECTION_PRIMARY: primary selection (select + middle
> mouse button).
> + * @QEMU_CLIPBOARD_SELECTION_SECONDARY: secondary selection (dunno).
> + * @QEMU_CLIPBOARD_SELECTION__COUNT: selection count.
> + */
>  enum QemuClipboardSelection {
>      QEMU_CLIPBOARD_SELECTION_CLIPBOARD,
>      QEMU_CLIPBOARD_SELECTION_PRIMARY,
> @@ -21,6 +51,15 @@ enum QemuClipboardSelection {
>      QEMU_CLIPBOARD_SELECTION__COUNT,
>  };
>
> +/**
> + * struct QemuClipboardPeer
> + *
> + * @name: peer name.
> + * @update: notifier for clipboard updates.
> + * @request: callback for clipboard data requests.
> + *
> + * Clipboard peer description.
> + */
>  struct QemuClipboardPeer {
>      const char *name;
>      Notifier update;
> @@ -28,6 +67,16 @@ struct QemuClipboardPeer {
>                      QemuClipboardType type);
>  };
>
> +/**
> + * struct QemuClipboardInfo
> + *
> + * @refcount: reference counter.
> + * @owner: clipboard owner.
> + * @selection: clipboard selection.
> + * @types: clipboard data array (one entry per type).
> + *
> + * Clipboard content data and metadata.
> + */
>  struct QemuClipboardInfo {
>      uint32_t refcount;
>      QemuClipboardPeer *owner;
> @@ -40,18 +89,100 @@ struct QemuClipboardInfo {
>      } types[QEMU_CLIPBOARD_TYPE__COUNT];
>  };
>
> +/**
> + * qemu_clipboard_peer_register
> + *
> + * @peer: peer information.
> + *
> + * Register clipboard peer.  Registering is needed for both active
> + * (set+grab clipboard) and passive (watch clipboard for updates)
> + * interaction with the qemu clipboard.
> + */
>  void qemu_clipboard_peer_register(QemuClipboardPeer *peer);
> +
> +/**
> + * qemu_clipboard_peer_unregister
> + *
> + * @peer: peer information.
> + *
> + * Unregister clipboard peer.
> + */
>  void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);
>
> +/**
> + * qemu_clipboard_info_new
> + *
> + * @owner: clipboard owner.
> + * @selection: clipboard selection.
> + *
> + * Allocate a new QemuClipboardInfo and initialize it with the given
> + * @owner and @selection.
> + *
> + * QemuClipboardInfo is a reference-counted struct.  The new struct is
> + * returned with a reference already taken (i.e. reference count is
> + * one).
> + */
>  QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
>                                             QemuClipboardSelection
> selection);
> +/**
> + * qemu_clipboard_info_get
> + *
> + * @info: clipboard info.
> + *
> + * Increase @info reference count.
> + */
>  QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info);
> +
> +/**
> + * qemu_clipboard_info_put
> + *
> + * @info: clipboard info.
> + *
> + * Decrease @info reference count.  When the count goes down to zero
> + * free the @info struct itself and all clipboard data.
> + */
>  void qemu_clipboard_info_put(QemuClipboardInfo *info);
>
> +/**
> + * qemu_clipboard_update
> + *
> + * @info: clipboard info.
> + *
> + * Update the qemu clipboard.  Notify all registered peers (including
> + * the clipboard owner) that the qemu clipboard has been updated.
> + *
> + * This is used for both new completely clipboard content and for
> + * clipboard data updates in response to qemu_clipboard_request()
> + * calls.
> + */
>  void qemu_clipboard_update(QemuClipboardInfo *info);
> +
> +/**
> + * qemu_clipboard_request
> + *
> + * @info: clipboard info.
> + * @type: clipboard data type.
> + *
> + * Request clipboard content.  Typically the clipboard owner only
> + * advertises the available data types and provides the actual data
> + * only on request.
> + */
>  void qemu_clipboard_request(QemuClipboardInfo *info,
>                              QemuClipboardType type);
>
> +/**
> + * qemu_clipboard_set_data
> + *
> + * @peer: clipboard peer.
> + * @info: clipboard info.
> + * @type: clipboard data type.
> + * @size: data size.
> + * @data: data blob.
> + * @update: notify peers about the update.
> + *
> + * Set clipboard content for the given @type.  This function will make
> + * a copy of the content data and store that.
> + */
>  void qemu_clipboard_set_data(QemuClipboardPeer *peer,
>                               QemuClipboardInfo *info,
>                               QemuClipboardType type,
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 6cf7e2d2330c..cbdbb9049182 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -36,6 +36,7 @@ Contents:
>     multi-thread-tcg
>     tcg-plugins
>     bitops
> +   ui
>     reset
>     s390-dasd-ipl
>     clocks
> diff --git a/docs/devel/ui.rst b/docs/devel/ui.rst
> new file mode 100644
> index 000000000000..06c7d622ce74
> --- /dev/null
> +++ b/docs/devel/ui.rst
> @@ -0,0 +1,8 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Qemu UI subsystem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Qemu Clipboard
> +--------------
> +
> +.. kernel-doc:: include/ui/clipboard.h
> --
> 2.30.2
>
>

--00000000000046a3b805c0f03223
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 12:34 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Documen=
t clipboard infrastructure in qemu.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/ui/clipboard.h | 133 ++++++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A0docs/devel/index.rst=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0docs/devel/ui.rst=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +++<br>
=C2=A03 files changed, 141 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 docs/devel/ui.rst<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt;=C2=A0 <br></div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h<br>
index b2354a4162db..57d4ad445628 100644<br>
--- a/include/ui/clipboard.h<br>
+++ b/include/ui/clipboard.h<br>
@@ -3,17 +3,47 @@<br>
<br>
=C2=A0#include &quot;qemu/notify.h&quot;<br>
<br>
+/**<br>
+ * DOC: Introduction<br>
+ *<br>
+ * The header ``ui/clipboard.h`` declares the qemu clipboard interface.<br=
>
+ *<br>
+ * All qemu elements which want use the clipboard can register as<br>
+ * clipboard peer.=C2=A0 Subsequently they can set the clipboard content<b=
r>
+ * and get notifications for clipboard updates.<br>
+ *<br>
+ * Typical users are user interfaces (gtk), remote access protocols<br>
+ * (vnc) and devices talking to the guest (vdagent).<br>
+ *<br>
+ * Even though the design allows different data types only plain text<br>
+ * is supported for now.<br>
+ */<br>
+<br>
=C2=A0typedef enum QemuClipboardType QemuClipboardType;<br>
=C2=A0typedef enum QemuClipboardSelection QemuClipboardSelection;<br>
=C2=A0typedef struct QemuClipboardPeer QemuClipboardPeer;<br>
=C2=A0typedef struct QemuClipboardInfo QemuClipboardInfo;<br>
<br>
+/**<br>
+ * enum QemuClipboardType<br>
+ *<br>
+ * @QEMU_CLIPBOARD_TYPE_TEXT: text/plain; charset=3Dutf-8<br>
+ * @QEMU_CLIPBOARD_TYPE__COUNT: type count.<br>
+ */<br>
=C2=A0enum QemuClipboardType {<br>
-=C2=A0 =C2=A0 QEMU_CLIPBOARD_TYPE_TEXT,=C2=A0 /* text/plain; charset=3Dutf=
-8 */<br>
+=C2=A0 =C2=A0 QEMU_CLIPBOARD_TYPE_TEXT,<br>
=C2=A0 =C2=A0 =C2=A0QEMU_CLIPBOARD_TYPE__COUNT,<br>
=C2=A0};<br>
<br>
=C2=A0/* same as VD_AGENT_CLIPBOARD_SELECTION_* */<br>
+/**<br>
+ * enum QemuClipboardSelection<br>
+ *<br>
+ * @QEMU_CLIPBOARD_SELECTION_CLIPBOARD: clipboard (explitcit cut+paste).<b=
r>
+ * @QEMU_CLIPBOARD_SELECTION_PRIMARY: primary selection (select + middle m=
ouse button).<br>
+ * @QEMU_CLIPBOARD_SELECTION_SECONDARY: secondary selection (dunno).<br>
+ * @QEMU_CLIPBOARD_SELECTION__COUNT: selection count.<br>
+ */<br>
=C2=A0enum QemuClipboardSelection {<br>
=C2=A0 =C2=A0 =C2=A0QEMU_CLIPBOARD_SELECTION_CLIPBOARD,<br>
=C2=A0 =C2=A0 =C2=A0QEMU_CLIPBOARD_SELECTION_PRIMARY,<br>
@@ -21,6 +51,15 @@ enum QemuClipboardSelection {<br>
=C2=A0 =C2=A0 =C2=A0QEMU_CLIPBOARD_SELECTION__COUNT,<br>
=C2=A0};<br>
<br>
+/**<br>
+ * struct QemuClipboardPeer<br>
+ *<br>
+ * @name: peer name.<br>
+ * @update: notifier for clipboard updates.<br>
+ * @request: callback for clipboard data requests.<br>
+ *<br>
+ * Clipboard peer description.<br>
+ */<br>
=C2=A0struct QemuClipboardPeer {<br>
=C2=A0 =C2=A0 =C2=A0const char *name;<br>
=C2=A0 =C2=A0 =C2=A0Notifier update;<br>
@@ -28,6 +67,16 @@ struct QemuClipboardPeer {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0QemuClipboardType type);<br>
=C2=A0};<br>
<br>
+/**<br>
+ * struct QemuClipboardInfo<br>
+ *<br>
+ * @refcount: reference counter.<br>
+ * @owner: clipboard owner.<br>
+ * @selection: clipboard selection.<br>
+ * @types: clipboard data array (one entry per type).<br>
+ *<br>
+ * Clipboard content data and metadata.<br>
+ */<br>
=C2=A0struct QemuClipboardInfo {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t refcount;<br>
=C2=A0 =C2=A0 =C2=A0QemuClipboardPeer *owner;<br>
@@ -40,18 +89,100 @@ struct QemuClipboardInfo {<br>
=C2=A0 =C2=A0 =C2=A0} types[QEMU_CLIPBOARD_TYPE__COUNT];<br>
=C2=A0};<br>
<br>
+/**<br>
+ * qemu_clipboard_peer_register<br>
+ *<br>
+ * @peer: peer information.<br>
+ *<br>
+ * Register clipboard peer.=C2=A0 Registering is needed for both active<br=
>
+ * (set+grab clipboard) and passive (watch clipboard for updates)<br>
+ * interaction with the qemu clipboard.<br>
+ */<br>
=C2=A0void qemu_clipboard_peer_register(QemuClipboardPeer *peer);<br>
+<br>
+/**<br>
+ * qemu_clipboard_peer_unregister<br>
+ *<br>
+ * @peer: peer information.<br>
+ *<br>
+ * Unregister clipboard peer.<br>
+ */<br>
=C2=A0void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);<br>
<br>
+/**<br>
+ * qemu_clipboard_info_new<br>
+ *<br>
+ * @owner: clipboard owner.<br>
+ * @selection: clipboard selection.<br>
+ *<br>
+ * Allocate a new QemuClipboardInfo and initialize it with the given<br>
+ * @owner and @selection.<br>
+ *<br>
+ * QemuClipboardInfo is a reference-counted struct.=C2=A0 The new struct i=
s<br>
+ * returned with a reference already taken (i.e. reference count is<br>
+ * one).<br>
+ */<br>
=C2=A0QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QemuClipboardSelection selection);<br>
+/**<br>
+ * qemu_clipboard_info_get<br>
+ *<br>
+ * @info: clipboard info.<br>
+ *<br>
+ * Increase @info reference count.<br>
+ */<br>
=C2=A0QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info);<=
br>
+<br>
+/**<br>
+ * qemu_clipboard_info_put<br>
+ *<br>
+ * @info: clipboard info.<br>
+ *<br>
+ * Decrease @info reference count.=C2=A0 When the count goes down to zero<=
br>
+ * free the @info struct itself and all clipboard data.<br>
+ */<br>
=C2=A0void qemu_clipboard_info_put(QemuClipboardInfo *info);<br>
<br>
+/**<br>
+ * qemu_clipboard_update<br>
+ *<br>
+ * @info: clipboard info.<br>
+ *<br>
+ * Update the qemu clipboard.=C2=A0 Notify all registered peers (including=
<br>
+ * the clipboard owner) that the qemu clipboard has been updated.<br>
+ *<br>
+ * This is used for both new completely clipboard content and for<br>
+ * clipboard data updates in response to qemu_clipboard_request()<br>
+ * calls.<br>
+ */<br>
=C2=A0void qemu_clipboard_update(QemuClipboardInfo *info);<br>
+<br>
+/**<br>
+ * qemu_clipboard_request<br>
+ *<br>
+ * @info: clipboard info.<br>
+ * @type: clipboard data type.<br>
+ *<br>
+ * Request clipboard content.=C2=A0 Typically the clipboard owner only<br>
+ * advertises the available data types and provides the actual data<br>
+ * only on request.<br>
+ */<br>
=C2=A0void qemu_clipboard_request(QemuClipboardInfo *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuClipboardType type);<br>
<br>
+/**<br>
+ * qemu_clipboard_set_data<br>
+ *<br>
+ * @peer: clipboard peer.<br>
+ * @info: clipboard info.<br>
+ * @type: clipboard data type.<br>
+ * @size: data size.<br>
+ * @data: data blob.<br>
+ * @update: notify peers about the update.<br>
+ *<br>
+ * Set clipboard content for the given @type.=C2=A0 This function will mak=
e<br>
+ * a copy of the content data and store that.<br>
+ */<br>
=C2=A0void qemu_clipboard_set_data(QemuClipboardPeer *peer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardInfo *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuClipboardType type,<br>
diff --git a/docs/devel/index.rst b/docs/devel/index.rst<br>
index 6cf7e2d2330c..cbdbb9049182 100644<br>
--- a/docs/devel/index.rst<br>
+++ b/docs/devel/index.rst<br>
@@ -36,6 +36,7 @@ Contents:<br>
=C2=A0 =C2=A0 multi-thread-tcg<br>
=C2=A0 =C2=A0 tcg-plugins<br>
=C2=A0 =C2=A0 bitops<br>
+=C2=A0 =C2=A0ui<br>
=C2=A0 =C2=A0 reset<br>
=C2=A0 =C2=A0 s390-dasd-ipl<br>
=C2=A0 =C2=A0 clocks<br>
diff --git a/docs/devel/ui.rst b/docs/devel/ui.rst<br>
new file mode 100644<br>
index 000000000000..06c7d622ce74<br>
--- /dev/null<br>
+++ b/docs/devel/ui.rst<br>
@@ -0,0 +1,8 @@<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+Qemu UI subsystem<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+Qemu Clipboard<br>
+--------------<br>
+<br>
+.. kernel-doc:: include/ui/clipboard.h<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--00000000000046a3b805c0f03223--


