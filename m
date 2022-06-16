Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531154E6B8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:12:44 +0200 (CEST)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1s6t-0003Z4-8Y
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1s0w-0000XU-Mp
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:06:35 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:33451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1s0v-0007UG-5E
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:06:34 -0400
Received: by mail-lj1-x231.google.com with SMTP id l20so2023920lji.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ezfZ/pp7Z1EJdLEHDQlMeLj+Z0/REihjAtJGJFV9G24=;
 b=QhW84tPTHacpva2uE/tRC+Xhhj+sJXPlPcEHb6xcgE3Qq4beQATWmSXPdSzKrD9SRH
 eZ1J0fgq9cIeZCfgZFlcHKpUPGBC9wRbgI0GDjRcCT7ZArUuhjF3B0+w8gOMY+30OQqO
 jYDsEot37iWuIrzb5kWY4JBz6brPTsdjFSiEzMoFvJoj8svJbjxrTWr63OfY9bvHKKLE
 0NefOehlA8yTPtX6Ait8EONZNyBc5xeuuCdjl5nHTV5JAJDb77yivx9fxlfDDtuhhUHl
 ReyfBkbSK+KpB4HzEaEyiwhX4RaO/H1i85ONy7UiZfgwCAtXLQKzWbaZB5GBOm+OH0JQ
 3h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ezfZ/pp7Z1EJdLEHDQlMeLj+Z0/REihjAtJGJFV9G24=;
 b=x3MY6BzaJCuq47/OKNWWtMhJ+gktG/Okd/Zcab2GC/BnhBKxU5HPwi7mKTC+/Q1gpu
 86gsWaa7dyRjSY5l45nA60mFPRt6BXZuJ8OmfU1nmLTff5AGory/GXTXktGmRhOkcZbj
 LkCqLhSKNixDbB/ad0CjjfIS9rrjznvo6NQFHbqp1r0Bdl1dRsEceymTFRNH818T/HNr
 yG31RPre0F6GyhkpuWChn/c60YQtCwjqavDUfR3s16aUYqmHIf/pAbLt/CpPRJJL66Gb
 YBwrdYZprdZ+3kDVexL9T/s8l1Ya29ZReX/z4LY/kMxPfFY4KRv3ooWlg7ue932jagTY
 h/UA==
X-Gm-Message-State: AJIora8+4kg4zOO4iBmIZabLet3leE4t3/sC9zXRJaayT+GNILdov5H6
 Nhzhswh+iHpRuqB9dCYCb6OQ8gQ+ExVzJZTNl/w=
X-Google-Smtp-Source: AGRyM1vQYD2aL+9Wsp19ssd7/vRgFHzWWAM48jzhq4Gkb3Sk4Pp92C28C1SNu6ywgMSDy26/xuv7avi/uD9cHGF9QyQ=
X-Received: by 2002:a2e:954e:0:b0:255:3768:9986 with SMTP id
 t14-20020a2e954e000000b0025537689986mr2990807ljh.516.1655395590774; Thu, 16
 Jun 2022 09:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-16-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-16-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 20:06:19 +0400
Message-ID: <CAJ+F1C+A=rs_wGoyUftdAmW1+p1DGT8QtgxiMptXdico90LGvg@mail.gmail.com>
Subject: Re: [PATCH V8 15/39] qapi: QAPI_LIST_LENGTH
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
Content-Type: multipart/alternative; boundary="00000000000026a53905e192d2da"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
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

--00000000000026a53905e192d2da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 15, 2022 at 7:38 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  include/qapi/util.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 7d88b09..75dddca 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -65,4 +65,17 @@ struct strList *strList_from_string(const char *in,
> char delim);
>      (tail) =3D &(*(tail))->next; \
>  } while (0)
>
> +/*
> + * For any GenericList @list, return its length.
> + */
> +#define QAPI_LIST_LENGTH(list) \
> +    ({ \
> +        int len =3D 0; \
> +        typeof(list) elem; \
> +        for (elem =3D list; elem !=3D NULL; elem =3D elem->next) { \
> +            len++; \
> +        } \
> +        len; \
> +    })
> +
>  #endif
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000026a53905e192d2da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 7:38 PM Ste=
ve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@=
oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistar=
e@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br></bloc=
kquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/qapi/util.h | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
index 7d88b09..75dddca 100644<br>
--- a/include/qapi/util.h<br>
+++ b/include/qapi/util.h<br>
@@ -65,4 +65,17 @@ struct strList *strList_from_string(const char *in, char=
 delim);<br>
=C2=A0 =C2=A0 =C2=A0(tail) =3D &amp;(*(tail))-&gt;next; \<br>
=C2=A0} while (0)<br>
<br>
+/*<br>
+ * For any GenericList @list, return its length.<br>
+ */<br>
+#define QAPI_LIST_LENGTH(list) \<br>
+=C2=A0 =C2=A0 ({ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D 0; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typeof(list) elem; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (elem =3D list; elem !=3D NULL; elem =3D e=
lem-&gt;next) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len++; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len; \<br>
+=C2=A0 =C2=A0 })<br>
+<br>
=C2=A0#endif<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000026a53905e192d2da--

