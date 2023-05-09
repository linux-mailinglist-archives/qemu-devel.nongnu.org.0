Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448B6FC3A3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:13:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKKT-0008Rh-K2; Tue, 09 May 2023 06:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwKKL-0008Le-CC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:12:13 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwKKI-0001Bh-GF
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:12:12 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f13c577e36so6267136e87.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683627128; x=1686219128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xG+UDSfesxi4G6seztoucoHSTQ5IVVUsg/oYE46jy/A=;
 b=nODf5EXR1nrcmFpaWzi/cruKLssiesKDgWlihxogLOJRJd8tY93tnjktf0Bqn4YYHe
 me2d8/LxJ0w6Cpp6qMj3hk0NxAMMQjXueLN6848euKTp11lAL3XYHOzqHOiDCRK1BJgU
 c4GUrxvi+LT6/27X8+vL0zWolJaWR1+WX5XzMG2lLMGrsrlqNhUZK/Iab17H+/TZGf/T
 U+yfnb0n9d+XWX1EofDvCwSS0H/GZ3UjWqSOtyuf2xyjje83CtupcAi2h8sSmTOlm4hK
 02P+/Z4a//veQiyswM4MqA85m0dKCPU3S6wohuY4C1KdYg2YcAzagQC6QPq8fbxrU+xN
 R3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683627128; x=1686219128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xG+UDSfesxi4G6seztoucoHSTQ5IVVUsg/oYE46jy/A=;
 b=ij/3b3llx+ac/1v9c/+U7I5KOyEHVPg2u3eAnU7lzOEvivJ11EmL7xz1ZtMXVGMbuj
 AJxyoHxERPbV5Wk72PNHCLvrhfC1ls3C7Po/Q5i3kX1PzFxytIWH1H15A8vVZp8xUPJ+
 NRy4YEbMPJXzwfwbppBz0tuZ9ySbKwiwqxq4f4QC+7NNcGlu543ojMkkNxblmtpTMeEv
 TAKSxmGHPAy8KHqBPxIiPde6ONSiojZTDnuf204MVVr+Afnkcs+li6d0JcPG83sMXbG2
 petJlVukPvYh+xjMuHu+rV6I4s97eFu48o4dCxoEjKsd6YN/y+AQAgPqbPyjR9rfTY+d
 HRdg==
X-Gm-Message-State: AC+VfDwVO96dZOqSrLwAM69zvwv7/F01DcBpXxSMfAGV024UnAvEtDGG
 t8yuEEpbCFLQ4MiJvLTChrGXVQeCwxMZ4odJCio=
X-Google-Smtp-Source: ACHHUZ4yBnVWq9E2a4UMXF9iS+UQ1sJZDQ1xbMkwbaJpA2MX0s63ko2wrm1ViWSwAdzYzhMZqKSiTV5CWbzx3s6H2Jg=
X-Received: by 2002:a19:c20d:0:b0:4f2:5c13:ea55 with SMTP id
 l13-20020a19c20d000000b004f25c13ea55mr337416lfc.18.1683627127669; Tue, 09 May
 2023 03:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230503081911.119168-1-aesteve@redhat.com>
 <20230503081911.119168-5-aesteve@redhat.com>
In-Reply-To: <20230503081911.119168-5-aesteve@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 May 2023 14:11:55 +0400
Message-ID: <CAJ+F1CJd_wdTuQgspE7=mPhgbvx9VDrd3iejcTDLquC8PBjj1A@mail.gmail.com>
Subject: Re: [PATCH 4/4] libvhost-user: add write_msg cb to dev struct
To: Albert Esteve <aesteve@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e108e305fb3ffcec"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

--000000000000e108e305fb3ffcec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 3, 2023 at 12:21=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:

> Add vu_write_msg_cb type as a member of the VuDev
> struct.
>
> In order to interact with the virtio-dmabuf
> API, vhost-user backends have available a special
> message type that can be sent to the frontend
> in Qemu, in order to add, lookup, or remove
> entries.
>
> To send these messages and avoid code replication,
> backends will need the write_msg method to be exposed
> to them, similarly to how the read_msg is for
> receiving messages.
>

I think read_msg was introduced to blend libvhost-user IO to qemu mainloop
& coroutine. Is that what you have in mind for write_msg?


> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c |  1 +
>  subprojects/libvhost-user/libvhost-user.h | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/subprojects/libvhost-user/libvhost-user.c
> b/subprojects/libvhost-user/libvhost-user.c
> index 6b4b721225..c50b353915 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -2115,6 +2115,7 @@ vu_init(VuDev *dev,
>      dev->sock =3D socket;
>      dev->panic =3D panic;
>      dev->read_msg =3D read_msg ? read_msg : vu_message_read_default;
> +    dev->write_msg =3D vu_message_write;
>

You are not making it customizable? And the callback is not used.


>      dev->set_watch =3D set_watch;
>      dev->remove_watch =3D remove_watch;
>      dev->iface =3D iface;
> diff --git a/subprojects/libvhost-user/libvhost-user.h
> b/subprojects/libvhost-user/libvhost-user.h
> index 784db65f7c..f5d7162886 100644
> --- a/subprojects/libvhost-user/libvhost-user.h
> +++ b/subprojects/libvhost-user/libvhost-user.h
> @@ -242,6 +242,7 @@ typedef void (*vu_set_features_cb) (VuDev *dev,
> uint64_t features);
>  typedef int (*vu_process_msg_cb) (VuDev *dev, VhostUserMsg *vmsg,
>                                    int *do_reply);
>  typedef bool (*vu_read_msg_cb) (VuDev *dev, int sock, VhostUserMsg *vmsg=
);
> +typedef bool (*vu_write_msg_cb) (VuDev *dev, int sock, VhostUserMsg
> *vmsg);
>  typedef void (*vu_queue_set_started_cb) (VuDev *dev, int qidx, bool
> started);
>  typedef bool (*vu_queue_is_processed_in_order_cb) (VuDev *dev, int qidx)=
;
>  typedef int (*vu_get_config_cb) (VuDev *dev, uint8_t *config, uint32_t
> len);
> @@ -429,6 +430,21 @@ struct VuDev {
>       */
>      vu_read_msg_cb read_msg;
>
> +    /*
> +     * @write_msg: custom method to write vhost-user message
> +     *
> +     * Write data to vhost_user socket fd from the passed
> +     * VhostUserMsg *vmsg struct.
> +     *
> +     * For the details, please refer to vu_message_write in
> libvhost-user.c
> +     * which will be used by default when calling vu_unit.
> +     * No custom method is allowed.
>

"No custom method is allowed"?


> +     *
> +     * Returns: true if vhost-user message successfully sent, false
> otherwise.
> +     *
> +     */
> +    vu_write_msg_cb write_msg;
> +
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000e108e305fb3ffcec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 3, 2023 at 12:21=E2=80=
=AFPM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Add vu_write_msg_cb type as a member of the VuDev<br>
struct.<br>
<br>
In order to interact with the virtio-dmabuf<br>
API, vhost-user backends have available a special<br>
message type that can be sent to the frontend<br>
in Qemu, in order to add, lookup, or remove<br>
entries.<br>
<br>
To send these messages and avoid code replication,<br>
backends will need the write_msg method to be exposed<br>
to them, similarly to how the read_msg is for<br>
receiving messages.<br></blockquote><div><br></div><div>I think read_msg wa=
s introduced to blend libvhost-user IO to qemu mainloop &amp; coroutine. Is=
 that what you have in mind for write_msg?<br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" targ=
et=3D"_blank">aesteve@redhat.com</a>&gt;<br>
---<br>
=C2=A0subprojects/libvhost-user/libvhost-user.c |=C2=A0 1 +<br>
=C2=A0subprojects/libvhost-user/libvhost-user.h | 16 ++++++++++++++++<br>
=C2=A02 files changed, 17 insertions(+)<br>
<br>
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c<br>
index 6b4b721225..c50b353915 100644<br>
--- a/subprojects/libvhost-user/libvhost-user.c<br>
+++ b/subprojects/libvhost-user/libvhost-user.c<br>
@@ -2115,6 +2115,7 @@ vu_init(VuDev *dev,<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;sock =3D socket;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;panic =3D panic;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;read_msg =3D read_msg ? read_msg : vu_message_r=
ead_default;<br>
+=C2=A0 =C2=A0 dev-&gt;write_msg =3D vu_message_write;<br></blockquote><div=
><br></div><div>You are not making it customizable? And the callback is not=
 used.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
=C2=A0 =C2=A0 =C2=A0dev-&gt;set_watch =3D set_watch;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;remove_watch =3D remove_watch;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;iface =3D iface;<br>
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvho=
st-user/libvhost-user.h<br>
index 784db65f7c..f5d7162886 100644<br>
--- a/subprojects/libvhost-user/libvhost-user.h<br>
+++ b/subprojects/libvhost-user/libvhost-user.h<br>
@@ -242,6 +242,7 @@ typedef void (*vu_set_features_cb) (VuDev *dev, uint64_=
t features);<br>
=C2=A0typedef int (*vu_process_msg_cb) (VuDev *dev, VhostUserMsg *vmsg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *do_reply);<br>
=C2=A0typedef bool (*vu_read_msg_cb) (VuDev *dev, int sock, VhostUserMsg *v=
msg);<br>
+typedef bool (*vu_write_msg_cb) (VuDev *dev, int sock, VhostUserMsg *vmsg)=
;<br>
=C2=A0typedef void (*vu_queue_set_started_cb) (VuDev *dev, int qidx, bool s=
tarted);<br>
=C2=A0typedef bool (*vu_queue_is_processed_in_order_cb) (VuDev *dev, int qi=
dx);<br>
=C2=A0typedef int (*vu_get_config_cb) (VuDev *dev, uint8_t *config, uint32_=
t len);<br>
@@ -429,6 +430,21 @@ struct VuDev {<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0vu_read_msg_cb read_msg;<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* @write_msg: custom method to write vhost-user messag=
e<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Write data to vhost_user socket fd from the passed<b=
r>
+=C2=A0 =C2=A0 =C2=A0* VhostUserMsg *vmsg struct.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* For the details, please refer to vu_message_write in=
 libvhost-user.c<br>
+=C2=A0 =C2=A0 =C2=A0* which will be used by default when calling vu_unit.<=
br>
+=C2=A0 =C2=A0 =C2=A0* No custom method is allowed.<br></blockquote><div><b=
r></div><div>&quot;No custom method is allowed&quot;?</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Returns: true if vhost-user message successfully sen=
t, false otherwise.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 vu_write_msg_cb write_msg;<br>
+<br></blockquote><div><br></div></div><br><span class=3D"gmail_signature_p=
refix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000e108e305fb3ffcec--

