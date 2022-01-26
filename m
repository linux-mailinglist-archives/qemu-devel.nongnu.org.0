Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E004449D0D0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:33:34 +0100 (CET)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmAo-000479-0A
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:33:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nClqx-0004O8-Df
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:13:03 -0500
Received: from [2a00:1450:4864:20::22b] (port=39788
 helo=mail-lj1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nClqv-0001V4-HU
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:13:02 -0500
Received: by mail-lj1-x22b.google.com with SMTP id z20so551963ljo.6
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 09:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hsdGbdu5V8Ys7NMt9/YC8yj7jkKzQkF/kbpU0Z5TFyI=;
 b=EQ+fgYrmVeWHKXuenMjnmHSn5gG14Ir/EhBYTvXnDICUzZWm3jIhSEJlw9J4Hxba05
 kt0EeUQtlmois3AjJjPO3z7uFnH+e95LIH7R7yGfnwME47i/r7jfiE6yEU4Bg+b/Vnws
 kOhMTZS0C20IwJXsTfIK/Zs9rCw0QsJETG/K060a3LX5RPvvxjVVMmToyRsLG2W94IMf
 Ad3IjTh0jTjQ5LmUhAZZut50Xy0So6ONlQYF8PROSgfFN3arDNGFSMj3FkXH8W4q1+LD
 m+vVTrAQ5bwKpMVvuAZ5crzYcG0EdQ2+oRPnBe/IpEjwATVNzOedjjeYaG+ZTen7AGdq
 E8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hsdGbdu5V8Ys7NMt9/YC8yj7jkKzQkF/kbpU0Z5TFyI=;
 b=b0OILysUz5XBUvBRvgQx61FqeBdpKYAJMLzmBreeDTEy8wp0i7UDmmdx+OxIf9pIid
 QsWpi7OG+vPN5BY2ZudSpBnNjawx6d5emZ15ysZwAJjdYzf44s4yqlwWse941/Lc93Vo
 deplmsVdhf2t2jLpvqjY+37CIkaA/sv8g97KfqJyrWRK5Q6RZF6uONTy3LXsA9oKS1Xj
 IPCK/nvgJTzfgOWELgh2CeqH5jJeTRaFJg084xpC0LlaW6tZL+qlgHA+2n9GmM7T3z6+
 oWOwN3xY2pu4NbM1nE57r4HAQiO7S0W9PeEYBA3/gJR7G+6cF4OZ+OgeauyE3/DNuGFV
 QR+Q==
X-Gm-Message-State: AOAM532mfk0akI52c4WFrBlnJb2QSlvzzvM+O2XZ33ak3S7kfDZOfywd
 BQYxhiJinu5fN6kyyDXIehYd4UALmw8E36kIv8a9OA==
X-Google-Smtp-Source: ABdhPJwVX13/y2OkUREdwKDWECCy3U9MCJi6Yiubf2soIfveFJPXPPPqZJFEojoNy62GtSONyDX50/LELXOkfQZUjys=
X-Received: by 2002:a2e:9801:: with SMTP id a1mr3516487ljj.369.1643217158606; 
 Wed, 26 Jan 2022 09:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
From: Chris Rauer <crauer@google.com>
Date: Wed, 26 Jan 2022 09:12:27 -0800
Message-ID: <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Patrick Venture <venture@google.com>, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000007ddd505d67f4f97"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=crauer@google.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--00000000000007ddd505d67f4f97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>I need to see a pretty strong justification for why we should be adding
new kinds of devices to the virt machine,
The designware i2c controller is a very common controller on many ARM
SoCs.  It has device tree bindings and ACPI bindings which makes it ideal
for this platform.

>Forgot to mention, but my prefered approach for providing
>an i2c controller on the virt board would be to have a
>PCI i2c controller: that way users who do need it can plug it
>in with a -device command line option, and users who don't
>need it never have to worry about it.
The device is enabled by a machine parameter, =E2=80=9C-machine virt,smbus=
=3Dtrue=E2=80=9D,
and is disabled by default.

> (We seem to have an ICH9-SMB PCI device already; I have no idea if it's
suitable.)
I didn't find that device suitable because it is part of the Intel
Southbridge, which may have some Intel platform quirks, and we don't need
all the things in that IO hub.

-Chris

--00000000000007ddd505d67f4f97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;I need to see a pretty strong justification for why we=
 should be adding new kinds of devices to the virt machine,<br>The designwa=
re i2c controller is a very common controller on many ARM SoCs.=C2=A0 It ha=
s device tree bindings and ACPI bindings which makes it ideal for this plat=
form.<br><br>&gt;Forgot to mention, but my prefered approach for providing<=
br>&gt;an i2c controller on the virt board would be to have a<br>&gt;PCI i2=
c controller: that way users who do need it can plug it<br>&gt;in with a -d=
evice command line option, and users who don&#39;t<br>&gt;need it never hav=
e to worry about it. <br>The device is enabled by a machine parameter, =E2=
=80=9C-machine virt,smbus=3Dtrue=E2=80=9D, and is disabled by default.<br><=
br>&gt; (We seem to have an ICH9-SMB PCI device already; I have no idea if =
it&#39;s suitable.)<br>I didn&#39;t find that device suitable because it is=
 part of the Intel Southbridge, which may have some Intel platform quirks, =
and we don&#39;t need all the things in that IO hub.<br><br>-Chris<br></div=
>

--00000000000007ddd505d67f4f97--

