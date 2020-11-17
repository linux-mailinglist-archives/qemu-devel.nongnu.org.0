Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE1D2B5B61
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:55:23 +0100 (CET)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewlm-0008WF-To
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewkO-0007GD-1J
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:53:56 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:37119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewkL-0005tn-QY
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:53:55 -0500
Received: by mail-ed1-x543.google.com with SMTP id cq7so21589039edb.4
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrMZELjb0sgoVlgL0ZPnjj9/RyjbdaMWcGhOXuM7Lf4=;
 b=eyWsfcFAMuS4eCw1MVfel6WWQ0dzkcQWTsH7Xmgrz7ugq2vpzMn9NQa+/kjwcOcPmG
 Q8uTmWIK7mhWJsWA7TO+fGnrVzqp//emmYn0r61tiqE7C8YkNGRKsBCPlkguz9LLcxaA
 nV5xkOasP2S4tBaCmXwpDkIgp97jE//f2fIBj+hnOXwWNGvwS8VzMn2jlqdzCeGOGk7+
 w2bTfuGGyP3ml5poIbv5xZ5T3f1n7g5iytxm/qfqL8GXGrkkXyLt0JEvQDG6d6v96mtd
 aj42+ZgaMEZT5h90VYBqFVgXmBP+AT4tJ3w1scfmb3tOAN5lFDh4Nj2Q0+B0IjOz5Kcv
 mCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrMZELjb0sgoVlgL0ZPnjj9/RyjbdaMWcGhOXuM7Lf4=;
 b=KuH4MqiGMDIuPtMqKFvf1bCrFO+K4rhItuuhlWhnygyUtNAJ8GdLO0/YxXirtt9dC3
 coe4BUOCWCmw7BWWY5DMiUhw3Qaz6FjGQ04q+FbaLGW+l05Wes2opEFEue4eV4cRatqw
 piY+Td9P1Sq4LrGBaxQG0dikSnTWzHBEXCqIcTmEXpcfJspJ7SxqdKcXPYnmahtzh5F5
 gFlhrc5HEYqXzzFLLtLxSx02BTJcJuh3Fd6C5/ql/3xyFUghJLTSKffZ1Tuh8F5gtZ86
 8iF8tJFua0In2d+Du5O/uoT64cDRswWUKU5mQxiuzCLcK4vODtm027re1clfg752POEI
 G17A==
X-Gm-Message-State: AOAM530euV3lQewb8ET0o095Q9PSE9+fDcd4y+zlqnpeAte6WiWjJfAX
 JXZUa8ejGTfzd67lh8kPSfyx/cB1f51QJf5j1k6SJMgKSJsP4A==
X-Google-Smtp-Source: ABdhPJwjTwOLrA1N3PkKhd2DJ9LRSmxa0fpdI5dNejZ4O63cfmdjHAQ4xXYrc3mFks1bO7jhChdEEQo05ZFO496AgfE=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr19621582edw.53.1605603231586; 
 Tue, 17 Nov 2020 00:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-7-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-7-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 12:53:39 +0400
Message-ID: <CAJ+F1CJu4QRwpXGhcYXgszy-e218q2DJ=vG5N6e3Dij2805JoQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] qlit: qlit_type() function
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000044df7205b449a237"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
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

--00000000000044df7205b449a237
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:48 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Useful function where we need to check for the qlit type before
> converting it to an actual QObject.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/qapi/qmp/qlit.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
> index f9e356d31e..acddb80831 100644
> --- a/include/qapi/qmp/qlit.h
> +++ b/include/qapi/qmp/qlit.h
> @@ -59,4 +59,9 @@ bool qlit_equal_qobject(const QLitObject *lhs, const
> QObject *rhs);
>
>  QObject *qobject_from_qlit(const QLitObject *qlit);
>
> +static inline QType qlit_type(const QLitObject *qlit)
> +{
> +    return qlit->type;
> +}
> +
>  #endif /* QLIT_H */
> --
> 2.28.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000044df7205b449a237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:48 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Us=
eful function where we need to check for the qlit type before<br>
converting it to an actual QObject.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/qapi/qmp/qlit.h | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h<br>
index f9e356d31e..acddb80831 100644<br>
--- a/include/qapi/qmp/qlit.h<br>
+++ b/include/qapi/qmp/qlit.h<br>
@@ -59,4 +59,9 @@ bool qlit_equal_qobject(const QLitObject *lhs, const QObj=
ect *rhs);<br>
<br>
=C2=A0QObject *qobject_from_qlit(const QLitObject *qlit);<br>
<br>
+static inline QType qlit_type(const QLitObject *qlit)<br>
+{<br>
+=C2=A0 =C2=A0 return qlit-&gt;type;<br>
+}<br>
+<br>
=C2=A0#endif /* QLIT_H */<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000044df7205b449a237--

