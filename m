Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934896137E1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:25:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUn1-0005vb-Tk; Mon, 31 Oct 2022 09:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opUn0-0005vK-FP
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:18 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opUmy-0007dQ-Lx
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:18 -0400
Received: by mail-qt1-x834.google.com with SMTP id fz10so1662307qtb.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GSPv19Ang51TzTOuhXNwG87aofdyFEYainuQ05ggZDk=;
 b=VFgEawnCkUF1/7n1zpqTizDKoD6XpEQY4zEW7/JuXMDL0gIFdsdmRQoHJ+JlwpCvc4
 uEj5AnOjB2pOeUYH96mDrckBB4FqjHLEO+4T2WTz6WXLINtz2d7V+xyY6lfPRF7MspwG
 vHeMv+2xbHNowQEgSCQkiTwWe3CK+lmgUDj4yeFFvMx7TrkGQ8V5b9aNK6k1ExothqSo
 Wenh4iWFQ+nFKXwrGFoOYzMst3flOEOw5v4RAJZZMLKTOG6Qi4aU2jMyC1XgF9BJqVnc
 tTsrWJEtLfyuqWwKQGsAe/tzkFZjvccExfucxEdMvebQtQKjaG58gxT47gvrYkNdYqbF
 oFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GSPv19Ang51TzTOuhXNwG87aofdyFEYainuQ05ggZDk=;
 b=ew6O7MuEk6aZq9jDTPpNtlt3ywU8tn4CEEkJztyZC4qYEn7QdweNR2hchgGjuEmXJS
 FlEYDYRw5HtL/arW0xwBAA/97lL+HK7HcgDa63b0gJ96/QtFt5L/n2qoPEanfu9a7C0o
 aFtwSDoPXs3JtpKTbwicq9vF6+eeZPDldtpnpCoVKQSEa/oUOGGhJZHgDEucw8afrI8m
 OwuTAyq4QSTX7KQW74oEVlhsH2azFKDr87QzBL1XothwyGqOY2a9pKUpX3khVgY4pxOp
 KeT61i3jCjMjSmB7sT1rMnQCR52c31pdD/GvBt5aKTCzY9q+OcpQtPgh0wgIZJQa5fHj
 Q3nA==
X-Gm-Message-State: ACrzQf1vFhdoyEsktACJSHSPPEQAX6lfzB3CIO0/oXOSWyMiEgRNDF9a
 MDvQzZ07O/ridS3Bir2FItU2+RgNTghKJihwS3NVpA==
X-Google-Smtp-Source: AMsMyM4phYWazrEbp161MWztKtfDz29k/1OmqA0fz7WgezLXxONnGGyYUhCJ40Pi2m89KU0Re8q/DI5Nsl2ZzHXyN9A=
X-Received: by 2002:ac8:5895:0:b0:39c:c5fa:2936 with SMTP id
 t21-20020ac85895000000b0039cc5fa2936mr10551594qta.420.1667222715503; Mon, 31
 Oct 2022 06:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
 <20221031124928.128475-2-mst@redhat.com>
In-Reply-To: <20221031124928.128475-2-mst@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 31 Oct 2022 18:55:04 +0530
Message-ID: <CAARzgwyS-2XmVh6SM_UG6Z85zyJd6VdqqC477RMcWo2_FYsn2g@mail.gmail.com>
Subject: Re: [PULL 01/86] bios-tables-test: do not ignore allowed diff list
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b82b3505ec54897b"
Received-SPF: none client-ip=2607:f8b0:4864:20::834;
 envelope-from=ani@anisinha.ca; helo=mail-qt1-x834.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000b82b3505ec54897b
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 31, 2022 at 6:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> we had such a beautiful structure for updating
> expected files, designed to keep bisect working.
> It turns out that we ignored the result of
> the allow list checks unless all tables matched
> anyway.
>
> Sigh.
>
> Let's at least make it work going forward.


Don't forget to drop this.


>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/bios-tables-test.c
> b/tests/qtest/bios-tables-test.c
> index e6096e7f73..a72f6ca326 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)
>                  "for instructions on how to update expected files.\n",
>                  exp_sdt->aml, sdt->aml_file, exp_sdt->aml_file);
>
> -        all_tables_match = all_tables_match &&
> +        all_tables_match = all_tables_match ||
>              test_acpi_find_diff_allowed(exp_sdt);
>
>          /*
> --
> MST
>
>

--000000000000b82b3505ec54897b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 31, 2022 at 6:20 PM Michael S. Tsirkin &lt;<a h=
ref=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">we had such a beautiful structure for updating<br>
expected files, designed to keep bisect working.<br>
It turns out that we ignored the result of<br>
the allow list checks unless all tables matched<br>
anyway.<br>
<br>
Sigh.<br>
<br>
Let&#39;s at least make it work going forward.</blockquote><div dir=3D"auto=
"><br></div><div dir=3D"auto">Don&#39;t forget to drop this.=C2=A0</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" tar=
get=3D"_blank">mst@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/bios-tables-test.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.=
c<br>
index e6096e7f73..a72f6ca326 100644<br>
--- a/tests/qtest/bios-tables-test.c<br>
+++ b/tests/qtest/bios-tables-test.c<br>
@@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;for ins=
tructions on how to update expected files.\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exp_sdt-&gt;a=
ml, sdt-&gt;aml_file, exp_sdt-&gt;aml_file);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 all_tables_match =3D all_tables_match &amp;&am=
p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 all_tables_match =3D all_tables_match ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_acpi_find_diff_allowed=
(exp_sdt);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-- <br>
MST<br>
<br>
</blockquote></div></div>

--000000000000b82b3505ec54897b--

