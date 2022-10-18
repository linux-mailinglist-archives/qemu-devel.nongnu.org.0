Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F21F6025B1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:29:28 +0200 (CEST)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh2V-00044k-ED
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1okg9w-00039W-QY
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:33:14 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1okg9t-0001xI-DO
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:33:02 -0400
Received: by mail-lf1-x131.google.com with SMTP id bu25so21028889lfb.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ewD+OxUpDqIp+pm+WBnL7+KCgTTZGRv4rhtLom9gIac=;
 b=PnIi4XsqocBBFwnaT90sD5Bse6PMrJ5bqqHoS0VhROhEbuYrfGZ8APFr1uK/j9C1xo
 UOyuGxYG4sOrQLgYOp5aIkfexwv+EiI07oycb5PBTrUxci/YFTCDnpRk9Kp1u2BcKx6T
 ufPR3rea3UXPkHUjxynrXTGmewKjYMZQp46WVbfTca2IKNxPp4Nmj2HtGiDYK7e5glsC
 u60MKfHToTI/16aPi1bXpX8tJKV1RNByzzu1yqYt1xjNfniwsDbvB8kML+C2KmovyXik
 OHgXAsFTX+8/5OCUcjEXUpUbeGXiiI5Ui4B4Wx2NM5GFmp2ul1XRuNmvXtNHL08BBzQR
 6Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewD+OxUpDqIp+pm+WBnL7+KCgTTZGRv4rhtLom9gIac=;
 b=Pq6B4DK2DxcN3cmkm6+9W8wbXfb/1N+sznpYVZ+wjLw8nNqQoLHvb3kIDMfYyt3LtJ
 EZvo8fYmr9GSgTN0MRndQCT/n6ieaAesuH7pShD/ZK+YmG1AwOCofC2TQcyG+EQdn1x3
 du3G3uLYwJPI1gvQ1KKmEsgQa4fbehRv3klgJsyL1/cyBrCSTCUfzbE1XKcWlmZ7f6vX
 DTg26o97YHSGiTD3AhuB5qngN1y6hpyWyV0zOl7q0AijhIj/P/RCC2qshyi3nEpCWMjo
 e09ADkdc7eJSoSygdltaI+SRGexBcTfcqrro1lF0O5jnmuj9b6q7F3Uy8iKhPC4BvrKg
 6Bvw==
X-Gm-Message-State: ACrzQf0vGNS/wLmaQN4SUL5H/GZd7ImH/umVYAm9GCe60qqdecyCgSc5
 jYNpCAGgVPozYlqKFiOd2PdkEI89Wqz1Xd3o86k=
X-Google-Smtp-Source: AMsMyM4LW4+KUWkW71W6WrOL3zNQbuU2b3qRJghYqxXq+JUJ+aUJoJb6ao8oVOjbc1/WlHn+XWBUMvNW5OpisdJQlms=
X-Received: by 2002:ac2:59d9:0:b0:4a2:bdbf:c20a with SMTP id
 x25-20020ac259d9000000b004a2bdbfc20amr446131lfn.362.1666074779105; Mon, 17
 Oct 2022 23:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221018044645.863859-1-linmq006@gmail.com>
In-Reply-To: <20221018044645.863859-1-linmq006@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Oct 2022 10:32:47 +0400
Message-ID: <CAJ+F1CLJFer=UoS7Udn0youfEgGAPG8xZJ9SokbGQm5CvXhugQ@mail.gmail.com>
Subject: Re: [PATCH] qga: Fix memory leak in split_list
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000060bfa305eb4943ef"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000060bfa305eb4943ef
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Oct 18, 2022 at 8:47 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> We should use g_strfreev to free the memory allocated by g_strsplit().
> Use g_free() will cause a memory leak.
>
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  qga/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index 5a9d8252e075..04902076b25d 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -934,7 +934,7 @@ static GList *split_list(const gchar *str, const gchar
> *delim)
>      for (i = 0; strv[i]; i++) {
>          list = g_list_prepend(list, strv[i]);
>      }
> -    g_free(strv);
> +    g_strfreev(strv);
>

No, this is intentional. We are building a list of allocated strings, we
shouldn't free those.

thanks

--00000000000060bfa305eb4943ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 18, 2022 at 8:47 AM Mia=
oqian Lin &lt;<a href=3D"mailto:linmq006@gmail.com">linmq006@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We sh=
ould use g_strfreev to free the memory allocated by g_strsplit().<br>
Use g_free() will cause a memory leak.<br>
<br>
Signed-off-by: Miaoqian Lin &lt;<a href=3D"mailto:linmq006@gmail.com" targe=
t=3D"_blank">linmq006@gmail.com</a>&gt;<br>
---<br>
=C2=A0qga/main.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/main.c b/qga/main.c<br>
index 5a9d8252e075..04902076b25d 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -934,7 +934,7 @@ static GList *split_list(const gchar *str, const gchar =
*delim)<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; strv[i]; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list =3D g_list_prepend(list, strv[i]);<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 g_free(strv);<br>
+=C2=A0 =C2=A0 g_strfreev(strv);<br></blockquote><div><br></div><div>No, th=
is is intentional. We are building a list of allocated strings, we shouldn&=
#39;t free those.<br></div><div>=C2=A0</div><div>thanks<br></div></div></di=
v>

--00000000000060bfa305eb4943ef--

