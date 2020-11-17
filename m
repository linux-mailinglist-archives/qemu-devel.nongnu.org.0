Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF5D2B5B6F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:58:11 +0100 (CET)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewoU-0001SY-Sy
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewnT-000123-9G
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:57:07 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewnR-000777-KD
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:57:07 -0500
Received: by mail-ej1-x644.google.com with SMTP id 7so28318782ejm.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JEoGtrFwgumM6e96chpR5UzJ4mOHMuGKZwdLfcZb+Q0=;
 b=DKEFqSzyzdoqyCEy4NQ8Q0OS/A14HaL6YuLdkXo7MpLcUPESjXzfxmwSAShEEJvsAj
 J54wF3LNq7cxPRgK4RzWv+uvqOWDrL4u2vMo2t1hYV67skJG8gPbwPurcidh44Tx2G0f
 mEXEknlY/aRGCg9OaKF7+MD0CHuVaMBDBW959o0xpjClaAe8JCS7reCuOM2TgL12RPAW
 rAdy62Itg0iDr4p7Sc4HxZuBc8DFJlVcqmgL9ISgvIUjXNXFctI6whtK6Qx4O2O0ztsa
 6bV9M6IpmPfBHWzpqH4OahOOn62sWHbUdiXE0FtfQE0XI1ysU2KedYLpErjV2KwPeh2U
 9M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEoGtrFwgumM6e96chpR5UzJ4mOHMuGKZwdLfcZb+Q0=;
 b=iK9GbgG8B0rEAoxKDBd2ljeQJ9NY8VH4a1vzX5HyHdz/eDcf4btSdigG6zzbZYSu3u
 mTYnMPvUhvU7PjMDWaYiB0NefAxgPIqvIbBnwJtNLQmOFtDZb81R2mwzyESlD3d+QJ3G
 TLa09UruFVZr14jH+tgX+gkg26wJCDhzpNwLHjC8oN2ogKhtMqGhAVkQb4BDjxQ9dLZw
 EVgqn4nQT4RHpvlp9RZ3ahx8ozwMYsVoiej/ij4LUfw0QLGA47Faq54S81rnW/JQXNCc
 +8XsnZPR65DMO3AmiPV7Pu3usvPlTpxGgIrBexMPjCTyxbiZNmBdvzn8Izx9qy8BFSIB
 0H5Q==
X-Gm-Message-State: AOAM5311w835Ag3K/rbgSiuT8aDfeKChWWEk8mUbRGLYw4FGaUuxqd7f
 PFyXNgNNzbgOHeNrvX8f+cOjSToqI6rzzyD2rmg=
X-Google-Smtp-Source: ABdhPJyF5DTr3U9BFP1g4KpGfncToxYBxl8Cwfqtz9BcIzZtznKSU35ma4LRuiLzvV+tfwv/znYzpNAZA3xIIAnUkAU=
X-Received: by 2002:a17:906:7c54:: with SMTP id
 g20mr18780801ejp.105.1605603423801; 
 Tue, 17 Nov 2020 00:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-8-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-8-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 12:56:52 +0400
Message-ID: <CAJ+F1CLZs0zLJfvFOg8uoE-9OS5Cqz4m=d9Mg+ZzpeEOmOgM2g@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] qom: Make object_property_set_default() public
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b9d74605b449adaf"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b9d74605b449adaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:44 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> The function will be used outside qom/object.c, to simplify the
> field property code that sets the property default value.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/qom/object.h | 11 +++++++++++
>  qom/object.c         |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 2ab124b8f0..4234cc9b66 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1090,6 +1090,17 @@ ObjectProperty
> *object_class_property_add(ObjectClass *klass, const char *name,
>                                            ObjectPropertyRelease *release=
,
>                                            void *opaque);
>
> +/**
> + * object_property_set_default:
> + * @prop: the property to set
> + * @value: the value to be written to the property
> + *
> + * Set the property default value.
> + *
> + * Ownership of @value is transferred to the property.
> + */
> +void object_property_set_default(ObjectProperty *prop, QObject *value);
> +
>  /**
>   * object_property_set_default_bool:
>   * @prop: the property to set
> diff --git a/qom/object.c b/qom/object.c
> index 7c11bcd3b1..6b0d9d8c79 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1547,7 +1547,7 @@ static void object_property_init_defval(Object *obj=
,
> ObjectProperty *prop)
>      visit_free(v);
>  }
>
> -static void object_property_set_default(ObjectProperty *prop, QObject
> *defval)
> +void object_property_set_default(ObjectProperty *prop, QObject *defval)
>  {
>      assert(!prop->defval);
>      assert(!prop->init);
> --
> 2.28.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b9d74605b449adaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:44 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e function will be used outside qom/object.c, to simplify the<br>
field property code that sets the property default value.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/qom/object.h | 11 +++++++++++<br>
=C2=A0qom/object.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A02 files changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/qom/object.h b/include/qom/object.h<br>
index 2ab124b8f0..4234cc9b66 100644<br>
--- a/include/qom/object.h<br>
+++ b/include/qom/object.h<br>
@@ -1090,6 +1090,17 @@ ObjectProperty *object_class_property_add(ObjectClas=
s *klass, const char *name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ObjectPropertyRelease *release,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0void *opaque);<br>
<br>
+/**<br>
+ * object_property_set_default:<br>
+ * @prop: the property to set<br>
+ * @value: the value to be written to the property<br>
+ *<br>
+ * Set the property default value.<br>
+ *<br>
+ * Ownership of @value is transferred to the property.<br>
+ */<br>
+void object_property_set_default(ObjectProperty *prop, QObject *value);<br=
>
+<br>
=C2=A0/**<br>
=C2=A0 * object_property_set_default_bool:<br>
=C2=A0 * @prop: the property to set<br>
diff --git a/qom/object.c b/qom/object.c<br>
index 7c11bcd3b1..6b0d9d8c79 100644<br>
--- a/qom/object.c<br>
+++ b/qom/object.c<br>
@@ -1547,7 +1547,7 @@ static void object_property_init_defval(Object *obj, =
ObjectProperty *prop)<br>
=C2=A0 =C2=A0 =C2=A0visit_free(v);<br>
=C2=A0}<br>
<br>
-static void object_property_set_default(ObjectProperty *prop, QObject *def=
val)<br>
+void object_property_set_default(ObjectProperty *prop, QObject *defval)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0assert(!prop-&gt;defval);<br>
=C2=A0 =C2=A0 =C2=A0assert(!prop-&gt;init);<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b9d74605b449adaf--

