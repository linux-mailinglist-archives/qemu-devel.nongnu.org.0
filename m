Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADACC48EC0E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:56:21 +0100 (CET)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8O04-0001br-0j
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n8NxY-00006J-Vx
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:53:45 -0500
Received: from [2a00:1450:4864:20::330] (port=39759
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n8NxX-00029i-DA
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:53:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso7691568wma.4
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u8lDFI1DORSF8ab34BlNEpCrwyoiZcGiwuQro5PKTSs=;
 b=GhXPeGRU7xt513jdQYq1GrVhnqW3WNH7qQJS/BCKa98rGwi38+D3VN0lWQSt7bO+cz
 TCNR7P6E5LGgFmdU1fxkL4rkgJ6QPTbmmcOzlK5YcnOTX+QVrSXKIPv/ZTp7YZtuaowX
 mzz7ogpb0r3umJqrkFglu95jphoJ2h8mFcZGZ/kSPqDl8LFQSRiYF1xWkbM6eydDLZqa
 WJilMXJfjKEPyWwkFE0TVH0vxzRwJy3KBp4+urhA9BPfT9IlqS2KqJSzzj40g64FSF/I
 ny17YIoZgJd6qxFJbrAQ5Zizh/BihDTbu08qU4Thm2+Jwbn5uML84lhcH/GnHwN/C047
 9e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u8lDFI1DORSF8ab34BlNEpCrwyoiZcGiwuQro5PKTSs=;
 b=GrdjDE+IJdTDFvVWtymWVao5v4qr104um7TB7tps0OclGRxPOi8b80Oa/biS4VKREp
 6Wfbi6MhAMHx8ghqg3R/+mbxp0g8Pi+KpJtmeCI5DcQ0hM9WeR/4z2dDpe/+c9b4GHPL
 KaD4A6heSnbTDl8PHMLAVwZY4uhooV8h5M+XLdDqgrlflyCrsaUdCetf+SBkBYy4dclY
 LMcfJyElqrfCGruURrgpZqQHXUvjGcJjQ9WRojaQvANtrSOibh9tTrly0d57jIKA1ibE
 W6dWZVKj8Dl0EdL2jTchEEYPi3lRyTCeSLxCxhWDns89WOD3qY2w95+5hUwyLCUIteXg
 0pug==
X-Gm-Message-State: AOAM530yd7du5xzT0zvnIYv9C2qixKm0n+R1tHeh5yffDnFX5gsDFWh1
 JmAGrc2IUXXlORaOWvDVX3CQBz8PVhVrFZscNon8yQ==
X-Google-Smtp-Source: ABdhPJzsCk0NR5JlfffwFtP7pLXpm6tYUoZdBfzEikmcpMKcy5LINDi5Re6cbdbNIz9XaUhxMz8xRKNrJa/RU/hp+nY=
X-Received: by 2002:a05:6402:3554:: with SMTP id
 f20mr9008166edd.343.1642172020986; 
 Fri, 14 Jan 2022 06:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220114142641.1727679-1-imammedo@redhat.com>
In-Reply-To: <20220114142641.1727679-1-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 14 Jan 2022 20:23:29 +0530
Message-ID: <CAARzgwyn-HGJcF+noLrckRk5ysuHDqGJ6KJm3if1yrdTMkMveA@mail.gmail.com>
Subject: Re: [PATCH 5/4] tests: acpi: test short OEM_ID/OEM_TABLE_ID values in
 test_oem_fields()
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f8b63505d58bf7fd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x330.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8b63505d58bf7fd
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 7:57 PM Igor Mammedov <imammedo@redhat.com> wrote:

> Previous patch [1] added explicit whitespace padding to OEM_ID/OEM_TABLE_ID
> values used in test_oem_fields() testcase to avoid false positive and
> bisection issues when QEMU is switched to \0' padding. As result
> testcase ceased to test values that were shorter than max possible
> length values.
>
> Update testcase to make sure that it's testing shorter IDs like it
> used to before [2].
>
> 1) "tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for  test_oem_fields()
> test"
> 2) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>


Reviewed-by: Ani Sinha <ani@anisinha.ca>



>

--000000000000f8b63505d58bf7fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jan 14, 2022 at 7:57 PM Igor Mammedov &lt;<a href=
=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">Previous patch [1] added explicit whitespace padding to O=
EM_ID/OEM_TABLE_ID<br>
values used in test_oem_fields() testcase to avoid false positive and<br>
bisection issues when QEMU is switched to \0&#39; padding. As result<br>
testcase ceased to test values that were shorter than max possible<br>
length values.<br>
<br>
Update testcase to make sure that it&#39;s testing shorter IDs like it<br>
used to before [2].<br>
<br>
1) &quot;tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for=C2=A0 test_oem_f=
ields() test&quot;<br>
2) 602b458201 (&quot;acpi: Permit OEM ID and OEM table ID fields to be chan=
ged&quot;)<br>
<br>
Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" tar=
get=3D"_blank">imammedo@redhat.com</a>&gt;</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:ani@=
anisinha.ca">ani@anisinha.ca</a>&gt;</div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)" dir=3D"auto"></blockquote><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)" dir=3D"auto"><br>
</blockquote></div></div>

--000000000000f8b63505d58bf7fd--

