Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1930BF1B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:15:00 +0100 (CET)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vWF-0007rw-Ma
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l6vTH-0006Lh-HQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:11:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l6vTA-0002WG-VA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612271506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6hVaJyNLmktwJ30aY8mzmIubrsj9HvcRK0yKWz+Xyo=;
 b=X1ds1G/mPtK285tP98aqrCbyy5eFweh67Pe2L/PJ9Ur64uuyvV0Gvn+O88Z18WCjB7KveD
 epHynkeWL5nW9juyMePbk6WHQnAIx3q8PSOZgU31ue0EWeCggSC8c2OUgsVOB2lE0fbLD/
 FzU/rfKZ43KVV9SryNzav21VyQwS7sI=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-cTFzaR0pNkSzsF0kAZ9qWw-1; Tue, 02 Feb 2021 08:11:44 -0500
X-MC-Unique: cTFzaR0pNkSzsF0kAZ9qWw-1
Received: by mail-io1-f72.google.com with SMTP id m2so16457664iow.23
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6hVaJyNLmktwJ30aY8mzmIubrsj9HvcRK0yKWz+Xyo=;
 b=Uy1DvlesZVXUx0IN+wLElsMb08+3y5Jg4CNBxPJAT+S3in0+xSJmt+4QadEEps2QQR
 GrUOlWqt5a4jTfddv/VXS9XkLMNoENQn9RV8MgOO3R2QFntG7DTe6t/xDtt7jg1KjQdd
 gy2Zzxh7O0/YuTQpOfZkBh3EDtT+Doc6IB3wD1C6rhdAho8SbxEqz0T1hZ06iUYuqaIR
 +5BADSNdm2Ba+ml572gizoIIqmuUCRVWs+B/sYMRu8kFbCr/SXResi/FkL1u3GRWtcDs
 zCaWxMrEaZZzJl8L5x+HzbucmfwTqfjXimdzUOKzGb4KgDcG8DhkvXZouZLEkD2ugR7g
 IKXg==
X-Gm-Message-State: AOAM5327k5QZRi6JMb70oeSBwjT3FRhbocUvQIz3+YEsrFKwceqyR+Mi
 cOWOK1CNICt2+ho7Mu9HrhHMI1nwVL2hZLgnLCNMJwXSQqI9vuRU6DyH6nVc7Sy2MnsCn7V+NdW
 1L0zvumVLJZmSug6h93XkhjkUmT8XyvE=
X-Received: by 2002:a6b:be86:: with SMTP id o128mr5615748iof.111.1612271502997; 
 Tue, 02 Feb 2021 05:11:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3Vs2T+5Buy9WRvu8EdJl8iCoJVBenZq6otbLyFWH1KZmT0+6miPDCJl9gGdOVE+4b8IG0ITPvbusonn/yFsU=
X-Received: by 2002:a6b:be86:: with SMTP id o128mr5615723iof.111.1612271502753; 
 Tue, 02 Feb 2021 05:11:42 -0800 (PST)
MIME-Version: 1.0
References: <1612270906-153951-1-git-send-email-priyankar.jain@nutanix.com>
In-Reply-To: <1612270906-153951-1-git-send-email-priyankar.jain@nutanix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 2 Feb 2021 17:11:31 +0400
Message-ID: <CAMxuvax0KUHjWsR8Uf96aAaHhfuOefoBsUE0QCeoCRWD50ABYA@mail.gmail.com>
Subject: Re: [PATCH] dbus-vmstate: Increase the size of input stream buffer
 used during load
To: Priyankar Jain <priyankar.jain@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000034184005ba5a3666"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034184005ba5a3666
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 2, 2021 at 5:02 PM Priyankar Jain <priyankar.jain@nutanix.com>
wrote:

> This commit fixes an issue where migration is failing in the load phase
> because of a false alarm about data unavailability.
>
> Following is the error received when the amount of data to be transferred
> exceeds the default buffer size setup by G_BUFFERED_INPUT_STREAM(4KiB),
> even when the maximum data size supported by this backend is 1MiB
> (DBUS_VMSTATE_SIZE_LIMIT):
>
>   dbus_vmstate_post_load: Invalid vmstate size: 4364
>   qemu-kvm: error while loading state for instance 0x0 of device
> 'dbus-vmstate/dbus-vmstate'
>
> This commit sets the size of the input stream buffer used during load to
> DBUS_VMSTATE_SIZE_LIMIT which is the maximum amount of data a helper can
> send during save phase.
> Secondly, this commit makes sure that the input stream buffer is loaded
> before
> checking the size of the data available in it, rectifying the false alarm
> about
> data unavailability.
>
> Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
>

Fixes: 5010cec2bc87 ("Add dbus-vmstate object")
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


---
>  backends/dbus-vmstate.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index bd050e8..3b8a116 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -204,6 +204,8 @@ static int dbus_vmstate_post_load(void *opaque, int
> version_id)
>      m =3D g_memory_input_stream_new_from_data(self->data, self->data_siz=
e,
> NULL);
>      s =3D g_data_input_stream_new(m);
>      g_data_input_stream_set_byte_order(s,
> G_DATA_STREAM_BYTE_ORDER_BIG_ENDIAN);
> +    g_buffered_input_stream_set_buffer_size(G_BUFFERED_INPUT_STREAM(s),
> +                                            DBUS_VMSTATE_SIZE_LIMIT);
>
>      nelem =3D g_data_input_stream_read_uint32(s, NULL, &err);
>      if (err) {
> @@ -241,11 +243,23 @@ static int dbus_vmstate_post_load(void *opaque, int
> version_id)
>          }
>
>          len =3D g_data_input_stream_read_uint32(s, NULL, &err);
> +        if (len > DBUS_VMSTATE_SIZE_LIMIT) {
> +            error_report("%s: Invalid vmstate size: %u", __func__, len);
> +            return -1;
> +        }
> +
> +        g_buffered_input_stream_fill(G_BUFFERED_INPUT_STREAM(s), len,
> NULL,
> +                                     &err);
> +        if (err) {
> +            goto error;
> +        }
> +
>          avail =3D g_buffered_input_stream_get_available(
>              G_BUFFERED_INPUT_STREAM(s));
> -
> -        if (len > DBUS_VMSTATE_SIZE_LIMIT || len > avail) {
> -            error_report("%s: Invalid vmstate size: %u", __func__, len);
> +        if (len > avail) {
> +            error_report("%s: Not enough data available to load for Id:
> '%s'. "
> +                "Available data size: %lu, Actual vmstate size: %u",
> +                __func__, id, avail, len);
>              return -1;
>          }
>
> --
> 1.8.3.1
>
>

--00000000000034184005ba5a3666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2, 2021 at 5:02 PM Priy=
ankar Jain &lt;<a href=3D"mailto:priyankar.jain@nutanix.com">priyankar.jain=
@nutanix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">This commit fixes an issue where migration is failing in the lo=
ad phase<br>
because of a false alarm about data unavailability.<br>
<br>
Following is the error received when the amount of data to be transferred<b=
r>
exceeds the default buffer size setup by G_BUFFERED_INPUT_STREAM(4KiB),<br>
even when the maximum data size supported by this backend is 1MiB<br>
(DBUS_VMSTATE_SIZE_LIMIT):<br>
<br>
=C2=A0 dbus_vmstate_post_load: Invalid vmstate size: 4364<br>
=C2=A0 qemu-kvm: error while loading state for instance 0x0 of device &#39;=
dbus-vmstate/dbus-vmstate&#39;<br>
<br>
This commit sets the size of the input stream buffer used during load to<br=
>
DBUS_VMSTATE_SIZE_LIMIT which is the maximum amount of data a helper can<br=
>
send during save phase.<br>
Secondly, this commit makes sure that the input stream buffer is loaded bef=
ore<br>
checking the size of the data available in it, rectifying the false alarm a=
bout<br>
data unavailability.<br>
<br>
Signed-off-by: Priyankar Jain &lt;<a href=3D"mailto:priyankar.jain@nutanix.=
com" target=3D"_blank">priyankar.jain@nutanix.com</a>&gt;<br></blockquote><=
div><br></div><div>Fixes: 5010cec2bc87 (&quot;Add dbus-vmstate object&quot;=
)<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br><=
/div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0backends/dbus-vmstate.c | 20 +++++++++++++++++---<br>
=C2=A01 file changed, 17 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c<br>
index bd050e8..3b8a116 100644<br>
--- a/backends/dbus-vmstate.c<br>
+++ b/backends/dbus-vmstate.c<br>
@@ -204,6 +204,8 @@ static int dbus_vmstate_post_load(void *opaque, int ver=
sion_id)<br>
=C2=A0 =C2=A0 =C2=A0m =3D g_memory_input_stream_new_from_data(self-&gt;data=
, self-&gt;data_size, NULL);<br>
=C2=A0 =C2=A0 =C2=A0s =3D g_data_input_stream_new(m);<br>
=C2=A0 =C2=A0 =C2=A0g_data_input_stream_set_byte_order(s, G_DATA_STREAM_BYT=
E_ORDER_BIG_ENDIAN);<br>
+=C2=A0 =C2=A0 g_buffered_input_stream_set_buffer_size(G_BUFFERED_INPUT_STR=
EAM(s),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 DBUS_VMSTATE_SIZE_LIMIT);<br>
<br>
=C2=A0 =C2=A0 =C2=A0nelem =3D g_data_input_stream_read_uint32(s, NULL, &amp=
;err);<br>
=C2=A0 =C2=A0 =C2=A0if (err) {<br>
@@ -241,11 +243,23 @@ static int dbus_vmstate_post_load(void *opaque, int v=
ersion_id)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D g_data_input_stream_read_uint32(s=
, NULL, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; DBUS_VMSTATE_SIZE_LIMIT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Invalid v=
mstate size: %u&quot;, __func__, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_buffered_input_stream_fill(G_BUFFERED_INPUT_=
STREAM(s), len, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avail =3D g_buffered_input_stream_get_ava=
ilable(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_BUFFERED_INPUT_STREAM(s))=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; DBUS_VMSTATE_SIZE_LIMIT || len &g=
t; avail) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Invalid v=
mstate size: %u&quot;, __func__, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; avail) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Not enoug=
h data available to load for Id: &#39;%s&#39;. &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Available da=
ta size: %lu, Actual vmstate size: %u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, id, avai=
l, len);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--00000000000034184005ba5a3666--


